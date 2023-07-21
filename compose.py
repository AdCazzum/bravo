# Copyright 2022 Cartesi Pte. Ltd.
#
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use
# this file except in compliance with the License. You may obtain a copy of the
# License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

from os import environ
import logging
import requests
import json
from util import hex2str, str2hex
from model import Voucher
from eth_abi import decode, encode

# Function selector to be called during the execution of a voucher that transfers funds,
# which corresponds to the first 4 bytes of the Keccak256-encoded result of "transfer(address,uint256)"
CALLBACK_FUNCTION_SELECTOR = b'\xa9\x05\x9c\xbb'

logging.basicConfig(level="INFO")
logger = logging.getLogger(__name__)

rollup_server = environ["ROLLUP_HTTP_SERVER_URL"]
logger.info(f"HTTP rollup_server url is {rollup_server}")

def evalcode(input_string):
    try:
        result = eval(input_string)
        return str(result)
    except Exception as e:
        return str(e)

def do_callback(address, result):
    payload = CALLBACK_FUNCTION_SELECTOR + \
            encode(['address', 'string'], [address, result])

    logger.info(f"sending callback to '{address}'")
    return Voucher(address, payload)

def handle_advance(data):
    logger.info(f"Received advance request data {data}")
    logger.info("Adding notice")

    json_input = json.loads(hex2str(data["payload"]))
    logger.info(json_input)
    logger.info(json_input["address"])
    logger.info(json_input["body"])

    response = evalcode(json_input["body"])
    logger.info(f"Evaluated response {response}")

    notice = {"payload": str2hex(json.dumps({
        "result": response
    }))}

    #emits voucher
    do_callback(json_input["address"], response)

    response = requests.post(rollup_server + "/notice", json=notice)
    logger.info(f"Received notice status {response.status_code} body {response.content}")
    return "accept"

def handle_inspect(data):
    logger.info(f"Received inspect request data {data}")
    logger.info("Adding report")
    report = {"payload": data["payload"]}
    response = requests.post(rollup_server + "/report", json=report)
    logger.info(f"Received report status {response.status_code}")
    return "accept"

handlers = {
    "advance_state": handle_advance,
    "inspect_state": handle_inspect,
}

finish = {"status": "accept"}

while True:
    logger.info("Sending finish")
    response = requests.post(rollup_server + "/finish", json=finish)
    logger.info(f"Received finish status {response.status_code}")
    if response.status_code == 202:
        logger.info("No pending rollup request, trying again")
    else:
        rollup_request = response.json()
        data = rollup_request["data"]
        
        handler = handlers[rollup_request["request_type"]]
        finish["status"] = handler(rollup_request["data"])

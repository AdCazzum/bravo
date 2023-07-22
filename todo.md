Bravo (ACCCE) => Arbitrary Cartesi Composability Code Execution

[X] encode & decode hex input and output
[X] eval python code
[X] emit a voucher to CALLBACK_FUNCTION_SELECTOR given an address
[X] generic address call
[X] send input from frontend-console (yarn start input send --payload '{"address":"0xF8C694fd58360De278d5fF2276B7130Bfdc0192A", "body":"7+1"}' --address "0xF8C694fd58360De278d5fF2276B7130Bfdc0192A")
[X] post the voucher
[X] check notice from frontend-console (yarn start notice list)
[X] check vouchers from frontend-console (yarn start voucher list)
[X] production mode ready
[X] use the new way to build the cartesi dapp
[X] add a contract to be called
[X] get the value of CALLBACK_FUNCTION_SELECTOR
[X] implement in the given contract a standard method to manage the callback
[X] manage a call from a contract instead of yarn start input send
[X] trigger the time advance (done in the docker compose conf 30s)
[X] trigger the voucher execution (yarn start voucher execute --id 1)
[X] change name in docker bake and compose
[X] name & logo
[X] architecture
[X] presentation (https://docs.google.com/presentation/d/1laa9j0GIkGGPwkdKkqref5h7FFCkWRJKYSnoTRu98vQ/edit?usp=sharing)
[] submit


💩  yarn hardhat run scripts/deploy.ts --network localhost
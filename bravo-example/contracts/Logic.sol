pragma solidity =0.8.19;

import "@cartesi/rollups/contracts/interfaces/IInput.sol";

contract Logic {
    address constant cartesiDapp = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;
    string public value; 

    event ItWorks(string message);
    
    function cartesiCallback(string calldata message) external {
        value = message;
        emit ItWorks(message);
    }

    function execute() external {
        bytes memory payload = abi.encode(address(this), "1+1");

        IInput(cartesiDapp).addInput(payload);
    }
}
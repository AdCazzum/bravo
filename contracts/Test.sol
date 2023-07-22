pragma solidity =0.8.19;

import "@cartesi/rollups@0.8.2/contracts/interfaces/IInput.sol";

contract Test {
    address constant cartesiDapp = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;
    string public s; 

    event ItWorks(string message);
    
    function cartesiCallback(string calldata message) external {
        s = message;
        emit ItWorks(message);
    }

    function foo() external {
        bytes memory payload = abi.encode(address(this), "numpy.");
        eval("python", "fdfd");

        IInput(cartesiDapp).addInput(payload);
    }
}
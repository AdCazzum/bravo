pragma solidity =0.8.19;

import "./BravoLib.sol";
import "./IBravoCallee.sol";

contract Example is IBravoCallee {
    address constant cartesiDapp = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;
    string public value; 

    event ItWorks(string message);
    
    function cartesiCallback(string calldata result) override external {
        value = result;
        emit ItWorks(result);
    }

    // ⌐◨-◨
    function execute() external {
        Bravo.eval(
            Bravo.Backend.PYTHON3,
            address(this),
            "1+1"
        );
    }
}
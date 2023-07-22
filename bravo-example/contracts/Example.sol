pragma solidity =0.8.19;

import "./BravoLib.sol";
import "./IBravoCallee.sol";

contract Example is IBravoCallee {
    address constant cartesiDapp = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;
    string public value; 

    event ItWorks(string message);
    
    function cartesiCallback(string calldata result) override external { //the CartesiVM will use this callback to notify the contract with the evaluated result
        value = result;
        emit ItWorks(result);
    }

    // ⌐◨-◨
    function execute() external {
        Bravo.eval(
            Bravo.Backend.PYTHON3,
            address(this),
            "sum([x**2 for x in range(10) if x % 2 == 0])" //this is generic python code that the CartesiVM will evaluate, the ouput is 120
        );
    }
}

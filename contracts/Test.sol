pragma solidity =0.8.19;

interface IInputBox {
    function addInput(
        bytes calldata _input
    ) external returns (bytes32);
}

contract Test {
    address constant cartesiDapp = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;
    address constant cartesiInputFacet = 0xeA8538B194742b992B19e694C13D63120908880e;

    event ItWorks(string message);
    
    function cartesiCallback(string calldata message) external {
        emit ItWorks(message);
    }

    function foo() external {
        IInputBox(cartesiInputFacet).addInput(bytes('{"address":address(this), "body":"7+2"}'));
    }
}

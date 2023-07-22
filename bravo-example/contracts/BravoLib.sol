pragma solidity =0.8.19;

import "@cartesi/rollups/contracts/interfaces/IInput.sol";

library Bravo {
    enum Backend{PYTHON3,NODE}
    address public constant BRAVO_DAPP = 0xF8C694fd58360De278d5fF2276B7130Bfdc0192A;

    function eval(Bravo.Backend backend, address callback, string calldata body) external {
        // TODO actually use the selected backend
        bytes memory payload = abi.encode(callback, body);
        IInput(BRAVO_DAPP).addInput(payload);
    }
}
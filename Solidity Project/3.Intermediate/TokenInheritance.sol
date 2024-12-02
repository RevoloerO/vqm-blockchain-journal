// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title TokenInheritance
*@dev create the inheritance token from ERC20Token using inheritance
* the inheritance override constructor and mint() function to add more detail info
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/

//Create contract to 
contract ERC20Token {
    string public name;
    //create ballances variable
    mapping(address => uint256) public balances;

    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[tx.origin]++;
    }
}

contract NewToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

    constructor(string memory _name, string memory _symbol)  ERC20Token(_name) {
        symbol = _symbol;
    }

    function mint() public override{
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}

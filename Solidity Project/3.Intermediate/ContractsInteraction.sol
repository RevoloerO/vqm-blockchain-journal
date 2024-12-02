// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title InteractionAndInheritance 
*@dev create the interaction between multiple contracts using ERC20Token,tx.origin
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/

//Create contract to 
contract ERC20Token {
    //create
    string public name;
    //create ballances variable
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin]++;
    }
}

contract PurchaseTransaction {
    address payable wallet;
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    receive() external payable {
        buyToken();
    }

    function buyToken() public payable {
        //ERC20Token(address(token)).mint();
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        
        wallet.transfer(msg.value);
    }
}
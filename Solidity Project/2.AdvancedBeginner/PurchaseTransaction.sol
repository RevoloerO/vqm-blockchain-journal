// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title PurchaseTransaction 
*@dev write a contract to set up transaction for address to buy ETH
*using mapping, event, constructor
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/
contract PurchaseTransaction {
    
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet)  {
        wallet = _wallet;
    }

    receive() external payable {
        buyToken();
    }

    function buyToken() public payable{
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender,1);
    }
}
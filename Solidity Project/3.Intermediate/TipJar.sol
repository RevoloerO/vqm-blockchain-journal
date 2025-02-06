// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/* 
*@title Tip Jar
*@dev This smart contract allows users to send and receive donations securely. Funds are stored in the contract and can be withdrawn by the owner.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*@author: vqm
*/
contract TipJar {
    address public owner;
    event TipReceived(address indexed sender, uint amount);
    event Withdrawn(address indexed owner, uint amount);

    constructor() {
        owner = msg.sender;
    }

    // Function to receive tips
    function sendTip() public payable {
        require(msg.value > 0, "Tip amount must be greater than zero");
        emit TipReceived(msg.sender, msg.value);
    }

    // Function to withdraw funds
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        uint balance = address(this).balance;
        require(balance > 0, "No funds available for withdrawal");
        payable(owner).transfer(balance);
        emit Withdrawn(owner, balance);
    }

    // Function to check contract balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title Rent
*@dev write a contract to create a payable address, which owner could put
* renter info. All ETH transferred on this contract address will be auto tranferred
* to owner's address
*/
contract Name {
    address payable public owner;
    string public lesseeName;
    uint public lesseeAge;
    string public lesseeOccupation;

    constructor(string memory name, uint age, string memory occupation) {
        lesseeName = name;
        lesseeAge = age;
        lesseeOccupation = occupation;
        owner = payable(msg.sender);
    }
    
    receive() external payable {
        owner.transfer(msg.value);
    }
}
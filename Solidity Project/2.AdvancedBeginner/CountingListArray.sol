// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title CountingListArray
*@dev write a contract to create a list of users using array datatype
*and use struct to create user object.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/

contract CountingListArray {
    Person[] public users; 
    
    uint256 public userCount = 0;

    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public{
        userCount += 1;
        users.push(Person(userCount,_firstName, _lastName));
    }
}
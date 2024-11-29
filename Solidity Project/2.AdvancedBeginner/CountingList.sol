// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title CountingList
*@dev write a contract to create a list of users using mapping function
*and use struct to create user object.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/

contract CountingList {
    uint256 userCount = 0;

    mapping(uint => Person) public users;

    struct Person{
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public{
        userCount += 1;
        users[userCount] = Person(userCount,_firstName, _lastName);
    }
}
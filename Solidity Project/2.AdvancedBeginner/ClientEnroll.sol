// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ClientEnroll {
    /*
    *@title: ClientEnroll
    *@dev: 
    - create a contract with function enroll() which enroll client id and name.
    - required concepts: mapping, event, emit.
    *@custom:dev-run-script scripts/deploy_with_ethers.ts
    */
    mapping(uint => string) public clients;
    event Enrolled(uint id);

    function enroll(uint id,string memory name)public  {
        clients[id] = name;
        emit Enrolled(id);
    } 
}
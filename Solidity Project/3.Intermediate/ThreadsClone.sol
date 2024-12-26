// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
    /**
    *@title Threads Clone
    *@dev write contract to:
    *    create Threads social network clone
    *@custom:dev-run-script scripts/deploy_with_ethers.ts
    */

contract ThreadsClone {
    mapping( address => string) public threads;


    function createThreads(string memory _thread) public {
        threads[msg.sender] = _thread;
    }

    function getThreads(address _owner) public view returns(string memory){
        return threads[_owner];
    }
}

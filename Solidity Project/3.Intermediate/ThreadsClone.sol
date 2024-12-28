// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
    /**
    *@title Threads Clone
    *@dev write contract to:
    *    create Threads social network clone
    *@custom:dev-run-script scripts/deploy_with_ethers.ts
    */

contract ThreadsClone {
    uint16 public THREAD_LENGTH_LIMIT = 256;

    //Define Thread struct
    struct Thread{
        address author;
        string content;
        uint timestamp;
        uint upvotes;
    }
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"Incorrect Authorization!!");
        _;
    }

    mapping( address => Thread[]) public threads;

    function setThreadLength(uint16 _newLength) public onlyOwner {
        THREAD_LENGTH_LIMIT = _newLength;
    }

    function createThreads(string memory _thread) public {
        require(bytes(_thread).length <= THREAD_LENGTH_LIMIT, "Too long");

        Thread memory newThread = Thread({
            author: msg.sender,
            content: _thread,
            timestamp: block.timestamp, 
            upvotes: 0
        });

        threads[msg.sender].push(newThread) ;
    }

    function getThread(uint _index) public view returns(Thread memory){
        return threads[msg.sender][_index];
    }
    
    function getAllThreads(address _owner) public view returns(Thread[] memory) {
        return threads[_owner];
    }
}

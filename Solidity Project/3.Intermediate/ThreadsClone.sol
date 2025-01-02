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
        uint256 id;
        address author;
        string content;
        uint timestamp;
        uint upvotes;
    }
    address public owner;
    mapping( address => Thread[]) public threads;

    event ThreadCreated(uint256 id, address author, string content, uint256 timestamp);
    event ThreadUpvotes(address upvoter, address threadCreator, uint256 threadId, uint256 upvoteCount);
    event ThreadReversedUpvotes(address reveredUpvoter, address threadCreator, uint256 threadId, uint256 upvoteCount);
    

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner,"Incorrect Authorization!!");
        _;
    }

   

    function setThreadLength(uint16 _newLength) public onlyOwner {
        THREAD_LENGTH_LIMIT = _newLength;
    }

    function createThreads(string memory _thread) public {
        require(bytes(_thread).length <= THREAD_LENGTH_LIMIT, "Too long");

        Thread memory newThread = Thread({
            id: threads[msg.sender].length,
            author: msg.sender,
            content: _thread,
            timestamp: block.timestamp, 
            upvotes: 0
        });

        threads[msg.sender].push(newThread) ;

        emit ThreadCreated(newThread.id, newThread.author, newThread.content, newThread.timestamp);
    }

    function upVote(address _author, uint256 _id) external {
        require( threads[_author][_id].id == _id, "Nonexist thread ID");
        threads[_author][_id].upvotes++;

        emit ThreadUpvotes(msg.sender, _author, _id, threads[_author][_id].upvotes);
    }

    function reverseUpVote(address _author, uint256 _id) external {
        require( threads[_author][_id].id == _id, "Nonexist thread ID");
        require( threads[_author][_id].upvotes > 0, "No upvote to reversed");
        threads[_author][_id].upvotes--;

        emit ThreadReversedUpvotes(msg.sender, _author, _id, threads[_author][_id].upvotes);
    }

    function getThread(uint _index) public view returns(Thread memory){
        return threads[msg.sender][_index];
    }
    
    function getAllThreads(address _owner) public view returns(Thread[] memory) {
        return threads[_owner];
    }
}

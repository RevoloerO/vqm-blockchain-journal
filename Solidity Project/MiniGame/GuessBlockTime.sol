// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
*@title Time
*@dev this contract return current block time and a mini game function to guess if a time is passed using timeStamp.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/
contract GuessingBlockTime {
    string[] tooLate = ["Too late, the block time has passed!",
                        "Missed it, the time's gone",
                        "Come on, you need to guess the actual current block time",
                        "Focus! It's the current block time you need.",
                        "Close, but guess the block time now!"];
    string[] tooSoon = ["Too soon, that block time hasn't come yet!",
                        "Slow down, you're ahead of time!",
                        "Whoa, the future block hasn't arrived!",
                        "Impressive, but the block isn't here yet!",
                        "Looks like you're in the future!"];
    string[] perfectTime = ["Bullseye! That's the current block time!",
                        "Correct! You're in sync with the blocks!",
                        "Boom! That's the right block!",
                        "You're spot on, excellent timing!",
                        "Perfect catch! That's the block!"];                                        
    uint RandNonce = 0;

    function getBlockTime() public view returns (uint) {
        uint time = block.timestamp;
        return time;
    }
    function guessBlockTime (uint time) public view returns (bool,string memory){
        uint message = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,RandNonce))) % 4;
        if(time < block.timestamp)
            return (false,tooLate[message]);
        else if(time == block.timestamp)
            return (true,perfectTime[message]);
        else
            return (false,tooSoon[message]);
    }
}
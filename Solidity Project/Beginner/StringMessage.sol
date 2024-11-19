// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title StringMessage
    * @dev implement contract to set a string with value from user. User can check value anytime without
    * cosumming any gas. The string will not be accessible by any other contracts 
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    */

contract StringMessage {

    string private _message;

    // receive message from user
    function sendMessage(string memory message) public{
        _message = message;
    }

    // retrieve sent message
    function getMessage() public view returns (string memory){
        return _message;
    }
}
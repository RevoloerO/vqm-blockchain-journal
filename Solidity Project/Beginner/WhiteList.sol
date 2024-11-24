// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SelfWhiteList {
    /***
     *@title SelfWhiteList
     *@dev create a contract to white list of user address from msg.sender
     */
    address[] public whiteList ;

    function AddWhiteList(address userAddress) public{
        if(userAddress == msg.sender){
            whiteList.push(userAddress);
        }
    }
    function check() public view returns (bool){
        for(uint i = 0; i < whiteList.length; i++){
            if(whiteList[i] == msg.sender)
                return true;
        }
        return false;
    }

}

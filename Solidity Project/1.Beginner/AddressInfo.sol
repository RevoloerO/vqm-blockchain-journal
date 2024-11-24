// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title AddressInfo
    * @dev write contract to:
        -set an address to the owner
        -emit event if success
        -show user current address
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    */

contract AddressInfo {
    address private _userAddress;
    event userSet(address userAddress);

    //Sets user address
    function setUserAddress(address userInput) public {
        _userAddress = userInput;
        emit userSet(_userAddress);
    }

    //return current user address
    function getCurrentUser() public view returns (address){
        return _userAddress;
    }
}
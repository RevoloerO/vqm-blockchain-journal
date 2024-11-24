// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
*@title Storage
*@dev this contract store hard coded value in the variable and return its value on user demand

*/
contract Storage {
    uint256 n;

    //Stores value in variable 'n'
    function store() public {
        n = 2009;
    }
    //return value of 'n'
    function get() public view returns (uint256){
        return n;
    }

}
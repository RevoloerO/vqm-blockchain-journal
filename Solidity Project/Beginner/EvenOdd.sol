// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title EvenOdd
    * @dev implement contract to check whether a number is even or odd then return
    * a string answer.
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    */
contract EvenOdd {

    function checkEvenOdd (uint num) public pure returns (string memory){
        if(num%2 == 0)
            return "Even";
        else
            return "Odd";
    }
    
}
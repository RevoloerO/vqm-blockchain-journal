// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title PrimeCheck
    * @dev write contract to:
        -determine whether a number is prime without consume gas
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    *  
    */

contract PrimeCheck {
    
    function ifPrime (int number) public pure returns (bool){
        if (number< 2) return false;
        
        //Create loop to check if prime
        for(int i = 2; i< number/2 ; i++){
            if(number%i == 0) return false;
        }
        return true;
    }
}
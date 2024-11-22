// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title Prime Check
    * @dev write contract to:
        create list of prime numbers up to a input number of limit
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    *  
    */

contract PrimeList {
    uint[] primes;

    function createPrimeList (uint number) public{
        delete primes; //Clear old list
        for(uint i = 2; i < number; i++){
            if (isPrime(i))
                primes.push(i);
        }
    }
    function showPrimeList () public view returns (uint[] memory){
        return primes;
    }
    
    function isPrime (uint number) private pure returns (bool){
        if (number< 2) return false;

        for(uint i = 2; i< number/2 ; i++){
            if(number%i == 0) return false;
        }
        return true;
    }
}
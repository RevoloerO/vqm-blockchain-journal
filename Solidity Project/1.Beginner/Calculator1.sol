// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title Basic Operator
    * @dev write contract to:
        -conduct calculator to handle basic operator in programming without consumming gas
        *IMPORTANT: To define a function which should not consume any 
        gas and return the response immediatly, we should use view or pure function.
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    *  
    */

contract BasicOperator {
    //add 2 numbers
    function add(int a, int b)public pure returns (int){
        return (a+b);
    }
    //sub 2 numbers
    function sub(int a, int b)public pure returns (int){
        return (a-b);
    }
    //multiply 2 numbers
    function mul(int a, int b)public pure returns (int){
        return (a*b);
    }
    //divide 2 numbers
    function div(int a, int b)public pure returns (int){
        return (a/b);
    }
    //compare bigger
    function bigger(int a, int b)public pure returns (bool){
        return (a>b);
    }
    //compare equal
    function equal(int a, int b)public pure returns (bool){
        return (a == b);
    }
    //compare bigger
    function bitwiseExclusive(int a, int b)public pure returns (int){
        return (a^b);
    }

}
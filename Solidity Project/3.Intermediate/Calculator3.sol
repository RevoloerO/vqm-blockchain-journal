// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/utils/Strings.sol";
    /**
    *@title Calculator3
    *@dev write contract to:
    *   - upgrade Calculator 2 contract with library by separate all func into a different library
    *@custom:dev-run-script scripts/deploy_with_ethers.ts
    */

library CalculatorLib {
    //Addition
    function add(uint256 a, uint256 b) external pure returns (uint256) {
        require(a+b>= a, "variable overflow");
        return a+b;
    }

    //Subtraction
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a, "variable underflow");
        return a-b;
    }

    //Multiplication
    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        require((a*b)/ a == b, "variable overflow");
        return a*b;
    }
    
    //Division
    function div(uint256 a, uint256 b) public pure returns (uint256) {
        require(b>0,"invalid operation");
        return a/b;
    }

    //Modulus
    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        return a%b;
    }

    //Comparison
    function compare(uint256 a, uint256 b) public pure returns (string memory) {
        if(a > b)
            return string.concat(Strings.toString(a)," > ",Strings.toString(b));
        else if(a < b)
            return string.concat(Strings.toString(a)," < ",Strings.toString(b));
        else if(a == b)
            return string.concat(Strings.toString(a)," = ",Strings.toString(b));
        else
            return "Invalid";
    }

    //BitwiseExclusive
    function bitwiseExclusive(int256 a, int256 b) public pure returns (int256) {
        return (a ^ b);
    }
}

contract Calculator3 {
    
    //call add function from Calculator Library
    function add(uint a, uint b) external pure returns (uint){
        return CalculatorLib.add(a,b);
    }

    //call sub function from Calculator Library
    function sub(uint a, uint b) external pure returns (uint){
        return CalculatorLib.sub(a,b);
    }

    //call mul function from Calculator Library
    function mul(uint a, uint b) external pure returns (uint){
        return CalculatorLib.mul(a,b);
    }

    //call div function from Calculator Library
    function div(uint a, uint b) external pure returns (uint){
        return CalculatorLib.div(a,b);
    }

    //call mod function from Calculator Library
    function mod(uint a, uint b) external pure returns (uint){
        return CalculatorLib.mod(a,b);
    }

    //call compare function from Calculator Library
    function compare(uint a, uint b) external pure returns (string memory){
        return CalculatorLib.compare(a,b);
    }
    
    //call compare function from Calculator Library
    function bitwiseExclusive(int a, int b) external pure returns (int){
        return CalculatorLib.bitwiseExclusive(a,b);
    }
}

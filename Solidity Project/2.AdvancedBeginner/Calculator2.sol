// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

    /**
    *@title Calculator2
    *@dev write contract to:
    *   - upgrade Calculator 1 contract with error handlers.
    *   IMPORTANT: use require/ assert method with "variable overflow", "variable underflow", "invalid operation"
    *@custom:dev-run-script scripts/deploy_with_ethers.ts
    */


contract Calculator2 {
    //@dev add 2 numbers then check variable overflow
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "variable overflow");
        return c;
    }

    //@dev first check 2nd smaller than 1st to avoid undeflow then sub 2 numbers
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a, "variable underflow");
        uint256 c = a - b;
        return c;
    }

    //@dev multiply 2 numbers then check variable overflow
    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a * b;
        require(c / a == b, "variable overflow");
        return c;
    }

    //@dev first check not divisible by 0 then divide 2 numbers
    function div(uint256 a, uint256 b) public pure returns (uint256) {
        require(b>0,"invalid operation");
        uint256 c = a/b;
        return c;
    }

    //compare bigger
    function bigger(int256 a, int256 b) public pure returns (bool) {
        return (a > b);
    }

    //compare equal
    function equal(int256 a, int256 b) public pure returns (bool) {
        return (a == b);
    }

    //compare bigger
    function bitwiseExclusive(int256 a, int256 b) public pure returns (int256) {
        return (a ^ b);
    }
}

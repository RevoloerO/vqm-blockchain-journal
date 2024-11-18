// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    * @title HelloWorld
    * @dev implement contract to print "Hello World"
    * @custom:dev-run-script scripts/deploy_with_ethers.ts
    */

contract HelloWorld {
    function print() public pure returns (string memory){
        return "Hello BlockChain World, VQM here!";
    }
}
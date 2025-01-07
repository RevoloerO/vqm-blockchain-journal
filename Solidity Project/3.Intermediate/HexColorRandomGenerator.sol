// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
*@title Time
*@dev this contract return current block time and a mini game function to guess if a time is passed using timeStamp.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*@author: vqm
*/
contract HexColorRandomGenerator {
    function toHexChar(uint256 value) private pure returns (bytes1) {
        if (value < 10) {
            return bytes1(uint8(value) + 48); // ASCII '0' = 48
        } else {
            return bytes1(uint8(value) + 87); // ASCII 'a' = 97 - 10
        }
    }

    function randomColorHex() public view returns (string memory) {
        uint256 randomNum = uint256(
            keccak256(abi.encodePacked(msg.sender, block.timestamp)));
        
        bytes memory hexString = abi.encodePacked(
            "#",
            toHexChar((randomNum >> 20) & 0xF),
            toHexChar((randomNum >> 16) & 0xF),
            toHexChar((randomNum >> 12) & 0xF),
            toHexChar((randomNum >> 8) & 0xF),
            toHexChar((randomNum >> 4) & 0xF),
            toHexChar(randomNum & 0xF)
        );

        return string(hexString);
    }

}
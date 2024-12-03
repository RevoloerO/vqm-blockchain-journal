// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
* @title AddressInfo
* @dev write contract to show all data type in Solidity
* @custom:dev-run-script scripts/deploy_with_ethers.ts
*/

contract AllDataType {
    bool itsReal = true;
    bool notReal = !itsReal;
    uint number = 315; //default is uint256, range: uint8->16,32,64,128-> uint256
    int intNUmber = -1; //all postive and negative in range int256
    string name = "Satoshi"; //byte object used for text
    bytes32 animal = "cat"; //string but converted to byte object, range 1 to 32

    address myWallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable eWallet = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); //add transfer and send.

    enum enumCount { Sa,to,Shi} //define enumerator

    //array
    uint[5] intArray = [1,2,3,4,5];
    string[] stringArray = ["Satoshi","Nakamoto"];
    function addString() public{
        stringArray.push("bitcoin");
    }

    //Visibility: public, private, external, internal 
    //Conversion: view, pure, payable, non-payable
    //function
    function funcName(uint _number) public{
        number = _number; //change number to _number input
    }
}
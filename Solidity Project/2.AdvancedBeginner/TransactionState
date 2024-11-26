// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
*@title TransactionState
*@dev Write a contract to show state of transaction using enum and activate() button
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*/

contract TransactionState {
    enum State{Waiting, Ready, Active}
    State public state;

    constructor() {
        state = State.Waiting;
    }

    function activation() public{
        state = State.Active;
    }

    function holdback() public{
        state = State.Waiting;
    }

    function isActive() public view returns(bool){
        return state == State.Active;
    }
}

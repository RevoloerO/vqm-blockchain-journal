// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Lottery {
    address public host;
    address payable[] public players_pool;

    constructor() {
        host = msg.sender;
    }

    /*
     * handle pushing players's address and checking entry fee
     */
    function enter() public payable {
        require(msg.value > 0.01 ether);
        //address of players entering lottery
        players_pool.push(payable(msg.sender));
    }

    /*
     * return a random number using keccak256 hashing algorithm
     */
    function getRandomNumber() public view returns (uint256) {
        // abi is globale variable, encodePacked is used to concat 2 variable into 1
        return uint256(keccak256(abi.encodePacked(host, block.timestamp)));
    }

    /*
     * call getRandomNumber function and select winner from players' pool
     */
    function pickWinner() public onlyHost {
        uint256 index = getRandomNumber() % players_pool.length;
        players_pool[index].transfer(address(this).balance);

        // empty players' pool
        players_pool = new address payable[](0);
    }

    modifier onlyHost() {
        require(msg.sender == host);
        _;
    }
    /*
    * Optional functions: return pot balance and players' pool
    */
    function getPotBalance() public view returns (uint){
        return address(this).balance;
    }

    function getPlayersPool() public view returns (address payable[] memory){
        return players_pool;
    }
}

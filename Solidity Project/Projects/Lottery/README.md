---
title: my blockchain journal
author: vqm
section: Solidity Project/ Projects/ Lottery
---
This project is a complete functioning lottery project using Solidity
---
*Lottery.sol*

**Sudo code:**
- create 2 address variable for host and players
- constructor() for getting host info
- function enter(): receive players entry fee and push players to pool
- function getRandomNumber(): provide random number
- function pickWinner(): select winner from pool, reset pool
- modifier onlyHost(): require check for host only
*Optional*
- function getPotBalance(): return current pot balance
- function getPlayersPool(): return list of current players

**Concepts:**
- basic: address, constructor, modifier, function, payable, public
- methods: require(), abi.encodePacked(), payable(), keccak256(), address(this).balance, block.timestamp,transfer().
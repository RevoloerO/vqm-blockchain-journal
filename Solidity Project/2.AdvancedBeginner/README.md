---
title: my blockchain journal
author: vqm
section: Solidity Project/ AdvancedBegninner
---
1.ClientEnroll.sol
To understand this contract, I need to understand the mapping function which provide 
search function to search for value based on key. Next, the application can listen to 
event via using event-emit function 
**Events - definition(Solidity events give an abstraction on top of the EVM's logging 
functionality. Applications can subscribe and listen to these events through the RPC 
interface of an Ethereum client.Events are inheritable members of contracts. When you 
call them, they cause the arguments to be stored in the transaction’s log - a special 
data structure in the blockchain.)
--
2.Calculator2.sol
There is some type of error handler that I need to learn for each type of contract.
Using require(condition,"message") is quite simple to understand and apply.
--
3.GradeSystem.sol
when I use enum to declare Grade() there is a miunderstanding of the concept of enum which I need to 
know about return are suppose to be stage number starting
from 0,1,2,3...
-- 
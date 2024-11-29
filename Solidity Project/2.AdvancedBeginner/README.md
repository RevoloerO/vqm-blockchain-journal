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
---
2.Calculator2.sol
There is some type of error handler that I need to learn for each type of contract.
Using require(condition,"message") is quite simple to understand and apply.
---
3.GradeSystem.sol
when I use enum to declare Grade() there is a miunderstanding of the concept of enum which I need to 
know about return are suppose to be stage number starting
from 0,1,2,3...
---
4.Rent.sol
It is interesting when I used RemixVM that I put lessee 
data before clicking transact which normally a deploy 
button. I can retrieve info from published contract and
check for who, with whom, what address.
---
5.TransactionState.sol
Another practice with enums and constructors which help me
to understand more about how state working. Another reminder
that I need to be careful about putting "view" into function
---
6.CountingListMapping.sol
A quick practice using mapping and struct to create a user list with count variable to handle id input.
---
7.CountingListArray.sol
Another practice of creating UserList with counting but use array data type instead. 
There is a different in the number list between array and mapping when array store 0 first
Array: input(0) -> id[1]
Mapping: input(1) -> id[1]
---
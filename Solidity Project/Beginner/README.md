---
title: my blockchain journal
author: vqm
section: Solidity Project/ Beginner
---
1.HelloWorld.sol
It is quite confusing when I used Remix to create 1st Solidity project, to test the file, I need to:
1. Select smart contract file
2. Compile HelloWorld.sol
3. Deploy smart contract to Remix VM
4. Interact with HelloWorld function with deployed contracts, the printed hello message stay in the decoded output.
---
2.Storage.sol
It is much more simple after I understand how value is sent and retrieved via blockchain
Beside, Remix VM, I also used solidity extension on Visual Studio Code to test and check value.
---
3.StringMessage.sol
I learn that when I put comma in the input for the string, it will count as 2 string which 
cause error for mismatch length
(StringMessage.sendMessage errored: Error encoding arguments: Error: types/values length mismatch)
wrong input: Hello, World! => comma make it into ["Hello","World!"]
correct input: "Hello, World!" -> put it into a string will make the whole message as 1 string
---
4.AddressInfo.sol
when testing with RemixVM, I recognize there is an address checksum to determine whether 
the address input is valid which is interesting since we could not just random input 
some fake address. Even if the blockchain world is random hash, there is some way to 
determine a valid random or just fake random one.
--
5. BasicOperator.sol
To define a function which should not consume any gas and return the response immediatly, 
we should use view or pure function.
--
6.PrimeCheck.sol
The interesting thing I learnt is Solidity does not support float or double data type which
means I could not use the range from 2 -> sqrt(n) to check for prime number. Thus, I create
for loop from 2 to n/2. Basically, the contract in blockchain work around integer numbers.
--
7.PrimeList.sol
Next level from PrimeCheck where I work around function private, public. The recall function help me to understand how the list is handled in Solidity. I need to match the data type 
uint[] correctly to ensure the output 
--
8.EvenOdd.sol
A quick practice for me to play around getting input and returns output using "pure" in Solidity
--
9.WhiteList.sol
I could not test the msg.sender address with RemixVM yet. To confirm the contract work, I will try to find a way to test.
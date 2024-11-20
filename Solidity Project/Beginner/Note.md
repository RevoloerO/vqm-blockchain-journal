---
title: my blockchain journal
author: vqm
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
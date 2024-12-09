---
title: my blockchain journal
author: vqm
section: NodeJS-Alchemy Project
---
1.HelloWorld
To test the project, run "npm init" and "npm install alchemy-sdk"
1.a.HelloWorld.js
- the network will connect with Sepolia which provide fakeETH to test the program
- Need to get API_KEY from Alchemy and change it into the code 
1.b.Price-Demo.js
- Again, need to get API_KEY from Alchemy, put it into the code
- The price data do not show up as the readable way, so I need to use JSON.stringify(data) to handle and read the JSON.
---
2.Hashing
2.a.FindColor.js
Practice hashing check by finding color using brute force method
- Required package: (mocha,ethereum-cryptography)
- To test: run $mocha ./findColorTest.js
2.b.hashMessage.js
Practice hashing by encrypt message using keccak256
- Required package: (mocha,ethereum-cryptography)
- To test: run $mocha ./hashMessageTest.js
2.c.signMessage.js
Practice sign message by using secp256k1 and PRIVATE_KEY
- Required package: (mocha,ethereum-cryptography)
- To test: run $mocha ./hashMessageTest.js
** There is a problem in testing in different platform or
version of secp256k1 library since sign() function is not regconized
2.d.getAddress.js
Practice obtain address from publickey by 
(1) take off 1st byte from public key
(2) take keccak hash from the rest 
(3) return toHex of the last 20 bytes from hash
- Required package: (mocha,ethereum-cryptography)
- To test: run $mocha ./getAddressTest.js
** There is also a problem of function getPublicKey from
ethereum-cryptography/secp256k1 due to environment set up
---
3.minerPOW.js
Create miner to find correct block using POW method
(1) Add transaction to mempool
(2) Add id with block height to new block
(3) Pull transaction out of the mempool, then add to new block
(4) Mining by add nonce and hash until satify condition
(5) Add found hash to new_block.
- Required package: (mocha,crypto-js/sha256)
- To test: run $mocha ./minerPOWTest.js
***Fortunately, the test work properly.


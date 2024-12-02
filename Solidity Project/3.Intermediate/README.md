---
title: my blockchain journal
author: vqm
section: Solidity Project/ Intermediate
---
1.ContractInteraction.sol
There are several required step need to be done to test the interact in RemixVM. 
I can used provided account from RemixVM to test the interaction
1. Deploy ERC20Token contract 
2. Get ERC20Token address which is just depolyed
3. Deploy PurchaseTransaction contract with provided wallet address and ERC20 Token address
4. Interaction using buyToken or mint to change the balances.
*NOTE: the mint() function need to use tx.origin instead of msg.sender to ensure correct address.
---
2.TokenInheritance.sol
There are some change using new version of Solidity. 
First is the virtual-override declaration to handle the override function from inherited.
Second is the the declaration of inherited of the declaration in the constructor.
The overall practice help me to understand how to create new Token with new name and symbol.
---
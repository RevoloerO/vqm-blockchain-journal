const SHA256 = require('crypto-js/sha256');
const TARGET_DIFFICULTY = BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    //Step 1 - Add transaction to mempool
    mempool.push(transaction);
}

function mine() {
    // TODO: mine a block
    //Step 2 - Add id with block height
    const new_block = { "id" : blocks.length };
    
    //Step 4a - pull transaction out of the mempool
    const transactions = [];
    while(mempool.length > 0 && transactions.length <MAX_TRANSACTIONS){
        transactions.push(mempool.pop());  
    }
    
    //Step 4b - add transactions array to block
    new_block["transactions"] = transactions;

    //Step 5 - mining by POW
    var nonce = 0;
    new_block["nonce"] = nonce;
    
    //hashing the block
    var block_hash;
    block_hash = SHA256(JSON.stringify(new_block));
    //compare the hash to target, rework if not in target
    while(BigInt(`0x${block_hash}`) > TARGET_DIFFICULTY){
        new_block["nonce"] = nonce++;
        block_hash = SHA256(JSON.stringify(new_block));
    }

    //Step 3 - Add hash to the block
    new_block["hash"] = block_hash;
    blocks.push(new_block);
}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction, 
    mine, 
    blocks,
    mempool
};
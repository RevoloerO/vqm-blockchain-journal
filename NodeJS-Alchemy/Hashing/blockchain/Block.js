const SHA256 = require('crypto-js/sha256');

class Block {
    constructor(input){
        this.previousHash;
        this.data = input;
    }

    //Add data to hash
    toHash() {
        return SHA256(this.previousHash + this.data);// a hash!
    }
}

module.exports = Block;

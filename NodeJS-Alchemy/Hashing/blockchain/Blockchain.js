const Block = require('./Block');

class Blockchain {
    //Create Genesis Block
    constructor() {
        this.chain = [new Block("Son of God")];
    }
    // Add new block to the chain
    addBlock(nextBlock){
        //Add previousHash to new block
        nextBlock.previousHash = this.chain[this.chain.length - 1].toHash();
        this.chain.push(nextBlock);
    }
}

module.exports = Blockchain;
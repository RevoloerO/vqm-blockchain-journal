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
    // Validate previous hash and stored hash
    isValid(){
        const height = this.chain.length-1
        for(var i = height; i > 0; i-- ){ 
            const realHash = this.chain[i-1].toHash().toString();
            const storedHash = this.chain[i].previousHash.toString();
            if(realHash !== storedHash)
            {return false;}
        }
        return true;
    }
}

module.exports = Blockchain;
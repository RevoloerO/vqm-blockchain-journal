const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {
    return  keccak256(utf8ToBytes(message));
    /*const bytes = utf8ToBytes(message);
    const hash = keccak256(bytes);
    return hash;*/
}

module.exports = hashMessage;
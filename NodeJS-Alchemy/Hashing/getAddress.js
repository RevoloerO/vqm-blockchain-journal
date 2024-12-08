const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");
const { toHex } = require("ethereum-cryptography/utils");


function getAddress(publicKey) {
    var slicedKey = publicKey.slice(1);
    var address = keccak256(slicedKey).slice(-20);
    console.log(toHex(address).toLowerCase());
    return address;

}

module.exports = getAddress;
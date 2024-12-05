const { sha256 } = require("./node_modules/ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("./node_modules/ethereum-cryptography/utils");

// the possible colors that the hash could represent
const COLORS = ['red', 'green', 'blue', 'yellow', 'pink', 'orange'];

// given a hash, return the color that created the hash
function findColor(hash) {
    for(var i = 0; i<COLORS.length; i++){
        if (toHex(sha256(utf8ToBytes(COLORS[i]))) === toHex(hash))
            return COLORS[i]
    }
    /*
    var color1 = '';
    COLORS.forEach((color) => {
        const colorName = color;
        const colorBytes = utf8ToBytes(colorName);
        const colorHash = sha256(colorBytes);
        if (toHex(hash) === toHex(colorHash)) {
            color1 = colorName;
        }
    });
    return color1;
    */
}

module.exports = findColor;
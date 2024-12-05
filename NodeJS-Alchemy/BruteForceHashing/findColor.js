const { sha256 } = require("ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

// the possible colors that the hash could represent
const COLORS = ['red', 'green', 'blue', 'yellow', 'pink', 'orange'];

// given a hash, return the color that created the hash
function findColor(hash) {
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
}

module.exports = findColor;
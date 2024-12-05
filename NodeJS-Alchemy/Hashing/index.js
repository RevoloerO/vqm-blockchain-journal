const {assert} = require('chai');
const findColor = require('./findColor');
const { sha256 } = require("./node_modules/ethereum-cryptography/sha256");
const { utf8ToBytes } = require("./node_modules/ethereum-cryptography/utils");

const COLORS = ['red', 'green', 'blue', 'yellow', 'pink', 'orange'];

describe('findColor', () => {
    COLORS.forEach((color) => {
        it(`should work for ${color}`, () => {
            assert.equal(findColor(sha256(utf8ToBytes(color))), color);
        });
    });
});
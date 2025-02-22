// SPDX-License-Identifier: MIT 
pragma solidity >=0.8.0;

contract ZombieFactory {
    // Add variable
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // Create a struct
    struct Zombie {
        string name;
        uint dna;
    }

    // Create an array of Zombie structs
    Zombie[] public zombies;

    // Create functions to manipulate the array
    // Add a function to create a new zombie
    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }
    // Add a function to generate a random DNA
    function _generateRandomDna(string memory _str) private view returns (uint) {
        // start here
    }

}

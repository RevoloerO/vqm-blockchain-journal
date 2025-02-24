// SPDX-License-Identifier: MIT 
pragma solidity >=0.8.0;

contract ZombieFactory {
    // Add event to notify when a new zombie is created
     event NewZombie(uint zombieId, string name, uint dna);
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
        uint id = zombies.length - 1;
        // Emit the event
        emit NewZombie(id, _name, _dna);
    }
    // Add a function to generate a random DNA using the keccak256 hash function
    // Then use the modulus operator to ensure the DNA is within the range of 0 to 10^16
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // Add a function to create a new zombie
    function createRandomZombie(string memory _name) public{
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}

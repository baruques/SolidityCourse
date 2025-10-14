// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OpcodeGas{
    function somaSolidity(uint256 a, uint256 b) external pure returns(uint256){
        uint256 soma = a + b;
        return soma; // Spent 938 gas to complete
    }

    function somaEmOpcode(uint256 a, uint256 b) external pure returns(uint256 result){
        assembly{
            result := add(a, b)
        }

        return result; // Spent 769 gas to complete and does the same thing
    }
}
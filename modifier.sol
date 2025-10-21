// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract TestModifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner"); // Recebe como parâmetro a condição e, após a virgula, o retorno caso Falso
        _; 
    }

    modifier noReentrancy() {
        require(!locked, "No reentrancy"); // Precisa estar falso, de forma a manter 1 instância.
        locked = true;
        _;
        locked = false;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Invalid address"); // Recebe como parâmetro a condição e, após a virgula, o retorno caso Falso
        _; // O _ é um placeholder para a função que vai ser executada
    }   

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) { // Já utiliza os modifiers, fazendo as verificações antes do código.
        owner = _newOwner;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}

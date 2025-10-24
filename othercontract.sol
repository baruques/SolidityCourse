// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Callee {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns(uint256) { // Setando o valor de x na variável global
        x = _x;
        return x;
    }

    function setXAndSendEther(uint256 _x) public payable returns (uint256, uint256) { // Seta x e envia Ether
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract CallerFunctions {
    function setX(Callee _callee, uint256 _x) public { // Está chamando o contrato _callee do tipo Callee
        uint256 x = _callee.setX(_x); // Usa a função setX do contrato Callee
    }

    function setXFromAddress(address _addr, uint256 _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXAndSendEther(Callee _callee, uint256 _x) public payable { // Setando e enviando Ether através de outro contrato
        (uint256 x, uint256 value) = _callee.setXAndSendEther {value: msg.value}(_x); // Instancia-se Callee em _callee dentro do contrato CallerFunctions
    } // Tudo aqui referencia o contrato Callee
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract VariableExample{
    // Exemplificando variáveis e comentando o código
    uint8 public maxPermit = 255; // Variável pública de 8 bits (0 a 255)
    uint8 public testLimit; // Inicializando variável vazia
    int256 public negativeNumber = -1; // Reparar que deve-se tipar e escopar qualquer variável criada
    uint256 public number; // Variável pública de 256 bits (0 a 2^256)
    int256 public negative = -1; 

    // Aula 02

    bool permission;
    address public registeredAccount;
    string public name;
    bytes public myData;

    // Implementaremos uma função antes de apresentar o conceito para exemplificar o uso de uma variável

    function insertMaxuint (uint8 _number) external{
        testLimit = _number;
    }

    function insertNumber (uint256 _number) external{
        number = _number;
    }

    function testNegative (int256 _number) external view returns (int256){
        int256 NumNegativo = _number;
        int256 somaDosNegativos = negative - NumNegativo;
        return (somaDosNegativos);
    }

    // Funções da aula 02

    function changePermission(bool _permission) external {
        permission = _permission;
    }

    function registerAddress(address _address) external {
        registeredAccount = _address;
    }

    function registerMyAddress(string memory _username) external {
        registeredAccount = msg.sender;
        name = _username;
    }

    function storeData(bytes memory _data) public {
        myData = _data;
    }

    function convertStringToBytes(string memory _myWords) external pure returns (bytes memory){
        bytes memory myWords = bytes(_myWords);
        return myWords;
    }

    function obterTamanhoDados() public view returns (uint256) {
        return myData.length;
    }
}
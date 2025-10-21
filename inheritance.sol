// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Este será o contrato pai X

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Este será o contrato pai Y

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;    
    }
}

// Este será o contrato filho, que herda os contratos x e y

contract Filho is X("Gabriel"), Y("Bom dia, Gabriel!"){} // Este modo não obedece o ERC20

contract Filho2 is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text){} // Este modo obedece o ERC20
}

contract A { 
    function foo() public pure virtual returns (string memory) { // Uma função com a tag "Virtual" indica que ela pode ser overrided
        return "a";
    }
}

contract F is A {
    // Testando o override
    function foo() public pure virtual override returns (string memory){ // Precisa ter o mesmo nome da função overridada 
        return "f"; // Alteramos o retorno da função
    }
}

contract O is A {
    function foo() public pure virtual override returns (string memory){
        return "o";
    }
}

contract J is F, O { // Caso herde 2 ou mais contratos, j.foo retorna o ultimo à direita : "o"
    function foo() public pure override (F, O) returns (string memory) { // A ordem dentro do parenteses (f, o) tem que ser a mesma da herança acima
        return super.foo();
    }
}
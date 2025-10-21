// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Este será o contrato pai X

contract x {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Este será o contrato pai Y

contract y {
    string public text;

    constructor(string memory _text) {
        text = _text;    
    }
}

// Este será o contrato filho, que herda os contratos x e y

contract filho is x("Gabriel"), y("Bom dia, Gabriel!"){} // Este modo não obedece o ERC20

contract filho2 is x, y {
    constructor(string memory _name, string memory _text) x(_name) y(_text){} // Este modo obedece o ERC20
}

contract a { 
    function foo() public pure virtual returns (string memory) { // Uma função com a tag "Virtual" indica que ela pode ser overrided
        return "a";
    }
}

contract f is a {
    // Testando o override
    function foo() public pure virtual override returns (string memory){ // Precisa ter o mesmo nome da função overridada
        return "f"; // Alteramos o retorno da função
    }
}

contract o is a {
    function foo() public pure virtual override returns (string memory){
        return "o";
    }
}

contract j is f, o { // Caso herde 2 ou mais contratos, j.foo retorna o ultimo à direita : "o"
    function foo() public pure override (f, o) returns (string memory) { // A ordem dentro do parenteses (f, o) tem que ser a mesma da herança acima
        return super.foo();
    }
}
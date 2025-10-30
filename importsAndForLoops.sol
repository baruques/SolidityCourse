// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Test is ERC721 {
    using Counters for Counters.Counter; // Counters será usado usando a library de contador Counters

    Counters.Counter private supply; // a contagem Counter será o supply (quantidade mintada) do NFT ERC721

    uint256 numeroDePedacos = 12; // numero de pedaços de cara bolo criado

    uint public somaBolo; // quantidade de fatias de bolos -- sempre soma de 12 em 12. Cada bolo, 12 fatias.
    uint farinha = 2; // Quilos
    uint acucar = 1; // Quilos

    mapping(address => uint256) public totalDeQuilos; // cada bolo criado pelo usuário deverá ter 3 kg
    address[] public DonosDosBolos;

    constructor() ERC721("MyCollection", "Symbol"){}

    function bolo() public returns (string memory novoBolo){
        for (uint256 i = 0; i < numeroDePedacos; i++) {
            farinha;
            acucar;
            somaBolo++;
            totalDeQuilos[msg.sender] = farinha + acucar;
        }

        DonosDosBolos.push(msg.sender);
        return novoBolo = "mais um bolo pronto!";
    }

    function mint(address _receiver, uint256 _mintAmount) // Minting new NFT 
    public // NEVER DO THIS
    payable // ALWAYS VERIFY THIS
    {
        for (uint256 i = 0; i < _mintAmount; i++){
            supply.increment();
            _safeMint(_receiver, supply.current());
        }
    }
}


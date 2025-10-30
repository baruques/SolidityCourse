// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

abstract contract Data {
    string public name;
    uint256 public age;

    function setName(string memory _name) external virtual {
        name = _name;
    }

    function setAge(uint256 _age) public virtual {
        age = _age;
    }

    function getData() public view virtual returns(string memory, uint256) {
        return (name, (age));
    }
}

contract DataContract is Data {}






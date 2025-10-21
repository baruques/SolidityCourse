// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Callee {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns(uint256) {
        x = _x;
        return x;
    }

    function setXAndSendEther(uint256 _x) public payable returns (uint256, uint256) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract callerFunctions {
    function setX(Callee _callee, uint256 _x) public {
        uint256 x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint256 _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }
}
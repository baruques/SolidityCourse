// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ExampleFunctions{
    // Setting global variables
    uint256 public num;
    string public name;
    string public message;

    // Non-public variables to store through the function
    uint256 value; 

    //internal function which can only be called by the contract
    function halfNum(uint256 _number) internal { // When calling it this way, it's only accessible to the contract
         uint256 half = _number / 2;
         num = half;
    }

    function setMsg(string memory _msg) public {
        message = _msg;
    }

    function setName(string memory _name, uint256 _number) external {
        name = _name;
        halfNum(_number);
        setMsg("Called the contract");
    }

    function setValue(uint256 _value) external {
        value = _value;
    }

    function getValue() external view returns(uint256) {
        return value;
    }

    function multiply(uint256 x, uint256 y) external pure returns(uint256){
        uint256 multipliedValue = x * y;
        return multipliedValue;
    }

    function payEther() external payable {}
}
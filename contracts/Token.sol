// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Token{
    string public name = "my hardhat token";
    string public symbol = 'lpc';
    uint256 public total = 10000;
    address public owner;
    mapping(address => uint256) balances;
    event Transfer(address indexed _from, address indexed _to, uint256 amount);
    constructor(){
        owner = msg.sender;
        balances[msg.sender] = total;
    }
    function transfer(address _to, uint256 amount) public {
        require(balances[msg.sender] >= amount, 'nont enough token');
        balances[msg.sender] -= amount;
        balances[_to] += amount;
        console.log('jjj', _to, amount);
        emit Transfer(msg.sender, _to, amount);
    }

    function balanceOf(address _address) public view returns(uint256){
        return balances[_address];
    }
}
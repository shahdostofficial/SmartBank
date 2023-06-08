// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) balance;
    
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    function ethBalance(address usr) external view returns (uint256) {
        
        return usr.balance;
    }

    function deposit(uint256 amount) external payable {
        require(msg.value>=amount,"Not have balance");
        balance[msg.sender] += msg.value;
    }
    function withdraw()  external {
        
        require(owner==msg.sender,"U r NOT");
        require(balance[msg.sender] > 0, "Bank: no balance");
        uint256 amount = balance[msg.sender];
        balance[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}

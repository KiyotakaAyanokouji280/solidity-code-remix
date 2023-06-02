/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
contract prototype{
address public admin;
mapping(address => uint256) public balance;
uint256 public withdrawlLimit;
constructor(){
admin = msg.sender;
withdrawlLimit = 1;
}
function setWithdrawlLimit(uint256 limit) public {
require(msg.sender == admin, "Only admin can set the withdrawl limit!");

withdrawlLimit = limit;
}
function deposit() public payable {
balance[msg.sender]+=msg.value;
}

function withdraw(uint256 debit) public {
require(debit <= withdrawlLimit, "Debit amount exceeds the limit!");

require(debit <= balance[msg.sender], "Debit amount exceeds the remaining balance!");

balance[msg.sender] -= debit;

payable(msg.sender).transfer(debit);
}
function viewBalance() public view returns(uint256){
return balance[msg.sender];
}
}
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SimpleBank {
   
    //Data structure to hold balance of user
    mapping (address => uint256) private balance;

    
    //Deposit ETH to smart contract
    function deposit() external payable {
        balance[msg.sender] =  balance[msg.sender] + msg.value;
    }

    //Withdraw ETH from smart contract
    function withdraw(uint _amount) external {
        require(balance[msg.sender] > _amount +1 ether);
        payable(msg.sender).transfer(_amount);
        
    }

    //Transfer ETH from one address to another
    function transfer(address payable receiver, uint _amount) external {
        require(balance[msg.sender] > _amount +1 ether);
        receiver.transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return balance[msg.sender];
    }
}
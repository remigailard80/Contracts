// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Shop {
  mapping (address=>uint16) MyApple;

  function buyApple() payable external {
    MyApple[msg.sender]++;
  }

  function getApple() view external returns(uint16) {
    return MyApple[msg.sender];
  }

  function setMyApples(uint _applePrice, uint16 _sellNumber) payable external {
    uint _currentApples = MyApple[msg.sender];
    uint refund = (_sellNumber * _applePrice);

    require(_sellNumber > 0, "Sell Count Must be bigger than 0");
    require(_currentApples >= _sellNumber, "Sell Count is bigger than apples user having.");

    _currentApples -= _sellNumber;

    payable(msg.sender).transfer(refund);
  } 
}

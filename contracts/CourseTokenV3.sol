pragma solidity ^0.4.4;

import './CourseTokenV2.sol';
// V3 - inherits from V2
// Implement the remaining functions of ERC20 specs to make this version compatible 
// with Tools supporting ERC20
// This is JUST A SHELL - Students should try to implement exercise on their own

// Implement the administrative functions
contract CourseTokenV3 is CourseTokenV2 {

  function CourseTokenV3(uint256 initSupply) CourseTokenV2(initSupply) {
    // constructor
    // Feel free to change the constructor
  }
}

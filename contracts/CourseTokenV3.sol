pragma solidity ^0.4.4;

import './CourseTokenV2.sol';
// V3 - inherits from V2
// Add the admin functions * to be done
//
// This is JUST A SHELL - Students should try to implement it as an exercise on their own
//
// Refer to example admin functions below
//
// Implement the administrative functions
contract CourseTokenV3 is CourseTokenV2 {

  function CourseTokenV3(uint256 initSupply) CourseTokenV2(initSupply) {
    // constructor
    // Feel free to change the constructor
  }

  function increaseSupply(uint additional) returns (bool success) {
    // 1. Only owner can take this action
    // 2. Caller gets the ownership of additional coins
    return true;
  }

  function decreaseSupply(uint additional) returns (bool success) {
    // 1. Only owner can take this action
    // 2. Caller's token are taken for removal
    // 3. What happens when caller does not have sufficient balance?
    return true;
  }

  // Think of other admin functions you would like to implement
}

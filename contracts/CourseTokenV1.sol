pragma solidity ^0.4.4;

/**
 * Part of the Ethereum DAPPs design and development course
 * http://ACloudFan.com
 * 
 * Implements a simple ERC20 Token
 * V1 >> Implements simple token that does not support approve/transferFrom & allowance function
 *       This version will not be ERC20 compliant as it does not implement all specs funcs/events
 * V2 >> Supports the approve/transferFrom & allowance function
 * V3 >> Add some admin functions that only the owner of the coin can execute
 * 
 * Walkthrough is in Section#9 of course
 */
contract CourseTokenV1 {

  // 1. Declare the metadata for the coin
  //    All of thse variables declared public constant - so available as functions

  string public constant name = "DAPP Course Token";
  string public constant symbol = "DCT";

  // Token values are passed as integers so decimals is the number of decimals from righ
  // E.g., decimals = 2, value=100 interpretted as 1.00
  // E.g., decimals = 1, value=100 interpretted as 10.0
  uint8  public constant decimals = 0;

  // 6. Declare the event
  event Transfer(address _from, address _to, uint256 _value);

  // 2. Maintain the total supply
  uint256 public totalSupply;

  // 4. Maintain the balance in a mapping
  mapping(address => uint256)  balances;

  // 3. Constructor sets the initial supply as total available
  function CourseTokenV1(uint256 initSupply) {
    // constructor

    // Set the initial supply
    totalSupply = initSupply;

    // Set the sender as the owner of all the initial set of tokens
    // Declare the balances mapping
    balances[msg.sender] = totalSupply;
  }

  // 5. transfer
  function transfer(address _to, uint256 _value) returns (bool success) {
    // Return false if specified value is less than the balance available
    if(_value > 0  && balances[msg.sender] < _value) {
      return false;
    }

    // Reduce the balance by _value
    balances[msg.sender] -= _value;

    // Increase the balance of the receiever that is account with address _to
    balances[_to] += _value;

    // Declare & Emit the transfer event
    Transfer(msg.sender, _to, _value);

    return true;
  }

  // 7. balanceOf
  // Anyone can call this constant function to check the balance of tokens for an address
  function balanceOf(address _someone) constant returns (uint256 balance){
    return balances[_someone];
  }

  // Fallback function
  // Do not accept ethers
  function() {
    // This will throw an exception - in effect no one can purchase the coin
    assert(true == false);
  }
}

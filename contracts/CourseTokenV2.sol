pragma solidity ^0.4.4;

import './CourseTokenV1.sol';
// V2 - inherits from V1
// Implement the remaining functions of ERC20 specs to make this version compatible 
// with Tools supporting ERC20
contract CourseTokenV2 is CourseTokenV1 {

  // Allowances
  // Two dimensional associative array
  // index-1 = Owner account   index-2 = spender account
  mapping(address => mapping (address => uint256)) allowances;

  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  function CourseTokenV2(uint256 initSupply) CourseTokenV1(initSupply) {
    // constructor
    // we have invoked the constructor for the V1, so we are good
  }

  // How many tokens can spender spend from owner's account
  function allowance(address _owner, address _spender) constant returns (uint remaining){
    //1. Declare a mapping to manage allowances
    //2. Return the allowance for _spender approved by _owner
    return allowances[_owner][_spender];
  }

  // Approval - sets the allowance
  function approve(address _spender, uint256 _value) returns (bool success) {
    if(_value <= 0) return false;

    // 3. Simply add/change the amount in allowances
    allowances[msg.sender][_spender] = _value;

    // 4. Declare the Approval event and emit it
    Approval(msg.sender, _spender, _value);

    return true;
  }

  // Transfer from
  // B transfer _value from A's account to C' account
  function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
    // Multiple if statements to make it easy to understand
    // a) b) c) below may be combined with && in one statememnt

    // a) Specified _value must be > 0
    if(_value <= 0) return false;

    // b) Check if _spender allowed to spend the specified _value from _from account
    // Spender's address = msg.sender
    if(allowances[_from][msg.sender] < _value) return false;

    // c) Check if the _from has enough tokens
    if(balances[_from] < _value) return false;

    // Reduce the balance _from
    balances[_from] -= _value;
    // Increase the balance _to
    balances[_to] += _value;

    // Reduce the allowance for spender
    allowances[_from][msg.sender] -= _value;

    // Emit a transfer event
    Transfer(_from, _to, _value);

    return true;
  }
}

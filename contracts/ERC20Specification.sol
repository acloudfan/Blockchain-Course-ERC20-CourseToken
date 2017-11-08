// Abstract contract for the full ERC 20 Token standard
// https://github.com/ethereum/EIPs/issues/20
pragma solidity ^0.4.8;

contract ERC20Specification {

    /// total amount of tokens
    /// Compiler generates a function totalSupply()
    uint256 public totalSupply;

    /// digits after decimal points
    /// Compiler generates a function decimals()
    uint256 public decimals;

    /// symbol for your token
    /// Compiler generates a function symbol() 
    string public  symbol;

    /// description for your token
    /// Compiler generates a function description() 
    string public  name;

    /// returns balance of the _owner
    /// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function balanceOf(address _owner) constant returns (uint256 balance);

    /// transfers specified number of tokens from=msg.sender to=_to
    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) returns (bool success);

    /// this requires implementation of the allowance & approve
    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);

    /// msg.sender approves _spender for spending _value of his tokens
    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) returns (bool success);

    /// checks the max _spender can spend _owner tokens
    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

    /// emit the events for transfer and transferFrom
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    /// emit from approve event
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

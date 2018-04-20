pragma solidity ^0.4.0;

contract Inbox{
    
    uint public value;
    
    
    function Inbox(uint amount) public {
       value = amount;
    }
    function deposit(uint amount) public {
       value += amount;
    }
    function remove(uint amount) public{
        value -=amount;
    }
    function getvalue() public view returns (uint){
        return value;
    }
    
}

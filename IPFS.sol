pragma solidity ^0.4.22;

contract ipfs
    
{   address owner; 
    address tokenaddress = 0x95528ab9d26c2fd50e5a83708d31f2841f5db29f;

    mapping(uint => string) ipfsHash;
    
    modifier onlyOwner() {
    require(msg.sender == owner);
    _;
    }
    
    function ipfs() 
    {
        owner = msg.sender;
    }
    
    function setIpfsHash(uint _id, string _hash) onlyOwner
    {
        ipfsHash[_id] = _hash;
    }
    function getIpfsHash(uint _id, uint price)public returns(string)
    {   ssaa s = ssaa(tokenaddress);
        /*require(Product[_id].pAmount >= amount);
        uint price = Product[_id].pPrice;*/
        require(s.transferFrom(msg.sender, owner,price));
        return ipfsHash[_id];
    }
}

contract ssaa{
    
    function balanceOf(address _owner) public view returns (uint256 balance);
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);

    }

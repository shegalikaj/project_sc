pragma solidity ^0.4.22;


contract crowdsale{
    

    uint value; 
    address owner;
    bool freez;
    address beneficiary;
    uint fundingGoal;
    uint deadline;
    uint price;
    address token;
    uint amountRaised;
    mapping (address => AllowedPerson) AllowedP; 
    mapping (address => uint256) balanceOf;
   
    struct AllowedPerson
    {
        string name;
        address Address;
        bool allowed;
    }
    
    function crowdSale(address sentto, uint fundingGoalinEther, uint etherCostofToken, uint duration , address addressoftokentoUse)
    
    {
        beneficiary = sentto;
        fundingGoal =  fundingGoalinEther * 1 ether;
        deadline = now + duration * 1 minutes;
        token = addressoftokentoUse;
        price = etherCostofToken * 1 ether;
    }
  
  
    function addtoWhitelist(string _name, address _address, bool _allow)public  onlyOwner()
    {
        AllowedP[_address] = AllowedPerson
        (
            {
                name: _name,
                Address : _address,
                allowed : _allow
            }
        );
        
    }
    
    function byetokens() payable
    {
        
         require (AllowedP[msg.sender].allowed == true,"you are not allowed");
         require (freez == false, "tokens are freezed");
         uint amount = msg.value;
         balanceOf[msg.sender] += amount;
         amountRaised += amount;
         //......
         //.....
    }
    
     modifier onlyOwner()
    {
        
        require(msg.sender == owner);
            _;
    }
    
    function freezUnfreez(bool _freez)public  onlyOwner()
    {
        freez = _freez;
    }
    
  
    
   //........... 
}



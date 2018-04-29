ragma solidity ^0.4.21;

contract Voting{
    
    
    uint public total;
    uint constant priceperVote = 1 ether; 
    
    struct Voter
    { 
        bool vote;
        uint price ;
        uint rightoPay;
    }
    
    mapping (address => Voter) voters;
    
    bool[] votes;
    uint truecounter;
    uint falsecounter;

    function righttoPay() public
    {
        if (voters[msg.sender].price == 0)
        {
             voters[msg.sender].rightoPay = 1;
        }
     }
    /*function ret() public view returns (bool)
    {
        return  voters[msg.sender].vote ;
    }*/
   
    function paytoVote() payable
    {   
        
        require(msg.value == priceperVote);
        require(voters[msg.sender].rightoPay== 1);
        voters[msg.sender].price += msg.value;
    }
    
    function voting(bool _vote)public
    {  
    
        require(voters[msg.sender].price == priceperVote);
        voters[msg.sender].vote = _vote;
        votes.push(_vote);
        total +=priceperVote;
        
    }
    function votecouter() public
    {
        for (uint i=0; i<votes.length; i++)
        {
            if(votes[i] == true)
            {
                truecounter +=1; 
            }
            else
            {
                falsecounter +=1;
            }
        }
        /*if (truecounter > falsecounter)
        {
            a = "We voted Yes more than No";
        }
        else 
        {
            a = "We voted No more than "
        }*/
    }
    
}

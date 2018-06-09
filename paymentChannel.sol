pragma solidity ^0.4.22;

contract PaymentChannel
{
    
    address owner = msg.sender;
    address recipient;
    uint256 deposit;
    
    modifier onlyOwner()
    {
        
        require(msg.sender == owner, "only owner can create channel");
            _;
    }
    function createChannel(address _recipient )payable onlyOwner()
    {           require(msg.value > 0);
                recipient = _recipient; 
                deposit = msg.value;
    }
    
    
    function closeChannel(bytes32 msghash, bytes32 r, bytes32 s, uint8 v, uint8 value, string prefix)
    {   
        require( msg.sender == recipient);
        address signer = ecrecover(msghash, v, r, s);
        require(signer == owner, "signer is not the owner");
        bytes32 proof = sha3(prefix, value);
        require(proof == msghash);
        require(deposit >= value, "deposit is smaller than value");
        recipient.transfer(value);
        deposit = deposit - value;
        selfdestruct(owner);
    }
    
    }

    

}

pragma solidity ^0.4.19;

import "./ownable.sol";

contract test is Ownable{
    uint index=1;
    
    struct User{
        uint ID;
        string publickey;
        string functiontoencode;
        bool invaild;
    }
    
    mapping(uint => User) users;
    mapping(uint => address) idtoaddress;
    mapping(address =>uint) addresstoid;
    
    function showuser(uint _id)public view returns(string c,string d){
        User memory user = users[_id];
        require (user.invaild);
        return (user.publickey,user.functiontoencode);
    }
    
    function createuser(string _key,string encode) public {
        users[index]=(User(index,_key,encode,false));
        idtoaddress[index]=msg.sender;
        addresstoid[msg.sender]=index++;
    }
    
    function confirm(uint _id) public onlyOwner{
        User storage user=users[_id];
        user.invaild=true;
    }
    
    function changepublickey(uint _id,string _key) public{
        require(msg.sender==idtoaddress[_id]);
        User storage user = users[_id];
        user.publickey=_key;
    }
    
    function deleteuser(uint _id) public{
        require(msg.sender==idtoaddress[_id]);
        User storage user=users[_id];
        user.ID=0;
        user.publickey="";
        user.functiontoencode="";
        user.invaild=false;
        idtoaddress[_id]=address(0);
        addresstoid[msg.sender]=0;
    }
    
    function kill() public onlyOwner(){
      selfdestruct(owner);
  }

}
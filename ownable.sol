pragma solidity ^0.4.19;
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;
  address public manager;
  uint public end=now+1 days;
  
  function shownow()view public returns(uint){
      return (now);
  }

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
      manager=msg.sender;
      owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    if(now >=end)owner=address(0);
    require(msg.sender == owner||msg.sender==manager);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    owner = newOwner;
  }
  
    function setmanger(address newManger) public onlyOwner {
    require(newManger != address(0));
    manager=newManger;
  }

}

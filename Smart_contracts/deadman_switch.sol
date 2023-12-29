// SPDX-License-Identifier: MIT 
pragma solidity >=0.8.2 <0.9.0;

contract DeadmanSwitch {
    address owner;
    uint256 lastCheckIn;
    address to;
    constructor(address _to) {
        owner = msg.sender;
        to = _to;
        lastCheckIn = block.number;
    }

    function check_alive() public {
       if (block.number - lastCheckIn >= 10) {
            uint256 contractBalance = address(this).balance;
            require(contractBalance > 0, "No funds to transfer");
            payable(to).transfer(contractBalance);
       }
    }

    function still_alive() public onlyOwner() {
        lastCheckIn = block.number;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
}
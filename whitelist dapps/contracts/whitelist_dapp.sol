// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract WhiteList_dapp {
    uint8 maxWhitelistAddress;
    uint8 noOfWhitelistAddress;
    mapping(address => bool) whitelist;
    constructor(uint8 _maxWhitelistAddress) {
        maxWhitelistAddress = _maxWhitelistAddress;
    }

    function addAddressToWhiteList() public {
        require(!whitelist[msg.sender],"Already Whitelisted");
        require(noOfWhitelistAddress < maxWhitelistAddress, "Max Whitelist Address Reached");
        whitelist[msg.sender] = true;
        noOfWhitelistAddress++;
    }
}
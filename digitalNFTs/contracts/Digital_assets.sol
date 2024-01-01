// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Digital_assets is ERC721URIStorage {

    constructor() ERC721("MyNFT", "MNFT") public {}

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    function mintNFT(address _to, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        require(newItemId <= 3000);
        _mint(_to, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function changeTokenUri(uint256 tokenId, string memory tokenURI)
        public
    {
        require(ownerOf(tokenId) == msg.sender);
        _setTokenURI(tokenId, tokenURI);
    }
}

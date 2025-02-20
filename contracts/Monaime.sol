// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MonaimeNFT is ERC721,ERC721URIStorage, Ownable {
    mapping(address => bool) private _hasMinted; // Track addresses that have minted
    uint256 private _nextTokenId;

    constructor(address initialOwner) ERC721("Monaime", "MI") Ownable(initialOwner) {}

    // Mint function - only allows one NFT per address
    function safeMint(address to,string memory uri) public onlyOwner {
        require(!_hasMinted[to], "Each address can only mint one NFT");
        _hasMinted[to] = true;

        uint256 tokenId = _nextTokenId;
        _nextTokenId++;

        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

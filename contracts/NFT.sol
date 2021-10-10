pragma solidity ^0.8.0;

// OpenZepplin imports

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("DogNFT", "DOG") {
        console.log("Dog NFT");
    }

    // create NFT with this function
    function createNFT() public {
        uint256 newNftID = _tokenIds.current();

        // Mint the NFT
        _safeMint(msg.sender, newNftID);

        _setTokenURI(newNftID, "https://jsonkeeper.com/b/2IWJ");
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newNftID,
            msg.sender
        );
        // Up count by 1
        _tokenIds.increment();
    }
}

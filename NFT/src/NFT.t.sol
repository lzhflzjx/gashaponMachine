// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;
import "forge-std/Test.sol";
import "../src/NFT.sol";


contract NFTTest is Test {

		NFT private nft;
		
		function setUp() public {
				nft = new NFT("NFT_tutorial", "TUT", "baseUri");
		}
		
		function test_RevertMintWithoutValue() public {
		    vm.expectRevert(MintPriceNotPaid.selector);
				nft.mintTo(address(1));
		}
		
		
		function test_MintPricePaid() public {
		    nft.mintTo{value: 0.08 ether}(address(1));
		}
		
		
		function test_RevertMintToZeroAddress() public {
		    vm.expectRevert("INVALID_RECIPIENT");
		    nft.mintTo{value: 0.08 ether}(address(0));
		}
}
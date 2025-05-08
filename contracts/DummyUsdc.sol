// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title DummyUsdc
 * @dev USDC token for testing
 */
contract DummyUsdc is ERC20, Ownable {
    constructor() ERC20("USD Coin", "dUSDC") Ownable(msg.sender) {
        // 6 decimals for USDC
        _mint(msg.sender, 1_000_000 * 10**6); // Mint 1M USDC
    }

    function decimals() public view virtual override returns (uint8) {
        return 6; // USDC has 6 decimals
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
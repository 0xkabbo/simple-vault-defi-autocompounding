// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title SimpleVault
 * @dev A minimalist ERC-4626 Vault implementation.
 */
contract SimpleVault is ERC4626 {
    /**
     * @param asset The underlying token (e.g., USDC, WETH) to be deposited.
     * @param name The name of the Vault Token.
     * @param symbol The symbol of the Vault Token (e.g., vUSDC).
     */
    constructor(
        IERC20 asset,
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) ERC4626(asset) {}

    /**
     * @dev Example function to simulate yield. 
     * In a real vault, this would be assets earned from a lending protocol.
     * @param amount The amount of yield to add to the vault.
     */
    function distributeYield(uint256 amount) public {
        // This is purely for demonstration.
        // In production, assets are usually sent to the vault by a Strategy.
        SafeERC20.safeTransferFrom(IERC20(asset()), msg.sender, address(this), amount);
    }
}

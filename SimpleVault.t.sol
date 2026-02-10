// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./SimpleVault.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockToken is ERC20 {
    constructor() ERC20("Mock", "MCK") {
        _mint(msg.sender, 10000e18);
    }
}

contract SimpleVaultTest is Test {
    SimpleVault public vault;
    MockToken public asset;
    address public alice = address(0xA);

    function setUp() public {
        asset = new MockToken();
        vault = new SimpleVault(asset, "Vault Token", "vMCK");
        asset.transfer(alice, 1000e18);
    }

    function testDeposit() public {
        vm.startPrank(alice);
        asset.approve(address(vault), 100e18);
        vault.deposit(100e18, alice);
        vm.stopPrank();

        assertEq(vault.balanceOf(alice), 100e18);
        assertEq(asset.balanceOf(address(vault)), 100e18);
    }

    function testShareAppreciation() public {
        // Alice deposits 100 tokens
        vm.startPrank(alice);
        asset.approve(address(vault), 100e18);
        vault.deposit(100e18, alice);
        vm.stopPrank();

        // Simulate yield: 50 tokens added to vault from external source
        asset.transfer(address(vault), 50e18);

        // Alice's 100 shares should now be worth 150 assets
        assertEq(vault.convertToAssets(100e18), 150e18);
    }
}

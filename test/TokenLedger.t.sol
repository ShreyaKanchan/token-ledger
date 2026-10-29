// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../TokenLedger.sol";

contract TokenLedgerTest is Test {
    TokenLedger ledger;
    address alice = address(0xA11CE);
    address bob = address(0xB0B);

    function setUp() public { ledger = new TokenLedger(); ledger.mint(alice, 100 ether); }

    function testMintUpdatesSupplyAndBalance() public {
        assertEq(ledger.totalSupply(), 100 ether);
        assertEq(ledger.balanceOf(alice), 100 ether);
    }

    function testTransferMovesTokens() public {
        vm.prank(alice);
        ledger.transfer(bob, 25 ether);
        assertEq(ledger.balanceOf(alice), 75 ether);
        assertEq(ledger.balanceOf(bob), 25 ether);
    }

    function testTransferFromConsumesAllowance() public {
        vm.prank(alice);
        ledger.approve(address(this), 10 ether);
        ledger.transferFrom(alice, bob, 10 ether);
        assertEq(ledger.allowance(alice, address(this)), 0);
    }
}

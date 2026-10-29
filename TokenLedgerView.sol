// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IERC20View { function balanceOf(address) external view returns (uint256); }
contract TokenLedgerView { function balances(IERC20View token, address[] calldata accounts) external view returns (uint256[] memory result) { result = new uint256[](accounts.length); for (uint256 i; i < accounts.length; i++) result[i] = token.balanceOf(accounts[i]); } }

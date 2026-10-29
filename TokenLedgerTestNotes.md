# Test plan

- Minting increases both `totalSupply` and the recipient balance.
- Transfers reject zero addresses and insufficient balances.
- Allowances decrease after delegated transfers.
- Events contain indexed addresses for off-chain indexing.
- Unauthorized accounts cannot mint.

These scenarios are a checklist for a Foundry or Hardhat test suite.

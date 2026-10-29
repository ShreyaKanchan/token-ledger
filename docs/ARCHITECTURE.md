# Architecture notes

The contract owns the accounting invariant: transfers move balances without changing total supply, while minting is isolated behind an ownership check. Off-chain tests should mirror these invariants.

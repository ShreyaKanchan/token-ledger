# TokenLedger

> A compact ERC-20-style token ledger demonstrating balances, allowances, minting, and event-driven accounting.

![TokenLedger](assets/logo.svg)

An ERC-20-inspired Solidity token with balances, allowances, minting, and transfer events.

The contract is intentionally compact for review. Before deployment, add access-control hardening, tests, fuzzing, and an audit.

## Contract surface

`mint` creates supply for the owner, `transfer` moves balances directly, and `approve`/`transferFrom` model delegated spending. The `Transfer` and `Approval` events make state changes indexable by clients such as BlockLens.

## Security checklist

- Replace demo ownership with audited role-based access control.
- Add invariant and fuzz tests for total supply and allowance behavior.
- Decide whether minting is capped, pausable, or permanently disabled.
- Verify compiler settings and deploy only after an independent audit.

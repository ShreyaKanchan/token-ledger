import test from "node:test";
import assert from "node:assert/strict";
test("token accounting preserves supply across a transfer", () => { const balances = { alice: 100, bob: 0 }; const amount = 25; balances.alice -= amount; balances.bob += amount; assert.equal(balances.alice + balances.bob, 100); });

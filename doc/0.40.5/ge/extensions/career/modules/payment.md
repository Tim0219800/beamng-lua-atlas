# `career_modules_payment`

*File: `lua/ge/extensions/career/modules/payment.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_payment`: `extensions.load("career_modules_payment")`, then the global `career_modules_payment`

Generic career payment: checks that a price (currency table) is payable with the player's attributes and debits it via career_modules_playerAttributes.

## Example

```lua
if career_modules_payment.pay({money = {amount = 500}}, {tags = {"buying"}, label = "Purchase"}) then ... end
```

## Notes

- The price is a table {currency = {amount = n, canBeNegative = bool}}. A currency with canBeNegative = true is never blocking.
- pay returns false without debiting anything if canPay fails.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_payment.canPay(price)` | Tests whether the player has enough of each currency of the price (except canBeNegative currencies or amount <= 0). | 9 |
| `career_modules_payment.pay(price, reason)` | Debits the price (negative amounts) via playerAttributes.addAttributes if canPay. | 18 |

### Parameter details

#### `career_modules_payment.canPay(price)`

Tests whether the player has enough of each currency of the price (except canBeNegative currencies or amount <= 0).

- `price` (*table<string, {amount: number, canBeNegative: boolean|nil}>*) : Price per currency.
- **returns**: boolean true if payable.

#### `career_modules_payment.pay(price, reason)`

Debits the price (negative amounts) via playerAttributes.addAttributes if canPay.

- `price` (*table*) : Price per currency, as for canPay.
- `reason` (*table|nil*) : Reason passed to the attributes log (tags, label).
- **returns**: boolean true if the payment took place.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/payment.lua`.*

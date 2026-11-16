# `career_modules_insurance_history`

*File: `lua/ge/extensions/career/modules/insurance/history.lua` · VM: Game Engine (GE) · 116 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_insurance_history`: `extensions.load("career_modules_insurance_history")`, then the global `career_modules_insurance_history`

History of the player's insurance events in career (claims, private repairs, renewals, contract changes…). Each entry has a type, a title, effects (for example {type='money', changedBy=-amount}), the name of the insurance concerned, an optional text, free data (other) and the os.time() time. The module also provides totals used for the insurance statistics. The data is saved by the insurance module via getPlHistory/setPlHistory.

## Notes

- Entry types used by the totals: 'insuranceRepairClaim', 'privateRepair', 'insuranceRenewed', 'insuranceChanged'.
- getHistoryTotalDetails (internal) increments totalCount once per 'money' effect (and not once per entry): an entry with several money effects counts several times, an entry without a money effect does not count.
- The money total uses the absolute value of changedBy.
- getTotalInsuranceRepairDeductiblesPaid reads entry.other.deductible and getDamageCostCoveredByInsurance reads entry.other.vehDamagePrice; these fields must be provided in other when adding.
- buildPlHistory returns a copy sorted from most recent to oldest and adds a date field formatted os.date('%c').

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_insurance_history.addToPlHistory(data)` | Adds an entry to the history with the current time (os.time()). | 10 |
| `career_modules_insurance_history.buildPlHistory()` | Builds the history list for the UI: deep copy sorted from most recent to oldest, with a readable date. | 23 |
| `career_modules_insurance_history.getDamageCostCoveredByInsurance()` | Sum of the damage costs (vehDamagePrice) of the repair claims, i.e. the value of the damage covered. | 75 |
| `career_modules_insurance_history.getInsuranceClaimsCount()` | Number of repairs covered by an insurance (money effects of the 'insuranceRepairClaim' entries). | 85 |
| `career_modules_insurance_history.getNonInsuranceRepairsCount()` | Number of repairs paid without insurance ('privateRepair' entries). | 89 |
| `career_modules_insurance_history.getPlHistory()` | Returns the raw history table (for saving). | 53 |
| `career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid()` | Sum of the deductibles paid on repair claims. | 65 |
| `career_modules_insurance_history.getTotalPremiumPaid()` | Total premiums paid: renewals ('insuranceRenewed') plus contract changes ('insuranceChanged'). | 93 |
| `career_modules_insurance_history.getTotalPrivateRepairsPaid()` | Total spent on repairs without insurance. | 99 |
| `career_modules_insurance_history.initPlHistory()` | Clears the history (new game). *(internal)* | 61 |
| `career_modules_insurance_history.setPlHistory(history)` | Replaces the history (save loading); a nil value clears it. | 57 |

### Parameter details

#### `career_modules_insurance_history.addToPlHistory(data)`

Adds an entry to the history with the current time (os.time()).

- `data` (*table*) : Table with type, title, effects, concernedInsuranceName, overrideText, other.

#### `career_modules_insurance_history.buildPlHistory()`

Builds the history list for the UI: deep copy sorted from most recent to oldest, with a readable date.

- **returns**: table List of entries with an extra date field.

#### `career_modules_insurance_history.getDamageCostCoveredByInsurance()`

Sum of the damage costs (vehDamagePrice) of the repair claims, i.e. the value of the damage covered.

- **returns**: number Amount.

#### `career_modules_insurance_history.getInsuranceClaimsCount()`

Number of repairs covered by an insurance (money effects of the 'insuranceRepairClaim' entries).

- **returns**: integer Number of claims.

#### `career_modules_insurance_history.getNonInsuranceRepairsCount()`

Number of repairs paid without insurance ('privateRepair' entries).

- **returns**: integer Number of private repairs.

#### `career_modules_insurance_history.getPlHistory()`

Returns the raw history table (for saving).

- **returns**: table List of entries.

#### `career_modules_insurance_history.getTotalInsuranceRepairDeductiblesPaid()`

Sum of the deductibles paid on repair claims.

- **returns**: number Amount.

#### `career_modules_insurance_history.getTotalPremiumPaid()`

Total premiums paid: renewals ('insuranceRenewed') plus contract changes ('insuranceChanged').

- **returns**: number Amount in game money.

#### `career_modules_insurance_history.getTotalPrivateRepairsPaid()`

Total spent on repairs without insurance.

- **returns**: number Amount.

#### `career_modules_insurance_history.setPlHistory(history)`

Replaces the history (save loading); a nil value clears it.

- `history` (*table|nil*) : Saved history.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/insurance/history.lua`.*

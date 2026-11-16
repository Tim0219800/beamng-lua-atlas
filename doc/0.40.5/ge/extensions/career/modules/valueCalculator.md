# `career_modules_valueCalculator`

*File: `lua/ge/extensions/career/modules/valueCalculator.lua` · VM: Game Engine (GE) · 245 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_valueCalculator`: `extensions.load("career_modules_valueCalculator")`, then the global `career_modules_valueCalculator`

Computation of the value and repair state of career vehicles and parts: depreciation per year of age (depreciationByYear table), loss related to mileage (odometer), scrap value (5% of the value), value of an inventory vehicle taking added/removed parts and damage into account, repair cost and duration (parts with integrity 0).

## Notes

- Constants: loss of 0.0000025 per relative km, scrap 5%, 20 s of repair per part, threshold of 3 broken parts to consider the vehicle in need of repair, minimum value min(500, 5% of the new value).
- The reference year is hardcoded to 2023 (age = 2023 - year) in getPartValue and getVehicleValue.
- Repair price: 60% of part.value (700 by default) for each part whose integrityValue is 0.
- In a vehicle's value, added parts count for 50% of their value and removed parts are subtracted at 50%.
- partConditionsNeedRepair does not take exceptions into account (bumpers, doors, mirrors, front end): the old logic is commented out.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition)` | Adjusted value of an item according to its age and mileage: yearly depreciation, mileage loss, plus the scrap value. | 47 |
| `career_modules_valueCalculator.getBrokenPartsThreshold()` | Returns the broken parts threshold (3). | 229 |
| `career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage)` | Current value of an inventory vehicle (adjusted base + parts - repairs, floored at the minimum value). | 194 |
| `career_modules_valueCalculator.getNumberOfBrokenParts(partConditions)` | Counts the parts whose integrityValue is 0. | 200 |
| `career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots)` | Compares a vehicle's original parts to the current parts and returns the added and removed parts per slot. | 55 |
| `career_modules_valueCalculator.getPartValue(part)` | Value of a part: value adjusted by age and mileage, -5% if primered, reduced according to the number of repairs. | 91 |
| `career_modules_valueCalculator.getRepairDetails(invVehInfo)` | Damage API: computes the price, duration and number of parts to replace for an inventory vehicle. | 133 |
| `career_modules_valueCalculator.getVehicleMileageById(inventoryId)` | Returns the mileage (odometer of the main part) of an inventory vehicle. 0 if not found. | 33 |
| `career_modules_valueCalculator.partConditionsNeedRepair(partConditions)` | Indicates whether the number of broken parts reaches the threshold (3). | 219 |

### Parameter details

#### `career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition)`

Adjusted value of an item according to its age and mileage: yearly depreciation, mileage loss, plus the scrap value.

- `value` (*number*) : Base value.
- `vehicleCondition` (*table*) : {age = years, mileage = odometer}.
- **returns**: number Adjusted value.

#### `career_modules_valueCalculator.getBrokenPartsThreshold()`

Returns the broken parts threshold (3).

- **returns**: integer Threshold.

#### `career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage)`

Current value of an inventory vehicle (adjusted base + parts - repairs, floored at the minimum value).

- `inventoryId` (*integer*) : Inventory id.
- `ignoreDamage` (*boolean|nil*) : If true, does not deduct the repair cost.
- **returns**: number|nil Value, or nil if the vehicle does not exist.

#### `career_modules_valueCalculator.getNumberOfBrokenParts(partConditions)`

Counts the parts whose integrityValue is 0.

- `partConditions` (*table|nil*) : Conditions per part path.
- **returns**: integer Number of broken parts (0 if the argument is not a table).

#### `career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots)`

Compares a vehicle's original parts to the current parts and returns the added and removed parts per slot.

- `originalParts` (*table<string, table>*) : Original parts per slot (with .name).
- `newParts` (*table<string, string>*) : Names of the current parts per slot.
- `changedSlots` (*table<string, boolean>*) : Modified slots (to detect an identical part being replaced).
- **returns**: table<string, string> addedParts (slot -> name).
- **returns**: table removedParts.

#### `career_modules_valueCalculator.getPartValue(part)`

Value of a part: value adjusted by age and mileage, -5% if primered, reduced according to the number of repairs.

- `part` (*table*) : Part with value, year, partCondition.odometer, primered, repairCount.
- **returns**: number Part value.

#### `career_modules_valueCalculator.getRepairDetails(invVehInfo)`

Damage API: computes the price, duration and number of parts to replace for an inventory vehicle.

- `invVehInfo` (*table*) : Inventory vehicle (id, partConditions, config.partsTree).
- **returns**: table {price, repairTime, partsCountToBeReplaced}.

#### `career_modules_valueCalculator.getVehicleMileageById(inventoryId)`

Returns the mileage (odometer of the main part) of an inventory vehicle. 0 if not found.

- `inventoryId` (*integer*) : Inventory id.
- **returns**: number Odometer (game unit for partCondition.odometer, inferred from code).

#### `career_modules_valueCalculator.partConditionsNeedRepair(partConditions)`

Indicates whether the number of broken parts reaches the threshold (3).

- `partConditions` (*table|nil*) : Conditions per part path.
- **returns**: boolean true if the vehicle needs repair.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career'}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/valueCalculator.lua`.*

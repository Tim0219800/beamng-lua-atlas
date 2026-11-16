# `career_modules_tuning`

*File: `lua/ge/extensions/career/modules/tuning.lua` · VM: Game Engine (GE) · 412 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tuning`: `extensions.load("career_modules_tuning")`, then the global `career_modules_tuning`

Tuning menu of a career inventory vehicle, from the garage computer. It reads the vehicle's tuning variables, applies changes by respawning the vehicle, builds a shopping cart (categories, subcategories, prices, 7% taxes) sent to the UI, and debits the money on confirmation. A capsule tether cancels the purchases if the player moves away from the garage.

## Notes

- Prices are hardcoded in the local `prices` table (100 by default for suspension/wheels/alignment/chassis, 500 for the transmission, 200 by default); the category, subcategory and each variable can add up.
- Variables excluded from the cart (price 0): $$ffbstrength, $tirepressure_F and $tirepressure_R. Variables hidden in career: $fuel, $fuel_R, $fuel_L and the Cargo category.
- Total = sum of prices + 7% taxes. The purchase calls invalidateCertification, setVehicleDirty, removes the money (tags tuning/buying) and unlocks the VEHICLE_TUNED achievement.
- The vehicle is frozen (setFreeze) during the menu and unfrozen on close.
- In onComputerAddFunctions, the variable `buttonDisabled` is not defined in the file (is nil).

**Dependencies (loaded first):** `career_career`, `gameplay_achievement`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tuning.apply(tuningValues, callback)` | Merges new tuning values into the vehicle config, respawns it at the same position and rotation, freezes it, triggers the onCareerTuningApplied hook, updates the modified variables and recomputes the cart. | 310 |
| `career_modules_tuning.applyShopping()` | Confirms the purchase: invalidates the certification, marks the vehicle modified, debits the total, unlocks the achievement, plays the sound, then saves (if autosave) before closing, otherwise closes directly. | 152 |
| `career_modules_tuning.cancelShopping()` | Cancels: reapplies the original variables then closes the menu. Also called by the tether when the player moves away. | 346 |
| `career_modules_tuning.close()` | Closes the menu: returns to the computer menu (or closes all career menus), unfreezes the vehicle and removes the tether. | 350 |
| `career_modules_tuning.getTuningData()` | Returns the current vehicle's tuning data (variables translated by core_vehicle_partmgmt), without the variables hidden in career. | 183 |
| `career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions)` | Garage computer hook: adds the "tuning" button for each garage vehicle. Disabled if the vehicle needs repair, if the starter vehicle is not bought or if permissions deny the tuning/vehicleModification tags. *(internal)* *(hook)* | 364 |
| `career_modules_tuning.onVehicleSaveFinished()` | Hook called at the end of a vehicle save; closes the menu if closing was waiting for the save. *(internal)* *(hook)* | 168 |
| `career_modules_tuning.removeVarFromShoppingCart(varName)` | Resets a variable to its original value, removes it from the cart and sends the UI (updateTuningVariable). | 333 |
| `career_modules_tuning.start(_inventoryId, _originComputerId)` | Opens tuning for an inventory vehicle. Remembers the original variables, fills in missing default values, offers a repair if few parts are broken (below the valueCalculator threshold), then navigates to career.computer.tuning, creates the cart and the tether. Does nothing if the vehicle has not appeared on the map. | 289 |

### Parameter details

#### `career_modules_tuning.apply(tuningValues, callback)`

Merges new tuning values into the vehicle config, respawns it at the same position and rotation, freezes it, triggers the onCareerTuningApplied hook, updates the modified variables and recomputes the cart.

- `tuningValues` (*table<string, number>*) : Tuning variables (e.g. "$gear_1") and their value.
- `callback` (*function|nil*) : Passed to career_modules_inventory.spawnVehicle.

#### `career_modules_tuning.getTuningData()`

Returns the current vehicle's tuning data (variables translated by core_vehicle_partmgmt), without the variables hidden in career.

- **returns**: table|nil Tuning variables, or nil if the vehicle is not found.

#### `career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions)`

Garage computer hook: adds the "tuning" button for each garage vehicle. Disabled if the vehicle needs repair, if the starter vehicle is not bought or if permissions deny the tuning/vehicleModification tags.

- `menuData` (*table*) : Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Table to fill (vehicleSpecific[inventoryId][id]).

#### `career_modules_tuning.removeVarFromShoppingCart(varName)`

Resets a variable to its original value, removes it from the cart and sends the UI (updateTuningVariable).

- `varName` (*string*) : Tuning variable name.

#### `career_modules_tuning.start(_inventoryId, _originComputerId)`

Opens tuning for an inventory vehicle. Remembers the original variables, fills in missing default values, offers a repair if few parts are broken (below the valueCalculator threshold), then navigates to career.computer.tuning, creates the cart and the tether. Does nothing if the vehicle has not appeared on the map.

- `_inventoryId` (*integer|nil*) : Inventory id; by default, the first one of the nearest garage.
- `_originComputerId` (*any*) : Id of the originating garage computer (otherwise no UI or tether).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career", "gameplay_achievement"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCareerTuningApplied`
- `onCareerTuningStarted` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `sendTuningShoppingData`, `updateTuningVariable`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tuning.lua`.*

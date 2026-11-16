# `career_modules_insurance_repairScreen`

*File: `lua/ge/extensions/career/modules/insurance/repairScreen.lua` · VM: Game Engine (GE) · 224 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_insurance_repairScreen`: `extensions.load("career_modules_insurance_repairScreen")`, then the global `career_modules_insurance_repairScreen`

Prepares the data and handles opening/closing of the repair screen (UI route career.computer.repair) reachable from the garage computer in career. It builds the repair options with or without insurance (damage cost, repair delays from instant to 10 minutes, deductible, current and future premium after a claim, driver score), adds the "Repair" function to the computer functions and applies a 7 m tether around the computer.

## Notes

- Repair delays without insurance (premiumInfluence = money surcharge): instant 500, 2 min 350, 5 min 150, 10 min 50; total price = surcharge + damage cost.
- With insurance, only the delay option included in the contract and the instant option are offered; the included option costs only the deductible, the instant one costs deductible + 500 (except with the free instantRepair perk).
- futureDriverScore drops by 1 after a claim, unless 'accidentForgiveness' remain on the contract.
- startRepairInGarage blocks repeated calls (closeMenuAfterSaving) until onVehicleSaveFinished: an instant repair saves a new vehicle thumbnail that hides the UI.
- The module has no initialization function: the state (vehicle, originating computer, tether) is set by openRepairMenu.
- getRepairData assumes openRepairMenu was called before (vehicleToRepairData non-nil), otherwise it crashes.

**Dependencies (loaded first):** `career_modules_valueCalculator`, `career_modules_inventory`, `career_modules_playerAttributes`, `career_modules_payment`, `career_modules_insurance_insurance`, `career_modules_tether`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_insurance_repairScreen.closeMenu()` | Called by the UI to close the screen; ignored while a vehicle save after repair is in progress. | 196 |
| `career_modules_insurance_repairScreen.closeRepairMenu()` | Closes the screen: goes back to the originating computer's menu, or closes all career menus. | 34 |
| `career_modules_insurance_repairScreen.getRepairData()` | Builds the screen data: repairOptions (noInsuranceRepairData, insuranceRepairData with premium, deductible, renewal, tolerances), vehicleData (damage cost, name, initial value, thumbnail, insured), player attributes, tiers and current and future driver score. | 96 |
| `career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions)` | Garage computer hook: adds the "repair" function for each vehicle in the garage (disabled before the starter vehicle is bought or if the 'vehicleRepair' permissions forbid it). *(internal)* *(hook)* | 43 |
| `career_modules_insurance_repairScreen.onMenuClosed()` | Menu close hook: removes the leash. *(internal)* *(hook)* | 188 |
| `career_modules_insurance_repairScreen.onVehicleSaveFinished()` | Vehicle save end hook: if a repair was waiting for this, closes the screen again. *(internal)* *(hook)* | 207 |
| `career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId)` | Opens a vehicle's repair screen. If an originating computer is given, starts a leash (door or sphere, 7 m) that closes the menus if the player moves away. | 13 |
| `career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData)` | Starts the repair via career_modules_insurance_insurance.startRepairInGarage and waits for the vehicle save to finish before closing the screen again. | 201 |

### Parameter details

#### `career_modules_insurance_repairScreen.getRepairData()`

Builds the screen data: repairOptions (noInsuranceRepairData, insuranceRepairData with premium, deductible, renewal, tolerances), vehicleData (damage cost, name, initial value, thumbnail, insured), player attributes, tiers and current and future driver score.

- **returns**: table Data for the UI.

#### `career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions)`

Garage computer hook: adds the "repair" function for each vehicle in the garage (disabled before the starter vehicle is bought or if the 'vehicleRepair' permissions forbid it).

- `menuData` (*table*) : Menu data (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Functions to complete (vehicleSpecific[inventoryId][id]).

#### `career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId)`

Opens a vehicle's repair screen. If an originating computer is given, starts a leash (door or sphere, 7 m) that closes the menus if the player moves away.

- `vehicle` (*table*) : Data of the inventory vehicle to repair.
- `_originComputerId` (*string|nil*) : Identifier of the garage computer that opened the screen.

#### `career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData)`

Starts the repair via career_modules_insurance_insurance.startRepairInGarage and waits for the vehicle save to finish before closing the screen again.

- `invVehId` (*integer*) : Inventory vehicle identifier.
- `repairOptionData` (*table*) : Chosen repair option (insurance or not, delay).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: valueCalculator, inventory, playerAttributes, payment, insurance_insurance, tether, etc. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/insurance/repairScreen.lua`.*

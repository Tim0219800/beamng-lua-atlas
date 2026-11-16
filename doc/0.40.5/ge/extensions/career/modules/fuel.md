# `career_modules_fuel`

*File: `lua/ge/extensions/career/modules/fuel.lua` · VM: Game Engine (GE) · 665 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_fuel`: `extensions.load("career_modules_fuel")`, then the global `career_modules_fuel`

Career mode refueling transaction at a gas station. startTransaction opens the career.refueling screen, reads the player vehicle's tanks (energyStorage), then onUpdate raises the energy of the active tanks at the chosen flow rate, computes the price (station price per unit, possible insurance discount) and sends the data to the UI (initialFuelingData, updateFuelData). payPrice debits the money (or nothing for a work vehicle, paid by the company), uiCancelTransaction restores the starting levels.

## Notes

- Internal units in joules; the UI receives liters (gasoline, diesel, kerosine), kg (n2o) or kWh (electricEnergy) via the MJ-per-unit factors: gasoline 31.125, diesel 36.112, kerosine 34.4, n2o 8.3, electricEnergy 3.6.
- Maximum flow rate 50,000,000 J/s (maxFuelFlowRate) multiplied by the onChangeFlowRate factor; electric charges at a third of this rate.
- Only the tanks whose type is known and offered by the station (freeroam_facilities_fuelPrice.getFuelPrice non-nil) are displayed, unless debugIgnoreStationFuelTypeRestriction is true.
- Refueling only starts if the vehicle is moving at less than 1 m/s; if the speed exceeds 2 m/s during the transaction, onUpdate cancels the transaction.
- An inventory vehicle with loanType == 'work' does not pay (message "paidByCompany").
- minimumRefuelingCheck: electric = full recharge; liquid <= 1% = set back to 5%; emergency message displayed. Useful after running out of fuel.
- Emitted hooks: onRefuelingStartTransaction, onRefuelingStopFueling(tank), onRefuelingEndTransaction, onPaidRefuelling(price).
- payPrice unlocks the VEHICLE_REFUELLED achievement twice (before and after endTransaction); harmless, but redundant. In payPrice, the onPaidRefuelling hook receives overallPrice already reset to 0 by endTransaction.
- In non-shipping builds, onUpdate displays a "Fueling" ImGui debug window with Start/Stop/Pay buttons.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_fuel.getFuelData()` | Returns the list of tanks kept for the transaction (energyType, name, currentEnergy, maxEnergy in joules). | 211 |
| `career_modules_fuel.getFuelingData()` | Returns, per tank, the energy added (fueledEnergy, joules) and the price (price) of the current transaction. | 372 |
| `career_modules_fuel.isCurrentlyFueling()` | Indicates whether at least one tank is being filled. | 473 |
| `career_modules_fuel.minimumRefuelingCheck(vehId)` | Avoids a total fuel outage: for each tank of the vehicle, fully recharges electric, or sets a nearly empty tank (<= 1%) back to 5%, with an emergency message. | 617 |
| `career_modules_fuel.onCareerActive(active)` | Hook called when career becomes active or inactive: creates the audio sources (gasoline and electric) if active. *(internal)* *(hook)* | 632 |
| `career_modules_fuel.onChangeFlowRate(factor, tankIndex)` | Hook/input action (pump trigger): sets the flow rate as a fraction 0 to 1 of the maximum and starts filling the tank; a factor of 0 stops it and resets the flow rate to the maximum. *(hook)* | 349 |
| `career_modules_fuel.onClientEndMission(levelPath)` | Level end hook: forgets the refueling sound identifiers. *(internal)* *(hook)* | 637 |
| `career_modules_fuel.onUpdate(dtReal, dtSim)` | Per-frame hook: cancels the transaction if the vehicle moves faster than 2 m/s, advances the active tanks (energy, price rounded to the cent), stops a full tank, sends the data to the UI every 0.1 s, adjusts the pump sound, and displays the ImGui debug window outside shipping builds. *(internal)* *(hook)* | 496 |
| `career_modules_fuel.payPrice()` | Pays the total (does nothing if the price is zero or the player does not have enough money), stops filling, records the expense (career_modules_playerAttributes, statistic career/fuel/paidPrice.money), ends the transaction and emits onPaidRefuelling. | 402 |
| `career_modules_fuel.requestRefuelingTransactionData()` | Asks the player vehicle for its tanks (energyStorage); on reply, filters the tanks, prepares the data and sends initialFuelingData to the UI. | 198 |
| `career_modules_fuel.sendUpdateDataToUI()` | Sends to the UI (guihook 'updateFuelData') current energy, added energy, price, active state per tank, total price, ability to pay (canPay) and relative flow rate. | 147 |
| `career_modules_fuel.startTransaction(_gasStation)` | Starts a transaction for the current inventory vehicle at the given station: enables the 'Refueling' action map, turns the ignition off (setIgnitionLevel 0), opens the career.refueling screen and emits onRefuelingStartTransaction. Does nothing without a current inventory vehicle. | 202 |
| `career_modules_fuel.uiButtonStartFueling(energyType)` | Called by the UI: starts filling all the tanks of an energy type. | 437 |
| `career_modules_fuel.uiButtonStartFuelingTank(index)` | Called by the UI: selects then starts filling a specific tank. | 445 |
| `career_modules_fuel.uiButtonStopFueling(energyType)` | Called by the UI: stops filling the tanks of a type (all if nil) and applies the levels to the vehicle. | 441 |
| `career_modules_fuel.uiButtonStopFuelingTank(index)` | Called by the UI: stops filling a specific tank. | 455 |
| `career_modules_fuel.uiCancelTransaction()` | Cancels the transaction: restores the starting energy levels on the vehicle, without paying, and ends the transaction (back to the 'play' screen, autosave or part conditions update). | 464 |
| `career_modules_fuel.uiSetSelectedTankIndex(index)` | Called by the UI: changes the selected tank (ignored during a fill or if the index is invalid). | 429 |

### Parameter details

#### `career_modules_fuel.getFuelData()`

Returns the list of tanks kept for the transaction (energyType, name, currentEnergy, maxEnergy in joules).

- **returns**: table|nil List of tanks, nil outside a transaction.

#### `career_modules_fuel.getFuelingData()`

Returns, per tank, the energy added (fueledEnergy, joules) and the price (price) of the current transaction.

- **returns**: table List of {price, fueledEnergy}.

#### `career_modules_fuel.isCurrentlyFueling()`

Indicates whether at least one tank is being filled.

- **returns**: boolean true if a fill is active.

#### `career_modules_fuel.minimumRefuelingCheck(vehId)`

Avoids a total fuel outage: for each tank of the vehicle, fully recharges electric, or sets a nearly empty tank (<= 1%) back to 5%, with an emergency message.

- `vehId` (*integer|nil*) : Vehicle; by default the current inventory vehicle.

#### `career_modules_fuel.onCareerActive(active)`

Hook called when career becomes active or inactive: creates the audio sources (gasoline and electric) if active.

- `active` (*boolean*) : true on activation.

#### `career_modules_fuel.onChangeFlowRate(factor, tankIndex)`

Hook/input action (pump trigger): sets the flow rate as a fraction 0 to 1 of the maximum and starts filling the tank; a factor of 0 stops it and resets the flow rate to the maximum.

- `factor` (*number*) : Fraction of the maximum flow rate, clamped to [0, 1].
- `tankIndex` (*integer|nil*) : Target tank; by default the selected tank.

#### `career_modules_fuel.onClientEndMission(levelPath)`

Level end hook: forgets the refueling sound identifiers.

- `levelPath` (*string*) : Level path.

#### `career_modules_fuel.onUpdate(dtReal, dtSim)`

Per-frame hook: cancels the transaction if the vehicle moves faster than 2 m/s, advances the active tanks (energy, price rounded to the cent), stops a full tank, sends the data to the UI every 0.1 s, adjusts the pump sound, and displays the ImGui debug window outside shipping builds.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).

#### `career_modules_fuel.startTransaction(_gasStation)`

Starts a transaction for the current inventory vehicle at the given station: enables the 'Refueling' action map, turns the ignition off (setIgnitionLevel 0), opens the career.refueling screen and emits onRefuelingStartTransaction. Does nothing without a current inventory vehicle.

- `_gasStation` (*table*) : Gas station; must contain facility (id, name).

#### `career_modules_fuel.uiButtonStartFueling(energyType)`

Called by the UI: starts filling all the tanks of an energy type.

- `energyType` (*string*) : gasoline, diesel, kerosine, n2o or electricEnergy.

#### `career_modules_fuel.uiButtonStartFuelingTank(index)`

Called by the UI: selects then starts filling a specific tank.

- `index` (*integer*) : Index (starting at 1) in the tank list.

#### `career_modules_fuel.uiButtonStopFueling(energyType)`

Called by the UI: stops filling the tanks of a type (all if nil) and applies the levels to the vehicle.

- `energyType` (*string|nil*) : Energy type.

#### `career_modules_fuel.uiButtonStopFuelingTank(index)`

Called by the UI: stops filling a specific tank.

- `index` (*integer*) : Tank index.

#### `career_modules_fuel.uiSetSelectedTankIndex(index)`

Called by the UI: changes the selected tank (ignored during a fill or if the index is invalid).

- `index` (*integer*) : Tank index.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPaidRefuelling`
- `onRefuelingEndTransaction`
- `onRefuelingStartTransaction`
- `onRefuelingStopFueling`

**UI events (guihooks.trigger):** `initialFuelingData`, `updateFuelData`

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/fuel.lua`.*

# `career_modules_delivery_tasklist`

*File: `lua/ge/extensions/career/modules/delivery/tasklist.lua` · VM: Game Engine (GE) · 305 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_delivery_tasklist`: `extensions.load("career_modules_delivery_tasklist")`, then the global `career_modules_delivery_tasklist`

Feeds the on-screen task list (tasklist) during career delivery. It groups the loaded cargos by destination, the cargos to pick up by pickup location, the trailer/vehicle tasks, and an "active deliveries" header. Each element is marked to update or to discard, then sent to the UI every frame via guihooks (SetTasklistTask, SetTasklistHeader, DiscardTasklistItem).

## Notes

- Element types: parcels, pickup, header, and the vehicle offer type (trailer or vehicle).
- The 'parcels' groups are grouped by destination label; without a modifier the key is 'noMods', otherwise it includes groupId and the loading time.
- For timed parcels, the subtext shows the time left before delayed, then before "very late", then "late".
- offerIdToTasklistElementId is never emptied (only cargoIdToTasklistElementId is reset on each sendCargoToTasklist).
- On discard, only the parcels, pickup, header, trailer and vehicle elements send a removal message to the UI.

**Dependencies (loaded first):** `core_vehicleBridge`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_delivery_tasklist.clearAll()` | Marks all elements to discard; they are removed at the next update. | 150 |
| `career_modules_delivery_tasklist.clearTasklistForOfferId(offerId)` | Marks to discard the element linked to a vehicle/trailer offer. | 143 |
| `career_modules_delivery_tasklist.onCareerActivated()` | Hook called on career activation: stores the delivery extensions. *(internal)* *(hook)* | 8 |
| `career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: calls updateCargoTasklistElements. *(internal)* *(hook)* | 301 |
| `career_modules_delivery_tasklist.sendCargoToTasklist()` | Rebuilds the tasklist elements from the cargo containers of nearby vehicles (asynchronous): marks all the old elements to discard, recreates the parcels and pickup groups, the vehicle tasks (dVehicleTasks.getVehicleTasks) and the header with the number of tasks or loaded items. | 22 |
| `career_modules_delivery_tasklist.updateCargoTasklistElements()` | Walks through the elements: sends the removals (DiscardTasklistItem / SetTasklistHeader nil) and updates (SetTasklistTask with label, subtext, active, type='message') to the UI, then deletes the discarded elements. The labels depend on the current step of the vehicle tasks (coupleTrailer, enterVehicle, bringToDestination/confirmDropOff, putIntoParkingSpot). | 159 |
| `career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId)` | Marks to refresh the tasklist element that contains this cargo (useful for the countdown of timed parcels). | 129 |
| `career_modules_delivery_tasklist.updateTasklistForOfferId(offerId)` | Marks to refresh the element linked to a vehicle/trailer offer. | 136 |

### Parameter details

#### `career_modules_delivery_tasklist.clearTasklistForOfferId(offerId)`

Marks to discard the element linked to a vehicle/trailer offer.

- `offerId` (*integer*) : Offer identifier.

#### `career_modules_delivery_tasklist.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: calls updateCargoTasklistElements.

- `dtReal` (*number*) : Real time delta (s), unused.
- `dtSim` (*number*) : Simulation time delta (s), unused.
- `dtRaw` (*number*) : Raw time delta (s), unused.

#### `career_modules_delivery_tasklist.updateTasklistForCargoId(cargoId)`

Marks to refresh the tasklist element that contains this cargo (useful for the countdown of timed parcels).

- `cargoId` (*integer*) : Cargo identifier.

#### `career_modules_delivery_tasklist.updateTasklistForOfferId(offerId)`

Marks to refresh the element linked to a vehicle/trailer offer.

- `offerId` (*integer*) : Offer identifier.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: core_vehicleBridge. |

**UI events (guihooks.trigger):** `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/delivery/tasklist.lua`.*

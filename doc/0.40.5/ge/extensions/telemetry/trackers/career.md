# `telemetry_trackers_career`

*File: `lua/ge/extensions/telemetry/trackers/career.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_career`: `extensions.load("telemetry_trackers_career")`, then the global `telemetry_trackers_career`

Career mode telemetry tracker: measures how long a career is played (activity "careerActive" with the save state at opening: money, beamXP, vouchers, vehicle count, new save, tutorial) and records the vehicles bought (vehicleAddedToInventory) and sold (vehicleSold). It goes through telemetry_core.startActivity/endActivity/addEvent.

## Notes

- Extension in manual unload; on a Lua reload, onExtensionUnloaded closes the activity in progress (otherwise it would have no duration).
- onBeforeVehicleSell does nothing if the inventory does not contain inventoryId.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_career.onBeforeVehicleSell(data)` | Hook called before a vehicle is sold: records model, name and sale price. *(internal)* *(hook)* | 56 |
| `telemetry_trackers_career.onCareerActive(active, newSave)` | Hook called when the career becomes active or inactive: starts or ends the careerActive activity (with the player's attributes at start). *(internal)* *(hook)* | 24 |
| `telemetry_trackers_career.onExtensionLoaded()` | Hook called on load: sets the extension to manual unload. *(internal)* *(hook)* | 70 |
| `telemetry_trackers_career.onExtensionUnloaded()` | Hook called on unload: a Lua reload destroys the trackers without onExit, so the career activity is also closed here. *(internal)* *(hook)* | 18 |
| `telemetry_trackers_career.onVehicleAddedToInventory(data)` | Hook called when a vehicle is added to the inventory: records model, name and purchase price. *(internal)* *(hook)* | 42 |

### Parameter details

#### `telemetry_trackers_career.onBeforeVehicleSell(data)`

Hook called before a vehicle is sold: records model, name and sale price.

- `data` (*table*) : Contains inventoryId and price.

#### `telemetry_trackers_career.onCareerActive(active, newSave)`

Hook called when the career becomes active or inactive: starts or ends the careerActive activity (with the player's attributes at start).

- `active` (*boolean*) : true if the career is starting.
- `newSave` (*boolean*) : true if it is a new save.

#### `telemetry_trackers_career.onVehicleAddedToInventory(data)`

Hook called when a vehicle is added to the inventory: records model, name and purchase price.

- `data` (*table*) : Contains vehicleInfo (model_key, Name) and purchaseData (prices).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/career.lua`.*

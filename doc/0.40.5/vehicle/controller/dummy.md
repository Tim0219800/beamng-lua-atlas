# `controller_dummy`

*File: `lua/vehicle/controller/dummy.lua` · VM: Vehicle · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `dummy` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Minimal main controller (type "main") for vehicles without an engine (trailers, objects). It provides the mandatory main controller API (gear changes, starter, etc., all nop) and writes neutral electrics values every frame: throttle, brake, clutch from the inputs, gear "N", gearIndex 0, rpm/fuel/temperatures at 0, ignition false, gearboxMode "none".

## Notes

- No jbeam key is read. M.engineInfo is an array of 21 values (index 3 and 4 = 1000, index 14 = "manual", index 15 = object id) whose index 11 is updated with the ground speed (obj:getGroundSpeed()) only if the engineInfo stream is listened to.
- Fields throttle, brake, clutchRatio, fireEngineTemperature, drivingAggression, shiftingAggression: constants at 0 for the main controller API. nop = global engine function that does nothing.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_dummy.updateGFX(dt)` | Every frame: copies the throttle/brake/clutch inputs (bounded 0..1) into electrics.values and forces the other values to their neutral state. *(internal)* | 42 |

### Parameter details

#### `controller_dummy.updateGFX(dt)`

Every frame: copies the throttle/brake/clutch inputs (bounded 0..1) into electrics.values and forces the other values to their neutral state.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `brake` | number | 0. |
| `clutchRatio` | number | 0. |
| `cycleGearboxModes` | function | nop. |
| `drivingAggression` | number | 0. |
| `engineInfo` | table | Engine info array of 21 static values (see notes). |
| `fireEngineTemperature` | number | 0. |
| `init` | function | nop. |
| `sendTorqueData` | function | nop. |
| `setEngineIgnition` | function | nop. |
| `setFreeze` | function | nop. |
| `setGearboxMode` | function | nop. |
| `setStarter` | function | nop. |
| `shiftDown` | function | nop. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop. |
| `shiftingAggression` | number | 0. |
| `throttle` | number | 0. |
| `type` | string | "main". |
| `vehicleActivated` | function | nop. |

## Calls into the engine (C++)

- `obj:` `getGroundSpeed`, `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/dummy.lua`.*

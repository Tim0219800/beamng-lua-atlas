# `core_vehicle_configTarget`

*File: `lua/ge/extensions/core/vehicle/configTarget.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_configTarget`: `extensions.load("core_vehicle_configTarget")`, then the global `core_vehicle_configTarget`

GE extension `core_vehicle_configTarget`: remembers which vehicle (and which player) is the target of the vehicle configuration menu, so that partmgmt, colors, mirror, thumbnail, etc. do not always act on player 0's vehicle. Also serves as a resolver: resolveVehicleId takes an explicit id, otherwise the target, otherwise player 0's vehicle. Emits onVehicleConfigTargetChanged on every change.

## Example

```lua
core_vehicle_configTarget.begin(vehId, {playerId = 0, returnRoute = 'pause.vehicle'})
local id = core_vehicle_configTarget.resolveVehicleId()   -- vehId
core_vehicle_configTarget.clear('done')
```

## Notes

- returnRoute is only accepted among 'pause' and 'pause.vehicle' (otherwise 'pause.vehicle').
- The target is cleared automatically one frame after the vehicle is destroyed if it was not recreated in the meantime (spawn of the same id), at the end of the level or on extension unload.
- The read functions (get) return a copy; the onVehicleConfigTargetChanged hook receives (currentTarget, previousTarget, reason) as copies: reason = 'begin', 'clear' or the reason passed to clear ('vehicleDestroyed', 'missionEnded', 'extensionUnloaded').

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_configTarget.begin(vehId, context)` | Sets the target vehicle. Refuses an invalid id or a nonexistent vehicle. Emits onVehicleConfigTargetChanged(current, previous, 'begin'). | 25 |
| `core_vehicle_configTarget.clear(reason)` | Clears the target and emits onVehicleConfigTargetChanged. | 42 |
| `core_vehicle_configTarget.get()` | Copy of the current target. | 55 |
| `core_vehicle_configTarget.getReturnRoute()` | UI route to return to after configuration. | 67 |
| `core_vehicle_configTarget.getTargetPlayerId()` | Index of the configuring player. | 63 |
| `core_vehicle_configTarget.getTargetVehicleId()` | Id of the target vehicle. | 59 |
| `core_vehicle_configTarget.isActive()` | Indicates whether a target is set. | 51 |
| `core_vehicle_configTarget.onClientEndMission()` | Hook: end of the level; clears the target ('missionEnded'). *(internal)* *(hook)* | 118 |
| `core_vehicle_configTarget.onDeserialized(data)` | Hook: restores the target if its vehicle still exists. *(internal)* *(hook)* | 132 |
| `core_vehicle_configTarget.onExtensionUnloaded()` | Hook: extension unloaded; clears the target ('extensionUnloaded'). *(internal)* *(hook)* | 122 |
| `core_vehicle_configTarget.onSerialize()` | Hook: saves the target before a Lua reload. *(internal)* *(hook)* | 126 |
| `core_vehicle_configTarget.onUpdate()` | Per-frame hook: clears the target if the destroyed vehicle still does not exist. *(internal)* *(hook)* | 109 |
| `core_vehicle_configTarget.onVehicleDestroyed(vehId)` | Hook: if the target vehicle is destroyed, notes that the target must be cleared on the next frame. *(internal)* *(hook)* | 97 |
| `core_vehicle_configTarget.onVehicleSpawned(vehId)` | Hook: cancels the planned clearing if the same id is recreated (vehicle replacement). *(internal)* *(hook)* | 103 |
| `core_vehicle_configTarget.resolveVehicle(explicitVehicleId)` | Like resolveVehicleId but returns the vehicle object. | 86 |
| `core_vehicle_configTarget.resolveVehicleData(explicitVehicleId)` | Like resolveVehicleId but returns the data from core_vehicle_manager.getVehicleData. | 91 |
| `core_vehicle_configTarget.resolveVehicleId(explicitVehicleId)` | Determines the vehicle id to use: the explicit id if given and valid, otherwise the target, otherwise player 0's vehicle. Returns nil if the object does not exist. | 71 |

### Parameter details

#### `core_vehicle_configTarget.begin(vehId, context)`

Sets the target vehicle. Refuses an invalid id or a nonexistent vehicle. Emits onVehicleConfigTargetChanged(current, previous, 'begin').

- `vehId` (*integer*) : vehicle id (>= 0)
- `context` (*table|nil*) : {playerId?, returnRoute?}
- **returns**: boolean true if the target was set

#### `core_vehicle_configTarget.clear(reason)`

Clears the target and emits onVehicleConfigTargetChanged.

- `reason` (*string|nil*) : reason passed to the hook, default 'clear'
- **returns**: boolean false if there was no target

#### `core_vehicle_configTarget.get()`

Copy of the current target.

- **returns**: table|nil {vehId, playerId, returnRoute} or nil

#### `core_vehicle_configTarget.getReturnRoute()`

UI route to return to after configuration.

- **returns**: string 'pause' or 'pause.vehicle' (default)

#### `core_vehicle_configTarget.getTargetPlayerId()`

Index of the configuring player.

- **returns**: integer|nil playerId or nil

#### `core_vehicle_configTarget.getTargetVehicleId()`

Id of the target vehicle.

- **returns**: integer|nil vehId or nil

#### `core_vehicle_configTarget.isActive()`

Indicates whether a target is set.

- **returns**: boolean true if active

#### `core_vehicle_configTarget.onDeserialized(data)`

Hook: restores the target if its vehicle still exists.

- `data` (*table*) : data from onSerialize

#### `core_vehicle_configTarget.onSerialize()`

Hook: saves the target before a Lua reload.

- **returns**: table {target}

#### `core_vehicle_configTarget.onVehicleDestroyed(vehId)`

Hook: if the target vehicle is destroyed, notes that the target must be cleared on the next frame.

- `vehId` (*integer*) : vehicle

#### `core_vehicle_configTarget.onVehicleSpawned(vehId)`

Hook: cancels the planned clearing if the same id is recreated (vehicle replacement).

- `vehId` (*integer*) : vehicle

#### `core_vehicle_configTarget.resolveVehicle(explicitVehicleId)`

Like resolveVehicleId but returns the vehicle object.

- `explicitVehicleId` (*integer|nil*) : imposed id
- **returns**: userdata|nil vehicle object

#### `core_vehicle_configTarget.resolveVehicleData(explicitVehicleId)`

Like resolveVehicleId but returns the data from core_vehicle_manager.getVehicleData.

- `explicitVehicleId` (*integer|nil*) : imposed id
- **returns**: table|nil vehicle data (vdata, config, vehicleDirectory, ioCtx...)

#### `core_vehicle_configTarget.resolveVehicleId(explicitVehicleId)`

Determines the vehicle id to use: the explicit id if given and valid, otherwise the target, otherwise player 0's vehicle. Returns nil if the object does not exist.

- `explicitVehicleId` (*integer|nil*) : id imposed by the caller (nil = automatic; an invalid id gives nil, with no fallback)
- **returns**: integer|nil vehicle id

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleConfigTargetChanged` — listened to by 4 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/configTarget.lua`.*

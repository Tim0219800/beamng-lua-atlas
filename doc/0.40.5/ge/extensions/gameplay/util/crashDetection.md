# `gameplay_util_crashDetection`

*File: `lua/ge/extensions/gameplay/util/crashDetection.lua` · VM: Game Engine (GE) · 770 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_util_crashDetection`: `extensions.load("gameplay_util_crashDetection")`, then the global `gameplay_util_crashDetection`

Collision ("crash") detector for tracked vehicles. On each frame it compares the vehicle's damage (map.objects[id].damage and sum of section damage) to a threshold that drops as the jerk (forward/backward acceleration jerk) increases, groups close impacts into one crash, then emits hooks. A modder adds a vehicle with addTrackedVehicleById() and listens to onVehicleCrashStarted / onVehicleCrashEnded (used notably by missions and damage gameplay). Depends on gameplay_util_damageAssessment to describe the damaged areas.

## Example

```lua
gameplay_util_crashDetection.addTrackedVehicleById(be:getPlayerVehicleID(0), {minDamage = 150, enableImpactLocationData = true}, "monMod")
local function onVehicleCrashEnded(data) dump(data.totalDamage, data.vehId) end
```

## Notes

- Emitted hooks: onVehicleCrashStarted({vehId, vehImpactPos, vehImpactSpeed}) on the first impact of a crash; onNewImpactStarted({newImpactData}) for subsequent impacts of the same crash; onVehicleCrashEnded({impacts, sanitizedData = {touchedVehIds, initialImpactPos, initialImpactSpeed}, totalDamage, vehId}).
- Internal constants: per-frame damage threshold 40, crash ends after 1.8 s without a new impact (or speed < minVelocity), maximum impact duration 0.3 s.
- crashSettings defaults: minAccel 0, maxAccel 100, minDamage 150, maxDamage 5000, verticallyUnweighted false, minVelocity 1, groupImpactsDist 1 (minimum 0.1), enableImpactLocationData false. The table passed as argument is modified in place.
- addTrackedVehicleById does nothing (no log) if the id is nil/negative or if the vehicle is missing from map.objects or from the scene tree; it does not check whether the vehicle is already tracked and then resets its data.
- The vehicle is automatically removed from the list if it disappears from map.objects or on onVehicleDestroyed.
- Debug mode (setDebug(true)) draws spheres/texts and opens an ImGui window with graphs.
- onSerialize/onDeserialized serialize the whole trackedVehIds table, including debug ImGui pointers.

**Dependencies (loaded first):** `gameplay_util_damageAssessment`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner)` | Starts tracking a vehicle to detect its crashes, with optional sensitivity settings. | 633 |
| `gameplay_util_crashDetection.isVehCrashing(vehId)` | Returns whether a tracked vehicle is currently in a crash. | 728 |
| `gameplay_util_crashDetection.isVehTracked(vehId)` | Returns whether the vehicle is in the tracking list. | 733 |
| `gameplay_util_crashDetection.onDeserialized(data)` | Hook called after reload: restores the serialized state. *(internal)* *(hook)* | 745 |
| `gameplay_util_crashDetection.onSerialize()` | Hook called when Lua extensions are reloaded: returns the state (tracked vehicles, debug). *(internal)* *(hook)* | 737 |
| `gameplay_util_crashDetection.onUpdate(dtReal, _dtSim)` | Hook called every frame: updates accelerations, impact detection, end of pre-impact/impact/crash for each tracked vehicle; removes those that no longer exist. *(internal)* *(hook)* | 599 |
| `gameplay_util_crashDetection.onVehicleDestroyed(vehId)` | Hook called when a vehicle is destroyed: removes it from tracking. *(internal)* *(hook)* | 751 |
| `gameplay_util_crashDetection.removeTrackedVehicleById(vehId)` | Stops tracking a vehicle. | 718 |
| `gameplay_util_crashDetection.resetCrashData(vehId)` | Resets the crash, current impact and pre-impact data of a tracked vehicle (without removing it). | 73 |
| `gameplay_util_crashDetection.setDebug(_debug)` | Enables or disables debug drawing and the ImGui window. | 724 |

### Parameter details

#### `gameplay_util_crashDetection.addTrackedVehicleById(vehId_, crashSettings, owner)`

Starts tracking a vehicle to detect its crashes, with optional sensitivity settings.

- `vehId_` (*integer*) : Vehicle id.
- `crashSettings` (*table|nil*) : minAccel, maxAccel, minDamage, maxDamage, verticallyUnweighted, minVelocity (m/s), groupImpactsDist (m), enableImpactLocationData.
- `owner` (*string|nil*) : Caller name, for debugging ("unknown" by default).

#### `gameplay_util_crashDetection.isVehCrashing(vehId)`

Returns whether a tracked vehicle is currently in a crash.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean false if not tracked.

#### `gameplay_util_crashDetection.isVehTracked(vehId)`

Returns whether the vehicle is in the tracking list.

- `vehId` (*integer*) : Vehicle id.
- **returns**: boolean 

#### `gameplay_util_crashDetection.onDeserialized(data)`

Hook called after reload: restores the serialized state.

- `data` (*table*) : Table returned by onSerialize.

#### `gameplay_util_crashDetection.onSerialize()`

Hook called when Lua extensions are reloaded: returns the state (tracked vehicles, debug).

- **returns**: table {trackedVehIds, debug, debugDamageAssessmentUIPtr}

#### `gameplay_util_crashDetection.onUpdate(dtReal, _dtSim)`

Hook called every frame: updates accelerations, impact detection, end of pre-impact/impact/crash for each tracked vehicle; removes those that no longer exist.

- `dtReal` (*number*) : Real time delta (s), unused.
- `_dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_util_crashDetection.onVehicleDestroyed(vehId)`

Hook called when a vehicle is destroyed: removes it from tracking.

- `vehId` (*integer*) : Id of the destroyed vehicle.

#### `gameplay_util_crashDetection.removeTrackedVehicleById(vehId)`

Stops tracking a vehicle.

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_util_crashDetection.resetCrashData(vehId)`

Resets the crash, current impact and pre-impact data of a tracked vehicle (without removing it).

- `vehId` (*integer*) : Vehicle id.

#### `gameplay_util_crashDetection.setDebug(_debug)`

Enables or disables debug drawing and the ImGui window.

- `_debug` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_util_damageAssessment"} |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onNewImpactStarted`
- `onVehicleCrashEnded` — listened to by 2 module(s)
- `onVehicleCrashStarted` — listened to by 2 module(s)

## Calls into the engine (C++)

- `be:` `getObjectByID`
- `debugDrawer:` `drawSphere`, `drawText`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/util/crashDetection.lua`.*

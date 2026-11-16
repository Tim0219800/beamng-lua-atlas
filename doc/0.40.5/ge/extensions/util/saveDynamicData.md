# `util_saveDynamicData`

*File: `lua/ge/extensions/util/saveDynamicData.lua` · VM: Game Engine (GE) · 214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_saveDynamicData`: `extensions.load("util_saveDynamicData")`, then the global `util_saveDynamicData`

Internal automated tool: loads the "autotest" test level, then spawns each vehicle configuration (filterable by model or by .pc file) and runs the dynamicVehicleData extension in the vehicle to measure its dynamic data (dynamicVehicleData.performTests). Results are written to vehicles/<model>/info_<config>.touched; configs already processed are skipped. A watchdog (20 s without heartbeat) and a maximum duration (600 s) move on to the next vehicle. At the end, the game is quit (shutdown(0)).

## Example

```lua
extensions.util_saveDynamicData.work('', 'pickup')
```

## Notes

- Models listed in blacklist.json (or blacklistDefault.json by default) are ignored.
- The work waits for the mod manager to be ready and the test level to be loaded (onClientStartMission hook).
- The replaced vehicle is placed at (0, 0, 0.5) and the physics speed is set to physicsSpeedFactor (0: internal value of the file).
- The code contains a TODO: work does not block until the work is done. The file uses the undeclared global newVehicle.
- The filter test on pcFile is ignored if the string is empty or nil; a nil vehicleToTest tests all models.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_saveDynamicData.heartbeat()` | Called by the vehicle side during the tests to signal that it is still active (rearms the 20 s watchdog). *(internal)* | 197 |
| `util_saveDynamicData.onClientStartMission(levelPath)` | Hook called when a level starts; marks the level as ready if it is the autotest test level. *(internal)* *(hook)* | 135 |
| `util_saveDynamicData.onExtensionLoaded()` | Called on load: unloads/reloads the base extensions if core_camera is absent, then loads the vehicle blacklist (blacklist.json, otherwise blacklistDefault.json). *(internal)* *(hook)* | 160 |
| `util_saveDynamicData.onExtensionUnloaded()` | Called on unload; only logs. *(internal)* *(hook)* | 201 |
| `util_saveDynamicData.onInit()` | Called at module initialization; only logs. *(internal)* *(hook)* | 26 |
| `util_saveDynamicData.vehicleDone()` | Called by the vehicle side (dynamicVehicleData) when the tests of the current configuration are finished; moves on to the next one. *(internal)* | 193 |
| `util_saveDynamicData.work(pcFile, vehicle)` | Entry point: stores the filters, starts the test job and launches the autotest level if it is not already loaded. | 142 |

### Parameter details

#### `util_saveDynamicData.onClientStartMission(levelPath)`

Hook called when a level starts; marks the level as ready if it is the autotest test level.

- `levelPath` (*string*) : Path of the started level

#### `util_saveDynamicData.work(pcFile, vehicle)`

Entry point: stores the filters, starts the test job and launches the autotest level if it is not already loaded.

- `pcFile` (*string|nil*) : Configuration key to test (empty or nil = all)
- `vehicle` (*string|nil*) : Model key to test (nil = all)

## Calls into the engine (C++)

- `be:` `getPlayerVehicle`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/saveDynamicData.lua`.*

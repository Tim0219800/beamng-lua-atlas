# `util_calibrateESC`

*File: `lua/ge/extensions/util/calibrateESC.lua` · VM: Game Engine (GE) · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_calibrateESC`: `extensions.load("util_calibrateESC")`, then the global `util_calibrateESC`

Internal tool for automated measurement of vehicles' stability control (ESC). It loads the level /levels/smallgrid/info.json, then for each vehicle config (excluding the blacklist and already processed configs) replaces the player vehicle, loads the vehicle extension escMeasurement, runs escMeasurement.performTests(model, config) and waits for the end (vehicleDone), a 20 s watchdog without heartbeat or a maximum duration. At the end, the game exits (shutdown(0)). Intended for automated runs by a worker script, not for normal use.

## Notes

- On load, the physics speed is set to 2 (be:setPhysicsSpeedFactor(2)).
- If core_camera is nil on load, the automatic extensions are unloaded then the preset extensions loaded (unloadAutoExtensions, loadPresetExtensions).
- Model blacklist read from blacklist.json, otherwise blacklistDefault.json (array of model keys).
- A config is skipped if the file vehicles/<model>/info_<config>.touched already exists.
- Watchdog: test ends if more than 20,000 hptimer units (ms) elapse without a call to heartbeat(); maximum duration per vehicle: 10,000,000 of these units.
- work(pcFile, vehicle) filters by config (pcFile) and model (vehicle); passing nil or an empty string for pcFile processes all configs. The code notes (TODO) that work does not block until the tests finish and that it is generally called twice.
- Warning: the test always ends with shutdown(0), which closes the game.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_calibrateESC.heartbeat()` | To call (from the vehicle) regularly to signal that the test is progressing and reset the watchdog. | 203 |
| `util_calibrateESC.onClientStartMission(levelPath)` | Hook called when a level starts; if it is the test level (/levels/smallgrid/info.json), allows the work to continue. *(internal)* *(hook)* | 141 |
| `util_calibrateESC.onExtensionLoaded()` | Load hook: sets the physics speed to 2, loads the vehicle blacklist and prints the ignored vehicles. *(internal)* *(hook)* | 165 |
| `util_calibrateESC.onExtensionUnloaded()` | Unload hook: only logs. *(internal)* *(hook)* | 207 |
| `util_calibrateESC.onInit()` | Hook called when the module loads (not all systems are necessarily ready); only logs. *(internal)* *(hook)* | 24 |
| `util_calibrateESC.vehicleDone()` | To call (from the vehicle) when a vehicle's measurements are finished: moves on to the next one. | 199 |
| `util_calibrateESC.work(pcFile, vehicle)` | Starts the calibration work in a job, loads the test level if it is not already loaded. | 147 |

### Parameter details

#### `util_calibrateESC.onClientStartMission(levelPath)`

Hook called when a level starts; if it is the test level (/levels/smallgrid/info.json), allows the work to continue.

- `levelPath` (*string*) : Path of the started level.

#### `util_calibrateESC.work(pcFile, vehicle)`

Starts the calibration work in a job, loads the test level if it is not already loaded.

- `pcFile` (*string|nil*) : Key of the config to test; nil or empty for all.
- `vehicle` (*string|nil*) : Key of the model to test; nil for all.

## Calls into the engine (C++)

- `be:` `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/calibrateESC.lua`.*

# `gameplay_statisticModules_watchJturn`

*File: `lua/ge/extensions/gameplay/statisticModules/watchJturn.lua` · VM: Game Engine (GE) · 112 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_statisticModules_watchJturn`: `extensions.load("gameplay_statisticModules_watchJturn")`, then the global `gameplay_statisticModules_watchJturn`

Statistics module that detects "J-turns" (reverse-then-forward U-turn) of the player vehicle and increments the metric "vehicle/jturn" via gameplay_statistic.metricAdd. It is called by gameplay_statistic with the workload function on each watch round.

## Notes

- Condition: speed > 8 m/s; vehicle direction opposite to the velocity (dot product < -0.96) = reverse; then back to forward (> 0.96) with the initial reverse direction opposite to the current velocity (< -0.90) for more than 1 s. Max delay of 4 s after the last reverse, otherwise canceled.
- The code comment indicates that simTime "is probably broken": it is accumulated from dtSim.
- The onPreRender function (debug) is commented out on export and references an undefined variable vpos: do not enable it.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_statisticModules_watchJturn.onExtensionLoaded()` | Hook called when the extension loads; does nothing. *(internal)* *(hook)* | 91 |
| `gameplay_statisticModules_watchJturn.onVehicleResetted(vid)` | Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle. *(internal)* *(hook)* | 87 |
| `gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player)` | Hook called when the controlled vehicle changes: cancels the detection. *(internal)* *(hook)* | 94 |
| `gameplay_statisticModules_watchJturn.workload(v, vid, dtSim)` | Analyzes a vehicle on each call (speed, direction) and counts a J-turn when the reverse-then-forward sequence is detected. *(internal)* | 29 |

### Parameter details

#### `gameplay_statisticModules_watchJturn.onVehicleResetted(vid)`

Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle.

- `vid` (*integer*) : Vehicle identifier.

#### `gameplay_statisticModules_watchJturn.onVehicleSwitched(oldid, newid, player)`

Hook called when the controlled vehicle changes: cancels the detection.

- `oldid` (*integer*) : Old vehicle.
- `newid` (*integer*) : New vehicle.
- `player` (*integer*) : Player index.

#### `gameplay_statisticModules_watchJturn.workload(v, vid, dtSim)`

Analyzes a vehicle on each call (speed, direction) and counts a J-turn when the reverse-then-forward sequence is detected.

- `v` (*userdata*) : Vehicle object.
- `vid` (*integer*) : Vehicle identifier; a vehicle change cancels the detection.
- `dtSim` (*number*) : Simulated time elapsed in seconds.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/statisticModules/watchJturn.lua`.*

# `gameplay_statisticModules_watchRollover`

*File: `lua/ge/extensions/gameplay/statisticModules/watchRollover.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_statisticModules_watchRollover`: `extensions.load("gameplay_statisticModules_watchRollover")`, then the global `gameplay_statisticModules_watchRollover`

Statistics module that detects rollovers (vehicle flipped onto its roof then back on its wheels) and increments the metric "vehicle/rollover" via gameplay_statistic.metricAdd. It is called by gameplay_statistic with the workload function.

## Notes

- The roof is detected when the vehicle's up axis has a z component < -0.7 and the vehicle slides more laterally than longitudinally. Returning to the wheels (z > 0.7) validates the rollover if the roof was seen less than 4 s ago and the last on-wheels position less than 8 s ago.
- The onPreRender function (debug) is commented out on export and references an undefined variable vpos.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_statisticModules_watchRollover.onExtensionLoaded()` | Hook called when the extension loads; does nothing. *(internal)* *(hook)* | 66 |
| `gameplay_statisticModules_watchRollover.onVehicleResetted(vid)` | Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle. *(internal)* *(hook)* | 62 |
| `gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player)` | Hook called when the controlled vehicle changes: cancels the detection. *(internal)* *(hook)* | 69 |
| `gameplay_statisticModules_watchRollover.workload(v, vid, dtSim)` | Analyzes a vehicle on each call (up/forward axes, speed) and counts a rollover when the roof-then-wheels sequence is detected. *(internal)* | 28 |

### Parameter details

#### `gameplay_statisticModules_watchRollover.onVehicleResetted(vid)`

Hook called when a vehicle is reset: cancels the detection if it is the tracked vehicle.

- `vid` (*integer*) : Vehicle identifier.

#### `gameplay_statisticModules_watchRollover.onVehicleSwitched(oldid, newid, player)`

Hook called when the controlled vehicle changes: cancels the detection.

- `oldid` (*integer*) : Old vehicle.
- `newid` (*integer*) : New vehicle.
- `player` (*integer*) : Player index.

#### `gameplay_statisticModules_watchRollover.workload(v, vid, dtSim)`

Analyzes a vehicle on each call (up/forward axes, speed) and counts a rollover when the roof-then-wheels sequence is detected.

- `v` (*userdata*) : Vehicle object.
- `vid` (*integer*) : Vehicle identifier; a change cancels the detection.
- `dtSim` (*number*) : Simulated time elapsed in seconds.

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/statisticModules/watchRollover.lua`.*

# `gameplayStatisticModules_watchBurnout`

*File: `lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua` · VM: Vehicle · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayStatisticModules_watchBurnout`: `extensions.load (vehicle VM)("gameplayStatisticModules_watchBurnout")`, then the global `gameplayStatisticModules_watchBurnout`

gameplayStatistic module that detects burnouts: an intact driven wheel spins (wheel speed > 2 and > 1.5 x ground speed, load-weighted slip > 4) while touching the ground. At the end, if the duration exceeds 0.1 s, adds the metric 'vehicle/burnout.time' (aggregated).

## Notes

- Unloads itself if the main controller is not 'vehicleController/vehicleController', or if there are no wheels or no driven wheel (wd.isPropulsed).
- Ignored if the wheel count has changed since load.
- Per-wheel condition: not isBroken, wheelSpeed > 2, wheelSpeed > groundSpeed * 1.5, lastSlip * min(downForce * 0.1, 1) > 4, ground contact.
- The workload is not registered here (the addSchedule call is commented out); it is gameplayStatistic that adds it to the scheduler.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayStatisticModules_watchBurnout.onExtensionLoaded()` | Called on load: lists the driven wheels; returns false to unload if the vehicle is not suitable. *(internal)* *(hook)* | 42 |
| `gameplayStatisticModules_watchBurnout.workload()` | Watch function run in turn by gameplayStatistic: detects burnout start/end and sends the metric. *(internal)* | 15 |

### Parameter details

#### `gameplayStatisticModules_watchBurnout.onExtensionLoaded()`

Called on load: lists the driven wheels; returns false to unload if the vehicle is not suitable.

- **returns**: boolean|nil false to request unloading.

## Calls into the engine (C++)

- `obj:` `getGroundSpeed`, `getSimTime`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayStatisticModules/watchBurnout.lua`.*

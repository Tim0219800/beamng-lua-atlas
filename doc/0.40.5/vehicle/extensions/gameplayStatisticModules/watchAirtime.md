# `gameplayStatisticModules_watchAirtime`

*File: `lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua` · VM: Vehicle · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplayStatisticModules_watchAirtime`: `extensions.load (vehicle VM)("gameplayStatisticModules_watchAirtime")`, then the global `gameplayStatisticModules_watchAirtime`

gameplayStatistic module that measures the time the vehicle is fully airborne: ground speed > 6 m/s, no wheel in contact (contactMaterialID1 and 2 = -1) and vehicle up axis within 45° of vertical (z > 0.707). On landing, if the duration exceeds 0.1 s, adds the metric 'vehicle/airtime.time' (aggregated).

## Notes

- Unloads itself (onExtensionLoaded returns false) if the main controller is not 'vehicleController/vehicleController' or if the vehicle has no wheels.
- Ignored if the wheel count has changed since load (lost wheel).
- Time is measured with obj:getSimTime(). The code contains a 'todo redo this' comment on the tilt test.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplayStatisticModules_watchAirtime.onExtensionLoaded()` | Called on load: stores the wheel count; returns false to unload if the vehicle is not suitable. *(internal)* *(hook)* | 39 |
| `gameplayStatisticModules_watchAirtime.workload()` | Watch function run in turn by gameplayStatistic: updates the 'airborne' state and sends the metric on landing. *(internal)* | 11 |

### Parameter details

#### `gameplayStatisticModules_watchAirtime.onExtensionLoaded()`

Called on load: stores the wheel count; returns false to unload if the vehicle is not suitable.

- **returns**: boolean|nil false to request unloading.

## Calls into the engine (C++)

- `obj:` `getDirectionVectorUpXYZ`, `getGroundSpeed`, `getSimTime`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/gameplayStatisticModules/watchAirtime.lua`.*

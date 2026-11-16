# `gameplay_traffic_roadTracking`

*File: `lua/ge/extensions/gameplay/traffic/roadTracking.lua` · VM: Game Engine (GE) · 352 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/roadTracking")` (file under extensions/ but not a regular extension)

Class that tracks a vehicle's placement and behavior on the road: current road segment (n1, n2), lateral position, alignment with the road, speed limit, legal side, and three fault scores (overSpeed, wrongWay, reckless) bounded from 0 to 1. It also handles light/stop violations via core_trafficSignals. Used by traffic to detect violations the police can penalize.

## Example

```lua
local rt = require('/lua/ge/extensions/gameplay/traffic/roadTracking')({vehId = be:getPlayerVehicleID(0)})
-- every frame:
rt:onUpdate(dt)
if rt.faults.overSpeed > 0.5 then --[[ speeding ]] end
```

## Notes

- The module returns a constructor: the parameter (table) is turned into an object, and init(o.vehId) is called.
- Fault scores are capped at 1; a value > 0.5 triggers violations on the police side (according to the code comment).
- Speeds in m/s: speedLimitFloor = 4.167 (15 km/h), speedLimitCoef = 1.125 (12.5% tolerance before speeding).
- sideValue: 1 = legal side/direction, -1 = illegal side, -2 = wrong way on a one-way road.
- On a non-public road (type 'private' or drivability < 0.25), all faults are reset to 0.
- Collisions are accumulated from map.objects[vehId].objectCollisions; they may be missed if dt is too large.
- init may set self._invalid = true if the vehicle does not exist, but then still reads getObjectByID(vehId).initialNodePosBB, which crashes if the vehicle is absent.
- highFrequency = true forces the road search every frame; fullStats is serialized but is not read in this file.

## Class `C`

A vehicle's road tracking object. Main fields: vehId, pos/dirVec/vel (vec3), speed, n1/n2 (road node names), linkData, speedLimit, speedRatio, alignment (~1 if parallel to the road), roadOffset, roadXnorm/roadYnorm (0 to 1), halfWidth, isOnRoad, isNearRoad, isPublicRoad, isOneWay, isReverse, legalSide, faults, timers, collisionIds, collisionCount, currSignal, signalAction, signalFault.

The module returns a constructor: `local obj = require("gameplay_traffic_roadTracking")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:calcVehOnRoad()` | Computes the vehicle's position on the n1-n2 segment: normalized longitudinal and lateral position, interpolated half-width, alignment, offset from the centerline, and isOnRoad. | 109 |
| `C:init(vehId)` | Initializes the object: measures the vehicle's footprint (initialNodePosBB), computes vehBasicRadius (minimum half-width or half-length), sets the speed thresholds, then calls refresh. | 16 |
| `C:onDeserialized(data)` | Restores the configuration from the table produced by onSerialize. | 338 |
| `C:onSerialize()` | Serializes the configuration (vehId, speedLimitFloor, speedLimitCoef, highFrequency, fullStats). | 328 |
| `C:onUpdate(dt)` | Per-frame update: refreshes vehicle and road, accumulates collisions, then evolves the fault scores (speeding, wrong direction/side, reckless driving) and tracks traffic signals (red light, stop) to fill in signalAction and signalFault. | 193 |
| `C:refresh()` | Resets all tables and values (faults, timers, collisions, road), recalculates the legal side (right- or left-hand driving according to map.getRoadRules()), then, if the vehicle is in map.objects, updates the vehicle and the current road. | 38 |
| `C:resetValues()` | Resets the active tracking values to their neutral values (speed ratio, alignment, offset, faults, timers, signal, collisions). | 68 |
| `C:updateCurrentRoad()` | Looks for the best road segment (map.findBestRoad) for the current position and direction, updates speed limit, one-way, public road and centerline (from the lane string '+'/'-'), orients n1->n2 in the direction of travel, then calls calcVehOnRoad. If no road is nearby: isNearRoad = false and values reset. | 152 |
| `C:updateVehicle()` | Updates the ground position (OOBB center lowered by half the height), the direction, the speed (m/s) and isReverse (speed of at least 1 m/s in the direction opposite to the vehicle's front). | 97 |

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/roadTracking.lua`.*

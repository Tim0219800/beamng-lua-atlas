# `flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos")` (file under extensions/ but not a regular extension)

Flowgraph node "Track Vehicle Distance to Position" (category repeat, straighten icon, tag rally). Measures the distance between a vehicle's front center (RallyUtil.getVehFrontCenter) and a target position, and broadcasts it to the UI via extensions.hook('onRallyDataUpdated', {activeState = vehicleProximity, vehicleProximity = {isNear = false, distance, isStopped = false, isFrozen = false, timer = 0, duration = 0}}). Inputs: flow, vehId (otherwise player vehicle 0), pos (vec3 or table). Output: flow (copy).

## Notes

- The target position is cached on first read and no longer changes until the graph restarts.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the stored target position. | 29 |
| `C:getDistanceSquared()` | Computes the squared distance between the vehicle's front center and the target position. | 74 |
| `C:init(mgr, ...)` | Initializes targetPos to nil. | 25 |
| `C:updateVehicleData2()` | Updates (module local variables) the front position, rotation and speed of the tracked vehicle from map.objects. | 55 |
| `C:work(args)` | Every frame: updates the vehicle data, broadcasts the distance to the UI and copies the flow. | 89 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyDataUpdated` — listened to by 2 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua`.*

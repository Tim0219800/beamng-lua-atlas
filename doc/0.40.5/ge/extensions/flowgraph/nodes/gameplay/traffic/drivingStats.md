# `flowgraph_nodes_gameplay_traffic_drivingStats`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/drivingStats")` (file under extensions/ but not a regular extension)

Flowgraph node "Traffic Driving Stats" (once_p_duration). Tracks the road and driving behavior of a vehicle (vehId, otherwise the player vehicle) with gameplay/traffic/roadTracking. Outputs: n1/n2 (road nodes), roadOffset, roadXnorm/roadYnorm, speedRatio (speed / limit), collisions, faultOverSpeed/WrongWay/Reckless (0 to 1) and associated timers.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Resets the node (calls onNodeReset). | 40 |
| `C:init()` | Resets the node (calls onNodeReset). | 36 |
| `C:onNodeReset()` | Forgets the vehicle and the current tracking. | 44 |
| `C:work()` | Creates or updates the roadTracking object for the vehicle (onUpdate with dtSim) and copies its values to the outputs. | 49 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/drivingStats.lua`.*

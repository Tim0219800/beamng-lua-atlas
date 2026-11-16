# `flowgraph_nodes_environment_setWind`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setWind.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setWind")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Wind" (category once_p_duration). Applies wind to one vehicle or to all. Input pins: vehId (empty = all vehicles), windSpeed (m/s) and windDir (vec3, {1,0,0} by default). Every frame, sends obj:setWind(x,y,z) (direction multiplied by speed) to the vehicle VM. Resets the wind to zero on reset and on stop.

## Notes

- The windDir vector is scaled without being normalized: a non-unit direction changes the actual speed.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 26 |
| `C:init()` | Calls onNodeReset (zero wind for all). | 22 |
| `C:onNodeReset()` | Sends obj:setWind(0, 0, 0) to all vehicles. | 30 |
| `C:work()` | Computes windDir * windSpeed and sends it via queueLuaCommand to each affected vehicle. | 37 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setWind.lua`.*

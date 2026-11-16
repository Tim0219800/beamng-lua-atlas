# `flowgraph_nodes_vehicle_ai_followWaypoints`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua` · VM: Game Engine (GE) · 122 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/followWaypoints")` (file under extensions/ but not a regular extension)

Node "AI Follow Waypoints" (color ai, once_f_duration). Makes a vehicle follow a list of navgraph waypoints with ai.driveUsingPath and detects the end of the laps. Inputs: navgraphPath (table, or aiPath inside it), vehId (no value = player), lapCount (hidden, 1), stopAtFinish (hidden, true: stops precisely at the last waypoint). Output: finalWp (hidden, name of the last waypoint). Legacy pin: waypointData became navgraphPath. Tags: ai, path, route, waypoint, race.

## Notes

- In drawMiddle, finalWp.value is concatenated without tostring: a nil value would cause an error.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 34 |
| `C:drawMiddle(builder, style)` | Displays the state, the number of waypoints and the final target. | 108 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 47 |
| `C:init()` | Calls onNodeReset. | 30 |
| `C:onNodeReset()` | Clears the path, resets the lap counters to zero, clears finalWp and goes to the "inactive" state. | 38 |
| `C:work()` | While "started", counts a lap when the vehicle passes within the radius of the last waypoint, re-arms when it is closer to the first one; goes to "finished" when lapsDone == lapCount. | 85 |
| `C:workOnce()` | Reads the path, computes lapCount, finalWp (last waypoint) and sends ai.driveUsingPath({wpTargetList, wpSpeeds, noOfLaps, aggression = 1}); in multi-lap mode, adds the first waypoint at the end; without stopAtFinish, sets the speed of the last waypoint to 100. Sets the state to "started". | 57 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua`.*

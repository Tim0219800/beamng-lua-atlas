# `flowgraph_nodes_vehicle_ai_arrive`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/arrive")` (file under extensions/ but not a regular extension)

Node "AI Arrive" (color ai, once_f_duration, duration behavior). Sends a vehicle to a navgraph waypoint ("manual" AI mode + ai.setTarget) and considers it arrived when the distance between the front of the vehicle and the waypoint is less than checkDistance (waypoint radius if empty) and the speed is less than checkVelocity. Inputs: aiVehId, waypointName, checkDistance (hidden, 1), checkVelocity (hidden, 0.1). Output: distance (hidden). Data: autoDisableOnArrive (true) disables the AI on arrival.

## Notes

- The legacy pin inRadius is remapped to complete.
- The arrival test precedes sending the command: the finished state can be overwritten by "started" on the first frame (the same work then calls setDurationState('started')).
- An empty checkVelocity gives a threshold of 10000 m/s (equivalent to no limit).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 46 |
| `C:drawMiddle(builder, style)` | Displays the state and whether the command was sent. | 50 |
| `C:getVeh()` | Returns the vehicle of aiVehId, or the player's without input. | 56 |
| `C:init()` | Initializes sentCommand, data.autoDisableOnArrive=true and the duration state "inactive". | 35 |
| `C:onNodeReset()` | Resets sentCommand to false and the state to "inactive". | 41 |
| `C:work()` | If flow is active and not finished: checks the waypoint and the vehicle (node error otherwise), computes the distance from the middle of the front, goes to "finished" on arrival (and disables the AI if autoDisableOnArrive), then sends ai.setState manual and ai.setTarget once. | 66 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua`.*

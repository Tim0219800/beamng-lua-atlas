# `flowgraph_nodes_vehicle_ai_stop`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua` · VM: Game Engine (GE) · 65 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/stop")` (file under extensions/ but not a regular extension)

Node "AI Stop" (color ai, once_p_duration). Asks the AI to stop the vehicle (ai.setState mode "stop") and activates the stopped output when its speed drops below checkVelocity (0.01 m/s). Inputs: aiVehId (no value = player), checkVelocity (hidden). Output: stopped (flow).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Calls onNodeReset. | 30 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 34 |
| `C:init()` | Initializes complete=false. | 22 |
| `C:onNodeReset()` | Resets complete to false. | 26 |
| `C:work()` | If the stop is detected, activates stopped; otherwise compares the speed (map.objects[vehId].vel) to the threshold and stores complete. | 51 |
| `C:workOnce()` | Sends ai.setState({mode = "stop"}) to the vehicle. | 44 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/stop.lua`.*

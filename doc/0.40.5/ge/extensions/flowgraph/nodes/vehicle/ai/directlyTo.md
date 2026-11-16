# `flowgraph_nodes_vehicle_ai_directlyTo`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/directlyTo")` (file under extensions/ but not a regular extension)

Node "AI Directly To" (color ai, duration + once behavior). Makes a vehicle drive in a straight line to a target position, via an interpolated path sent to ai.startFollowing ("neverReset" mode). Inputs: flow, reset, vehId, target (vec3), targetVelocity (m/s, 1 by default). Output: flow, active when the vehicle has arrived. Data: minDistance (1.5 m), handBrakeWhenFinished, straightenWheelsWhenFinished, maxStepDistance (5 m).

## Notes

- In setupAI, the loop goes from 1 to steps+3: the path overshoots the target by three points.
- The local variable target is reassigned (target = target - origin), which creates a new object on each call.
- The output flow pin is never reset to false once complete.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset. | 40 |
| `C:drawMiddle(builder, style)` | Displays the Complete and Started states. | 124 |
| `C:endAI()` | Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle according to the node data. | 60 |
| `C:getVeh()` | Returns the vehicle of vehId, or the player's without input. | 50 |
| `C:init()` | Initializes started/complete and the default data. | 31 |
| `C:reset()` | Resets started/complete to false and calls endAI. | 44 |
| `C:setupAI()` | Builds a path of points spaced at most maxStepDistance apart between the vehicle position and the target (time = distance / speed) and sends it via ai.startFollowing. | 67 |
| `C:work()` | Handles reset; on the first flow runs setupAI; then tests the squared distance to the target and, below minDistance, stops the AI, marks complete and activates the flow output. | 96 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua`.*

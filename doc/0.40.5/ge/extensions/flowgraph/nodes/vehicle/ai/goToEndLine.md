# `flowgraph_nodes_vehicle_ai_goToEndLine`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua` · VM: Game Engine (GE) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/goToEndLine")` (file under extensions/ but not a regular extension)

Node "AI Go To The End Line" (color ai, duration behavior, no category). Sends a vehicle in "manual" AI mode to a finish line given by a position, and activates the flow output when it is within checkDistance (1 m by default) and slower than checkVelocity. Inputs: flow, reset, aiVehId, endLinePosition (vec3, hidden), checkDistance (hidden), checkVelocity (0.1, hidden). Outputs: flow, distance (hidden). Data: autoDisableOnArrive (true).

## Notes

- Bug: the code writes self.pinOut.inRadius.value while the inRadius pin does not exist in pinSchema: the access would raise an error as soon as the vehicle is within the radius.
- Unlike AI Arrive, no ai.setTarget command is sent: manual mode is enabled without a target, so this node does not really steer the vehicle toward endLinePosition.
- The description of the output flow pin contains a typo ("slowe").

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 39 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 43 |
| `C:init()` | Enables autoDisableOnArrive and calls onNodeReset. | 29 |
| `C:onNodeReset()` | Resets complete and sentCommand to false. | 34 |
| `C:work()` | Handles reset; if already arrived, activates flow. Otherwise computes the distance between the middle of the vehicle's front and endLinePosition, determines arrival (distance and speed) and disables the AI if autoDisableOnArrive; sends ai.setState manual once. Node error if no position is given. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua`.*

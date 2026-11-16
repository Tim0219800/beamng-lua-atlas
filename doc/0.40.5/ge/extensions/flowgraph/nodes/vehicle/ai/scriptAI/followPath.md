# `flowgraph_nodes_vehicle_ai_scriptAI_followPath`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua` · VM: Game Engine (GE) · 150 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath")` (file under extensions/ but not a regular extension)

Node "AI Follow Path from Data" (color ai). Makes a vehicle follow a ScriptAI path provided by the "AI Path from File" or "Stored AI Path" nodes (ai.startFollowing). Inputs: flow, reset, path (type aiPath), vehId, loopCount. Output: flow, active when the path is finished. Inspector options: Timescale (min 0.25), reset mode (neverReset, alwaysReset, startReset), "Reset AI" button. Data: handBrakeWhenFinished, straightenWheelsWhenFinished.

## Notes

- loopMode is not saved: it goes back to "neverReset" when the project is reloaded.
- If loopCount is not given, the value 0 is sent to ai.startFollowing.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Stops the AI if the path was running then resets started/complete to false. | 87 |
| `C:_onDeserialized(nodeData)` | Restores timeScale (1 by default). | 138 |
| `C:_onSerialize(res)` | Saves timeScale. | 134 |
| `C:drawCustomProperties()` | Draws the Timescale field (minimum 0.25), the reset mode choice and the "Reset AI" button. | 38 |
| `C:drawMiddle(builder, style)` | Displays the Complete and Started states. | 143 |
| `C:endAI()` | Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle. | 70 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 60 |
| `C:init()` | Initializes started, complete, loopMode="neverReset", timeScale=1 and the data. | 29 |
| `C:loadPath()` | Loads the path from the path pin into self.path. | 95 |
| `C:onVehicleSubmitInfo(id, info, nodeID)` | Hook called by the command sent every frame (the vehicle's ai.scriptState); when the info is nil for this vehicle and this node, marks the path as finished and stops the AI. | 77 |
| `C:setupAI()` | Prepares the path (times divided by timeScale, dir/up kept) and sends ai.startFollowing(path, nil, loopCount, loop mode). | 99 |
| `C:work()` | Handles reset; on the first pass runs setupAI; every frame requests via be:queueAllObjectLua the ai.scriptState() state of each vehicle, which calls the onVehicleSubmitInfo hook back; activates flow once complete. | 118 |

## Calls into the engine (C++)

- `be:` `queueAllObjectLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua`.*

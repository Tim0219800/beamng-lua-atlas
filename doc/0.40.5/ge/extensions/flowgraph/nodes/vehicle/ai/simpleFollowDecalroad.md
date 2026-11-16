# `flowgraph_nodes_vehicle_ai_simpleFollowDecalroad`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua` · VM: Game Engine (GE) · 161 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad")` (file under extensions/ but not a regular extension)

Node "Follow Decalroad" (color ai, duration behavior). Simply makes a vehicle follow a DecalRoad: builds a path from the road nodes (time = distance / data.speed) and starts ai.startFollowing. Inputs: flow, start, stop, roadName, vehId, loopCount (hidden). Outputs: flow, active, finished, progress (0 to 1). Data: renderDebug, speed (5 m/s), loopMode ("startReset").

## Notes

- Bug: in onVehicleSubmitInfo, self.pinOut.active and self.pinOut.finished are replaced by booleans (instead of .value), which overwrites the pin objects.
- Bug: when info == nil, the function continues and reads info.scriptTime (error); a return is missing.
- The last node of the road is not added to the path (the loop goes from 0 to getNodeCount()-2), and the end is never detected by flow.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays Load button, state, number of nodes, distance and debug path if renderDebug. | 129 |
| `C:getVeh()` | Returns the vehicle whose id is given as input, or the player's vehicle (getPlayerVehicle(0)) without input. | 61 |
| `C:init()` | Initializes the data (speed=5, loopMode=startReset, renderDebug=false) and asks all vehicles to emit the onVehicleSubmitInfo hook with their ai.scriptState(). | 33 |
| `C:loadRecording()` | Builds self.path from the DecalRoad (scenetree.findObject(roadName)): one point per node with the cumulative time and the direction/up of the first point. | 98 |
| `C:onVehicleSubmitInfo(id, info)` | Hook called with the AI script state of a vehicle; updates progress = scriptTime / endScriptTime and receivedInfo if the id matches vehId. | 47 |
| `C:play()` | Loads the road, sends ai.startFollowing(path, nil, loopCount or -1, loopMode) and initializes the finished, active and progress pins. | 71 |
| `C:stop()` | Sends ai.stopFollowing() and sets finished/active to false. | 87 |
| `C:work()` | Calls play on start, or stop on stop. | 121 |

## Calls into the engine (C++)

- `be:` `queueAllObjectLua`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua`.*

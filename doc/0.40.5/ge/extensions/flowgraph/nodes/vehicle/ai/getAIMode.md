# `flowgraph_nodes_vehicle_ai_getAIMode`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/getAIMode")` (file under extensions/ but not a regular extension)

Node "Get AI Mode" (color ai, repeat_p_duration). Reads the current AI mode of a vehicle. Input: vehId (no value = player). Output: aiMode (string). The value arrives asynchronously: the vehicle runs a command that calls the node back on the game engine side.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the last received mode. | 40 |
| `C:getAIMode(mode)` | Callback called from the vehicle with the AI mode; stores it in returnedMode. | 48 |
| `C:getCmd()` | Builds the Lua command executed on the vehicle side: reads ai.getState().mode and calls n:getAIMode(mode) back on this node via core_flowgraphManager.getManagerGraphNode. | 44 |
| `C:init()` | Does nothing. | 21 |
| `C:work()` | Sends the getCmd command to the vehicle and publishes the last received mode on aiMode (the value is therefore at least one frame late). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua`.*

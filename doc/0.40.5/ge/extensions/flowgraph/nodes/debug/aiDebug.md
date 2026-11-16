# `flowgraph_nodes_debug_aiDebug`

*File: `lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/aiDebug")` (file under extensions/ but not a regular extension)

Flowgraph node "AI Debug Display" (category dynamic_p_duration, tags target/trajectory/route/debug). Shows or hides the AI debug visualizations of a vehicle by calling ai.setVehicleDebugMode on the vehicle side. Inputs: vehId (number, 0 or empty = player vehicle) and mode (string: off, target, trajectory, speeds, route; 'off' by default). In 'repeat' dynamic mode the command is resent every frame.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:SetAIDebugMode()` | Finds the vehicle (vehId or player) and sends it ai.setVehicleDebugMode({debugMode = mode}) via queueLuaCommand. | 42 |
| `C:postInit()` | Provides the list of modes as templates for the mode pin in the editor. | 24 |
| `C:work()` | If dynamicMode is 'repeat', reapplies the mode every frame. | 36 |
| `C:workOnce()` | Applies the mode once. | 32 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua`.*

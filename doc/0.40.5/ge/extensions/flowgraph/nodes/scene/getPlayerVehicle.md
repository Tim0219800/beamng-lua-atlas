# `flowgraph_nodes_scene_getPlayerVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/scene/getPlayerVehicle.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/getPlayerVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Player Vehicle ID" (provider category). Outputs: vehId (number) id of the vehicle controlled by the player (be:getPlayerVehicleID(0), -1 if none) and exist (bool, hidden). Old pin name: objID -> vehId (legacyPins).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Nothing to initialize. | 28 |
| `C:work()` | Writes vehId = be:getPlayerVehicleID(0) or -1 and exist = (vehId ~= -1). | 31 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/getPlayerVehicle.lua`.*

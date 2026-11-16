# `flowgraph_nodes_mission_removeStashedPlayerVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle.lua` · VM: Game Engine (GE) · 22 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node 'Remove Stashed Player Vehicle' (once_p_duration category). Deletes the player vehicle stashed by the mission cleanup node (manager's mission module). No pins.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls self.mgr.modules.mission:removeStashedPlayerVehicle(). | 18 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/removeStashedPlayerVehicle.lua`.*

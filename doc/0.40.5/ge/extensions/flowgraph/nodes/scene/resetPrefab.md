# `flowgraph_nodes_scene_resetPrefab`

*File: `lua/ge/extensions/flowgraph/nodes/scene/resetPrefab.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/resetPrefab")` (file under extensions/ but not a regular extension)

Flowgraph node "Reset Prefab" (once_instant, author BeamNG). Restores the transforms of the objects/vehicles of a prefab via self.mgr.modules.prefab:restoreVehiclePositions(id). Input: id (number).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls the prefab module's restoreVehiclePositions(id). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/resetPrefab.lua`.*

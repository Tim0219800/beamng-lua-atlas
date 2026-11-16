# `flowgraph_nodes_scene_removePrefab`

*File: `lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua` · VM: Game Engine (GE) · 29 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/removePrefab")` (file under extensions/ but not a regular extension)

Flowgraph node "Remove Prefab" (repeat_instant). Deletes a prefab by its id via self.mgr.modules.prefab:deletePrefab(id, true). Inputs: flow, id (number, 0 by default).

## Notes

- The icon references ui_flowgraph_editor.nodeIcons.svene (typo for scene): nil icon.
- The description of the id pin is truncated ("If not present").

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Does nothing. | 24 |
| `C:work()` | Calls the prefab module's deletePrefab(id, true) on every execution with flow. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/removePrefab.lua`.*

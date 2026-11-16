# `flowgraph_nodes_scene_keepPrefab`

*File: `lua/ge/extensions/flowgraph/nodes/scene/keepPrefab.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/keepPrefab")` (file under extensions/ but not a regular extension)

Flowgraph node "Keep Prefab" (once_instant). Marks a prefab to be kept after the flowgraph stops; by default a prefab created during execution is deleted at the end. Inputs: id (number), keep (bool). Uses self.mgr.modules.prefab:setKeepPrefab.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Nothing to initialize. | 24 |
| `C:workOnce()` | Calls setKeepPrefab(id, keep) and copies the flow input to the flow output. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/keepPrefab.lua`.*

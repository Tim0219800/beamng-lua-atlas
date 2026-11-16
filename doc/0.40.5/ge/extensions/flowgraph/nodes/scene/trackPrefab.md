# `flowgraph_nodes_scene_trackPrefab`

*File: `lua/ge/extensions/flowgraph/nodes/scene/trackPrefab.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/trackPrefab")` (file under extensions/ but not a regular extension)

Flowgraph node "Track Prefab" (once_instant). Lets the flowgraph track a prefab created outside the flowgraph, via modules.prefab:addPrefab(id, options). Inputs: flow, id (0 = player's prefab according to the description), dontDelete, skipNavgraphReload, skipCollisionReload (all true by default, hidden).

## Notes

- The icon references nodeIcons.svene (typo): nil icon.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Does nothing. | 29 |
| `C:workOnce()` | Calls addPrefab(id, {dontDelete, skipNavgraphReload, skipCollisionReload}). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/trackPrefab.lua`.*

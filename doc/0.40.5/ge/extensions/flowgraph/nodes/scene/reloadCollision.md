# `flowgraph_nodes_scene_reloadCollision`

*File: `lua/ge/extensions/flowgraph/nodes/scene/reloadCollision.lua` · VM: Game Engine (GE) · 24 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/reloadCollision")` (file under extensions/ but not a regular extension)

Flowgraph node "Reload Collision" (once_instant). Reloads the level's collision data once via be:reloadCollision(). No pins.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls be:reloadCollision(). | 19 |

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/reloadCollision.lua`.*

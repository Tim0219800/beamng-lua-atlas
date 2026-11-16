# `flowgraph_nodes_util_popActionMap`

*File: `lua/ge/extensions/flowgraph/nodes/util/popActionMap.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/popActionMap")` (file under extensions/ but not a regular extension)

Node "Pop Action Map" (once_instant). Removes an action map from the input stack (popActionMap). Input: name. The todo field points to odd behavior if several projects use the same action map.

## Notes

- Bug: workOnce uses self.mapName, never defined in this node (it is only defined by Push Action Map); the name pin is not read, so popActionMap receives nil.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Calls _executionStopped. | 21 |
| `C:workOnce()` | Calls popActionMap(self.mapName). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/popActionMap.lua`.*

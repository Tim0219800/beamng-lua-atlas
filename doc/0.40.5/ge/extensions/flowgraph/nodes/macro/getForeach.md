# `flowgraph_nodes_macro_getForeach`

*File: `lua/ge/extensions/flowgraph/nodes/macro/getForeach.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/macro/getForeach")` (file under extensions/ but not a regular extension)

Flowgraph node 'Get Foreach' (provider category). In a flowgraph created by a Foreach node, exposes the key and value of the current element, read from self.mgr.modules.foreach.

## Notes

- C.tags is defined twice; the second definition overwrites the first.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Copies mgr.modules.foreach.key and .value to the output pins. | 32 |
| `C:init(mgr, ...)` | Empty. | 24 |
| `C:postInit()` | Empty. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/macro/getForeach.lua`.*

# `flowgraph_nodes_types_bool`

*File: `lua/ge/extensions/flowgraph/nodes/types/bool.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/bool")` (file under extensions/ but not a regular extension)

Node "Bool" (provider). Provides a boolean value (data.value, true by default) on the value pin.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 27 |
| `C:init()` | data.value = true. | 19 |
| `C:work()` | Writes data.value to the output. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/bool.lua`.*

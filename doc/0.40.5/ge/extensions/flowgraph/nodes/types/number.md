# `flowgraph_nodes_types_number`

*File: `lua/ge/extensions/flowgraph/nodes/types/number.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/number")` (file under extensions/ but not a regular extension)

Node "Number" (provider). Provides a number (data.value, 0 by default) on the value pin.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 28 |
| `C:init()` | data.value = 0 and clearOutPinsOnStart = false. | 19 |
| `C:onDeserialized(nodeData)` | Empty (name without underscore, unlike _onSerialize used by the other nodes). | 36 |
| `C:onSerialize(res)` | Empty (name without underscore, unlike _onSerialize used by the other nodes). | 33 |
| `C:work()` | Writes data.value to the output. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/number.lua`.*

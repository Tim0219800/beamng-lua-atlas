# `flowgraph_nodes_types_string`

*File: `lua/ge/extensions/flowgraph/nodes/types/string.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/types/string")` (file under extensions/ but not a regular extension)

Node "String" (provider). Provides a string ("Hello World" by default) on the value pin. Single-line or multi-line editing in the editor; line breaks are escaped (\n) on save.

## Notes

- The imgui buffer is limited to 2048 characters.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(nodeData)` | Restores the string (supports the old data.value format) and multiLine. | 80 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 75 |
| `C:drawCustomProperties()` | "Multi Line" checkbox and input field (2048-character buffer). | 29 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 58 |
| `C:drawProperties()` | Empty. | 72 |
| `C:init()` | string = 'Hello World', multiLine = false. | 20 |
| `C:work()` | Writes the string to the output. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/types/string.lua`.*

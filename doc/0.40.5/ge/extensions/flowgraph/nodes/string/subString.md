# `flowgraph_nodes_string_subString`

*File: `lua/ge/extensions/flowgraph/nodes/string/subString.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/string/subString")` (file under extensions/ but not a regular extension)

Node "SubString" (simple). Extracts a substring with string.sub(value, data.from, data.to). Default values from = 0 and to = -1. Pins: value (in), value (out).

## Notes

- Lua indices start at 1; from = 0 is treated as 1 by string.sub.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 27 |
| `C:init()` | data.from = 0, data.to = -1. | 22 |
| `C:work()` | Writes string.sub(value, from, to). | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/string/subString.lua`.*

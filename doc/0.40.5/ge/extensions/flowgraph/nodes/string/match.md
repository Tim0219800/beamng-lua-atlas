# `flowgraph_nodes_string_match`

*File: `lua/ge/extensions/flowgraph/nodes/string/match.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/string/match")` (file under extensions/ but not a regular extension)

Node "Match String" (simple). Should return the first capture of a Lua pattern applied to the input string; pins: value (in, string), value (out, string). Pattern in data.pattern ("%d" by default).

## Notes

- Bug: work uses self.data.pattern.value whereas data.pattern is a string: indexing a string by 'value' gives nil, string.match receives a nil pattern and raises an error.
- The file notes as a todo that the usable patterns remain to be documented.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 31 |
| `C:init()` | data.pattern = '%d'. | 23 |
| `C:work()` | Calls string.match(value, data.pattern.value) and writes the result. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/string/match.lua`.*

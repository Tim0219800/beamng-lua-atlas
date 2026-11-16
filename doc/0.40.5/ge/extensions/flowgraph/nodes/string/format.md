# `flowgraph_nodes_string_format`

*File: `lua/ge/extensions/flowgraph/nodes/string/format.lua` · VM: Game Engine (GE) · 159 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/string/format")` (file under extensions/ but not a regular extension)

Node "Format String" (repeat_instant). Applies string.format(data.pattern, values...) with up to 16 values (dynamic input pins value_1..value_N, N set by "Count" in the editor). Output: value (string). Default pattern "%d".

## Notes

- Maximum 16 values: beyond 16, work produces nothing.
- A nil value or one of a type incompatible with the format (e.g. %d with a string) makes string.format fail.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores count and recreates the pins. | 71 |
| `C:_onSerialize(res)` | Saves the node's state in the given table. | 67 |
| `C:drawCustomProperties()` | "Count" field (min 1) that adds/removes pins. | 31 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the editor. | 145 |
| `C:init()` | data.pattern = '%d' and count = 1. | 22 |
| `C:postInit()` | Creates the initial value_i pins. | 27 |
| `C:updatePins(old, new)` | Creates or deletes the value_i pins (and the associated links) to go from old to new values. | 49 |
| `C:work()` | Formats the pattern with the values value_1..value_count. | 77 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/string/format.lua`.*

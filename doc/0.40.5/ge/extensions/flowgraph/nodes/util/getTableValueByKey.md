# `flowgraph_nodes_util_getTableValueByKey`

*File: `lua/ge/extensions/flowgraph/nodes/util/getTableValueByKey.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/getTableValueByKey")` (file under extensions/ but not a regular extension)

Node "Get Table Value By Key" (repeat_instant). Reads a value from a table using a key (string or number). Inputs: value (table), key. Output: value (any).

## Notes

- If the key is absent or is false, the output keeps its previous value instead of being cleared.
- The input and output pins are both named "value".

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | If the table is connected, writes table[key] to the output value only if the result is non-nil/false; otherwise sets the output to nil. | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/getTableValueByKey.lua`.*

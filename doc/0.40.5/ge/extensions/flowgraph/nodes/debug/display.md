# `flowgraph_nodes_debug_display`

*File: `lua/ge/extensions/flowgraph/nodes/debug/display.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/display")` (file under extensions/ but not a regular extension)

Flowgraph node "Display Value" (simple type, category repeat_instant, tag util). Displays in the node body the value received on the input pin "value" (any); if it is a table, a "Dump" button sends it to the console (dump). No output.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Editor: displays the value (dumpsz, depth 2) and the Dump button for tables. | 23 |
| `C:work()` | Stores the last received value. | 19 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/display.lua`.*

# `flowgraph_nodes_debug_multiFlow`

*File: `lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/multiFlow")` (file under extensions/ but not a regular extension)

Flowgraph node "Multi Flow" (simple type, category logic), a test node with four flow inputs a, b, c, d. Displays in the node one box per input (green, yellow, red, magenta), checked if the input has flow; if data.logOnWork is true, prints their values on each execution.

## Notes

- Game C.todo: "Maybe merge this with displayFlow node".

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Editor: draws four checked boxes according to the pin state. | 37 |
| `C:init()` | Sets data.logOnWork to false. | 24 |
| `C:work()` | If data.logOnWork, prints the state of the four inputs. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/multiFlow.lua`.*

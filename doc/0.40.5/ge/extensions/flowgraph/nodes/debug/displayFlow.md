# `flowgraph_nodes_debug_displayFlow`

*File: `lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/displayFlow")` (file under extensions/ but not a regular extension)

Flowgraph node "Display Flow" (simple type, category logic, tag util). Displays a green checked box when flow reaches the node (considered active if the last flow is less than 5 frames old). The tooltip shows an estimated refresh rate (1 / interval between two flows). Input pin: value (flow). No output.

## Notes

- Game C.todo: "Randomly bugs out when first starting the execution sometimes".

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Editor: draws the checked box (active/inactive) and accumulates time. | 33 |
| `C:drawTooltip()` | Editor: "N fps" tooltip. | 44 |
| `C:init()` | Initializes lastTime, time and lastUsedFrame. | 21 |
| `C:work()` | Stores the time elapsed since the last flow and the current frame number (mgr.frameCount). | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/displayFlow.lua`.*

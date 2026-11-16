# `flowgraph_nodes_ui_updatedUI_endScreenTimeSlip`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip")` (file under extensions/ but not a regular extension)

Node "EndScreen Drag Time Slip" (repeat_instant, color ui). Displays the timing slip (time slip) of a drag race on the end screen. Input flow, output flow (chainFlow).

## Notes

- The warning log uses the variable logTag, which is not defined in this file (nil value).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Prepares the panel {type='dragTimeSlip', header='Timeslip', pages={timeslip=true}}. | 21 |
| `C:work()` | Gets gameplay_drag_dragBridge.createTimeslipData() and adds it to the panel via modules.ui:addUIElement; without data, adds the empty panel and logs a warning. | 32 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenTimeSlip.lua`.*

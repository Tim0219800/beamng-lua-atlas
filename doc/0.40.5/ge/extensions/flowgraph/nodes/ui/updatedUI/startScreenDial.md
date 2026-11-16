# `flowgraph_nodes_ui_updatedUI_startScreenDial`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua` · VM: Game Engine (GE) · 68 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenDial")` (file under extensions/ but not a regular extension)

Node "StartScreen Drag Dial" (repeat_instant, color ui). Adds the dial setup panel of a drag race to the start screen (the winner is the one who finishes closest to their dial without going over). Input flow; outputs flow (chainFlow) and dials (table of {label, key, value, disabled, racerId}).

## Notes

- The warning log uses logTag, which is not defined in this file (nil).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Prepares the panel {type='dragDial', header='Dial Setup', ...}. | 22 |
| `C:onDialSetByDialPanel(dial)` | Called when the player changes a dial in the panel; updates the value of the entry with the same label and republishes dials. | 58 |
| `C:work()` | Reads gameplay_drag_dragBridge.getData(); for each racer creates a dial entry (value timers.dial.value or 12 by default, disabled if the racer is not playable), adds the panel to the UI and publishes the list on the dials pin. Without data, logs a warning and does nothing else. | 34 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenDial.lua`.*

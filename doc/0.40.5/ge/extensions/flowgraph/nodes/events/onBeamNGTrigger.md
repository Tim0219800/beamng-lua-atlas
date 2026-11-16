# `flowgraph_nodes_events_onBeamNGTrigger`

*File: `lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua` · VM: Game Engine (GE) · 74 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/onBeamNGTrigger")` (file under extensions/ but not a regular extension)

Flowgraph node "on BeamNGTrigger" (category repeat_instant, event). Listens to the onBeamNGTrigger hook and lets flow through depending on the event (enter or exit). Can filter by trigger name (data.filterName, empty = all). Outputs: enter, exit (pulses), vehId, triggerId, vehicleName, triggerName.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays the active filter in the node. | 65 |
| `C:init(mgr, ...)` | Initializes data.filterName = "" and the flags. | 32 |
| `C:onBeamNGTrigger(data)` | Hook called by the engine on each BeamNGTrigger event. Ignores the event if the name does not match the filter, fills the output pins, raises enterFlag/exitFlag and triggers the node. | 38 |
| `C:work(args)` | Copies enterFlag/exitFlag to the enter/exit pins then resets them to false. | 57 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua`.*

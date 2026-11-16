# `flowgraph_nodes_activity_activityHook`

*File: `lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/activityHook")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Hook Trigger" (category once_instant, tag activity). Triggers a mission hook named by data.eventName ("start" by default), passing all custom input pins (except flow and reset) as arguments via mgr.modules.mission:missionHook. Marked "generally unused" (C.todo). No fixed pins; all types except flow are allowed as custom pins.

## Notes

- Game C.todo: "This node is generally unused."

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Sets data.eventName = 'start' and enables allowCustomInPins and savePins. | 29 |
| `C:workOnce()` | Builds a table {pinName = value} from the input pins (except flow, reset) and calls mgr.modules.mission:missionHook(eventName, data). | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/activityHook.lua`.*

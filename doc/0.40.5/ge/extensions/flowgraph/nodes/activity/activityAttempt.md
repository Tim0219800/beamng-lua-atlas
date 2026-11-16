# `flowgraph_nodes_activity_activityAttempt`

*File: `lua/ge/extensions/flowgraph/nodes/activity/activityAttempt.lua` · VM: Game Engine (GE) · 71 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/activityAttempt")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Attempt" (category once_instant, tags activity/mission). Creates a mission attempt via gameplay_missions_progress.newAttempt and outputs it on the table pin "attempt" (tableType attemptData) for the other activity nodes. Fixed pins: bool inputs "passed" and "completed"; output "attempt". Custom input pins added by the user (all types except flow) are copied into the attempt data. Runs once when the flow arrives (workOnce).

## Notes

- The attempt type is always 'attempted': the lines that set it to 'passed'/'completed' depending on the pins are commented out, so the "passed" and "completed" pins have no effect in this node.
- The fixed pins (passed, completed) are not copied into the data; only non-fixed pins are.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Enables savePins and allowCustomInPins (saved custom input pins). | 37 |
| `C:postInit()` | Empty (code commented out on attempt type templates). | 42 |
| `C:workOnce()` | If the flow is active, gathers the non-fixed pins into a table, creates the 'attempted' attempt with this data and puts it on the attempt output pin. | 51 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/activityAttempt.lua`.*

# `flowgraph_nodes_activity_getProgress`

*File: `lua/ge/extensions/flowgraph/nodes/activity/getProgress.lua` · VM: Game Engine (GE) · 67 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/getProgress")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Progress" (category once_p_duration, tag activity). Reads the mission's aggregated progress for the current progress key (saveData.progress[key].aggregate) and puts it on pins: "aggregate" (table), "aggText" (plain text), "aggHtml" (HTML list), and hidden pins bestType, passed, completed, attemptCount, mostRecentDate. Custom output pins receive the aggregate's field with the same name.

## Notes

- Without an associated activity, does nothing.
- The "aggregate" pin is never filled by the code (no aggregate key in the aggregate itself); use aggText/aggHtml or the named pins.
- Numbers are formatted with %0.2d (integer of at least 2 digits).
- The description of the mostRecentDate pin says "Completed" (copy-paste).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Enables savePins. | 27 |
| `C:workOnce()` | Builds aggText and aggHtml (sorted keys) and copies each aggregate value to the output pin with the same name. | 31 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/getProgress.lua`.*

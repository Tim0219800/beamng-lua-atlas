# `flowgraph_nodes_activity_missionAttemptStars`

*File: `lua/ge/extensions/flowgraph/nodes/activity/missionAttemptStars.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/missionAttemptStars")` (file under extensions/ but not a regular extension)

Flowgraph node "Mission Attempt Stars" (category once_instant, tags activity/mission). Adds stars to an attempt "via the constructor": the custom input pins are gathered into a table and passed to mission:addAttemptData(attempt, data), leaving it to the mission type to fill unlockedStars. Fixed input and output "attempt" (attemptData).

## Notes

- Crashes without an associated activity (self.mgr.activity nil is indexed). If addAttemptData does not exist, the attempt is returned as is (with unlockedStars = {} at minimum).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Enables savePins and allowCustomInPins. | 22 |
| `C:workOnce()` | Initializes attempt.unlockedStars, collects the custom pins, calls activity:addAttemptData if present, then outputs attempt. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/missionAttemptStars.lua`.*

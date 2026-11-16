# `flowgraph_nodes_gameplay_rally_loop_rallyClock`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua` · VM: Game Engine (GE) · 80 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Clock" (category repeat_instant, tag rally). Provides the current rally epoch time (currentEpochTime, seconds, rm:getEpochTime()) and the scheduled time of an event (scheduledEventTime, rm:getScheduledEventTime(eventName)) for the given event name (position name, e.g. "SS_start_line"). The scheduled time is cached and recomputed only when eventName or the current mission changes.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears the cache when the graph starts. | 30 |
| `C:init(mgr, ...)` | Initializes the cache (event name, mission id, scheduled time) to nil. | 23 |
| `C:work()` | Every frame: updates currentEpochTime and scheduledEventTime (with cache). | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/rallyClock.lua`.*

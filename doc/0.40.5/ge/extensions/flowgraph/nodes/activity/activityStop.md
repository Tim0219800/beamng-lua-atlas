# `flowgraph_nodes_activity_activityStop`

*File: `lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/activityStop")` (file under extensions/ but not a regular extension)

Flowgraph node "Finish Mission" (tag activity). Stops the current mission: when the flow arrives, it stops the graph execution (mgr:setRunning(false)) after the frame's nodes have triggered. Input pins: flow, "attempt" (attemptData table). Without an associated activity, the attempt is discarded with a W log and the fade screen is stopped (ui_fadeScreen.stop(0)).

## Notes

- The attempt read (attempt pin, otherwise newAttempt('attempted', {})) is no longer recorded: the call to missionManager.stop is commented out, only setRunning(false) stops the graph.
- The category is not defined in this file.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Called after the nodes have triggered: if stopping, stops the graph (setRunning(false)); without an activity, logs the abandoned attempt and stops the screen fade. | 27 |
| `C:work()` | Sets self.stopping = true when the node is executed. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/activityStop.lua`.*

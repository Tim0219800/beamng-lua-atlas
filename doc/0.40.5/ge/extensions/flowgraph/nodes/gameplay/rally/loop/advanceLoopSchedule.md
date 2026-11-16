# `flowgraph_nodes_gameplay_rally_loop_advanceLoopSchedule`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Advance Loop Schedule" (category once_instant, tag rally, no pin). Asks the rally loop manager (gameplay_rallyLoop.getManager()) to move to the next mission in the schedule via rm:getNextMissionId(), and logs the result (D if a next mission exists, W otherwise, E if the manager cannot be found or the extension is not loaded).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls rm:getNextMissionId() (which advances the schedule) and logs the id obtained. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/advanceLoopSchedule.lua`.*

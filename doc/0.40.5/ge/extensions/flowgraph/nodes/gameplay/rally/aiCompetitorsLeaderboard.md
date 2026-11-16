# `flowgraph_nodes_gameplay_rally_aiCompetitorsLeaderboard`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally AI Competitors Leaderboard" (category once_instant, tag rally). Simulates the stage times of AI competitors from the aiCompetitors config (module gameplay/rally/aiCompetitors) and produces a ranking for the end screen in the leaderboard pin ({rows, playerRowIndex}; multiStage and stageCount if several stages). Inputs: playerTime, silverTime (old fallback), playerTimes and silverTimes (tables, one time per stage, of the same length), stageLabels (labels), playerTotalTimeSec (official total of the rally loop, used to rank the player). Executed only once (workOnce).

## Notes

- In multi-stage mode, if the labels are neither provided nor retrievable via gameplay_rallyLoop.getManager():getStageLabels(), an error is logged and the ranking is empty ({rows = {}}).
- In single mode, the reference time comes from aiCompetitors.getReferenceTime(missionTypeData), otherwise from the silverTime pin.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Computes the ranking via aiCompetitors.computeLeaderboard and writes it to the leaderboard pin. | 64 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/aiCompetitorsLeaderboard.lua`.*

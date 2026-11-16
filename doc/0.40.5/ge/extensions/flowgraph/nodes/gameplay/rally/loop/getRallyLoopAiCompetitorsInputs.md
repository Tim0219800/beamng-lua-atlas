# `flowgraph_nodes_gameplay_rally_loop_getRallyLoopAiCompetitorsInputs`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs.lua` · VM: Game Engine (GE) · 155 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop AI Competitors Inputs" (category once_instant, tag rally). Prepares the inputs of the Rally AI Competitors Leaderboard node from the rally loop: playerTimes (raw stage times in seconds, without penalties, taken from the event log; nil from the first missing time), silverTimes (configured reference times of the linked rallyStage missions, up to 4 via stage1..4_rallyStage), stageLabels (aligned labels) and playerTotalTimeSec (official total of the loop = time + penalties). Flow pins as input and output (chainFlow).

## Notes

- If a stage has no usable reference time (AiCompetitors.getReferenceTime), a warning is logged and the list of reference times is empty.
- If the number of labels does not match the number of reference times, the labels stay empty (warning).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Initializes the outputs to empty then fills silverTimes, stageLabels, playerTotalTimeSec and playerTimes from the rally loop manager. | 95 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/getRallyLoopAiCompetitorsInputs.lua`.*

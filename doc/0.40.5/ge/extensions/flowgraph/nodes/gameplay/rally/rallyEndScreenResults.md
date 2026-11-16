# `flowgraph_nodes_gameplay_rally_rallyEndScreenResults`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally End Screen Results" (category repeat_instant, rally color, ui icon). Adds text panels to the mission end screen: the formatted attempt (change.formattedAttempt), the mission end text (missionTypeData.endScreenText) and an additional text (text pin, e.g. result with medal), plus optionally the objectives and the ratings (includeObjectives, includeRatings via mgr.modules.ui). Title: missionTypeData.outroTitleText, otherwise 'ui.missions.results.title'; it is only shown on the first panel. Inputs: flow, text (string or table), change, includeObjectives, includeRatings. Output: flow.

## Notes

- The additional text is ignored if it has the same translation key as the mission text.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame: copies flow and adds the UI elements (textPanel, objectives, ratings) to the flowgraph ui module. | 36 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyEndScreenResults.lua`.*

# `flowgraph_nodes_ui_updatedUI_endScreenAiCompetitorsLeaderboard`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard")` (file under extensions/ but not a regular extension)

Flowgraph node "EndScreen AI Competitors Leaderboard" (category once_instant, tags end/finish/rally): adds an AI competitors leaderboard tab to the mission end screen (rally). Inputs: flow (chaining), "leaderboard" (table from the Rally AI Competitors Leaderboard node). Single stage: time and gap columns; multi-stage: one column per stage plus the final. Adds a UI element 'textPanel' via self.mgr.modules.ui:addUIElement with header 'missions.aiCompetitorsLeaderboard.title'.

## Notes

- Silently ignored if the table is empty; logs an error and ignores if the multi-stage structure is invalid (stageCount, stageLabels, stageCells).
- The player name comes from OnlineServiceProvider.playerName, otherwise 'Player' (useDefaultPlayerName = true).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Validates the leaderboard data and adds the 'textPanel' panel to the end screen. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenAiCompetitorsLeaderboard.lua`.*

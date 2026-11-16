# `flowgraph_nodes_gameplay_rally_rallyStageInfoPanel`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua` · VM: Game Engine (GE) · 226 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Info Panel" (category repeat_instant, tag rally/ui/start/screen, ui icon). Builds the consolidated rally start screen panel and adds it via mgr.modules.ui:addUIElement({type = 'rallyStageInfo', ...}): statistics (distance in km and surface breakdown, read from the mission's driveline file), mission description blurb, rules (recovery with or without repair, flip, stop check, or loop rules: liaison, service park, liaison speed, false starts, time control penalties). Inputs: flow, isLoop (bool: loop rules if true, single stage rules otherwise). Output: flow. Sets the page icon 'roadInfo'.

## Notes

- The repair on recovery comes from activity.lastUserSettings.rallyRepairVehicleOnRecovery, otherwise from the rallyRepairVehicleOnRecovery setting, otherwise true.
- In loop mode, also displays SS/liaison/total distances (via the loop manager) and the list of stages (stage1..4_rallyStage).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:buildLoopStages()` | List of the loop's stages (name, distance, surfaces) from the stage1..4_rallyStage fields of the mission. | 96 |
| `C:buildLoopStats()` | Stage, liaison and total distances of the rally loop (formatted in km). | 78 |
| `C:buildRules(repairEnabled)` | Builds the list of rules (translation keys or {txt, context}) according to isLoop and the repair. | 132 |
| `C:buildStats()` | Formatted stats of the current stage. | 74 |
| `C:formatStats(stats)` | Formats the stats: distance ("%.2f km") and rounded surfaces > 0 % sorted by descending value. | 49 |
| `C:getServiceParkSpeedLimit()` | Displayable service park speed limit (30 km/h by default). | 123 |
| `C:readStats()` | Reads the driveline stats from the rally manager, or from the mission's spline file. | 27 |
| `C:readStatsForFolder(folder)` | Reads the stats from the driveline file of a mission folder. | 41 |
| `C:work()` | Every frame: copies flow and adds the rallyStageInfo UI element. | 168 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua`.*

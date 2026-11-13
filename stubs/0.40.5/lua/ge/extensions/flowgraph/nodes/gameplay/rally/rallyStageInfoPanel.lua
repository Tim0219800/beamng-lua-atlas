---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua
---@class flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C
local flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C = {}

--- For loops: one entry per filled special stage, in run order, with the stage's
---  title + its own distance/surfaces (read from that stage's driveline spline).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:96
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStages() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:78
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStats() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:132
---@param repairEnabled any
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildRules(repairEnabled) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:74
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildStats() end

--- Shape a raw stats table into UI-ready distance + sorted surface percentages.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:49
---@param stats any
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:formatStats(stats) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:123
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:getServiceParkSpeedLimit() end

--- Read the authored stats. Prefer the loaded driveline (drivelineV3.stats); fall back to
---  reading the spline file directly so the panel works regardless of driveline load timing.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:27
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStats() end

--- Read the stats for a specific mission folder's driveline spline.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:41
---@param folder any
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStatsForFolder(folder) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:168
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:work() end


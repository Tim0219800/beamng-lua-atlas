---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C
local flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C = {}

--- List of the loop's stages (name, distance, surfaces) from the stage1..4_rallyStage fields of the mission.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:96
---@return table|nil  List of entries or nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStages() end

--- Stage, liaison and total distances of the rally loop (formatted in km).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:78
---@return table|nil  {specialStageDistance, liaisonDistance, totalDistance} or nil if the schedule is invalid.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildLoopStats() end

--- Builds the list of rules (translation keys or {txt, context}) according to isLoop and the repair.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:132
---@param repairEnabled boolean Whether the recovery repairs the vehicle.
---@return table  List of rules.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildRules(repairEnabled) end

--- Formatted stats of the current stage.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:74
---@return table|nil  See formatStats.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:buildStats() end

--- Formats the stats: distance ("%.2f km") and rounded surfaces > 0 % sorted by descending value.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:49
---@param stats table|nil Raw stats.
---@return table|nil  {distance, surfaces} or nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:formatStats(stats) end

--- Displayable service park speed limit (30 km/h by default).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:123
---@return string  Text like "30 km/h".
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:getServiceParkSpeedLimit() end

--- Reads the driveline stats from the rally manager, or from the mission's spline file.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:27
---@return table|nil  Stats (raceDistanceKms, surfacePercentages...) or nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStats() end

--- Reads the stats from the driveline file of a mission folder.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:41
---@param folder string|nil Mission folder.
---@return table|nil  Stats or nil.
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:readStatsForFolder(folder) end

--- Every frame: copies flow and adds the rallyStageInfo UI element.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua:168
function flowgraph_nodes_gameplay_rally_rallyStageInfoPanel_C:work() end


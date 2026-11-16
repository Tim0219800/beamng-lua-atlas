---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_knockAwayCheck_C
local flowgraph_nodes_mission_knockAwayCheck_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:35
function flowgraph_nodes_mission_knockAwayCheck_C:_executionStarted() end

--- Ends and releases the markers (scenario/race_marker).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:44
function flowgraph_nodes_mission_knockAwayCheck_C:_executionStopped() end

--- For each BeamNGVehicle of the prefab, records position, rotation and up vector, and adds the vehicle to the manager's vehicle module.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:51
---@param data table prefab data (allChildrenIds)
---@return table  transforms by vehicle id
function flowgraph_nodes_mission_knockAwayCheck_C:getOriginalVehicleTransforms(data) end

--- data.zOffset=0, positions empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:39
function flowgraph_nodes_mission_knockAwayCheck_C:init() end

--- Draws on the minimap a pointer (edge) or a circle for each vehicle not yet knocked over.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:168
---@param td table minimap drawing data
function flowgraph_nodes_mission_knockAwayCheck_C:onDrawOnMinimap(td) end

--- Called every render frame; draws the markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:161
---@param dt number real-time delta
---@param dtSim number simulation-time delta
function flowgraph_nodes_mission_knockAwayCheck_C:onPreRender(dt, dtSim) end

--- On reset, reinitializes. On the first frame of flow, initializes the counters, points and markers; then tests each vehicle (tilt via dirVecUp, displacement via pos) and updates the counters and markers; writes count, total, points, done, flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:68
function flowgraph_nodes_mission_knockAwayCheck_C:work() end


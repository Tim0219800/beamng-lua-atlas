---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_selectHeistMissionSpots_C
local flowgraph_nodes_mission_selectHeistMissionSpots_C = {}

--- Calls resetData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:56
function flowgraph_nodes_mission_selectHeistMissionSpots_C:_executionStarted() end

--- Initializes the location lists and the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:36
function flowgraph_nodes_mission_selectHeistMissionSpots_C:init() end

--- Resets the lists, the state machine and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:60
function flowgraph_nodes_mission_selectHeistMissionSpots_C:resetData() end

--- On reset: resetData. If flow, advances the state machine: 1 sorts the spots by tag and shuffles, 2 validates the start, 3 validates the heist location, 4 validates the escape, 5 writes the zones and loaded=true, 6 loaded=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:80
function flowgraph_nodes_mission_selectHeistMissionSpots_C:work() end


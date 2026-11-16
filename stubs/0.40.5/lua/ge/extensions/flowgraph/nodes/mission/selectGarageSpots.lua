---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_selectGarageSpots_C
local flowgraph_nodes_mission_selectGarageSpots_C = {}

--- Calls resetData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:52
function flowgraph_nodes_mission_selectGarageSpots_C:_executionStarted() end

--- Picks an end spot at an acceptable distance from the start spot (see Select Garage Sites), otherwise the best candidate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:77
---@param startSpot table start spot
---@return table|nil  end spot
function flowgraph_nodes_mission_selectGarageSpots_C:findEndSpotForStartingSpot(startSpot) end

--- Initializes the lists, state=1 and the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:37
function flowgraph_nodes_mission_selectGarageSpots_C:init() end

--- Empties the used spots and resets everything to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:56
function flowgraph_nodes_mission_selectGarageSpots_C:resetData() end

--- If flow: state 1 selects start and end, writes the outputs, flow and loaded to true; state 2 keeps flow=true and loaded=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:119
function flowgraph_nodes_mission_selectGarageSpots_C:work() end

--- Calls resetData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:72
function flowgraph_nodes_mission_selectGarageSpots_C:workOnce() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_selectGarage2GarageZones_C
local flowgraph_nodes_mission_selectGarage2GarageZones_C = {}

--- Resets the selection and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:41
function flowgraph_nodes_mission_selectGarage2GarageZones_C:_executionStarted() end

--- Shuffles the possible end spots and returns the first one whose distance to the start spot is within [minDist, maxDist]; otherwise the one closest to maxDist from below (best candidate).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:95
---@param startSpot table start spot
---@param possibleEndSpots table list of {name, spot}
---@return table|nil  end spot data
function flowgraph_nodes_mission_selectGarage2GarageZones_C:findEndSpotForStartingSpot(startSpot, possibleEndSpots) end

--- Initializes the state, the used spots and the outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:28
function flowgraph_nodes_mission_selectGarage2GarageZones_C:init() end

--- Resets the selection, state=1 and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:53
function flowgraph_nodes_mission_selectGarage2GarageZones_C:resetData() end

--- state 1: computes the possible spots, empties the usage lists when exhausted, picks start and end, sorts the zones by prio, writes the outputs and loaded=true, goes to state 2. state 2: loaded=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:138
function flowgraph_nodes_mission_selectGarage2GarageZones_C:work() end

--- Calls resetData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:65
function flowgraph_nodes_mission_selectGarage2GarageZones_C:workOnce() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_career_setFuelLevel_C
local flowgraph_nodes_career_setFuelLevel_C = {}

--- Calls onNodeReset when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:27
function flowgraph_nodes_career_setFuelLevel_C:_executionStarted() end

--- Calls onNodeReset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:24
function flowgraph_nodes_career_setFuelLevel_C:init() end

--- Resets the received data, the send flag and the duration state ('inactive').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:36
function flowgraph_nodes_career_setFuelLevel_C:onNodeReset() end

--- Once the data has arrived, sets each tank to maxEnergy*mult and switches to 'finished'.
---Source: lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:55
function flowgraph_nodes_career_setFuelLevel_C:work() end

--- Finds the vehicle, requests the energy data and switches to the 'started' state.
---Source: lua/ge/extensions/flowgraph/nodes/career/setFuelLevel.lua:44
function flowgraph_nodes_career_setFuelLevel_C:workOnce() end


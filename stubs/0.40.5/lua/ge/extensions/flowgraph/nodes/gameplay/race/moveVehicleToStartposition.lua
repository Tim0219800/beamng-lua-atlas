---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C
local flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C = {}

--- Forgets the stored path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:40
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:_executionStarted() end

--- Initializes self.path and disables clearOutPinsOnStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:35
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:init(mgr, ...) end

--- Chooses the start position, calls sp:moveResetVehicleTo(vehId, lowPrecision, repair) and writes pos/rot to the output.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:44
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:work(args) end


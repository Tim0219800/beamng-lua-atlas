---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C
local flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C = {}

--- Forgets the stored target position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:29
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:_executionStarted() end

--- Computes the squared distance between the vehicle's front center and the target position.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:74
---@return number|nil  Squared distance in m², or nil without a target.
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:getDistanceSquared() end

--- Initializes targetPos to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:25
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:init(mgr, ...) end

--- Updates (module local variables) the front position, rotation and speed of the tracked vehicle from map.objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:55
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:updateVehicleData2() end

--- Every frame: updates the vehicle data, broadcasts the distance to the UI and copies the flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackVehicleDistanceToPos.lua:89
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_rally_trackVehicleDistanceToPos_C:work(args) end


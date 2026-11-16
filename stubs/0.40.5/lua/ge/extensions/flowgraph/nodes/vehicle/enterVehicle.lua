---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_enterVehicle_C
local flowgraph_nodes_vehicle_enterVehicle_C = {}

--- Finds the vehicle (`vehId` or player), calls `gameplay_walk.getInVehicle` and `commands.setGameCamera`.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:37
function flowgraph_nodes_vehicle_enterVehicle_C:enterVehicle() end

--- If `dynamicMode == 'repeat'`, repeats the entry into the vehicle every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:31
function flowgraph_nodes_vehicle_enterVehicle_C:work() end

--- Makes the player enter the vehicle once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/enterVehicle.lua:27
function flowgraph_nodes_vehicle_enterVehicle_C:workOnce() end


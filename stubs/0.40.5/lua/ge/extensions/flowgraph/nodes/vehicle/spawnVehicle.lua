---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua
---@class flowgraph_nodes_vehicle_spawnVehicle_C
local flowgraph_nodes_vehicle_spawnVehicle_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:93
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStarted() end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:85
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStopped() end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:237
---@param builder any
---@param style any
function flowgraph_nodes_vehicle_spawnVehicle_C:drawMiddle(builder, style) end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:233
---@param action any
function flowgraph_nodes_vehicle_spawnVehicle_C:getCmd(action) end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:55
function flowgraph_nodes_vehicle_spawnVehicle_C:init() end

--- spawning can fail (e.g. low memory on PS5), so retry for a while and then abandon the mission
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:62
function flowgraph_nodes_vehicle_spawnVehicle_C:onSpawnFailed() end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:79
function flowgraph_nodes_vehicle_spawnVehicle_C:postInit() end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:50
function flowgraph_nodes_vehicle_spawnVehicle_C:resetSpawnRetry() end

---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:103
function flowgraph_nodes_vehicle_spawnVehicle_C:work() end


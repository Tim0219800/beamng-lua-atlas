---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_selectGarage2GarageVehicle_C
local flowgraph_nodes_mission_selectGarage2GarageVehicle_C = {}

--- Resets the selection and the outputs to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:37
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:_executionStarted() end

--- Initializes the selection, state=1 and usedConfigs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:23
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:init() end

--- Resets the selection, state=1 and the outputs to zero (usedConfigs is kept).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:51
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:resetData() end

--- state 1: picks an unused config, records it in usedConfigs, writes model/config/name, loaded=true, goes to state 2. state 2: loaded=false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:90
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:work() end

--- Calls resetData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:65
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:workOnce() end


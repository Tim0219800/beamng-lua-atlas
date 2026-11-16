---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_mission_getCustomVehicleData_C
local flowgraph_nodes_mission_getCustomVehicleData_C = {}

--- Splits a comma-separated string into a table of strings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:39
---@param str string string to split
---@return table  list of substrings
function flowgraph_nodes_mission_getCustomVehicleData_C:convertStringToTable(str) end

--- Enables savePins and allowCustomOutPins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:33
function flowgraph_nodes_mission_getCustomVehicleData_C:init() end

--- Looks up the vehicle by id and copies routeSpeed and risk (converted to number) to the output pins of the same name; the waypoints part is broken (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:56
function flowgraph_nodes_mission_getCustomVehicleData_C:workOnce() end


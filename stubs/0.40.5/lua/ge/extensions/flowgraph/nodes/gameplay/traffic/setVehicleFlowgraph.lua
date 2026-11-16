---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C
local flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C = {}

--- Calls onNodeReset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:41
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:_executionStopped() end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:35
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:init() end

--- Removes the role flowgraph of the remembered vehicle (clearFlowgraph) and forgets vehId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:45
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:onNodeReset() end

--- Copies the values of all non-fixed input pins into varData and calls veh.role:setupFlowgraph(fgFile, varData) for vehicle vehId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setVehicleFlowgraph.lua:55
function flowgraph_nodes_gameplay_traffic_setVehicleFlowgraph_C:workOnce() end


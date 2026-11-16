---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_vehicle_ai_getAIMode_C
local flowgraph_nodes_vehicle_ai_getAIMode_C = {}

--- Forgets the last received mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:40
function flowgraph_nodes_vehicle_ai_getAIMode_C:_executionStarted() end

--- Callback called from the vehicle with the AI mode; stores it in returnedMode.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:48
---@param mode string AI mode of the vehicle (e.g. manual, disabled, random...).
function flowgraph_nodes_vehicle_ai_getAIMode_C:getAIMode(mode) end

--- Builds the Lua command executed on the vehicle side: reads ai.getState().mode and calls n:getAIMode(mode) back on this node via core_flowgraphManager.getManagerGraphNode.
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:44
function flowgraph_nodes_vehicle_ai_getAIMode_C:getCmd() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:21
function flowgraph_nodes_vehicle_ai_getAIMode_C:init() end

--- Sends the getCmd command to the vehicle and publishes the last received mode on aiMode (the value is therefore at least one frame late).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/vehicle/ai/getAIMode.lua:25
function flowgraph_nodes_vehicle_ai_getAIMode_C:work() end


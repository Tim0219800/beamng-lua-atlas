---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_deliveryFinished_C
local flowgraph_nodes_gameplay_delivery_deliveryFinished_C = {}

--- Resets the states and outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:44
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:_executionStarted() end

--- Resets the states and outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:35
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:_executionStopped() end

--- Initializes the states and outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:26
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:init() end

--- If flow is active, compares the finished state with the previous state to emit finished only once and fills failed/failReason.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/deliveryFinished.lua:53
function flowgraph_nodes_gameplay_delivery_deliveryFinished_C:work() end


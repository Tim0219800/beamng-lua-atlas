---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_abandonDelivery_C
local flowgraph_nodes_gameplay_delivery_abandonDelivery_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:31
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:_executionStopped() end

--- Sets flow and success to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:26
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:init() end

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:onNodeReset() end

--- Resets flow and success to false.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:39
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:reset() end

--- If flow is active: calls teardown(keepVehicles) and signals success; logs an error if the delivery system is absent.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/abandonDelivery.lua:46
function flowgraph_nodes_gameplay_delivery_abandonDelivery_C:work() end


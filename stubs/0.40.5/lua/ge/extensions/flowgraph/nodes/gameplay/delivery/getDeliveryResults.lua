---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_getDeliveryResults_C
local flowgraph_nodes_gameplay_delivery_getDeliveryResults_C = {}

--- Resets results and isActive to nil/false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:34
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:_executionStarted() end

--- Resets results and isActive to nil/false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:29
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:_executionStopped() end

--- Resets results and isActive to nil/false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:24
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:init() end

--- Calls isActive() then getResults() of the freeformDelivery module if the delivery is active.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/getDeliveryResults.lua:39
function flowgraph_nodes_gameplay_delivery_getDeliveryResults_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_loadDelivery_C
local flowgraph_nodes_gameplay_delivery_loadDelivery_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:34
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:_executionStopped() end

--- Initializes the outputs and the duration state to 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:27
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:init() end

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:38
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:onNodeReset() end

--- Resets the outputs to false and the state to 'inactive'.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:42
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:reset() end

--- In the 'started' state, waits for isLoaded() then activates success, isLoaded and flow ('finished'); afterwards keeps flow.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:87
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:work() end

--- Resolves the path, calls freeformDelivery.load and switches to the 'started' state; logs errors.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/loadDelivery.lua:49
function flowgraph_nodes_gameplay_delivery_loadDelivery_C:workOnce() end


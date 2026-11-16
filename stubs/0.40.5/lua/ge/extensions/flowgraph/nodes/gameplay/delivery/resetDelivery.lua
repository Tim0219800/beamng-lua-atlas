---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_resetDelivery_C
local flowgraph_nodes_gameplay_delivery_resetDelivery_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:31
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:_executionStopped() end

--- Initializes the outputs and the duration state to 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:25
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:init() end

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:onNodeReset() end

--- Resets the outputs to false and the state to 'inactive'.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:39
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:reset() end

--- In the 'started' state, waits for the setup to finish then activates success and flow.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:71
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:work() end

--- Checks that a delivery exists, calls freeformDelivery.reset() and switches to 'started'; logs a warning or an error otherwise.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/resetDelivery.lua:45
function flowgraph_nodes_gameplay_delivery_resetDelivery_C:workOnce() end


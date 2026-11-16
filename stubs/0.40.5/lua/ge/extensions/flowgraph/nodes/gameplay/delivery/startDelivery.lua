---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_delivery_startDelivery_C
local flowgraph_nodes_gameplay_delivery_startDelivery_C = {}

--- Resets flow and success to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:35
function flowgraph_nodes_gameplay_delivery_startDelivery_C:_executionStarted() end

--- Resets flow and success to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:30
function flowgraph_nodes_gameplay_delivery_startDelivery_C:_executionStopped() end

--- Resets flow and success to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:25
function flowgraph_nodes_gameplay_delivery_startDelivery_C:init() end

--- If flow is active: checks isLoaded() and not isActive(), calls freeformDelivery.start() and fills success/flow; logs errors.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/delivery/startDelivery.lua:40
function flowgraph_nodes_gameplay_delivery_startDelivery_C:work() end


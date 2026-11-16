---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_onUpdate_C
local flowgraph_nodes_events_onUpdate_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:28
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_onUpdate_C:init(mgr, ...) end

--- Called when the project enters the state: enterState true, delta times at 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:44
function flowgraph_nodes_events_onUpdate_C:onStateStartedTrigger() end

--- Called when the project leaves the state: exitState true, delta times at 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:58
function flowgraph_nodes_events_onUpdate_C:onStateStoppedTrigger() end

--- Hook called every frame: sets flow to true, copies the delta times to mgr and the pins, triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:31
---@param dtReal number Real delta time (s)
---@param dtSim number Simulated delta time (s)
---@param dtRaw number Raw delta time (s)
function flowgraph_nodes_events_onUpdate_C:onUpdate(dtReal, dtSim, dtRaw) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onUpdate.lua:72
---@param args table Flowgraph arguments
function flowgraph_nodes_events_onUpdate_C:work(args) end


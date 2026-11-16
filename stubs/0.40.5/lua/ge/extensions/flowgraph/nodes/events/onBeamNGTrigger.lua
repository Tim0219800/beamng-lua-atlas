---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_onBeamNGTrigger_C
local flowgraph_nodes_events_onBeamNGTrigger_C = {}

--- Displays the active filter in the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:65
---@param builder any
---@param style any
function flowgraph_nodes_events_onBeamNGTrigger_C:drawMiddle(builder, style) end

--- Initializes data.filterName = "" and the flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:32
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_onBeamNGTrigger_C:init(mgr, ...) end

--- Hook called by the engine on each BeamNGTrigger event. Ignores the event if the name does not match the filter, fills the output pins, raises enterFlag/exitFlag and triggers the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:38
---@param data table Fields used: subjectID, subjectName, triggerID, triggerName, event ('enter' or 'exit')
function flowgraph_nodes_events_onBeamNGTrigger_C:onBeamNGTrigger(data) end

--- Copies enterFlag/exitFlag to the enter/exit pins then resets them to false.
---Source: lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:57
---@param args table Flowgraph arguments
function flowgraph_nodes_events_onBeamNGTrigger_C:work(args) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_controlsReset_C
local flowgraph_nodes_events_controlsReset_C = {}

--- Resets self.reset to false after triggering.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:43
function flowgraph_nodes_events_controlsReset_C:_afterTrigger() end

--- Resets self.reset to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:34
function flowgraph_nodes_events_controlsReset_C:_executionStarted() end

--- Resets self.reset to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:29
function flowgraph_nodes_events_controlsReset_C:_executionStopped() end

--- Node drawing in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_events_controlsReset_C:drawMiddle(builder, style) end

--- Initializes self.reset and data.blocksOnResetGameplay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:24
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_controlsReset_C:init(mgr, ...) end

--- Hook: adds to results the button {id='controlsReset', label='Reset', order=0, active}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:64
---@param results table List of buttons to complete
function flowgraph_nodes_events_controlsReset_C:onGatherGameContextUiButtons(results) end

--- Hook called by extensions.hook("onResetGameplay"): stores the press.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:39
function flowgraph_nodes_events_controlsReset_C:onResetGameplay() end

--- Sets flow and value to true one frame after a reset, otherwise to false.
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua:51
---@param args table Flowgraph arguments
function flowgraph_nodes_events_controlsReset_C:work(args) end


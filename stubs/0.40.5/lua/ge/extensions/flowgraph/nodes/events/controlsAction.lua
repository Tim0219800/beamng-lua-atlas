---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_controlsAction_C
local flowgraph_nodes_events_controlsAction_C = {}

--- Resets the state and calls pushActionMap("FlowgraphActions").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:36
function flowgraph_nodes_events_controlsAction_C:_executionStarted() end

--- Resets the state and calls popActionMap("FlowgraphActions").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:30
function flowgraph_nodes_events_controlsAction_C:_executionStopped() end

--- Node drawing in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_events_controlsAction_C:drawMiddle(builder, style) end

--- Initializes self.reset = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:26
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_controlsAction_C:init(mgr, ...) end

--- Hook called when the action is triggered: stores the frame number.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:42
function flowgraph_nodes_events_controlsAction_C:onControlsAction() end

--- Sets flow and value to true during the frame following the press, otherwise to false.
---Source: lua/ge/extensions/flowgraph/nodes/events/controlsAction.lua:53
---@param args table Flowgraph arguments
function flowgraph_nodes_events_controlsAction_C:work(args) end


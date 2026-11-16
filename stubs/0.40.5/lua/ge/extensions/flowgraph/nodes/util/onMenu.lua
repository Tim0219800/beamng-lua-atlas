---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/onMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_onMenu_C
local flowgraph_nodes_util_onMenu_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:29
function flowgraph_nodes_util_onMenu_C:_executionStarted() end

--- Resets the previous state to "none": the next frame will emit a pulse.
---Source: lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:25
function flowgraph_nodes_util_onMenu_C:reset() end

--- Computes the open/closed state and writes open, close, openOrClosed; emits the onOpened or onClosed pulse on state change, then resets them to false on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/onMenu.lua:33
function flowgraph_nodes_util_onMenu_C:work() end


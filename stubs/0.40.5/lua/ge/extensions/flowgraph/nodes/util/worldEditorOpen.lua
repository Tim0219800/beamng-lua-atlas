---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_worldEditorOpen_C
local flowgraph_nodes_util_worldEditorOpen_C = {}

--- Calls reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:29
function flowgraph_nodes_util_worldEditorOpen_C:_executionStarted() end

--- Resets the previous state to "none".
---Source: lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:25
function flowgraph_nodes_util_worldEditorOpen_C:reset() end

--- Writes open/close/openOrClosed according to editor.active and emits an onOpened or onClosed pulse when the state changes compared to the previous frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/worldEditorOpen.lua:33
function flowgraph_nodes_util_worldEditorOpen_C:work() end


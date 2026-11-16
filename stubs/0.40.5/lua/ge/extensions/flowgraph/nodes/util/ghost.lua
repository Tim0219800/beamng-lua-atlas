---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/ghost.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_ghost_C
local flowgraph_nodes_util_ghost_C = {}

--- Returns the original data (ghostData) as is so that the node is saved again identically.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/ghost.lua:34
function flowgraph_nodes_util_ghost_C:__onSerialize() end

--- Records the error, stores the original type, renames the node "[GHOST]<last word of the type>" and keeps nodeData in ghostData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/ghost.lua:38
---@param nodeData table Saved data of the original node.
function flowgraph_nodes_util_ghost_C:_onDeserialized(nodeData) end

--- Draws the original node type and a "Dump ghost data" button that prints ghostData to the console.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/ghost.lua:26
---@param builder table Editor node constructor.
---@param style table Node style.
function flowgraph_nodes_util_ghost_C:drawMiddle(builder, style) end

--- Initializes formerNodeType to "NOT GHOST".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/ghost.lua:18
function flowgraph_nodes_util_ghost_C:init() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/ghost.lua:22
function flowgraph_nodes_util_ghost_C:work() end


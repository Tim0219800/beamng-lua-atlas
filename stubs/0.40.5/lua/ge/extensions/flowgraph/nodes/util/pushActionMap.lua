---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_pushActionMap_C
local flowgraph_nodes_util_pushActionMap_C = {}

--- Removes the pushed action map (popActionMap) and forgets its name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:25
function flowgraph_nodes_util_pushActionMap_C:_executionStopped() end

--- Displays "<name> pushed." in the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:37
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_pushActionMap_C:drawMiddle(builder, style) end

--- Calls _executionStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:21
---@param mgr any
---@param ... any
function flowgraph_nodes_util_pushActionMap_C:init(mgr, ...) end

--- Stores the name and calls pushActionMap(name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/pushActionMap.lua:32
function flowgraph_nodes_util_pushActionMap_C:workOnce() end


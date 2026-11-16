---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/firstElement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_firstElement_C
local flowgraph_nodes_util_firstElement_C = {}

--- Sets oldPos to nil (field unused afterwards).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:23
function flowgraph_nodes_util_firstElement_C:_executionStarted() end

--- Returns table[1] of the input pin table (the argument is not used).
---Source: lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:27
---@param table table Ignored: the function rereads the input pin.
function flowgraph_nodes_util_firstElement_C:getFirstElement(table) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:20
---@param mgr any
function flowgraph_nodes_util_firstElement_C:init(mgr) end

--- Writes the first element to firstElement if the table is connected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/firstElement.lua:33
function flowgraph_nodes_util_firstElement_C:work() end


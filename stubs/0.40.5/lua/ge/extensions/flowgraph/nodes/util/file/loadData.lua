---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_file_loadData_C
local flowgraph_nodes_util_file_loadData_C = {}

--- Enables pin saving and custom output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua:33
---@param mgr any
function flowgraph_nodes_util_file_loadData_C:init(mgr) end

--- Forces the file to reload (modules.file:forceReload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua:48
function flowgraph_nodes_util_file_loadData_C:onNodeReset() end

--- For each output pin (except flow), reads the corresponding value from the file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/file/loadData.lua:38
function flowgraph_nodes_util_file_loadData_C:workOnce() end


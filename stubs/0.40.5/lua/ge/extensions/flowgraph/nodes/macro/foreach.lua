---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/foreach.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_macro_foreach_C
local flowgraph_nodes_macro_foreach_C = {}

--- If destroyTargetOnStop, stops and deletes the created managers; clears targets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:39
function flowgraph_nodes_macro_foreach_C:_executionStopped() end

--- data.destroyTargetOnStop=true, targets=nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:28
---@param mgr any
---@param ... any
function flowgraph_nodes_macro_foreach_C:init(mgr, ...) end

--- Restricts the elementFile pin to '.flow.json' files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:33
function flowgraph_nodes_macro_foreach_C:postInit() end

--- On the first flow, creates and starts one manager per element of the table; self.done prevents starting again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/foreach.lua:52
function flowgraph_nodes_macro_foreach_C:work() end


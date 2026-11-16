---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/io.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_macro_io_C
local flowgraph_nodes_macro_io_C = {}

--- Reads back name, color and ioType and allows custom pins in the right direction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:35
---@param nodeData any
function flowgraph_nodes_macro_io_C:_onDeserialized(nodeData) end

--- Saves name, color and ioType (error logged if ioType stayed 'io').
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:24
---@param res any
function flowgraph_nodes_macro_io_C:_onSerialize(res) end

--- Selects the target graph in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:71
function flowgraph_nodes_macro_io_C:doubleClicked() end

--- Displays the name of the target graph and a hover preview.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:47
---@param builder any
---@param style any
function flowgraph_nodes_macro_io_C:drawMiddle(builder, style) end

--- savePins=true, ioType='io' (must become 'in' or 'out'), ignoreAsRoot=true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:17
function flowgraph_nodes_macro_io_C:init() end

--- For an 'out' node: calls integratedNode:updatePins().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/io.lua:77
function flowgraph_nodes_macro_io_C:work() end


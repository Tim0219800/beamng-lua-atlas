---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/macro/integrated.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_macro_integrated_C
local flowgraph_nodes_macro_integrated_C = {}

--- Calls updatePins after each execution.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:190
function flowgraph_nodes_macro_integrated_C:_afterTrigger() end

--- Pushes the values of the hard-coded input pins to the 'in' I/O node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:195
function flowgraph_nodes_macro_integrated_C:_executionStarted() end

--- Resets these values to nil in the 'in' I/O node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:207
function flowgraph_nodes_macro_integrated_C:_executionStopped() end

--- Reads back name, color, graph type and target (macro instance created from macroPath if needed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:110
---@param nodeData any
function flowgraph_nodes_macro_integrated_C:_onDeserialized(nodeData) end

--- Saves name, graphType, targetID and color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:82
---@param res any
function flowgraph_nodes_macro_integrated_C:_onSerialize(res) end

--- Relinks the target graph via mgr.graphs[targetID + offset].
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:57
function flowgraph_nodes_macro_integrated_C:_postDeserialize() end

--- Selects the target graph in the editor (except from a macro graph).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:160
function flowgraph_nodes_macro_integrated_C:doubleClicked() end

--- Debug button 'Manually Refresh Pins'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:23
function flowgraph_nodes_macro_integrated_C:drawCustomProperties() end

--- Search icon with hover preview and watched variables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:130
---@param builder any
---@param style any
function flowgraph_nodes_macro_integrated_C:drawMiddle(builder, style) end

--- Recreates the input/output pins from the pin lists of the I/O nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:61
---@return table  list of input pins
---@return table  list of output pins
function flowgraph_nodes_macro_integrated_C:gatherPins() end

--- savePins=true and gray color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:19
function flowgraph_nodes_macro_integrated_C:init() end

--- Returns the represented graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:13
---@return table|nil  targetGraph
function flowgraph_nodes_macro_integrated_C:representsGraph() end

--- Binds the node to a graph: finds its macro/io 'in' and 'out' nodes, stores targetGraph/targetID and sets the name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:36
---@param graph table target graph
function flowgraph_nodes_macro_integrated_C:setTargetGraph(graph) end

--- Copies the values of the input pins to the 'in' I/O node and those of the 'out' I/O node to the output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:171
function flowgraph_nodes_macro_integrated_C:updatePins() end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/macro/integrated.lua:218
function flowgraph_nodes_macro_integrated_C:work() end


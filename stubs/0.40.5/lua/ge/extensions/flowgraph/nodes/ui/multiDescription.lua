---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_multiDescription_C
local flowgraph_nodes_ui_multiDescription_C = {}

--- Restores count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:69
---@param res table Node save table to fill.
function flowgraph_nodes_ui_multiDescription_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:65
---@param res table Node save table to fill.
function flowgraph_nodes_ui_multiDescription_C:_onSerialize(res) end

--- "Count" field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:29
function flowgraph_nodes_ui_multiDescription_C:drawCustomProperties() end

--- Displays self.data.pattern (first 10 characters) if defined.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:82
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_multiDescription_C:drawMiddle(builder, style) end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:21
function flowgraph_nodes_ui_multiDescription_C:init() end

--- Creates the initial pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:25
function flowgraph_nodes_ui_multiDescription_C:postInit() end

--- Adjusts the number of value_i pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:47
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_multiDescription_C:updatePins(old, new) end

--- Builds the list of input values and writes it to "value".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:75
function flowgraph_nodes_ui_multiDescription_C:work() end


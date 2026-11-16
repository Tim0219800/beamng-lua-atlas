---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/template.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_template_C
local flowgraph_nodes_util_template_C = {}

--- Called when the project starts, before any work.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:121
function flowgraph_nodes_util_template_C:_executionStarted() end

--- Called when the project stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:130
function flowgraph_nodes_util_template_C:_executionStopped() end

--- Called when the node must be cleaned up (before serialization, before start...); by default calls _executionStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:135
function flowgraph_nodes_util_template_C:_onClear() end

--- Restores the custom fields (self.data is restored automatically).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:189
---@param data table Saved data.
function flowgraph_nodes_util_template_C:_onDeserialized(data) end

--- Saves the custom fields in res (self.data is saved automatically).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:182
---@param res table Save table.
function flowgraph_nodes_util_template_C:_onSerialize(res) end

--- Called when the node is deleted.
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:195
function flowgraph_nodes_util_template_C:destroy() end

--- Imgui code displayed in the properties window (text field and slider); returning a string creates a history point (undo/redo).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:148
function flowgraph_nodes_util_template_C:drawCustomProperties() end

--- Imgui code displayed in the node; must start with builder:Middle().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:166
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_template_C:drawMiddle(builder, style) end

--- Called when the properties are no longer displayed.
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:160
function flowgraph_nodes_util_template_C:hideProperties() end

--- Called when the node is first created; initializes myField, the data table and the sliderWidth cursor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:109
---@param mgr table Flowgraph manager.
function flowgraph_nodes_util_template_C:init(mgr) end

--- Called when the node's properties are displayed.
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:141
function flowgraph_nodes_util_template_C:showProperties() end

--- Called when the node must run its function.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/template.lua:125
function flowgraph_nodes_util_template_C:work() end


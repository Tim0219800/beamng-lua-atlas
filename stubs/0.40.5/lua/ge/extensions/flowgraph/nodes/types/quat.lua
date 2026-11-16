---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/quat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_types_quat_C
local flowgraph_nodes_types_quat_C = {}

--- Restores nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/quat.lua:41
---@param nodeData any saved data
function flowgraph_nodes_types_quat_C:_onDeserialized(nodeData) end

--- Saves nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/quat.lua:38
---@param res any save table
function flowgraph_nodes_types_quat_C:_onSerialize(res) end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/quat.lua:30
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_types_quat_C:drawMiddle(builder, style) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/quat.lua:35
function flowgraph_nodes_types_quat_C:drawProperties() end

--- Composes the quaternion and writes the table.
---Source: lua/ge/extensions/flowgraph/nodes/types/quat.lua:24
function flowgraph_nodes_types_quat_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/vec3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_types_vec3_C
local flowgraph_nodes_types_vec3_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/vec3.lua:48
---@param nodeData table Saved node data.
function flowgraph_nodes_types_vec3_C:_onDeserialized(nodeData) end

--- Empty (nothing to save).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/vec3.lua:45
---@param res table Node save table to fill.
function flowgraph_nodes_types_vec3_C:_onSerialize(res) end

--- Displays the vector text (x,y,z) at the center of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/vec3.lua:37
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_types_vec3_C:drawMiddle(builder, style) end

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/vec3.lua:42
function flowgraph_nodes_types_vec3_C:drawProperties() end

--- Computes the output: direction (0,1,0) rotated by 'rot' if present, otherwise {x,y,z}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/vec3.lua:26
function flowgraph_nodes_types_vec3_C:work() end


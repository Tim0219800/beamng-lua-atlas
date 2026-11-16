---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/transform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_types_transform_C
local flowgraph_nodes_types_transform_C = {}

--- Forces the outputs to be rewritten at start (changed = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:317
function flowgraph_nodes_types_transform_C:_executionStarted() end

--- Forces the outputs to be rewritten at the next start (changed = true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:341
function flowgraph_nodes_types_transform_C:_executionStopped() end

--- Restores the node's state from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:459
---@param nodeData table Saved node data.
function flowgraph_nodes_types_transform_C:_onDeserialized(nodeData) end

--- Writes the node's state to the save table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:448
---@param res table Node save table to fill.
function flowgraph_nodes_types_transform_C:_onSerialize(res) end

--- Draws a solid box (triangles) and its black edges from a corner and three edge vectors.
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:392
---@param corner vec3 Starting corner of the box.
---@param x vec3 First edge vector.
---@param y vec3 Second edge vector.
---@param z vec3 Third edge vector.
---@param clr color Color of the faces.
function flowgraph_nodes_types_transform_C:drawAxisBox(corner, x, y, z, clr) end

--- Draws the gizmo mode controls: display mode, position, rotation (euler in degrees or quaternion), scale, color, buttons "Copy from selection", "Position in front of camera / at camera", "Rotation at camera", "Drop to terrain".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:166
function flowgraph_nodes_types_transform_C:drawCustom() end

--- Mode combo (gizmo/fromID) — adds or removes the objID pin — then drawCustom in gizmo mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:123
function flowgraph_nodes_types_transform_C:drawCustomProperties() end

--- Draws the colored X/Y/Z axes (spheres and lines) and the preview volume according to displayMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:346
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_types_transform_C:drawMiddle(builder, style) end

--- Start of a gizmo drag: stores the original rotation, scale and position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:42
function flowgraph_nodes_types_transform_C:gizmoBeginDrag() end

--- During the gizmo drag: updates position (translation), rotation (rotation, in local frame or relative to the start) or scale (component by component) depending on the gizmo mode, and draws the axes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:48
function flowgraph_nodes_types_transform_C:gizmoDragging() end

--- End of a gizmo drag (called by editor.updateAxisGizmo); updates the node's state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:79
function flowgraph_nodes_types_transform_C:gizmoEndDrag() end

--- Called when the node is deselected: removes the gizmo and goes back to the objectSelect edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:113
function flowgraph_nodes_types_transform_C:hideProperties() end

--- Sets the position 15 m in front of the camera, identity rotation, scale (1,1,1), semi-transparent red marker color, mode 'gizmo' and displayMode 'halfBox'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:24
function flowgraph_nodes_types_transform_C:init() end

--- Called when the node is selected in the editor: plugs in the 'flowgraphTransform' edit mode with the World Editor axis gizmo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:85
function flowgraph_nodes_types_transform_C:showProperties() end

--- Synchronizes the gizmo matrix with the node's position and rotation (rotation ignored if the gizmo is in world alignment).
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:153
function flowgraph_nodes_types_transform_C:updateTransform() end

--- In fromID mode, copies position/rotation/scale from the object objID; if 'changed', writes the three output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/types/transform.lua:321
function flowgraph_nodes_types_transform_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared axis gizmo handling for the editor's spline editing tools. Places the gizmo on the selected node (or on a display anchor position), moves the node in translation (or all nodes in rigid mode), rotates the normals around the local tangent, and records the drag in the undo history.
--- Access: extension `editor_toolUtilities_gizmo`: `extensions.load("editor_toolUtilities_gizmo")`, then the global `editor_toolUtilities_gizmo`
---@class editor_toolUtilities_gizmo
editor_toolUtilities_gizmo = {}

--- To be called every frame: positions, updates and draws the gizmo on the selected node of a spline, and configures the axis locks. During a drag, the node follows the cursor; releasing commits the 'Gizmo Drag' action in the history.
---Source: lua/ge/extensions/editor/toolUtilities/gizmo.lua:112
---@param isRotEnabledIn boolean Enables rotation (tangent axis).
---@param selectedSplineIdx integer Index of the selected spline.
---@param selectedNodeIdx integer Index of the selected node.
---@param splinesIn table[] List of splines (each with nodes, nmls, isDirty).
---@param isConformToTerrainIn boolean Terrain-conforming spline (Z not free on the gizmo).
---@param isRigidIn boolean Rigid translation/rotation applied to all nodes.
---@param deepCopyFunctIn function Deep copy of a spline's state, for the history.
---@param undoFunctIn function Undo callback.
---@param redoFunctIn function Redo callback.
---@param commitHistoryOverrideIn function|nil Replaces editor.history:commitAction to group the drag into a larger action.
---@param anchorPosIn vec3|nil Display position of the gizmo instead of the node; nil = on the node.
function editor_toolUtilities_gizmo.handleGizmo(isRotEnabledIn, selectedSplineIdx, selectedNodeIdx, splinesIn, isConformToTerrainIn, isRigidIn, deepCopyFunctIn, undoFunctIn, redoFunctIn, commitHistoryOverrideIn, anchorPosIn) end

--- True while a gizmo drag (translation or rotation) is in progress; allows heavy rebuilds to be deferred.
---Source: lua/ge/extensions/editor/toolUtilities/gizmo.lua:170
---@return boolean  Drag state.
function editor_toolUtilities_gizmo.isDragging() end


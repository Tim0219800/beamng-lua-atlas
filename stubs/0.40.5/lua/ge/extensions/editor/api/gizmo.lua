---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_gizmo` : `extensions.load("editor_api_gizmo")`, puis la globale `editor_api_gizmo`
---@class editor_api_gizmo
editor_api_gizmo = {}

---Source : lua/ge/extensions/editor/api/gizmo.lua:533
---@param editorInstance any
function editor_api_gizmo.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/gizmo.lua
---@class editor_api_gizmo_editor
local editor_api_gizmo_editor = {}

--- Call this once when starting to drag the gizmo
---Source : lua/ge/extensions/editor/api/gizmo.lua:96
---@param objectTransforms any
---@param objectBBs any
---@param objectHeights any
---@param objects any
function editor_api_gizmo_editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects) end

---Source : lua/ge/extensions/editor/api/gizmo.lua:349
function editor_api_gizmo_editor.cancelAxisGizmoInteraction() end

--- Draw the axis gizmo with its current transform and mode.
---Source : lua/ge/extensions/editor/api/gizmo.lua:364
function editor_api_gizmo_editor.drawAxisGizmo() end

---Source : lua/ge/extensions/editor/api/gizmo.lua:14
function editor_api_gizmo_editor.drawObjectIcons() end

--- Return the axis gizmo alignment.
---  @see setAxisGizmoAlignment
---Source : lua/ge/extensions/editor/api/gizmo.lua:423
function editor_api_gizmo_editor.getAxisGizmoAlignment() end

--- Return the axis gizmo mode.
---  @see setAxisGizmoMode
---Source : lua/ge/extensions/editor/api/gizmo.lua:417
function editor_api_gizmo_editor.getAxisGizmoMode() end

--- Return the axis gizmo current scale as a Point3F object.
---Source : lua/ge/extensions/editor/api/gizmo.lua:54
function editor_api_gizmo_editor.getAxisGizmoScale() end

--- Return the axis gizmo selected element (axis or plane).
---Source : lua/ge/extensions/editor/api/gizmo.lua:433
function editor_api_gizmo_editor.getAxisGizmoSelectedElement() end

--- Return the axis gizmo current matrix transform as a MatrixF object.
---Source : lua/ge/extensions/editor/api/gizmo.lua:49
function editor_api_gizmo_editor.getAxisGizmoTransform() end

--- Returns the new transforms every frame when dragging the gizmo after "beginGizmoTranslate" was called once
---  TODO Why do we not have that function for rotation as well?
---Source : lua/ge/extensions/editor/api/gizmo.lua:170
---@param objects any
---@param objectHeights any
function editor_api_gizmo_editor.getTransformsGizmoTranslate(objects, objectHeights) end

--- Return true if the axis gizmo has any hovered elements (axes).
---Source : lua/ge/extensions/editor/api/gizmo.lua:428
function editor_api_gizmo_editor.isAxisGizmoHovered() end

--- Modify the distance of the object icons fading by a delta value
---Source : lua/ge/extensions/editor/api/gizmo.lua:499
---@param deltaValue any
function editor_api_gizmo_editor.modifyFadeIconsDistance(deltaValue) end

--- Set the current axis gizmo alignment. Usually called when the edit mode is activated.
---  @param alignment the alignment of the axis gizmo to be set:
---   *editor.AxisGizmoAlignment_World* the gizmo is aligned with the world axes
---   *editor.AxisGizmoAlignment_Local* the gizmo is aligned with the local axes of the gizmo transform
---Source : lua/ge/extensions/editor/api/gizmo.lua:385
---@param alignment any
function editor_api_gizmo_editor.setAxisGizmoAlignment(alignment) end

--- Set the current axis gizmo mode. Usually called when the edit mode is activated.
---  @param mode the mode of the axis gizmo to be set:
---   *editor.AxisGizmoMode_Translate*
---   *editor.AxisGizmoMode_Rotate*
---   *editor.AxisGizmoMode_Scale*
---Source : lua/ge/extensions/editor/api/gizmo.lua:376
---@param mode any
function editor_api_gizmo_editor.setAxisGizmoMode(mode) end

--- Set the lock on rotation on certain axes
---  @param x true to allow rotation on X axis
---  @param y true to allow rotation on Y axis
---  @param z true to allow rotation on Z axis
---Source : lua/ge/extensions/editor/api/gizmo.lua:403
---@param x any
---@param y any
---@param z any
function editor_api_gizmo_editor.setAxisGizmoRotateLock(x, y, z) end

--- Set the axis gizmo rotation snapping parameters.
---  @param enabled true to enable snapping
---  @param gridSize a float specifying the angle step for snapping
---Source : lua/ge/extensions/editor/api/gizmo.lua:447
---@param enabled any
---@param rotationSnap any
function editor_api_gizmo_editor.setAxisGizmoRotateSnap(enabled, rotationSnap) end

--- Set the lock on scaling on certain axes
---  @param x true to allow scaling on X axis
---  @param y true to allow scaling on Y axis
---  @param z true to allow scaling on Z axis
---Source : lua/ge/extensions/editor/api/gizmo.lua:411
---@param x any
---@param y any
---@param z any
function editor_api_gizmo_editor.setAxisGizmoScaleLock(x, y, z) end

--- Set the axis gizmo scale snapping parameters.
---  @param enabled true to enable snapping
---  @param gridSize a float specifying the scale step for snapping
---Source : lua/ge/extensions/editor/api/gizmo.lua:454
---@param enabled any
---@param scaleSnap any
function editor_api_gizmo_editor.setAxisGizmoScaleSnap(enabled, scaleSnap) end

--- Set the axis gizmo's transform, used for custom editing of object parts or other visual handles.
---  @param matrix (MatrixF) the world transform matrix of the gizmo
---  @param scale (Point3F) of the gizmo, so to avoid non uniform scale decomposition problems
---Source : lua/ge/extensions/editor/api/gizmo.lua:44
---@param matrix any
---@param scale any
function editor_api_gizmo_editor.setAxisGizmoTransform(matrix, scale) end

--- Set the lock on translation on certain axes
---  @param x true to allow translation on X axis
---  @param y true to allow translation on Y axis
---  @param z true to allow translation on Z axis
---Source : lua/ge/extensions/editor/api/gizmo.lua:395
---@param x any
---@param y any
---@param z any
function editor_api_gizmo_editor.setAxisGizmoTranslateLock(x, y, z) end

--- Set the axis gizmo translation snapping parameters.
---  @param enabled true to enable snapping
---  @param gridSize a float specifying the grid cell size for snapping
---Source : lua/ge/extensions/editor/api/gizmo.lua:440
---@param enabled any
---@param gridSize any
function editor_api_gizmo_editor.setAxisGizmoTranslateSnap(enabled, gridSize) end

--- Switches between local and world gizmo axes alignment
---Source : lua/ge/extensions/editor/api/gizmo.lua:459
function editor_api_gizmo_editor.toggleAxisGizmoAlignment() end

--- Toggle draw gizmo plane
---Source : lua/ge/extensions/editor/api/gizmo.lua:468
function editor_api_gizmo_editor.toggleDrawGizmoPlane() end

--- Toggle draw object icons in the world scene view
---Source : lua/ge/extensions/editor/api/gizmo.lua:482
function editor_api_gizmo_editor.toggleDrawObjectIcons() end

--- Toggle draw object name text in the world scene view
---Source : lua/ge/extensions/editor/api/gizmo.lua:488
function editor_api_gizmo_editor.toggleDrawObjectText() end

--- Toggle selection highlight on the selected meshes
---Source : lua/ge/extensions/editor/api/gizmo.lua:494
function editor_api_gizmo_editor.toggleSelectionHighlight() end

--- Toggle enable snapping for rotate and translate
---Source : lua/ge/extensions/editor/api/gizmo.lua:513
---@param value any
function editor_api_gizmo_editor.toggleSnapping(value) end

--- Updates the axis gizmo internals, checking mouse manipulation events and so on.
---  Only call this together with "editor.drawAxisGizmo"
---  @param onStartGizmoDragFunc this function is called when the gizmo axes/handles are starting to being dragged (no args)
---  @param onEndGizmoDragFunc this function is called when the gizmo axes/handles ended being dragged (no args)
---  @param onGizmoDraggingFunc this function is called when the gizmo axes/handles are currently being dragged (no args)
---Source : lua/ge/extensions/editor/api/gizmo.lua:289
---@param onStartGizmoDragFunc any
---@param onEndGizmoDragFunc any
---@param onGizmoDraggingFunc any
function editor_api_gizmo_editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc) end

---Source : lua/ge/extensions/editor/api/gizmo.lua:24
function editor_api_gizmo_editor.updateObjectIcons() end


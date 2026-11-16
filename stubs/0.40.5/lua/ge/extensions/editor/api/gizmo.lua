---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for the 3D axis gizmo (move / rotate / scale) and for object icons in the world view. It wraps `worldEditorCppApi`: mode and alignment selection, per-axis locks, translation/rotation/scale snapping, mouse hover/drag detection, and computation of object transforms during a move with terrain snapping (raycast or core_terrain). `initialize` installs everything on the `editor` object and defines the `editor.AxisGizmoMode_*` and `editor.AxisGizmoAlignment_*` constants.
--- Access: extension `editor_api_gizmo`: `extensions.load("editor_api_gizmo")`, then the global `editor_api_gizmo`
---@class editor_api_gizmo
editor_api_gizmo = {}

--- Remembers the editor, defines the axis/mode/alignment constants and installs all the gizmo/icon functions on `editor`.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/gizmo.lua:533
---@param editorInstance table `editor` object
function editor_api_gizmo.initialize(editorInstance) end

--- Functions added to `editor` by initialize.
---@class editor_api_gizmo_editor
local editor_api_gizmo_editor = {}

--- To be called once at the start of the drag: remembers the starting transforms and, if terrain snapping is enabled, the ground offsets, normals and bounding boxes (object collision temporarily disabled for the raycast).
---Source: lua/ge/extensions/editor/api/gizmo.lua:96
---@param objectTransforms MatrixF[] initial object transforms
---@param objectBBs Box3F[] object bounding boxes
---@param objectHeights number[] starting raycast height per object
---@param objects table[] objects (for disableCollision/enableCollision)
function editor_api_gizmo_editor.beginGizmoTranslate(objectTransforms, objectBBs, objectHeights, objects) end

--- Cancels an ongoing interaction: virtually releases the mouse, restores the simulation pause and deselects the gizmo element.
---Source: lua/ge/extensions/editor/api/gizmo.lua:349
function editor_api_gizmo_editor.cancelAxisGizmoInteraction() end

--- Draws the gizmo with its current transform and mode (if the editor camera exists).
---Source: lua/ge/extensions/editor/api/gizmo.lua:364
function editor_api_gizmo_editor.drawAxisGizmo() end

--- Draws the closest objects' icons if the camera exists and editor.hideObjectIcons is not true.
---Source: lua/ge/extensions/editor/api/gizmo.lua:14
function editor_api_gizmo_editor.drawObjectIcons() end

--- Returns the current gizmo alignment.
---Source: lua/ge/extensions/editor/api/gizmo.lua:423
---@return integer  alignment
function editor_api_gizmo_editor.getAxisGizmoAlignment() end

--- Returns the current gizmo mode.
---Source: lua/ge/extensions/editor/api/gizmo.lua:417
---@return integer  mode
function editor_api_gizmo_editor.getAxisGizmoMode() end

--- Returns the current gizmo scale.
---Source: lua/ge/extensions/editor/api/gizmo.lua:54
---@return Point3F  scale
function editor_api_gizmo_editor.getAxisGizmoScale() end

--- Returns the selected gizmo element (axis or plane).
---Source: lua/ge/extensions/editor/api/gizmo.lua:433
---@return integer  element index, -1 if none
function editor_api_gizmo_editor.getAxisGizmoSelectedElement() end

--- Returns the current gizmo transform.
---Source: lua/ge/extensions/editor/api/gizmo.lua:49
---@return MatrixF  transform
function editor_api_gizmo_editor.getAxisGizmoTransform() end

--- To be called every frame of the drag after beginGizmoTranslate: returns the new object transforms (gizmo translation, with terrain snapping and relative rotation according to the preferences). Returns {} if beginGizmoTranslate was not called.
---Source: lua/ge/extensions/editor/api/gizmo.lua:170
---@param objects table[] moved objects
---@param objectHeights number[] starting raycast height per object
---@return MatrixF[]  updated transforms
function editor_api_gizmo_editor.getTransformsGizmoTranslate(objects, objectHeights) end

--- Returns whether a gizmo element (axis or plane) is hovered/selected.
---Source: lua/ge/extensions/editor/api/gizmo.lua:428
---@return boolean  true if the selected element is not -1
function editor_api_gizmo_editor.isAxisGizmoHovered() end

--- Adjusts the object icons fade distance (preference gizmos.objectIcons.fadeIconsDistance += delta x fadeIconsDistanceModifySpeed, clamped to 1..50000) and shows a notification.
---Source: lua/ge/extensions/editor/api/gizmo.lua:499
---@param deltaValue number change (0 = nothing; no effect if editor.disableModifyFadeIconsDistance)
function editor_api_gizmo_editor.modifyFadeIconsDistance(deltaValue) end

--- Sets the gizmo alignment and emits onEditorAxisGizmoAligmentChanged.
---Source: lua/ge/extensions/editor/api/gizmo.lua:385
---@param alignment integer editor.AxisGizmoAlignment_World (0) or _Local (1)
function editor_api_gizmo_editor.setAxisGizmoAlignment(alignment) end

--- Sets the gizmo mode and emits onEditorAxisGizmoModeChanged(mode).
---Source: lua/ge/extensions/editor/api/gizmo.lua:376
---@param mode integer editor.AxisGizmoMode_Translate (1), _Rotate (2) or _Scale (3)
function editor_api_gizmo_editor.setAxisGizmoMode(mode) end

--- Allows or not rotation per axis.
---Source: lua/ge/extensions/editor/api/gizmo.lua:403
---@param x boolean X axis
---@param y boolean Y axis
---@param z boolean Z axis
function editor_api_gizmo_editor.setAxisGizmoRotateLock(x, y, z) end

--- Sets rotation snapping.
---Source: lua/ge/extensions/editor/api/gizmo.lua:447
---@param enabled boolean enable
---@param rotationSnap number angle step
function editor_api_gizmo_editor.setAxisGizmoRotateSnap(enabled, rotationSnap) end

--- Allows or not scaling per axis.
---Source: lua/ge/extensions/editor/api/gizmo.lua:411
---@param x boolean X axis
---@param y boolean Y axis
---@param z boolean Z axis
function editor_api_gizmo_editor.setAxisGizmoScaleLock(x, y, z) end

--- Sets scale snapping.
---Source: lua/ge/extensions/editor/api/gizmo.lua:454
---@param enabled boolean enable
---@param scaleSnap number scale step
function editor_api_gizmo_editor.setAxisGizmoScaleSnap(enabled, scaleSnap) end

--- Places the gizmo in the world (to edit object parts or custom handles).
---Source: lua/ge/extensions/editor/api/gizmo.lua:44
---@param matrix MatrixF world transform of the gizmo
---@param scale vec3|nil gizmo scale (default vec3(1,1,1)), avoids non-uniform scale decomposition problems
function editor_api_gizmo_editor.setAxisGizmoTransform(matrix, scale) end

--- Allows or not translation per axis.
---Source: lua/ge/extensions/editor/api/gizmo.lua:395
---@param x boolean X axis
---@param y boolean Y axis
---@param z boolean Z axis
function editor_api_gizmo_editor.setAxisGizmoTranslateLock(x, y, z) end

--- Sets translation snapping.
---Source: lua/ge/extensions/editor/api/gizmo.lua:440
---@param enabled boolean enable
---@param gridSize number grid cell size
function editor_api_gizmo_editor.setAxisGizmoTranslateSnap(enabled, gridSize) end

--- Toggles between world and local alignment.
---Source: lua/ge/extensions/editor/api/gizmo.lua:459
function editor_api_gizmo_editor.toggleAxisGizmoAlignment() end

--- Toggles the gizmos.general.drawGizmoPlane preference and enables/disables the gizmo's plane, hatching and move grid.
---Source: lua/ge/extensions/editor/api/gizmo.lua:468
function editor_api_gizmo_editor.toggleDrawGizmoPlane() end

--- Toggles the gizmos.general.drawObjectIcons preference and applies it to C++.
---Source: lua/ge/extensions/editor/api/gizmo.lua:482
function editor_api_gizmo_editor.toggleDrawObjectIcons() end

--- Toggles the gizmos.general.drawObjectText preference (display of object names) and applies it to C++.
---Source: lua/ge/extensions/editor/api/gizmo.lua:488
function editor_api_gizmo_editor.toggleDrawObjectText() end

--- Toggles the gizmos.general.highlightSelectedMeshes preference.
---Source: lua/ge/extensions/editor/api/gizmo.lua:494
function editor_api_gizmo_editor.toggleSelectionHighlight() end

--- Enables/disables rotation and translation snapping according to the snapping.general.* preferences (rotateSnapSize, gridSize), unless the corresponding rotateSnapEnabled / snapToGrid preference is already true.
---Source: lua/ge/extensions/editor/api/gizmo.lua:513
---@param value integer 0 = disable, 1 = enable (other values ignored)
function editor_api_gizmo_editor.toggleSnapping(value) end

--- Handles the gizmo's mouse events (start, drag, end, hover), relays keyboard modifiers to C++ and emits onEditorAxisGizmoAligmentChanged if the alignment changed on the C++ side. To be called together with drawAxisGizmo.
---Source: lua/ge/extensions/editor/api/gizmo.lua:289
---@param onStartGizmoDragFunc function|nil called at the start of the drag (no arguments)
---@param onEndGizmoDragFunc function|nil called at the end if the gizmo was dragged (no arguments)
---@param onGizmoDraggingFunc function|nil called every drag frame (no arguments)
function editor_api_gizmo_editor.updateAxisGizmo(onStartGizmoDragFunc, onEndGizmoDragFunc, onGizmoDraggingFunc) end

--- Updates editor.objectIconHitId (object icon under the mouse, 0 if icons are hidden or the gizmos.general.drawObjectIcons preference == false) and editor.objectIconHoverId (only if no mouse button is pressed and the UI does not capture the mouse). To be called every frame.
---Source: lua/ge/extensions/editor/api/gizmo.lua:24
function editor_api_gizmo_editor.updateObjectIcons() end


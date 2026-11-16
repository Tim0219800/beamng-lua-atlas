---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/transformUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the module constructor. Notable public fields: pos (vec3), rot (quat), scl (vec3|number), allowTranslate/allowRotate/allowScale (booleans), oneDimensionalScale, showWidgets, showGizmo, widgetSettings.width, switchRotationForMouse, isDragging.
---@class editor_util_transformUtil
local editor_util_transformUtil = {}

--- Start of the gizmo drag: remembers the starting pos/rot/scl.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:674
function editor_util_transformUtil:beginDrag() end

--- Draws the combined interface (gizmo, help buttons, fields) in the available width.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:418
---@return boolean  true if the transform changed.
function editor_util_transformUtil:combinedWidget() end

--- Draws the help context menu (position/rotation to camera, camera to position, etc.).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:366
---@return boolean  true if an action modified the transform.
function editor_util_transformUtil:contextMenu() end

--- Tells whether the editor's active edit mode is that of this helper.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:742
---@return boolean  true if active.
function editor_util_transformUtil:correctEditMode() end

--- During the drag: updates pos, rot or scl according to the gizmo mode (translation, rotation, scale) and draws the axes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:681
function editor_util_transformUtil:dragging() end

--- Activates this helper's edit mode, with a delay of a few frames before processing clicks.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:306
---@param cooldown integer|nil Number of frames to wait (1 by default).
function editor_util_transformUtil:enableEditing(cooldown) end

--- End of the gizmo drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:732
function editor_util_transformUtil:endDragging() end

--- Returns the list of help buttons compatible with allowTranslate/allowRotate (stops at the first incompatible one).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:547
---@return table  List of button definitions.
function editor_util_transformUtil:getValidButtons() end

--- Draws the 'Edit <object>' / 'Exit Editing' button, the axis gizmo in edit mode, and the '...' menu.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:559
---@return boolean  true if the gizmo or the menu modified the transform.
function editor_util_transformUtil:gizmo() end

--- Aligns the up axis to the smoothed terrain normal while keeping the projected forward direction (no effect without terrain).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:355
function editor_util_transformUtil:helperAlignWithTerrain() end

--- Switches to the free camera and moves the camera to the position, keeping its orientation.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:329
function editor_util_transformUtil:helperCameraToPosition() end

--- Switches to the free camera and applies position and rotation to the camera.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:343
function editor_util_transformUtil:helperCameraToPositionRotation() end

--- Switches to the free camera and applies the rotation to the camera, keeping its position.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:336
function editor_util_transformUtil:helperCameraToRotation() end

--- Centers the editor view on the position (editor.fitViewToSelectionSmooth).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:313
function editor_util_transformUtil:helperFocus() end

--- Teleports the player vehicle (spawn.safeTeleport) to the position/rotation.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:349
function editor_util_transformUtil:helperMoveToTransform() end

--- Sets the position to the terrain height (no effect if there is no terrain).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:322
function editor_util_transformUtil:helperPositionDownToTerrain() end

--- Places the position 15 m in front of the camera.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:319
function editor_util_transformUtil:helperPositionInFrontOfToCamera() end

--- Sets the position to the camera's.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:316
function editor_util_transformUtil:helperPositionToCamera() end

--- Copies the camera rotation (identical to helperRotationToCamera; the button tooltip says 'face away from the camera').
---Source: lua/ge/extensions/editor/util/transformUtil.lua:361
function editor_util_transformUtil:helperRotateWithCamera() end

--- Copies the camera rotation.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:326
function editor_util_transformUtil:helperRotationToCamera() end

--- Constructor: creates the state (pos 0, identity rot, scl 1), the imgui fields and registers the editor edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:68
---@param editName string Name of the edit mode (a unique id is appended).
---@param objectName string|nil Label of the object in the UI, 'Object' by default.
function editor_util_transformUtil:init(editName, objectName) end

--- Edit mode callback: clears the object selection and resets via set().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:747
function editor_util_transformUtil:onActivate() end

--- Edit mode callback: clears the object selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/transformUtil.lua:751
function editor_util_transformUtil:onDeactivate() end

--- Clears the drag start values (manual call).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:737
function editor_util_transformUtil:resetDragging() end

--- Sets position, rotation and scale; nil arguments are ignored. Updates the gizmo transform and the input fields.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:146
---@param pos vec3|nil New position.
---@param rot quat|nil New rotation.
---@param scl vec3|number|nil New scale (converted according to oneDimensionalScale).
function editor_util_transformUtil:set(pos, rot, scl) end

--- Switches between scalar scale and vec3 scale and recreates the corresponding input field.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:116
---@param ods boolean true for a single-value scale.
function editor_util_transformUtil:setOneDimensionalScale(ods) end

--- Handles the Quick Edit (Shift + mouse): sets the position at the targeted point and orients the object according to the drag.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:201
---@param mouseInfo table Editor mouse info (rayCast, down, hold, up, valid).
---@return boolean|nil  true if an edit took place during the hold.
function editor_util_transformUtil:shiftUpdate(mouseInfo) end

--- Enters this helper's edit mode if not already in it.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:131
function editor_util_transformUtil:start() end

--- Exits the edit mode (editor.selectEditMode(nil)) if it is active.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:138
function editor_util_transformUtil:stop() end

--- To be called every frame: handles clicks, help messages and the Quick Edit when the edit mode is active, then draws the widgets (combinedWidget).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:254
---@param mouseInfo table|nil Editor mouse info.
---@return boolean  true if the transform changed.
function editor_util_transformUtil:update(mouseInfo) end

--- Copies pos, rot and scl into the imgui arrays (inputPos, inputRot, inputScl).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:182
function editor_util_transformUtil:updateInputFields() end

--- Recomputes the gizmo matrix from pos/rot (local or world orientation depending on the gizmo alignment) and applies it if this edit mode is active.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:164
function editor_util_transformUtil:updateTransform() end

--- Draws the Position, Rotation (quaternion) and Scale input fields according to the permissions.
---Source: lua/ge/extensions/editor/util/transformUtil.lua:597
---@return boolean  true if a value was modified.
function editor_util_transformUtil:widget() end

--- Compact version of widget() (labels Pos, Rot, Scl).
---Source: lua/ge/extensions/editor/util/transformUtil.lua:635
---@return boolean  true if a value was modified.
function editor_util_transformUtil:widgetCondensed() end


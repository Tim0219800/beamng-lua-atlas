---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main edit mode of the World Editor, "Manipulate Object(s)" (editor.editModes.objectSelect, pencil icon). It handles object selection (click, rectangle, hover), the axis gizmo (move, rotate, scale, local/world alignment, snapping, Shift drag-duplicate, surface alignment with Ctrl+Alt), the drawn bounding boxes (orange, red if locked; for a vehicle, the sphere and axes of the reference node), copy/paste/duplicate/delete with undo (editor.history), as well as the registration of the "gizmos" (general, brush, object icons) and "snapping" (general, terrain, grid) preferences. It also adds "Move Selection At Camera" and "Align Objects Individually To The Grid" to the scene tree menu. At initialization it registers functions on the global editor table (see class "editor").
--- Access: extension `editor_objectTool`: `extensions.load("editor_objectTool")`, then the global `editor_objectTool`
---@class editor_objectTool
editor_objectTool = {}

--- Hook called when the gizmo alignment changes (name with a typo in the game: "Aligment"). If the current edit mode is "Manipulate Object(s)", repositions the gizmo on the selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1134
function editor_objectTool.onEditorAxisGizmoAligmentChanged() end

--- Hook called when an edit mode is activated: restores the gizmo state (editMode.axisGizmoRestoreState) remembered at its last deactivation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1503
---@param editMode table Edit mode activated.
function editor_objectTool.onEditorEditModeActivated(editMode) end

--- Hook called when an edit mode is deactivated: remembers the gizmo state in editMode.axisGizmoRestoreState.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1520
---@param editMode table Edit mode deactivated.
function editor_objectTool.onEditorEditModeDeactivated(editMode) end

--- Hook called at editor initialization: creates editor.editModes.objectSelect (action map ObjectTool, shortcuts for copy, paste, duplicate, delete), registers the API on editor, applies the default local alignment if the preference is active and adds two entries to the scene tree context menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1427
function editor_objectTool.onEditorInitialized() end

--- Hook called when an inspector field is modified. Only handles the startTime field of a TimeOfDay.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1489
---@param selectedIds integer[] Ids of the selected objects; only the first is examined.
---@param fieldName string Name of the modified field.
---@param fieldValue any New value (unused).
---@param arrayIndex integer|nil Index in an array field (unused).
function editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook called when a preference changes: forwards the gizmos.* settings (object icons, colors, scales, fine snapping, etc.) to worldEditorCppApi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1258
---@param path string Preference path, e.g. "gizmos.general.drawObjectIcons".
---@param value any New value.
function editor_objectTool.onEditorPreferenceValueChanged(path, value) end

--- Preferences registration hook: creates the gizmos and snapping categories and their preferences (selection highlight, object icons, colors, gizmo sizes, grid, etc.).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/objectTool.lua:1326
---@param prefsRegistry table Editor preferences registry.
function editor_objectTool.onEditorRegisterPreferences(prefsRegistry) end

--- Not a class: functions that this module adds to the global editor table during onEditorInitialized (registerApi).
---@class editor_objectTool_editor
local editor_objectTool_editor = {}

--- Draws the bounding box of a scene object (ignores objects without getTransform). For a BeamNGVehicle, instead draws a magenta sphere and three cylinders (red, blue, green axes) at the reference node, whose size follows the camera distance unless gizmos.general.fixedRefnodeVisualization is active.
---Source: lua/ge/extensions/editor/objectTool.lua:72
---@param obj userdata Scene object (SimObject).
---@param color ColorF Box color (unused for a vehicle).
function editor_objectTool_editor.drawSelectedObjectBBox(obj, color) end

--- Draws with debugDrawer:drawLineInstance the 12 edges of a unit box transformed by the given matrix.
---Source: lua/ge/extensions/editor/objectTool.lua:47
---@param objMat MatrixF Transform matrix (position, rotation, scale of the box).
---@param color ColorF Line color.
function editor_objectTool_editor.drawSelectionBBox(objMat, color) end

--- Duplicates the selection: if the left mouse button is held down, immediately pastes a copy of the manipulable objects and switches to drag-duplicate; otherwise records an undoable "DuplicateObjects" action.
---Source: lua/ge/extensions/editor/objectTool.lua:1198
function editor_objectTool_editor.duplicateSceneObjects() end

--- Creates, with possible undo (action "DuplicateObjectsAtCamera"), a copy of the selection moved so the gizmo ends up 10 m in front of the camera.
---Source: lua/ge/extensions/editor/objectTool.lua:238
function editor_objectTool_editor.duplicateSelectionAtCamera() end

--- Moves the selection (outside SimGroup) 10 m in front of the camera, with possible undo (action "MoveSelectionAtCamera").
---Source: lua/ge/extensions/editor/objectTool.lua:272
function editor_objectTool_editor.moveSelectionAtCamera() end

--- Places the axis gizmo on the object selection: orientation of the last object in local mode, position of the last object, of the selection box center or of the centroid depending on the preferences (snapping and gizmos.general.useObjectBoxCenter).
---Source: lua/ge/extensions/editor/objectTool.lua:108
function editor_objectTool_editor.updateObjectSelectionAxisGizmo() end


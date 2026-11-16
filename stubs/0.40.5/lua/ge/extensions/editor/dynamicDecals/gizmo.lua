---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the axis gizmo (move / rotate / scale) of the Dynamic Decals tool. Other modules (decal, path, group...) choose the mode with setTransformMode, install their translateFn / rotateFn / scaleFn callback, and update M.transform. On each edit frame, editModeUpdate displays the gizmo, the bounding box of the selected decal and a debug sphere.
--- Access: extension `editor_dynamicDecals_gizmo`: `extensions.load("editor_dynamicDecals_gizmo")`, then the global `editor_dynamicDecals_gizmo`
---@class editor_dynamicDecals_gizmo
---@field data table Information about the object being manipulated (uid, type, objectType, dataPointIndex, objectDataCopy), filled by the calling modules.
---@field rotateFn function|nil Rotation callback.
---@field scaleFn function|nil Scale callback.
---@field transform MatrixF Gizmo matrix (MatrixF(true) initially).
---@field transformModes table<string, integer> none = 0, translate = 1, rotate = 2, scale = 3.
---@field translateFn function|nil Translation callback, receives the gizmo matrix.
editor_dynamicDecals_gizmo = {}

--- Called every frame by the editor's edit mode: updates and draws the gizmo if a mode is active, draws the bounding box of the selected decal, then the debug sphere of the control points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:116
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a preference changes. Does nothing here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:112
---@param path string Preference path.
---@param value any New value.
function editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value) end

--- Number of drag updates since the start of the current drag.
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:54
---@return integer  Counter.
function editor_dynamicDecals_gizmo.getDragCount() end

--- Returns the current transform mode.
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:40
---@return integer  Value of transformModes.
function editor_dynamicDecals_gizmo.getTransformMode() end

--- Callback passed to editor.updateAxisGizmo: called when the gizmo drag starts. Resets the counter to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:59
function editor_dynamicDecals_gizmo.gizmoBeginDrag() end

--- Callback called on every drag update: increments the counter then, depending on the mode, calls translateFn / rotateFn / scaleFn with editor.getAxisGizmoTransform().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:72
function editor_dynamicDecals_gizmo.gizmoDragging() end

--- Callback called at the end of the drag. Resets the counter to 0 (no undo action is added here).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:66
function editor_dynamicDecals_gizmo.gizmoEndDrag() end

--- Registers `dynamicDecalsTool.gizmo`: displayBoundingBox (bool, true), boundingBoxColor (RGBA {1,0,0,0.75}, with color picker) and displayDebugObjWhileMovingControlPoints (bool, true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:100
---@param prefsRegistry table Editor preferences registry.
function editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry) end

--- Resets translateFn, rotateFn and scaleFn to nil.
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:48
function editor_dynamicDecals_gizmo.resetTransformFn() end

--- Sets the transform mode; with none, the gizmo is no longer displayed.
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:44
---@param value integer A value of transformModes.
function editor_dynamicDecals_gizmo.setTransformMode(value) end

--- Called by the tool: stores the tool and the editor_api_dynamicDecals API.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dynamicDecals/gizmo.lua:142
---@param tool_in table Reference to the editor_dynamicDecalsTool tool.
function editor_dynamicDecals_gizmo.setup(tool_in) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_objectTool` : `extensions.load("editor_objectTool")`, puis la globale `editor_objectTool`
---@class editor_objectTool
editor_objectTool = {}

---Source : lua/ge/extensions/editor/objectTool.lua:1134
function editor_objectTool.onEditorAxisGizmoAligmentChanged() end

---Source : lua/ge/extensions/editor/objectTool.lua:1503
---@param editMode any
function editor_objectTool.onEditorEditModeActivated(editMode) end

---Source : lua/ge/extensions/editor/objectTool.lua:1520
---@param editMode any
function editor_objectTool.onEditorEditModeDeactivated(editMode) end

---Source : lua/ge/extensions/editor/objectTool.lua:1427
function editor_objectTool.onEditorInitialized() end

---Source : lua/ge/extensions/editor/objectTool.lua:1489
---@param selectedIds any
---@param fieldName any
---@param fieldValue any
---@param arrayIndex any
function editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

---Source : lua/ge/extensions/editor/objectTool.lua:1258
---@param path any
---@param value any
function editor_objectTool.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/objectTool.lua:1326
---@param prefsRegistry any
function editor_objectTool.onEditorRegisterPreferences(prefsRegistry) end

--- Classe locale `editor` de lua/ge/extensions/editor/objectTool.lua
---@class editor_objectTool_editor
local editor_objectTool_editor = {}

---Source : lua/ge/extensions/editor/objectTool.lua:72
---@param obj any
---@param color any
function editor_objectTool_editor.drawSelectedObjectBBox(obj, color) end

--- TODO: this could be done in C++
---Source : lua/ge/extensions/editor/objectTool.lua:47
---@param objMat any
---@param color any
function editor_objectTool_editor.drawSelectionBBox(objMat, color) end

---Source : lua/ge/extensions/editor/objectTool.lua:1198
function editor_objectTool_editor.duplicateSceneObjects() end

---Source : lua/ge/extensions/editor/objectTool.lua:238
function editor_objectTool_editor.duplicateSelectionAtCamera() end

---Source : lua/ge/extensions/editor/objectTool.lua:272
function editor_objectTool_editor.moveSelectionAtCamera() end

---Source : lua/ge/extensions/editor/objectTool.lua:108
function editor_objectTool_editor.updateObjectSelectionAxisGizmo() end


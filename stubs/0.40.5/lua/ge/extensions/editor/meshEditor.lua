---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshEditor` : `extensions.load("editor_meshEditor")`, puis la globale `editor_meshEditor`
---@class editor_meshEditor
editor_meshEditor = {}

--- These methods are for the action map to call
---Source : lua/ge/extensions/editor/meshEditor.lua:964
function editor_meshEditor.copySettingsAM() end

---Source : lua/ge/extensions/editor/meshEditor.lua:1060
function editor_meshEditor.onActivate_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:269
function editor_meshEditor.onDeleteSelection() end

---Source : lua/ge/extensions/editor/meshEditor.lua:1055
function editor_meshEditor.onDeselect_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:1040
function editor_meshEditor.onEditorAxisGizmoAligmentChanged_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:1029
---@param selectedIds any
---@param fieldName any
---@param fieldValue any
---@param arrayIndex any
function editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex) end

---Source : lua/ge/extensions/editor/meshEditor.lua:354
---@param inspectorInfo any
function editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo) end

---Source : lua/ge/extensions/editor/meshEditor.lua:1047
function editor_meshEditor.onEditorObjectSelectionChanged_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:1011
---@param path any
---@param value any
function editor_meshEditor.onEditorPreferenceValueChanged_(path, value) end

---Source : lua/ge/extensions/editor/meshEditor.lua:1015
---@param prefsRegistry any
function editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry) end

---Source : lua/ge/extensions/editor/meshEditor.lua:53
function editor_meshEditor.onSelectAll() end

---Source : lua/ge/extensions/editor/meshEditor.lua:984
function editor_meshEditor.onToolbar_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:735
function editor_meshEditor.onUpdate_() end

---Source : lua/ge/extensions/editor/meshEditor.lua:129
function editor_meshEditor.pasteFieldsAM() end


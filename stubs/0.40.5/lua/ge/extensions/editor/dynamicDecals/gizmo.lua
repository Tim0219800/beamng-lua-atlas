---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/gizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dynamicDecals_gizmo` : `extensions.load("editor_dynamicDecals_gizmo")`, puis la globale `editor_dynamicDecals_gizmo`
---@class editor_dynamicDecals_gizmo
---@field data table
---@field rotateFn any
---@field scaleFn any
---@field transform any
---@field transformModes table
---@field translateFn any
editor_dynamicDecals_gizmo = {}

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:116
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_dynamicDecals_gizmo.editModeUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:112
---@param path any
---@param value any
function editor_dynamicDecals_gizmo.editorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:54
function editor_dynamicDecals_gizmo.getDragCount() end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:40
function editor_dynamicDecals_gizmo.getTransformMode() end

--- called when the axis gizmo started to be dragged
---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:59
function editor_dynamicDecals_gizmo.gizmoBeginDrag() end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:72
function editor_dynamicDecals_gizmo.gizmoDragging() end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:66
function editor_dynamicDecals_gizmo.gizmoEndDrag() end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:100
---@param prefsRegistry any
function editor_dynamicDecals_gizmo.registerEditorPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:48
function editor_dynamicDecals_gizmo.resetTransformFn() end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:44
---@param value any
function editor_dynamicDecals_gizmo.setTransformMode(value) end

---Source : lua/ge/extensions/editor/dynamicDecals/gizmo.lua:142
---@param tool_in any
function editor_dynamicDecals_gizmo.setup(tool_in) end


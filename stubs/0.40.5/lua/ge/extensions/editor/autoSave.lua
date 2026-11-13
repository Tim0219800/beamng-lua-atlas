---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/autoSave.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_autoSave` : `extensions.load("editor_autoSave")`, puis la globale `editor_autoSave`
---@class editor_autoSave
editor_autoSave = {}

---Source : lua/ge/extensions/editor/autoSave.lua:110
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw) end

--- public interface
---Source : lua/ge/extensions/editor/autoSave.lua:133
function editor_autoSave.onEditorInitialized() end

---Source : lua/ge/extensions/editor/autoSave.lua:138
---@param path any
---@param value any
function editor_autoSave.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/autoSave.lua:153
---@param prefsRegistry any
function editor_autoSave.onEditorRegisterPreferences(prefsRegistry) end


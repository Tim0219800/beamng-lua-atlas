---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/preferences.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_preferences` : `extensions.load("editor_preferences")`, puis la globale `editor_preferences`
---@class editor_preferences
editor_preferences = {}

---Source : lua/ge/extensions/editor/preferences.lua:435
---@param state any
function editor_preferences.onDeserialized(state) end

---Source : lua/ge/extensions/editor/preferences.lua:447
function editor_preferences.onEditorActivated() end

---Source : lua/ge/extensions/editor/preferences.lua:439
function editor_preferences.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/preferences.lua:237
function editor_preferences.onEditorGui() end

---Source : lua/ge/extensions/editor/preferences.lua:408
function editor_preferences.onEditorInitialized() end

---Source : lua/ge/extensions/editor/preferences.lua:321
---@param path any
---@param value any
function editor_preferences.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/preferences.lua:341
---@param prefsRegistry any
function editor_preferences.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/preferences.lua:309
function editor_preferences.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/preferences.lua:431
---@param state any
function editor_preferences.onSerialize(state) end

--- Classe locale `editor` de lua/ge/extensions/editor/preferences.lua
---@class editor_preferences_editor
local editor_preferences_editor = {}

---Source : lua/ge/extensions/editor/preferences.lua:304
---@param categoryName any
function editor_preferences_editor.showPreferences(categoryName) end

---Source : lua/ge/extensions/editor/preferences.lua:386
function editor_preferences_editor.updatePreferencePages() end


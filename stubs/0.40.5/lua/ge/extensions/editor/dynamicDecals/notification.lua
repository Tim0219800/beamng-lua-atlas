---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dynamicDecals/notification.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dynamicDecals_notification` : `extensions.load("editor_dynamicDecals_notification")`, puis la globale `editor_dynamicDecals_notification`
---@class editor_dynamicDecals_notification
---@field levels table
editor_dynamicDecals_notification = {}

---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:97
---@param section any
---@param title any
---@param msg any
---@param level any
function editor_dynamicDecals_notification.add(section, title, msg, level) end

---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:84
---@param path any
---@param value any
function editor_dynamicDecals_notification.editorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:31
function editor_dynamicDecals_notification.onGui() end

---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:78
---@param prefsRegistry any
function editor_dynamicDecals_notification.registerEditorPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/dynamicDecals/notification.lua:88
---@param tool_in any
function editor_dynamicDecals_notification.setup(tool_in) end


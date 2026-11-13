---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/generalSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_multiseat_generalSettings` : `extensions.load("ui_multiseat_generalSettings")`, puis la globale `ui_multiseat_generalSettings`
---@class ui_multiseat_generalSettings
ui_multiseat_generalSettings = {}

---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:201
---@param stagedSettings any
---@param _activeSettings any
---@param result any
function ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result) end

---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:107
---@param providers any
function ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers) end

---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:142
---@param providerId any
---@param fieldId any
---@param result any
---@param value any
function ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value) end

---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:153
---@param providerId any
---@param fieldId any
---@param value any
function ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value) end

---Source : lua/ge/extensions/ui/multiseat/generalSettings.lua:166
---@param stagedSettings any
---@param _activeSettings any
---@param result any
function ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/shared.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_photomode_shared` : `extensions.load("ui_photomode_shared")`, puis la globale `ui_photomode_shared`
---@class ui_photomode_shared
---@field S table
ui_photomode_shared = {}

---Source : lua/ge/extensions/ui/photomode/shared.lua:143
---@param source any
---@param fieldDescriptors any
function ui_photomode_shared.buildDescribedState(source, fieldDescriptors) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:313
function ui_photomode_shared.buildMediaActions() end

---Source : lua/ge/extensions/ui/photomode/shared.lua:95
---@param value any
---@param minValue any
---@param maxValue any
---@param fallback any
function ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:160
---@param name any
function ui_photomode_shared.getCoreCameraFunction(name) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:263
function ui_photomode_shared.getScreenshotApi() end

---Source : lua/ge/extensions/ui/photomode/shared.lua:131
---@param state any
---@param fieldDescriptors any
function ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:55
function ui_photomode_shared.isDebugEnabled() end

---Source : lua/ge/extensions/ui/photomode/shared.lua:68
---@param message any
function ui_photomode_shared.logDebug(message) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:109
---@param value any
---@param fallback any
function ui_photomode_shared.normalizeBoolean(value, fallback) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:171
---@param value any
function ui_photomode_shared.normalizePathForCompare(value) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:179
---@param values any
---@param expectedLength any
function ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:254
function ui_photomode_shared.notifySettingsUi() end

---Source : lua/ge/extensions/ui/photomode/shared.lua:89
function ui_photomode_shared.playPhotoCaptureSound() end

---Source : lua/ge/extensions/ui/photomode/shared.lua:218
---@param settingName any
function ui_photomode_shared.readSettingValue(settingName) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:194
---@param variableName any
function ui_photomode_shared.readVariableRegistryValue(variableName) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:59
---@param value any
function ui_photomode_shared.setDebugEnabled(value) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:75
---@param payload any
function ui_photomode_shared.stringifyDebugPayload(payload) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:230
---@param settingName any
---@param value any
function ui_photomode_shared.writeSettingValue(settingName, value) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:242
---@param partialState any
function ui_photomode_shared.writeSettingsState(partialState) end

---Source : lua/ge/extensions/ui/photomode/shared.lua:206
---@param variableName any
---@param value any
function ui_photomode_shared.writeVariableRegistryValue(variableName, value) end


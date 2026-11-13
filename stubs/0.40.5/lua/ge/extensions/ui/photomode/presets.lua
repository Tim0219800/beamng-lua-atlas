---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/presets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_photomode_presets` : `extensions.load("ui_photomode_presets")`, puis la globale `ui_photomode_presets`
---@class ui_photomode_presets
---@field dependencies table
ui_photomode_presets = {}

---Source : lua/ge/extensions/ui/photomode/presets.lua:275
---@param presetType any
---@param presetId any
---@param options any
function ui_photomode_presets.applyPreset(presetType, presetId, options) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:398
---@param presetType any
---@param payload any
function ui_photomode_presets.applyPresetPayload(presetType, payload) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:129
function ui_photomode_presets.captureSessionDefaultPresets() end

---Source : lua/ge/extensions/ui/photomode/presets.lua:320
---@param presetType any
---@param presetId any
function ui_photomode_presets.deletePreset(presetType, presetId) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:228
---@param presetType any
function ui_photomode_presets.discoverTemporaryPresets(presetType) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:462
function ui_photomode_presets.getScreenshotPresetBundle() end

---Source : lua/ge/extensions/ui/photomode/presets.lua:213
---@param presetType any
function ui_photomode_presets.listPresets(presetType) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:373
---@param presetType any
---@param presetId any
---@param name any
function ui_photomode_presets.renamePreset(presetType, presetId, name) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:58
function ui_photomode_presets.resetTemporaryPresets() end

---Source : lua/ge/extensions/ui/photomode/presets.lua:245
---@param presetType any
---@param name any
---@param options any
function ui_photomode_presets.saveCurrentPreset(presetType, name, options) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:436
---@param bundle any
---@param namePrefix any
---@param origin any
function ui_photomode_presets.savePresetBundle(bundle, namePrefix, origin) end

---Source : lua/ge/extensions/ui/photomode/presets.lua:415
---@param presetType any
---@param name any
---@param payload any
---@param origin any
function ui_photomode_presets.savePresetPayload(presetType, name, payload, origin) end


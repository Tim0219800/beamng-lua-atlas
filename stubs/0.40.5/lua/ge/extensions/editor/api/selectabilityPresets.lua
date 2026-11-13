---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/selectabilityPresets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_selectabilityPresets` : `extensions.load("editor_api_selectabilityPresets")`, puis la globale `editor_api_selectabilityPresets`
---@class editor_api_selectabilityPresets
editor_api_selectabilityPresets = {}

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:72
---@param presetId any
---@param persist any
---@param owner any
function editor_api_selectabilityPresets.applyPreset(presetId, persist, owner) end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:83
---@param owner any
---@param presetId any
---@param ownerLabel any
function editor_api_selectabilityPresets.beginScope(owner, presetId, ownerLabel) end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:163
function editor_api_selectabilityPresets.drawControls() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:102
---@param owner any
function editor_api_selectabilityPresets.endScope(owner) end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:155
function editor_api_selectabilityPresets.getActivePresetId() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:159
function editor_api_selectabilityPresets.getActivePresetLabel() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:120
function editor_api_selectabilityPresets.getScopeOwner() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:68
function editor_api_selectabilityPresets.initialize() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:124
function editor_api_selectabilityPresets.isScoped() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:128
function editor_api_selectabilityPresets.markCurrent() end

---Source : lua/ge/extensions/editor/api/selectabilityPresets.lua:134
function editor_api_selectabilityPresets.syncActivePresetFromMask() end


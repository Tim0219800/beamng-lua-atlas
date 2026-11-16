---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/textureQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Texture quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Video::textureReductionLevel and $pref::Reflect::refractTexScale. The onApply hook reloads the textures.
--- Access: extension `core_settings_textureQuality`: `extensions.load("core_settings_textureQuality")`, then the global `core_settings_textureQuality`
---@class core_settings_textureQuality
---@field qualityLevels table<string, table<string, number>> textureReductionLevel / refractTexScale: Lowest 2 / 0.5, Low 1 / 0.75, Normal 0 / 1.
core_settings_textureQuality = {}

--- Called by graphicsQualityGroup when a value has changed. Calls reloadTextures().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/textureQuality.lua:24
function core_settings_textureQuality.onApply() end


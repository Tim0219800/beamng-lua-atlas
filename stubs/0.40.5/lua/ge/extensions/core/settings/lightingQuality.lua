---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/lightingQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lighting quality presets, consumed by graphicsQualityGroup. Each level sets the light manager, shadow filtering, specular, normal mapping, parallax, true water reflections and the shader quality group, via $pref::* keys. The onApply hook changes the active light manager.
--- Access: extension `core_settings_lightingQuality`: `extensions.load("core_settings_lightingQuality")`, then the global `core_settings_lightingQuality`
---@class core_settings_lightingQuality
---@field qualityLevels table<string, table<string, any>> Levels Lowest, Low, High, Ultra. Keys: $pref::lightManager, $pref::Shadows::filterMode, $pref::Video::disablePixSpecular, $pref::Video::disableNormalmapping, $pref::Video::disableParallaxMapping, $pref::Water::disableTrueReflections, $pref::Video::ShaderQualityGroup.
core_settings_lightingQuality = {}

--- Called by graphicsQualityGroup when a value has changed. Reads $pref::lightManager; if getActiveLightManager() is already equal, does nothing, otherwise calls setLightManager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/settings/lightingQuality.lua:49
function core_settings_lightingQuality.onApply() end


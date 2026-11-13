---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/textureQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité des textures, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Video::textureReductionLevel et $pref::Reflect::refractTexScale. Le hook onApply recharge les textures.
--- Accès : extension `core_settings_textureQuality` : `extensions.load("core_settings_textureQuality")`, puis la globale `core_settings_textureQuality`
---@class core_settings_textureQuality
---@field qualityLevels table<string, table<string, number>> textureReductionLevel / refractTexScale : Lowest 2 / 0.5, Low 1 / 0.75, Normal 0 / 1.
core_settings_textureQuality = {}

--- Appelé par graphicsQualityGroup quand une valeur a changé. Appelle reloadTextures().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/settings/textureQuality.lua:24
function core_settings_textureQuality.onApply() end


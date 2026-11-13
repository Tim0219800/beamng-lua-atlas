---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/shadowsQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Préréglages de qualité des ombres, consommés par graphicsQualityGroup. Chaque niveau fixe $pref::Shadows::textureScalar et $pref::Shadows::disable. vehicleTexSizes donne en plus la taille de texture d'ombre des véhicules par niveau.
--- Accès : extension `core_settings_shadowsQuality` : `extensions.load("core_settings_shadowsQuality")`, puis la globale `core_settings_shadowsQuality`
---@class core_settings_shadowsQuality
---@field qualityLevels table<string, table<string, number>> Niveaux Disabled, Lowest, Low, Normal, High, Ultra. textureScalar : 0.25, 0.25, 0.5, 1.0, 2.0, 4.0.
---@field vehicleTexSizes table<string, integer> Taille de texture d'ombre véhicule par niveau : Disabled 512, Lowest 512, Low 1024, Normal 2048, High 4096, Ultra 8192.
core_settings_shadowsQuality = {}


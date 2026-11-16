---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/shadowsQuality.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shadow quality presets, consumed by graphicsQualityGroup. Each level sets $pref::Shadows::textureScalar and $pref::Shadows::disable. vehicleTexSizes additionally gives the vehicle shadow texture size per level.
--- Access: extension `core_settings_shadowsQuality`: `extensions.load("core_settings_shadowsQuality")`, then the global `core_settings_shadowsQuality`
---@class core_settings_shadowsQuality
---@field qualityLevels table<string, table<string, number>> Levels Disabled, Lowest, Low, Normal, High, Ultra. textureScalar: 0.25, 0.25, 0.5, 1.0, 2.0, 4.0.
---@field vehicleTexSizes table<string, integer> Vehicle shadow texture size per level: Disabled 512, Lowest 512, Low 1024, Normal 2048, High 4096, Ultra 8192.
core_settings_shadowsQuality = {}


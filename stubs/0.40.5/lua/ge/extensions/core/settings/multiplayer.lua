---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the "option helpers" of the multiplayer settings. Each helper has a set(value) function that forwards the setting to the matching multiplayer_* extension if it is loaded. Used by core_settings_settings to link the mp* options to their extensions.
--- Access: extension `core_settings_multiplayer`: `extensions.load("core_settings_multiplayer")`, then the global `core_settings_multiplayer`
---@class core_settings_multiplayer
core_settings_multiplayer = {}

--- Builds and returns the helpers table. Keys: mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL).
---Source: lua/ge/extensions/core/settings/multiplayer.lua:7
---@return table<string, {set: fun(value: any)}>  Table option name -> {set = function}.
function core_settings_multiplayer.buildOptionHelpers() end


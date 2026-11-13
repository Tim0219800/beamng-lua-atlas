---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/settings/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit les « option helpers » des réglages multijoueur. Chaque helper a une fonction set(value) qui répercute le réglage sur l'extension multiplayer_* correspondante si elle est chargée. Utilisé par core_settings_settings pour relier les options mp* à leurs extensions.
--- Accès : extension `core_settings_multiplayer` : `extensions.load("core_settings_multiplayer")`, puis la globale `core_settings_multiplayer`
---@class core_settings_multiplayer
core_settings_multiplayer = {}

--- Construit et renvoie la table des helpers. Clés : mpNametagsEnabled (multiplayer_nametags.nametagsEnabled), mpNametagDistance (multiplayer_nametags.nametagDistance), mpEnableSwitchingToPlayerVehicles (multiplayer_vehicleSync.enableSwitchingToPlayerVehicles(value)), mpDebugMode (multiplayer_multiplayer.debugMode), mpUseCustomServiceURL (multiplayer_sessionManager.useCustomServiceURL), mpCustomServiceURL (multiplayer_sessionManager.customServiceURL).
---Source : lua/ge/extensions/core/settings/multiplayer.lua:7
---@return table<string, {set: fun(value: any)}>  Table nom d'option -> {set = function}.
function core_settings_multiplayer.buildOptionHelpers() end


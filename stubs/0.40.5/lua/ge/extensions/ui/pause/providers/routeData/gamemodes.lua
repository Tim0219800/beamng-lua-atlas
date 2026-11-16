---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for multiplayer game modes: list of modes (GamemodesTab component), configuration of a mode (GamemodeSetupView) and settings of the current mode (GamemodeSettingsView). If multiplayer is active, it adds the player list as a side panel via routeData_multiplayer.
--- Access: extension `ui_pause_providers_routeData_gamemodes`: `extensions.load("ui_pause_providers_routeData_gamemodes")`, then the global `ui_pause_providers_routeData_gamemodes`
---@class ui_pause_providers_routeData_gamemodes
---@field dependencies string[] {"ui_pause_providers_routeData_multiplayer"}
ui_pause_providers_routeData_gamemodes = {}

--- Returns the settings view of the current mode (GamemodeSettingsView).
---Source: lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:42
---@param context table Pause context.
---@return table  {mainCardClass, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context) end

--- Returns the configuration view of a mode (GamemodeSetupView, prop gamemodeName).
---Source: lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:25
---@param context table Pause context.
---@param params table|nil Field read: gamemodeName.
---@return table  {mainCardClass, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params) end

--- Returns the GamemodesTab main panel and, if context.isMultiplayerActive, the player list side panel.
---Source: lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua:16
---@param context table Pause context (field read: isMultiplayerActive).
---@return table  {mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_gamemodes.getGamemodesData(context) end


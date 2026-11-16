---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for multiplayer: multiplayer home page (Session Settings / Game Modes / Manage Players buttons), session settings (PauseMultiplayerSessionTab) and player list (PauseMultiplayerPlayerList). Actions are read-only in freeroamTutorial mode.
--- Access: extension `ui_pause_providers_routeData_multiplayer`: `extensions.load("ui_pause_providers_routeData_multiplayer")`, then the global `ui_pause_providers_routeData_multiplayer`
---@class ui_pause_providers_routeData_multiplayer
ui_pause_providers_routeData_multiplayer = {}

--- Returns the multiplayer home page with three navigation buttons (routes pause.multiplayer.settings, pause.gamemodes or pause.gamemodeSettings, pause.multiplayer.playerList). The last two are only enabled if a multiplayer session is active.
---Source: lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:30
---@param context table Pause context (fields read: isMultiplayerActive, mode).
---@return table  {active, disabledReason, mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_multiplayer.getMultiplayerData(context) end

--- Returns the player management page (PauseMultiplayerPlayerList component with interactive = true).
---Source: lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:103
---@return table  {mainPanelContent}
function ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData() end

--- Returns the session settings page (PauseMultiplayerSessionTab component) with the player list as a side panel.
---Source: lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:88
---@return table  {mainPanelContent, sidePanelContents}
function ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData() end

--- Returns the content of the "Players" side panel (title ui.multiplayer.players and PauseMultiplayerPlayerList component). Also used by routeData_gamemodes.
---Source: lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua:13
---@return table  List of side panels.
function ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents() end


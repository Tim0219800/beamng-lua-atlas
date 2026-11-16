---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/system.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pause menu data provider for the System page. It builds the button rail in three groups: topSystemButtons (Options, Mods, HUD, Statistics), firstDriveButtons (restart, reset progress, switch to freeroam, only during the First Drive experience) and exitSystemButtons (multiplayer disconnect, quit to main menu, quit the game with confirmation).
--- Access: extension `ui_pause_providers_routeData_system`: `extensions.load("ui_pause_providers_routeData_system")`, then the global `ui_pause_providers_routeData_system`
---@class ui_pause_providers_routeData_system
---@field dependencies string[] {"ui_pause_actions"}
ui_pause_providers_routeData_system = {}

--- Returns {heading = ui.pause.system, sidePanelContents = nil, rail = button groups}. Each button is registered via ui_pause_actions.registerButton (so it can be executed afterwards with executeAction).
---Source: lua/ge/extensions/ui/pause/providers/routeData/system.lua:219
---@param context table Pause context (fields read: mode, isMultiplayerActive, isFirstDriveActive, isFirstDriveGuided).
---@return table  System page data.
function ui_pause_providers_routeData_system.getSystemData(context) end


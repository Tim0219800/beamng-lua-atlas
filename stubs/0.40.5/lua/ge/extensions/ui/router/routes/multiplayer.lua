---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Multiplayer routes: host-options, settings and playerList (pause screens with ui_pause_routeLifecycleCallbacks hooks) and spectator (Vue, hooks multiplayer_gamemodes_utils_spectator.onSpectatorViewEnter/Leave). Included by menu.lua and pause.lua.
--- Access: extension `ui_router_routes_multiplayer`: `extensions.load("ui_router_routes_multiplayer")`, then the global `ui_router_routes_multiplayer`
---@class ui_router_routes_multiplayer
---@field Children table<string, table> host-options (screenId multiplayer.host-options), settings (screenId pause.multiplayer.settings), playerList (pause.multiplayer.playerList), spectator (uiApps visible, bars hidden).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {} (empty root)
ui_router_routes_multiplayer = {}


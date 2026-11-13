---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/multiplayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes multijoueur : host-options, settings et playerList (écrans de pause avec hooks ui_pause_routeLifecycleCallbacks) et spectator (Vue, hooks multiplayer_gamemodes_utils_spectator.onSpectatorViewEnter/Leave). Inclus par menu.lua et pause.lua.
--- Accès : extension `ui_router_routes_multiplayer` : `extensions.load("ui_router_routes_multiplayer")`, puis la globale `ui_router_routes_multiplayer`
---@class ui_router_routes_multiplayer
---@field Children table<string, table> host-options (screenId multiplayer.host-options), settings (screenId pause.multiplayer.settings), playerList (pause.multiplayer.playerList), spectator (uiApps visibles, barres masquées).
---@field ModuleName string Nom du module de routes (premier segment du nom pointé).
---@field Root table {} (racine vide)
ui_router_routes_multiplayer = {}


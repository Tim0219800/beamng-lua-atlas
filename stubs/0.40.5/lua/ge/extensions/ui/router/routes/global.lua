---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/global.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Routes globales à un seul segment (hors module) : onboarding, buttonLayout, play, /mainmenu. Pour un nom à un segment, routeManager cherche d'abord ici (module global désigné par routes.lua : Global.include). « play » et « /mainmenu » ont `back = {mode = "rootExit"}`.
--- Accès : extension `ui_router_routes_global` : `extensions.load("ui_router_routes_global")`, puis la globale `ui_router_routes_global`
---@class ui_router_routes_global
---@field Children table<string, table> onboarding (backTarget menu), buttonLayout (infoBar par défaut), play (screenId play, Vue, uiNav = false, uiApps visibles), /mainmenu (screenId menu, uiApps masquées).
ui_router_routes_global = {}


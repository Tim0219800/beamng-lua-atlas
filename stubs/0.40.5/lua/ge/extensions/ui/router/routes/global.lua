---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/global.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Single-segment global routes (outside a module): onboarding, buttonLayout, play, /mainmenu. For a single-segment name, routeManager looks here first (global module designated by routes.lua: Global.include). "play" and "/mainmenu" have `back = {mode = "rootExit"}`.
--- Access: extension `ui_router_routes_global`: `extensions.load("ui_router_routes_global")`, then the global `ui_router_routes_global`
---@class ui_router_routes_global
---@field Children table<string, table> onboarding (backTarget menu), buttonLayout (default infoBar), play (screenId play, Vue, uiNav = false, uiApps visible), /mainmenu (screenId menu, uiApps hidden).
ui_router_routes_global = {}


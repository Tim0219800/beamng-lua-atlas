---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Root registry of the UI router routes: the single explicit entry point for registering top-level route families. Each `{ include = "name" }` entry mounts the routes/name.lua module (Root + Children). There is no automatic filesystem discovery: a module is registered only if it is listed here (or added at runtime via routeManager.addVueRoutes / registerModRoutes). Read by routeManager.
--- Access: extension `ui_router_routes`: `extensions.load("ui_router_routes")`, then the global `ui_router_routes`
---@class ui_router_routes
---@field Children table[] List of `{ include = "module" }` entries: bigmap, campaign, career, debug, default, firstDrive, freeroamLevels, freeroamWizard, garage, legal, livery, liveries, menu, mission, mods, multiseat, multiplayer, options, pause, radial, scenario, taxi, trackBuilder.
---@field Global table `{ include = "global" }`: module of flat global routes (play, /mainmenu, etc.).
ui_router_routes = {}


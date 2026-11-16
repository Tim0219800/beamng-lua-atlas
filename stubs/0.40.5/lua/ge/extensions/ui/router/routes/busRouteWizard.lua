---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/busRouteWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vue wizard for configuring a bus route (port of the old Angular busRoute module, kept next to "menu.busRoutes" behind a feature flag). Same structure as quickraceWizard; shares the oneshotRaceCore.lua backend and differs only by the Lua configurator (busroute_busrouteConfigurator). Root = welcome screen, children = choice of level (with "middle" sub-step = choice of the route) and of vehicle.
--- Access: extension `ui_router_routes_busRouteWizard`: `extensions.load("ui_router_routes_busRouteWizard")`, then the global `ui_router_routes_busRouteWizard`
---@class ui_router_routes_busRouteWizard
---@field Children table<string, table> Children: level (onEnter onWizardLevelRouteEnter, minor sub-route level.middle -> onWizardMiddleRouteEnter) and vehicle (onWizardVehicleRouteEnter). They use a grid selector scopeTree (grid-selector-grid / grid-selector-details with back to the grid).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "busRouteWizard", title = "ui.playmodes.bus", onEnter = "busroute_busrouteConfigurator.onWizardRouteEnter", root scopeTree, Vue only, infoBar and topBar hidden}
ui_router_routes_busRouteWizard = {}


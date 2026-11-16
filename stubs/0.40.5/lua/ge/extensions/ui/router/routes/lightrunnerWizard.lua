---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/lightrunnerWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vue wizard for configuring LightRunner mode (port of the old Angular lightrunner module). Same structure as quickraceWizard, oneshotRaceCore.lua backend, configurator lightrunner_lightrunnerConfigurator. Children: level (> middle, title "ui.quickrace.quickraceTracks"), vehicle.
--- Access: extension `ui_router_routes_lightrunnerWizard`: `extensions.load("ui_router_routes_lightrunnerWizard")`, then the global `ui_router_routes_lightrunnerWizard`
---@class ui_router_routes_lightrunnerWizard
---@field Children table<string, table> level (onWizardLevelRouteEnter; minor sub-route middle -> onWizardMiddleRouteEnter), vehicle (onWizardVehicleRouteEnter); grid selector scopeTree.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "lightrunnerWizard", title = "ui.playmodes.lightRunner", onEnter = "lightrunner_lightrunnerConfigurator.onWizardRouteEnter", Vue only, bars hidden}
ui_router_routes_lightrunnerWizard = {}


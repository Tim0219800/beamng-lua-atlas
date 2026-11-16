---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/quickraceWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vue wizard for quick race (port of the old Angular quickrace module, separate from "menu.quickrace" so both can coexist behind a flag). The root is the overview/options screen; level (> middle = track choice) and vehicle are steps that return to the root. Configurator: quickrace_quickraceConfigurator; shared backend oneshotRaceCore.lua.
--- Access: extension `ui_router_routes_quickraceWizard`: `extensions.load("ui_router_routes_quickraceWizard")`, then the global `ui_router_routes_quickraceWizard`
---@class ui_router_routes_quickraceWizard
---@field Children table<string, table> level (onWizardLevelRouteEnter, title ui.quickrace.quickraceLevels; minor sub-route middle -> onWizardMiddleRouteEnter, title ui.quickrace.quickraceTracks), vehicle (onWizardVehicleRouteEnter); grid selector scopeTree.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "quickraceWizard", title = "ui.playmodes.quickrace", onEnter = "quickrace_quickraceConfigurator.onWizardRouteEnter", Vue only, bars hidden}
ui_router_routes_quickraceWizard = {}


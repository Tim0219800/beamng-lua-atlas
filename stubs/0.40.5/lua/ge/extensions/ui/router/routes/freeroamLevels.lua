---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/freeroamLevels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vue wizard to choose level/vehicle/options for freeroam mode, "level grid" root version. The hooks call freeroam_freeroamConfigurator.onWizard*. Children: level (detail, minor sub-route), vehicles (> vehicle, options > multiplayer).
--- Access: extension `ui_router_routes_freeroamLevels`: `extensions.load("ui_router_routes_freeroamLevels")`, then the global `ui_router_routes_freeroamLevels`
---@class ui_router_routes_freeroamLevels
---@field Children table<string, table> level (dynamic title via resolveSelectedLevelTitle), vehicles (> vehicle with dynamic title resolveSelectedVehicleTitle, > options > multiplayer).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "freeroamLevels", title = "ui.menu.freeroamSelector.wizard.location", onEnter onWizardLevelsRouteEnter, onMount onWizardLevelsRouteMount, scopeTree root > (grid, auxillary), targetScope grid, ui Vue, default infoBar, uiApps hidden}
ui_router_routes_freeroamLevels = {}


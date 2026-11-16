---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/freeroamWizard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Wizard" variant of the freeroam wizard: same flow as freeroamLevels (levels > level, vehicles > vehicle, options, multiplayer) but under the freeroamWizard root (title ui.menu.freeroamSelector.title). The hooks call freeroam_freeroamConfigurator.onWizard*.
--- Access: extension `ui_router_routes_freeroamWizard`: `extensions.load("ui_router_routes_freeroamWizard")`, then the global `ui_router_routes_freeroamWizard`
---@class ui_router_routes_freeroamWizard
---@field Children table<string, table> levels (> level), vehicles (> vehicle), options, multiplayer; dynamic titles via resolveSelectedLevelTitle / resolveSelectedVehicleTitle.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {title = "ui.menu.freeroamSelector.title", ui = Vue only, default infoBar, topBar and uiApps hidden}
ui_router_routes_freeroamWizard = {}


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/mission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mission routes (Vue, abstract): details (back via missionDetailsExitHandler), mission control (back pause; grid vehicle selector with gridSelector backendName vehicleSelector), grid, drag history and rules, AI competitors leaderboard.
--- Access: extension `ui_router_routes_mission`: `extensions.load("ui_router_routes_mission")`, then the global `ui_router_routes_mission`
---@class ui_router_routes_mission
---@field Children table<string, table> details, control (> vehicleSelector with hooks ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter/Mount/Leave and meta.gridSelector {backendName, routePath = "/mission-vehicle-selector", defaultPath}), grid, dragHistory, dragRules, aiCompetitorsLeaderboardTable.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "mission", abstract = true, ui = Vue only, default infoBar, topBar hidden, default uiApps}
ui_router_routes_mission = {}


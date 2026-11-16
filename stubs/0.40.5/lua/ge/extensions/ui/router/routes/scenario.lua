---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/scenario.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Scenario end and start routes (Vue, abstract module): start, end, quickrace.end and chapter.end. Each screen has an action scopeTree with backTarget to the root; conditional blocks (settings, progress, vehicle, rewards, stats, mission) are `optional = true` for the scope validator. Default back to pause.
--- Access: extension `ui_router_routes_scenario`: `extensions.load("ui_router_routes_scenario")`, then the global `ui_router_routes_scenario`
---@class ui_router_routes_scenario
---@field Children table<string, table> start, end, quickrace (abstract > end), chapter (abstract > end); screenId scenario.start / scenario.end / scenario.quickrace.end / scenario.chapter.end, all Vue with backTarget = "pause".
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {abstract = true, ui = filter only, infoBar and topBar hidden, uiApps visible}
ui_router_routes_scenario = {}


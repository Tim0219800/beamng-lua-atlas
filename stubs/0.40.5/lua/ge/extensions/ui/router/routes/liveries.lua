---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/liveries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Livery editor routes (Vue): list (liveries), edit (liveries.edit), paint (liveries.edit.paint) and decals (includes the decals module). Hooks: ui_liveries_routeLifecycleCallbacks.onLiveriesEnter / onLiveriesEditEnter / onLiveriesPaintEnter / onLiveriesLeave / onLiveriesRootLeave.
--- Access: extension `ui_router_routes_liveries`: `extensions.load("ui_router_routes_liveries")`, then the global `ui_router_routes_liveries`
---@class ui_router_routes_liveries
---@field Children table<string, table> edit (backTarget liveries; children paint and decals = include of the decals module).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "liveries", title = "ui.liveries.title", Vue only, default infoBar, topBar hidden, onEnter onLiveriesEnter, onLeave onLiveriesRootLeave}
ui_router_routes_liveries = {}


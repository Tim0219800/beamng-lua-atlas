---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/bigmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Big map routes (Vue): "bigmap" screen (title Map) with a bigmapMenu sub-route. Gamepad navigation scope tree: bigmap-layout contains bigmap-camera and bigmap-main, which contains bigmap-details. Included by other modules (e.g. pause.bigmap).
--- Access: extension `ui_router_routes_bigmap`: `extensions.load("ui_router_routes_bigmap")`, then the global `ui_router_routes_bigmap`
---@class ui_router_routes_bigmap
---@field Children table<string, table> Child "bigmapMenu" (screenId bigmap.bigmapMenu, Vue).
---@field Root table {screenId = "bigmap", title = "Map", targetScope = "bigmap-main", scopeTree = bigmap-layout > (bigmap-camera, bigmap-main > bigmap-details), ui = Vue only, default infoBar, hidden topBar, default uiApps}
ui_router_routes_bigmap = {}


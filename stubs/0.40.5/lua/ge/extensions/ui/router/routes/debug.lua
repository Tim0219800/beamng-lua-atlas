---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/debug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI debug routes (Vue, bars hidden, abstract module): demo components, UI apps test, bulk async loader, tutorial highlight (see ui_tutorialHighlight).
--- Access: extension `ui_router_routes_debug`: `extensions.load("ui_router_routes_debug")`, then the global `ui_router_routes_debug`
---@class ui_router_routes_debug
---@field Children table<string, table> components (scopeTree root > demo), ui-apps-test, asyncBulkLoader, tutorialHighlight.
---@field Root table {abstract = true, ui = Vue, infoBar and topBar hidden, default uiApps}
ui_router_routes_debug = {}


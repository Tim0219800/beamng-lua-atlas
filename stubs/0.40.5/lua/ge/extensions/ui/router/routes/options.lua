---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/options.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Options routes (Vue): "options" root (fallback to menu via fallbackTarget) with infoBar without system info, and child category (screenId pause.options.category, topBar hidden). The detailed options screens are in menu.options.* and pause.options.
--- Access: extension `ui_router_routes_options`: `extensions.load("ui_router_routes_options")`, then the global `ui_router_routes_options`
---@class ui_router_routes_options
---@field Children table<string, table> category.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "options", title = "Options", fallbackTarget = "menu", ui = Vue only, infoBar visible without system info, topBar hidden, uiApps hidden}
ui_router_routes_options = {}


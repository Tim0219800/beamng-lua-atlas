---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/multiseat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Root route of multiseat mode (several players on one screen, Vue): "multiseat" screen (title ui.multiseat.title), exit via rootExit, UI navigation disabled (uiNav = false), bars and apps hidden. No children.
--- Access: extension `ui_router_routes_multiseat`: `extensions.load("ui_router_routes_multiseat")`, then the global `ui_router_routes_multiseat`
---@class ui_router_routes_multiseat
---@field Children table<string, table> Empty table.
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {screenId = "multiseat", title = "ui.multiseat.title", back = rootExit, ui = {uiNav = false, Vue only, infoBar/topBar hidden, uiApps hidden}}
ui_router_routes_multiseat = {}


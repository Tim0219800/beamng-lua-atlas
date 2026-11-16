---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/radial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Radial menu routes (Vue). The "radial" root calls core_quickAccess.endRouteHandoff on entry (ends the current route handoff, shows the menu again) and has a back handled by `radialBackHandler`. Child: mirrors (mirror adjustment, back to radial).
--- Access: extension `ui_router_routes_radial`: `extensions.load("ui_router_routes_radial")`, then the global `ui_router_routes_radial`
---@class ui_router_routes_radial
---@field Children table<string, table> mirrors (screenId radial.mirrors, title ui.mirrors.name, backTarget radial).
---@field Root table {screenId = "radial", onEnter = "core_quickAccess.endRouteHandoff", back = handler radialBackHandler, ui = Vue, default infoBar, topBar hidden}
ui_router_routes_radial = {}


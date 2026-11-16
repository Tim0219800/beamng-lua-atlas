---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routes/default.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Default, abstract routes module that defines the `ui` configuration of base screens: mapview (Angular), options (Vue, default infoBar), play (Angular, visible uiApps) and radial (Vue).
--- Access: extension `ui_router_routes_default`: `extensions.load("ui_router_routes_default")`, then the global `ui_router_routes_default`
---@class ui_router_routes_default
---@field Children table<string, table> mapview, options, play, radial: each defines only its `ui` block (uiTypes, uiTypesFilter = only, infoBar, topBar, uiApps).
---@field ModuleName string Name of the routes module (first segment of the dotted name).
---@field Root table {abstract = true}
ui_router_routes_default = {}


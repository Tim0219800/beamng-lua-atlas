---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exit handler of the root routes (garage / menu).
--- Access: extension `ui_router_routeHandlers_rootExitHandlers`: `extensions.load("ui_router_routeHandlers_rootExitHandlers")`, then the global `ui_router_routeHandlers_rootExitHandlers`
---@class ui_router_routeHandlers_rootExitHandlers
ui_router_routeHandlers_rootExitHandlers = {}

--- Toggles between "menu" and "garage": with no current route, navigates to "menu"; if the current route is "menu", navigates to "garage"; otherwise navigates to "menu".
---Source: lua/ge/extensions/ui/router/routeHandlers/rootExitHandlers.lua:7
---@return boolean|nil  true in the first two cases, nil in the last.
function ui_router_routeHandlers_rootExitHandlers.garageExitHandler() end


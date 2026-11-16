---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeHandlers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of the routes' named back/exit handlers. A route whose back is in "handler" mode designates a name (for example garageExitHandler); router.back() fetches it via getHandler and calls it. Most handlers are defined in routeHandlers/*ExitHandlers.lua or delegate to gameplay modules (career, inventory, vehicle purchase, vehicle configuration guard).
--- Access: extension `ui_router_routeHandlers`: `extensions.load("ui_router_routeHandlers")`, then the global `ui_router_routeHandlers`
---@class ui_router_routeHandlers
ui_router_routeHandlers = {}

--- Returns the handler registered under this name.
---Source: lua/ge/extensions/ui/router/routeHandlers.lua:36
---@param handlerName string Handler name declared in the route (back.handler).
---@return function|nil  Handler, or nil if the name is unknown.
function ui_router_routeHandlers.getHandler(handlerName) end


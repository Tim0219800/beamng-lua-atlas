---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/services/routeResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- DEPRECATED UI router service: the main flow now builds NavigationEntries directly with ResolvedRoute.createEntry(). This module remains for possible external callers: it resolves a route name into a resolved table and compares two routes.
--- Access: extension `ui_router_services_routeResolver`: `extensions.load("ui_router_services_routeResolver")`, then the global `ui_router_services_routeResolver`
---@class ui_router_services_routeResolver
ui_router_services_routeResolver = {}

--- Compares two routes: same `name` and same `params` (value-by-value comparison, non-recursive).
---Source: lua/ge/extensions/ui/router/services/routeResolver.lua:42
---@param routeA table First route.
---@param routeB table Second route.
---@return boolean  true if identical; false if either is nil.
function ui_router_services_routeResolver.isEqualRoutes(routeA, routeB) end

--- Resolves a route name (possibly relative, resolved with utils.resolveRelativeRoute if a current route is provided) into a resolved route via routeManager.getRoute then ResolvedRoute.createResolved. Returns nil with a warning if the route is not found or creation fails. Deprecated.
---Source: lua/ge/extensions/ui/router/services/routeResolver.lua:15
---@param routeName string Name of the road.
---@param params table|nil Query parameters.
---@param currentRoute table|nil Current route (for relative names).
---@return table|nil  Resolved route.
function ui_router_services_routeResolver.resolve(routeName, params, currentRoute) end


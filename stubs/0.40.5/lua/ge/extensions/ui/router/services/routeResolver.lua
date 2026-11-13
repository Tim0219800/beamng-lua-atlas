---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/services/routeResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_services_routeResolver` : `extensions.load("ui_router_services_routeResolver")`, puis la globale `ui_router_services_routeResolver`
---@class ui_router_services_routeResolver
ui_router_services_routeResolver = {}

--- Check if two routes are the same (by name and params).
---
---   @param routeA - First route
---   @param routeB - Second route
---   @return boolean
---Source : lua/ge/extensions/ui/router/services/routeResolver.lua:42
---@param routeA any
---@param routeB any
function ui_router_services_routeResolver.isEqualRoutes(routeA, routeB) end

--- Resolve a route name to a resolved route table.
---  @deprecated Use ResolvedRoute.createEntry() for full NavigationEntries.
---Source : lua/ge/extensions/ui/router/services/routeResolver.lua:15
---@param routeName any
---@param params any
---@param currentRoute any
function ui_router_services_routeResolver.resolve(routeName, params, currentRoute) end


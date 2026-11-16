---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/breadcrumbManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds a route's breadcrumb for the router. For a non-global route, it optionally adds a module decorator at the head, then one crumb per node of the route chain (label, abstract, isMinorRoute, routeName, params). Titles can be static (string or non-dynamic table) or dynamic (source function called with the parameters, with fallback value).
--- Access: extension `ui_router_managers_breadcrumbManager`: `extensions.load("ui_router_managers_breadcrumbManager")`, then the global `ui_router_managers_breadcrumbManager`
---@class ui_router_managers_breadcrumbManager
ui_router_managers_breadcrumbManager = {}

--- Builds the list of crumbs for a route: optional decorator then one crumb per node returned by ui_router_routeManager.getRouteNodes(routename).
---Source: lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:72
---@param routename string Base route name.
---@param route table Route configuration (route.global disables the breadcrumb).
---@param params table|nil Route parameters (used for dynamic titles).
---@param decorator any|nil Already resolved decorator (otherwise computed if the decorator is visible).
---@return table[]  Crumbs {label, abstract, isMinorRoute, routeName, params}; the decorator is {label, routeName=nil, decorator=true}.
function ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator) end

--- Indicates whether the decorator is visible (NavigationState.isDecoratorVisible).
---Source: lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:100
---@return boolean  true if visible.
function ui_router_managers_breadcrumbManager.isDecoratorVisible() end

--- Shows or hides the decorator in the breadcrumb (delegates to NavigationState.setDecoratorVisible).
---Source: lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:96
---@param visible boolean true to show.
function ui_router_managers_breadcrumbManager.setDecoratorVisible(visible) end


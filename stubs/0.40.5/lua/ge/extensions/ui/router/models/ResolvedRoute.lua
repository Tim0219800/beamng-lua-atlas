---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/ResolvedRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Builds the canonical navigation entry (NavigationEntry) used everywhere in the router: {request, resolved, origin, toRoute, fromRoute, routeNode}. Once created, the entry is to be treated as immutable. Also provides the conversion to a storable/serializable form (without functions) and its validation.
--- Access: extension `ui_router_models_ResolvedRoute`: `extensions.load("ui_router_models_ResolvedRoute")`, then the global `ui_router_models_ResolvedRoute`
---@class ui_router_models_ResolvedRoute
ui_router_models_ResolvedRoute = {}

--- Deprecated alias: creates a request then the resolved route (moduleName added as extra).
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:179
---@param config table Route configuration.
---@param name string Road name.
---@param params table|nil Parameters.
---@param query table|nil Request.
---@param moduleName string|nil Module name.
---@return table  Resolved route.
function ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName) end

--- Creates the full navigation entry, with origin = {route = name of the previous request} if a previous entry exists.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:90
---@param routeConfig table Route configuration (becomes routeNode).
---@param request table Request.
---@param extras table|nil Extras for resolved.
---@param previousEntry table|nil Previous entry.
---@return table  {request, resolved, origin, toRoute, fromRoute, routeNode}.
function ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry) end

--- Deprecated alias, does nothing.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:176
function ui_router_models_ResolvedRoute.createNew() end

--- Creates the navigation request.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:41
---@param name string Canonical route name.
---@param params table|nil Parameters ({} by default).
---@param query table|nil Query parameters ({} by default).
---@param options table|nil Navigation options ({} by default).
---@param fullRoute string|nil Full reference base[:scope]; otherwise the canonical name.
---@return table  {name, fullRoute, params, query, options}.
function ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute) end

--- Builds the resolved route from the route configuration, the request and extras (copy without hooks or functions).
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:53
---@param routeConfig table|nil Route configuration.
---@param request table Request (name, params, query).
---@param extras table|nil Fields added into resolved (breadcrumbs, scope...).
---@return table  Resolved route.
function ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras) end

--- Rebuilds an entry from stored data (routeNode = nil; toRoute recomputed if absent).
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:129
---@param data table|nil Data produced by toStorable.
---@return table|nil  Navigation entry.
function ui_router_models_ResolvedRoute.fromStorable(data) end

--- Reduced compatibility view of a resolved route.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:80
---@param resolved table|nil Resolved route.
---@return table|nil  {name, screenId (or name), params, meta} or nil.
function ui_router_models_ResolvedRoute.toCompatRoute(resolved) end

--- Deprecated alias: minimal view {name, params, query}.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:186
---@param route table Road.
---@return table  {name, params, query}.
function ui_router_models_ResolvedRoute.toMinimal(route) end

--- Copies the entry removing the functions from resolved and the routeNode, for serialization.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:108
---@param entry table|nil Navigation entry.
---@return table|nil  {request, resolved, origin, toRoute, fromRoute}.
function ui_router_models_ResolvedRoute.toStorable(entry) end

--- Validates the structure of a navigation entry.
---Source: lua/ge/extensions/ui/router/models/ResolvedRoute.lua:141
---@param entry table|nil Entry to validate.
---@return boolean  true if valid.
---@return string[]  List of errors.
function ui_router_models_ResolvedRoute.validate(entry) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI router route manager. It builds the route tree from the root registry (routes.lua), the modules in the routes/ folder (via `include`), then overlays the runtime routes (synchronized Vue routes or routes registered by mods). It resolves a route by its dotted name (e.g. "menu.options"), applies `ui` configuration inheritance, computes the back target (`backTarget`) and reconciles the active route when routes change. A modder mainly uses it through registerModRoutes / unregisterModRoutes.
--- Access: extension `ui_router_routeManager`: `extensions.load("ui_router_routeManager")`, then the global `ui_router_routeManager`
---@class ui_router_routeManager
---@field RegisteredRoutes table<string, table> Cache of the resolved route trees by module name. Cleared by invalidateCache and rebuilt by resolveAllRoutes.
---@field RuntimeRouteModules table<string, table> Modules synthesized for route families that exist only at runtime (no file in routes/).
---@field RuntimeRoutes table<string, table> Route name -> winning definition coming from the runtime registry; overlaid on the static tree.
ui_router_routeManager = {}

--- Vue synchronization (dev/HMR): registers the raw route array in the reserved source "__vueSync". No reconciliation of the active route. Errors are logged.
---Source: lua/ge/extensions/ui/router/routeManager.lua:588
---@param routesObject table Raw Vue route array.
function ui_router_routeManager.addVueRoutes(routesObject) end

--- Returns the list (without duplicates) of all known route names: registered trees (except modules marked ExcludeFromDiscovery), global routes and effective runtime routes.
---Source: lua/ge/extensions/ui/router/routeManager.lua:342
---@return string[]  Dotted route names.
function ui_router_routeManager.getAllRoutes() end

--- Returns the `ContextDecorator` of the route's module, or by default { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }.
---Source: lua/ge/extensions/ui/router/routeManager.lua:597
---@param routeName string Dotted name of the route.
---@return table  Context decorator.
function ui_router_routeManager.getModuleDecorator(routeName) end

--- Returns the full configuration of a route (copy): `ui` inheritance applied, `name`, computed `backTarget` (non-abstract parent route, or fallbackTarget) and `screenId` (defaults to the name). Returns nil if the route does not exist.
---Source: lua/ge/extensions/ui/router/routeManager.lua:539
---@param routeKey string Dotted name of the route.
---@return table|nil  Route config.
function ui_router_routeManager.getRoute(routeKey) end

--- Returns the list of nodes from the root down to the requested route, each with `key` and `routeName`.
---Source: lua/ge/extensions/ui/router/routeManager.lua:553
---@param routeName string Dotted name of the route.
---@return table[]|nil  Nodes, or nil if a segment is not found.
function ui_router_routeManager.getRouteNodes(routeName) end

--- Registers (or replaces) the routes of a source, rebuilds the runtime state then reconciles the active route (reload or fallback).
---Source: lua/ge/extensions/ui/router/routeManager.lua:696
---@param sourceId string Non-empty identifier of the source (e.g. mod name).
---@param routes table Route array in Vue format (name, meta, children...).
---@param options table|nil `fallbackRoute`: fallback route if the active route disappears.
---@return table  {success, sourceId, isNew, names, added, removed, changed, reconciliation} or {success=false, errors}. reconciliation = {performed, action = none|fallback|reload, routeName, success, reason}.
function ui_router_routeManager.registerModRoutes(sourceId, routes, options) end

--- Removes only the "__vueSync" source; sources registered by mods remain. No reconciliation.
---Source: lua/ge/extensions/ui/router/routeManager.lua:611
function ui_router_routeManager.removeRuntimeRoutes() end

--- Clears the cache and rebuilds all route modules: reads the global module declared in routes.lua (`Global.include`), the root modules and the runtime modules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeManager.lua:722
function ui_router_routeManager.resolveAllRoutes() end

--- Resolves a possibly relative reference against a base route. References that do not start with '.' are returned as is.
---Source: lua/ge/extensions/ui/router/routeManager.lua:452
---@param reference string Absolute or relative reference ("./x", "../x").
---@param baseRouteName string|nil Base route (required for a relative reference).
---@return string|nil  Resolved name, or nil on failure.
---@return string|nil  Failure reason: "invalid_relative_route" or "relative_route_without_base".
function ui_router_routeManager.resolveRouteName(reference, baseRouteName) end

--- Removes a source from the registry, rebuilds the state and reconciles the active route. Removing an unknown source succeeds with existed=false.
---Source: lua/ge/extensions/ui/router/routeManager.lua:709
---@param sourceId string Source identifier.
---@param options table|nil `fallbackRoute`, as for registerModRoutes.
---@return table  Registry result + `reconciliation`.
function ui_router_routeManager.unregisterModRoutes(sourceId, options) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/runtimeRouteRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pure registry of runtime routes and parser of raw Vue routes, with no game-side effects. It turns a Vue route array into router configuration overrides and remembers which source owns each route name. routeManager consumes its "winners" to overlay them on the static Lua tree. Each instance (M.new()) keeps snapshots per sourceId, a stable registration order and per-name derivation (the most recent source wins, no composition).
--- Access: extension `ui_router_runtimeRouteRegistry`: `extensions.load("ui_router_runtimeRouteRegistry")`, then the global `ui_router_runtimeRouteRegistry`
---@class ui_router_runtimeRouteRegistry
ui_router_runtimeRouteRegistry = {}

--- Checks that a hook reference is a "module.func" string (split at the last dot, two non-empty parts).
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:44
---@param ref string|any Reference to test.
---@return boolean  true if valid.
function ui_router_runtimeRouteRegistry.isValidHookRef(ref) end

--- Creates an isolated registry instance (routeManager holds one; tests create as many as needed). Instance methods: register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} or {success=false, errors}; unregister(sourceId) -> {success, existed, added, removed, changed}; getEffectiveRoutes(); getEffectiveNames() (sorted); getRoute(name); getRouteSource(name); hasRoute(name); hasSource(sourceId); getSourceOrder(); clear().
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:389
---@return table  Registry instance.
function ui_router_runtimeRouteRegistry.new() end

--- Parses a raw Vue route array into an ordered list of names and a name -> configuration override table. Descends into the `children` of named or unnamed nodes. Any error rejects the whole.
---Source: lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:155
---@param rawRoutes table Vue route array (name, meta, children).
---@return table  { ok = boolean, errors = string[], names = string[], definitions = table<string, table> }
function ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes) end


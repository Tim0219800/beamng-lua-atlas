---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_routeManager` : `extensions.load("ui_router_routeManager")`, puis la globale `ui_router_routeManager`
---@class ui_router_routeManager
---@field RegisteredRoutes table
---@field RuntimeRouteModules table
---@field RuntimeRoutes table
ui_router_routeManager = {}

--- Non-reconciling Vue dev/HMR sync entry point. Routes flow into the reserved
---  Vue-sync source only, so this can never disturb mod-registered sources. Active
---  route reconciliation is intentionally not performed here.
---Source : lua/ge/extensions/ui/router/routeManager.lua:588
---@param routesObject any
function ui_router_routeManager.addVueRoutes(routesObject) end

---Source : lua/ge/extensions/ui/router/routeManager.lua:342
function ui_router_routeManager.getAllRoutes() end

---Source : lua/ge/extensions/ui/router/routeManager.lua:597
---@param routeName any
function ui_router_routeManager.getModuleDecorator(routeName) end

---Source : lua/ge/extensions/ui/router/routeManager.lua:539
---@param routeKey any
function ui_router_routeManager.getRoute(routeKey) end

---Source : lua/ge/extensions/ui/router/routeManager.lua:553
---@param routeName any
function ui_router_routeManager.getRouteNodes(routeName) end

---Source : lua/ge/extensions/ui/router/routeManager.lua:696
---@param sourceId any
---@param routes any
---@param options any
function ui_router_routeManager.registerModRoutes(sourceId, routes, options) end

--- Non-reconciling counterpart to addVueRoutes: clears only the reserved
---  Vue-sync source, leaving any mod-registered runtime sources intact.
---Source : lua/ge/extensions/ui/router/routeManager.lua:611
function ui_router_routeManager.removeRuntimeRoutes() end

---Source : lua/ge/extensions/ui/router/routeManager.lua:722
function ui_router_routeManager.resolveAllRoutes() end

--- Resolve a possibly-relative route reference against a base (committed) route
---  name. Absolute references (dotted names, global one-segment names, and
---  '/'-prefixed names) pass through unchanged. Relative references use '.' /
---  '..' segments separated by '/', e.g. "./child", "../sibling", "../../x".
---  Returns resolvedName, nil on success or nil, errorReason on failure.
---Source : lua/ge/extensions/ui/router/routeManager.lua:452
---@param reference any
---@param baseRouteName any
function ui_router_routeManager.resolveRouteName(reference, baseRouteName) end

---Source : lua/ge/extensions/ui/router/routeManager.lua:709
---@param sourceId any
---@param options any
function ui_router_routeManager.unregisterModRoutes(sourceId, options) end


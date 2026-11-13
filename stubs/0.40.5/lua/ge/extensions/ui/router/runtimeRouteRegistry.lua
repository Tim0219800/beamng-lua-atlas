---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/runtimeRouteRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_runtimeRouteRegistry` : `extensions.load("ui_router_runtimeRouteRegistry")`, puis la globale `ui_router_runtimeRouteRegistry`
---@class ui_router_runtimeRouteRegistry
ui_router_runtimeRouteRegistry = {}

--- Lifecycle hooks must stay declarative "module.func" string references.
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:44
---@param ref any
function ui_router_runtimeRouteRegistry.isValidHookRef(ref) end

--- Create an isolated registry instance. The route manager holds one; tests can
---  spin up as many independent instances as they need.
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:389
function ui_router_runtimeRouteRegistry.new() end

--- Parse a raw Vue route array into an ordered list of route names and a
---  name -> route-config-overlay map. Recurses into `children` for both named and
---  unnamed nodes. Any error rejects the whole parse (transactional).
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:155
---@param rawRoutes any
function ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes) end


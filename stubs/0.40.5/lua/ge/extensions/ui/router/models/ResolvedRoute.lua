---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/ResolvedRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_models_ResolvedRoute` : `extensions.load("ui_router_models_ResolvedRoute")`, puis la globale `ui_router_models_ResolvedRoute`
---@class ui_router_models_ResolvedRoute
ui_router_models_ResolvedRoute = {}

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:179
---@param config any
---@param name any
---@param params any
---@param query any
---@param moduleName any
function ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:90
---@param routeConfig any
---@param request any
---@param extras any
---@param previousEntry any
function ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:176
function ui_router_models_ResolvedRoute.createNew() end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:41
---@param name any
---@param params any
---@param query any
---@param options any
---@param fullRoute any
function ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:53
---@param routeConfig any
---@param request any
---@param extras any
function ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:129
---@param data any
function ui_router_models_ResolvedRoute.fromStorable(data) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:80
---@param resolved any
function ui_router_models_ResolvedRoute.toCompatRoute(resolved) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:186
---@param route any
function ui_router_models_ResolvedRoute.toMinimal(route) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:108
---@param entry any
function ui_router_models_ResolvedRoute.toStorable(entry) end

---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:141
---@param entry any
function ui_router_models_ResolvedRoute.validate(entry) end


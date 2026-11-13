---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/models/ResolvedRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit l'entrée de navigation canonique (NavigationEntry) utilisée partout dans le routeur : {request, resolved, origin, toRoute, fromRoute, routeNode}. Une fois créée, l'entrée est à traiter comme immuable. Fournit aussi la conversion en forme stockable/sérialisable (sans fonctions) et sa validation.
--- Accès : extension `ui_router_models_ResolvedRoute` : `extensions.load("ui_router_models_ResolvedRoute")`, puis la globale `ui_router_models_ResolvedRoute`
---@class ui_router_models_ResolvedRoute
ui_router_models_ResolvedRoute = {}

--- Alias déprécié : crée une requête puis la route résolue (moduleName ajouté en extra).
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:179
---@param config table Configuration de route.
---@param name string Nom de route.
---@param params table|nil Paramètres.
---@param query table|nil Requête.
---@param moduleName string|nil Nom du module.
---@return table  Route résolue.
function ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName) end

--- Crée l'entrée de navigation complète, avec origin = {route = nom de la requête précédente} si une entrée précédente existe.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:90
---@param routeConfig table Configuration de route (devient routeNode).
---@param request table Requête.
---@param extras table|nil Extras pour resolved.
---@param previousEntry table|nil Entrée précédente.
---@return table  {request, resolved, origin, toRoute, fromRoute, routeNode}.
function ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry) end

--- Alias déprécié, ne fait rien.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:176
function ui_router_models_ResolvedRoute.createNew() end

--- Crée la requête de navigation.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:41
---@param name string Nom canonique de la route.
---@param params table|nil Paramètres ({} par défaut).
---@param query table|nil Paramètres de requête ({} par défaut).
---@param options table|nil Options de navigation ({} par défaut).
---@param fullRoute string|nil Référence complète base[:scope] ; sinon le nom canonique.
---@return table  {name, fullRoute, params, query, options}.
function ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute) end

--- Construit la route résolue à partir de la configuration de route, de la requête et d'extras (copie sans hooks ni fonctions).
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:53
---@param routeConfig table|nil Configuration de route.
---@param request table Requête (name, params, query).
---@param extras table|nil Champs ajoutés dans resolved (breadcrumbs, scope…).
---@return table  Route résolue.
function ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras) end

--- Reconstruit une entrée à partir de données stockées (routeNode = nil ; toRoute recalculé si absent).
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:129
---@param data table|nil Données produites par toStorable.
---@return table|nil  Entrée de navigation.
function ui_router_models_ResolvedRoute.fromStorable(data) end

--- Vue réduite de compatibilité d'une route résolue.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:80
---@param resolved table|nil Route résolue.
---@return table|nil  {name, screenId (ou name), params, meta} ou nil.
function ui_router_models_ResolvedRoute.toCompatRoute(resolved) end

--- Alias déprécié : vue minimale {name, params, query}.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:186
---@param route table Route.
---@return table  {name, params, query}.
function ui_router_models_ResolvedRoute.toMinimal(route) end

--- Copie l'entrée en retirant les fonctions de resolved et le routeNode, pour sérialisation.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:108
---@param entry table|nil Entrée de navigation.
---@return table|nil  {request, resolved, origin, toRoute, fromRoute}.
function ui_router_models_ResolvedRoute.toStorable(entry) end

--- Valide la structure d'une entrée de navigation.
---Source : lua/ge/extensions/ui/router/models/ResolvedRoute.lua:141
---@param entry table|nil Entrée à valider.
---@return boolean  true si valide.
---@return string[]  Liste des erreurs.
function ui_router_models_ResolvedRoute.validate(entry) end


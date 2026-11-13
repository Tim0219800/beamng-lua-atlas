---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/services/routeResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Service OBSOLÈTE du routeur UI : le flux principal construit désormais les NavigationEntries directement avec ResolvedRoute.createEntry(). Ce module reste pour d'éventuels appelants externes : il résout un nom de route en table résolue et compare deux routes.
--- Accès : extension `ui_router_services_routeResolver` : `extensions.load("ui_router_services_routeResolver")`, puis la globale `ui_router_services_routeResolver`
---@class ui_router_services_routeResolver
ui_router_services_routeResolver = {}

--- Compare deux routes : même `name` et mêmes `params` (comparaison valeur à valeur, non récursive).
---Source : lua/ge/extensions/ui/router/services/routeResolver.lua:42
---@param routeA table Première route.
---@param routeB table Seconde route.
---@return boolean  true si identiques ; false si l'une est nil.
function ui_router_services_routeResolver.isEqualRoutes(routeA, routeB) end

--- Résout un nom de route (relatif possible, résolu avec utils.resolveRelativeRoute si une route courante est fournie) en route résolue via routeManager.getRoute puis ResolvedRoute.createResolved. Renvoie nil avec un avertissement si la route est introuvable ou la création échoue. Obsolète.
---Source : lua/ge/extensions/ui/router/services/routeResolver.lua:15
---@param routeName string Nom de la route.
---@param params table|nil Paramètres de la requête.
---@param currentRoute table|nil Route courante (pour les noms relatifs).
---@return table|nil  Route résolue.
function ui_router_services_routeResolver.resolve(routeName, params, currentRoute) end


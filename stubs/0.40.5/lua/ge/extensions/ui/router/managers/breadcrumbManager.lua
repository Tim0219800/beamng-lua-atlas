---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/breadcrumbManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Construit le fil d'Ariane (breadcrumbs) d'une route pour le routeur. Pour une route non globale, il ajoute éventuellement un décorateur de module en tête, puis une miette par nœud de la chaîne de routes (label, abstract, isMinorRoute, routeName, params). Les titres peuvent être statiques (chaîne ou table non dynamique) ou dynamiques (fonction source appelée avec les paramètres, avec valeur de repli).
--- Accès : extension `ui_router_managers_breadcrumbManager` : `extensions.load("ui_router_managers_breadcrumbManager")`, puis la globale `ui_router_managers_breadcrumbManager`
---@class ui_router_managers_breadcrumbManager
ui_router_managers_breadcrumbManager = {}

--- Construit la liste des miettes pour une route : décorateur éventuel puis une miette par nœud renvoyé par ui_router_routeManager.getRouteNodes(routename).
---Source : lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:72
---@param routename string Nom de route de base.
---@param route table Configuration de la route (route.global désactive le fil d'Ariane).
---@param params table|nil Paramètres de route (utilisés pour les titres dynamiques).
---@param decorator any|nil Décorateur déjà résolu (sinon calculé si le décorateur est visible).
---@return table[]  Miettes {label, abstract, isMinorRoute, routeName, params} ; le décorateur est {label, routeName=nil, decorator=true}.
function ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator) end

--- Indique si le décorateur est visible (NavigationState.isDecoratorVisible).
---Source : lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:100
---@return boolean  true si visible.
function ui_router_managers_breadcrumbManager.isDecoratorVisible() end

--- Affiche ou masque le décorateur dans le fil d'Ariane (délègue à NavigationState.setDecoratorVisible).
---Source : lua/ge/extensions/ui/router/managers/breadcrumbManager.lua:96
---@param visible boolean true pour afficher.
function ui_router_managers_breadcrumbManager.setDecoratorVisible(visible) end


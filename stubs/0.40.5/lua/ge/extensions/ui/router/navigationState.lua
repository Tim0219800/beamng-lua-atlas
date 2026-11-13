---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mémoire d'état du routeur d'interface : entrée précédente, entrée courante et entrée en attente (pending), état du décorateur de fil d'Ariane, et dernière portée active par route. Il fournit les accesseurs, la promotion d'une entrée en attente en entrée courante, la sérialisation (pour survivre au rechargement des extensions Lua) et la réinitialisation. Aucune logique de navigation : c'est le routeur qui décide.
--- Accès : extension `ui_router_navigationState` : `extensions.load("ui_router_navigationState")`, puis la globale `ui_router_navigationState`
---@class ui_router_navigationState
ui_router_navigationState = {}

--- Réinitialise le décorateur (valeur et module à nil, visibilité par défaut de la config).
---Source : lua/ge/extensions/ui/router/navigationState.lua:132
function ui_router_navigationState.clearDecorator() end

--- Oublie la dernière portée active d'une route (ignoré si routeName est nil).
---Source : lua/ge/extensions/ui/router/navigationState.lua:26
---@param routeName string|nil Nom de route.
function ui_router_navigationState.clearLastActiveScope(routeName) end

--- Supprime l'entrée en attente non validée.
---Source : lua/ge/extensions/ui/router/navigationState.lua:44
function ui_router_navigationState.clearPendingEntry() end

--- Restaure l'état depuis les données de serialize (sans effet si data est nil). Sans champ decorator, le décorateur est réinitialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationState.lua:153
---@param data table|nil Données produites par serialize.
function ui_router_navigationState.deserialize(data) end

--- Renvoie le fil d'Ariane de l'entrée courante ({} si aucun).
---Source : lua/ge/extensions/ui/router/navigationState.lua:82
---@return table[]  Miettes de pain.
function ui_router_navigationState.getBreadcrumbs() end

--- Renvoie l'entrée de navigation courante (validée).
---Source : lua/ge/extensions/ui/router/navigationState.lua:54
---@return table|nil  Entrée {request, resolved, origin, toRoute, fromRoute, routeNode}.
function ui_router_navigationState.getCurrentEntry() end

--- Raccourci de compatibilité : renvoie l'entrée courante complète (voir notes).
---Source : lua/ge/extensions/ui/router/navigationState.lua:70
---@return table|nil  Entrée courante.
function ui_router_navigationState.getCurrentResolved() end

--- Renvoie la configuration de route (routeNode, avec ses hooks) de l'entrée courante.
---Source : lua/ge/extensions/ui/router/navigationState.lua:74
---@return table|nil  Nœud de route.
function ui_router_navigationState.getCurrentRouteNode() end

--- Renvoie la valeur du décorateur.
---Source : lua/ge/extensions/ui/router/navigationState.lua:116
---@return any  Décorateur ou nil.
function ui_router_navigationState.getDecorator() end

--- Renvoie le module propriétaire du décorateur.
---Source : lua/ge/extensions/ui/router/navigationState.lua:120
---@return string|nil  Nom du module.
function ui_router_navigationState.getDecoratorModule() end

--- Renvoie la dernière portée active mémorisée pour la route.
---Source : lua/ge/extensions/ui/router/navigationState.lua:22
---@param routeName string Nom de route.
---@return string|nil  Identifiant de portée.
function ui_router_navigationState.getLastActiveScope(routeName) end

--- Renvoie l'entrée en attente.
---Source : lua/ge/extensions/ui/router/navigationState.lua:58
---@return table|nil  Entrée en attente.
function ui_router_navigationState.getPendingEntry() end

--- Renvoie le routeNode de l'entrée en attente.
---Source : lua/ge/extensions/ui/router/navigationState.lua:78
---@return table|nil  Nœud de route.
function ui_router_navigationState.getPendingRouteNode() end

--- Renvoie l'entrée précédente.
---Source : lua/ge/extensions/ui/router/navigationState.lua:62
---@return table|nil  Entrée précédente.
function ui_router_navigationState.getPreviousEntry() end

--- Indique si le décorateur est visible.
---Source : lua/ge/extensions/ui/router/navigationState.lua:128
---@return boolean  Visibilité.
function ui_router_navigationState.isDecoratorVisible() end

--- Promeut l'entrée en attente en entrée courante (l'ancienne courante devient précédente).
---Source : lua/ge/extensions/ui/router/navigationState.lua:48
function ui_router_navigationState.promotePendingEntry() end

--- Raccourci de compatibilité : appelle promotePendingEntry.
---Source : lua/ge/extensions/ui/router/navigationState.lua:95
function ui_router_navigationState.promotePendingStates() end

--- Remet à zéro les trois entrées, les dernières portées actives et le décorateur.
---Source : lua/ge/extensions/ui/router/navigationState.lua:167
function ui_router_navigationState.reset() end

--- Sérialise les entrées précédente/courante/en attente (formes stockables) et le décorateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationState.lua:140
---@return table  {previousEntry, currentEntry, pendingEntry, decorator={value, moduleName, visible}}.
function ui_router_navigationState.serialize() end

--- Définit la valeur du décorateur et son module.
---Source : lua/ge/extensions/ui/router/navigationState.lua:111
---@param value any Valeur du décorateur.
---@param moduleName string Module propriétaire (premier segment du nom de route).
function ui_router_navigationState.setDecorator(value, moduleName) end

--- Affiche ou masque le décorateur.
---Source : lua/ge/extensions/ui/router/navigationState.lua:124
---@param visible boolean Visibilité.
function ui_router_navigationState.setDecoratorVisible(visible) end

--- Mémorise la dernière portée active d'une route.
---Source : lua/ge/extensions/ui/router/navigationState.lua:18
---@param routeName string Nom de route.
---@param scopeId string Identifiant de portée.
function ui_router_navigationState.setLastActiveScope(routeName, scopeId) end

--- Définit l'entrée de navigation en attente de validation par le framework.
---Source : lua/ge/extensions/ui/router/navigationState.lua:38
---@param entry table Entrée de navigation.
function ui_router_navigationState.setPendingEntry(entry) end

--- Raccourci de compatibilité : construit l'entrée en attente à partir d'un routeNode et de {request, resolved, origin}.
---Source : lua/ge/extensions/ui/router/navigationState.lua:86
---@param routeNode table Nœud de route.
---@param data table {request, resolved, origin}.
function ui_router_navigationState.setPendingState(routeNode, data) end

--- Raccourci de compatibilité : ne fait rien.
---Source : lua/ge/extensions/ui/router/navigationState.lua:99
function ui_router_navigationState.setRequest() end


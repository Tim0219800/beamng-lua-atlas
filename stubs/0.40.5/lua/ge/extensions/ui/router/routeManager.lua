---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des routes du routeur UI. Il construit l'arbre des routes à partir du registre racine (routes.lua), des modules du dossier routes/ (via les `include`), puis y superpose les routes d'exécution (routes Vue synchronisées ou routes enregistrées par des mods). Il résout une route par son nom pointé (ex. « menu.options »), applique l'héritage de la configuration `ui`, calcule la cible de retour (`backTarget`) et réconcilie la route active quand les routes changent. Un moddeur l'utilise surtout via registerModRoutes / unregisterModRoutes.
--- Accès : extension `ui_router_routeManager` : `extensions.load("ui_router_routeManager")`, puis la globale `ui_router_routeManager`
---@class ui_router_routeManager
---@field RegisteredRoutes table<string, table> Cache des arbres de routes résolus par nom de module. Vidé par invalidateCache et reconstruit par resolveAllRoutes.
---@field RuntimeRouteModules table<string, table> Modules synthétisés pour les familles de routes qui n'existent qu'à l'exécution (aucun fichier dans routes/).
---@field RuntimeRoutes table<string, table> Nom de route -> définition gagnante venant du registre d'exécution ; superposée à l'arbre statique.
ui_router_routeManager = {}

--- Synchronisation Vue (dev/HMR) : enregistre le tableau de routes brut dans la source réservée « __vueSync ». Sans réconciliation de la route active. Les erreurs sont journalisées.
---Source : lua/ge/extensions/ui/router/routeManager.lua:588
---@param routesObject table Tableau de routes Vue brut.
function ui_router_routeManager.addVueRoutes(routesObject) end

--- Renvoie la liste (sans doublon) de tous les noms de routes connus : arbres enregistrés (sauf modules marqués ExcludeFromDiscovery), routes globales et routes d'exécution effectives.
---Source : lua/ge/extensions/ui/router/routeManager.lua:342
---@return string[]  Noms de routes pointés.
function ui_router_routeManager.getAllRoutes() end

--- Renvoie le `ContextDecorator` du module de la route, ou par défaut { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }.
---Source : lua/ge/extensions/ui/router/routeManager.lua:597
---@param routeName string Nom pointé de la route.
---@return table  Décorateur de contexte.
function ui_router_routeManager.getModuleDecorator(routeName) end

--- Renvoie la configuration complète d'une route (copie) : héritage `ui` appliqué, `name`, `backTarget` calculé (route parente non abstraite, ou fallbackTarget) et `screenId` (par défaut le nom). Renvoie nil si la route n'existe pas.
---Source : lua/ge/extensions/ui/router/routeManager.lua:539
---@param routeKey string Nom pointé de la route.
---@return table|nil  Config de la route.
function ui_router_routeManager.getRoute(routeKey) end

--- Renvoie la liste des nœuds de la racine jusqu'à la route demandée, chacun avec `key` et `routeName`.
---Source : lua/ge/extensions/ui/router/routeManager.lua:553
---@param routeName string Nom pointé de la route.
---@return table[]|nil  Nœuds, ou nil si un segment est introuvable.
function ui_router_routeManager.getRouteNodes(routeName) end

--- Enregistre (ou remplace) les routes d'une source, reconstruit l'état d'exécution puis réconcilie la route active (rechargement ou repli).
---Source : lua/ge/extensions/ui/router/routeManager.lua:696
---@param sourceId string Identifiant non vide de la source (ex. nom du mod).
---@param routes table Tableau de routes au format Vue (name, meta, children…).
---@param options table|nil `fallbackRoute` : route de repli si la route active disparaît.
---@return table  {success, sourceId, isNew, names, added, removed, changed, reconciliation} ou {success=false, errors}. reconciliation = {performed, action = none|fallback|reload, routeName, success, reason}.
function ui_router_routeManager.registerModRoutes(sourceId, routes, options) end

--- Supprime uniquement la source « __vueSync » ; les sources enregistrées par des mods restent. Sans réconciliation.
---Source : lua/ge/extensions/ui/router/routeManager.lua:611
function ui_router_routeManager.removeRuntimeRoutes() end

--- Vide le cache et reconstruit tous les modules de routes : lit le module global déclaré dans routes.lua (`Global.include`), les modules racines et les modules d'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.lua:722
function ui_router_routeManager.resolveAllRoutes() end

--- Résout une référence éventuellement relative par rapport à une route de base. Les références qui ne commencent pas par '.' sont renvoyées telles quelles.
---Source : lua/ge/extensions/ui/router/routeManager.lua:452
---@param reference string Référence absolue ou relative (« ./x », « ../x »).
---@param baseRouteName string|nil Route de base (requise pour une référence relative).
---@return string|nil  Nom résolu, ou nil en cas d'échec.
---@return string|nil  Raison de l'échec : « invalid_relative_route » ou « relative_route_without_base ».
function ui_router_routeManager.resolveRouteName(reference, baseRouteName) end

--- Retire une source du registre, reconstruit l'état et réconcilie la route active. Retirer une source inconnue réussit avec existed=false.
---Source : lua/ge/extensions/ui/router/routeManager.lua:709
---@param sourceId string Identifiant de la source.
---@param options table|nil `fallbackRoute`, comme pour registerModRoutes.
---@return table  Résultat du registre + `reconciliation`.
function ui_router_routeManager.unregisterModRoutes(sourceId, options) end


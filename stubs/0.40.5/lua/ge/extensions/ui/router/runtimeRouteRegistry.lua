---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/runtimeRouteRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre pur des routes d'exécution et analyseur de routes Vue brutes, sans effet de bord côté jeu. Il transforme un tableau de routes Vue en surcharges de configuration du routeur et mémorise quelle source possède chaque nom de route. routeManager en consomme les « gagnants » pour les superposer à l'arbre Lua statique. Chaque instance (M.new()) garde des instantanés par sourceId, un ordre stable d'enregistrement et la dérivation par nom (la source la plus récente gagne, sans composition).
--- Accès : extension `ui_router_runtimeRouteRegistry` : `extensions.load("ui_router_runtimeRouteRegistry")`, puis la globale `ui_router_runtimeRouteRegistry`
---@class ui_router_runtimeRouteRegistry
ui_router_runtimeRouteRegistry = {}

--- Vérifie qu'une référence de hook est une chaîne « module.func » (séparation au dernier point, deux parties non vides).
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:44
---@param ref string|any Référence à tester.
---@return boolean  true si valide.
function ui_router_runtimeRouteRegistry.isValidHookRef(ref) end

--- Crée une instance de registre isolée (routeManager en détient une ; les tests en créent à volonté). Méthodes de l'instance : register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} ou {success=false, errors} ; unregister(sourceId) -> {success, existed, added, removed, changed} ; getEffectiveRoutes() ; getEffectiveNames() (triés) ; getRoute(name) ; getRouteSource(name) ; hasRoute(name) ; hasSource(sourceId) ; getSourceOrder() ; clear().
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:389
---@return table  Instance de registre.
function ui_router_runtimeRouteRegistry.new() end

--- Analyse un tableau de routes Vue brut en liste ordonnée de noms et table nom -> surcharge de configuration. Descend dans `children` des nœuds nommés ou non. Toute erreur rejette l'ensemble.
---Source : lua/ge/extensions/ui/router/runtimeRouteRegistry.lua:155
---@param rawRoutes table Tableau de routes Vue (name, meta, children).
---@return table  { ok = boolean, errors = string[], names = string[], definitions = table<string, table> }
function ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/scopeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les portées (scopes) de focus d'une route d'interface. Une route déclare un arbre de portées (scopeTree) ; ce module détermine la portée cible d'une navigation, vérifie qu'une portée existe dans l'arbre et construit la table parent de chaque portée avec ses métadonnées (backTarget, optional, escapeTargets, preferAutoFocus…).
--- Accès : extension `ui_router_managers_scopeManager` : `extensions.load("ui_router_managers_scopeManager")`, puis la globale `ui_router_managers_scopeManager`
---@class ui_router_managers_scopeManager
ui_router_managers_scopeManager = {}

--- Parcourt l'arbre de portées et renvoie une table indexée par identifiant de portée.
---Source : lua/ge/extensions/ui/router/managers/scopeManager.lua:67
---@param scopeTree table|nil Arbre de portées ; nil donne {}.
---@return table<string, table>  Pour chaque portée : {parentScopeId (false pour la racine), isRoot, backTarget, backTargetType, optional (booléen), escapeTargets, preferAutoFocus (booléen)}.
function ui_router_managers_scopeManager.buildScopeParentMap(scopeTree) end

--- Détermine la portée cible d'une navigation selon la priorité décrite dans les notes.
---Source : lua/ge/extensions/ui/router/managers/scopeManager.lua:38
---@param route table Configuration de route (name, scopeTree, targetScope).
---@param options table|nil Options de navigation : routeScopeId, preferredScope, restoreLastScope.
---@return table  {targetScope = string|nil}.
function ui_router_managers_scopeManager.getTargetScope(route, options) end

--- Indique si scopeId est une portée déclarée dans l'arbre.
---Source : lua/ge/extensions/ui/router/managers/scopeManager.lua:24
---@param scopeTree table|nil Arbre de portées de la route.
---@param scopeId string|nil Identifiant de portée (chaîne non vide).
---@return boolean  true si la portée existe dans l'arbre.
function ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId) end


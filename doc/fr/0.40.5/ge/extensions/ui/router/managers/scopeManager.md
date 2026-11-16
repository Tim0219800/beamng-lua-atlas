# `ui_router_managers_scopeManager`

*Fichier : `lua/ge/extensions/ui/router/managers/scopeManager.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_scopeManager` : `extensions.load("ui_router_managers_scopeManager")`, puis la globale `ui_router_managers_scopeManager`

Gère les portées (scopes) de focus d'une route d'interface. Une route déclare un arbre de portées (scopeTree) ; ce module détermine la portée cible d'une navigation, vérifie qu'une portée existe dans l'arbre et construit la table parent de chaque portée avec ses métadonnées (backTarget, optional, escapeTargets, preferAutoFocus…).

## Remarques

- Priorité de la portée cible : options.routeScopeId (suffixe :scope de la route), puis options.preferredScope, puis (si options.restoreLastScope == true) la dernière portée active mémorisée si elle est encore déclarée dans l'arbre (sinon elle est oubliée), puis route.targetScope, puis la première clé de route.scopeTree.
- Si routeScopeId et preferredScope sont tous deux fournis, un avertissement est journalisé et routeScopeId l'emporte.
- Clés réservées d'un nœud de portée (non traitées comme des portées enfants) : backTarget, backTargetType, optional, escapeTargets, preferAutoFocus.
- getScopeTreeRoot utilise pairs sur la table : si l'arbre a plusieurs racines, la « première » clé est indéterminée (ordre de pairs).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_scopeManager.buildScopeParentMap(scopeTree)` | Parcourt l'arbre de portées et renvoie une table indexée par identifiant de portée. | 67 |
| `ui_router_managers_scopeManager.getTargetScope(route, options)` | Détermine la portée cible d'une navigation selon la priorité décrite dans les notes. | 38 |
| `ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId)` | Indique si scopeId est une portée déclarée dans l'arbre. | 24 |

### Détail des paramètres

#### `ui_router_managers_scopeManager.buildScopeParentMap(scopeTree)`

Parcourt l'arbre de portées et renvoie une table indexée par identifiant de portée.

- `scopeTree` (*table|nil*) : Arbre de portées ; nil donne {}.
- **renvoie** : table<string, table> Pour chaque portée : {parentScopeId (false pour la racine), isRoot, backTarget, backTargetType, optional (booléen), escapeTargets, preferAutoFocus (booléen)}.

#### `ui_router_managers_scopeManager.getTargetScope(route, options)`

Détermine la portée cible d'une navigation selon la priorité décrite dans les notes.

- `route` (*table*) : Configuration de route (name, scopeTree, targetScope).
- `options` (*table|nil*) : Options de navigation : routeScopeId, preferredScope, restoreLastScope.
- **renvoie** : table {targetScope = string|nil}.

#### `ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId)`

Indique si scopeId est une portée déclarée dans l'arbre.

- `scopeTree` (*table|nil*) : Arbre de portées de la route.
- `scopeId` (*string|nil*) : Identifiant de portée (chaîne non vide).
- **renvoie** : boolean true si la portée existe dans l'arbre.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/scopeManager.lua`.*

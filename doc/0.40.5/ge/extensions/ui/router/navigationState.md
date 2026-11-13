# `ui_router_navigationState`

*Fichier : `lua/ge/extensions/ui/router/navigationState.lua` · VM : Game Engine (GE) · 176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationState` : `extensions.load("ui_router_navigationState")`, puis la globale `ui_router_navigationState`

Mémoire d'état du routeur d'interface : entrée précédente, entrée courante et entrée en attente (pending), état du décorateur de fil d'Ariane, et dernière portée active par route. Il fournit les accesseurs, la promotion d'une entrée en attente en entrée courante, la sérialisation (pour survivre au rechargement des extensions Lua) et la réinitialisation. Aucune logique de navigation : c'est le routeur qui décide.

## Remarques

- promotePendingEntry décale : previous = current, current = pending, pending = nil. clearPendingEntry abandonne l'entrée en attente (timeout, rejet, annulation, préemption).
- Les fonctions « Compatibility shims » (getCurrentResolved, getCurrentRouteNode, getPendingRouteNode, getBreadcrumbs, setPendingState, promotePendingStates, setRequest) conservent les formes de retour de l'ancienne API ; setRequest ne fait rien. Attention : getCurrentResolved renvoie l'entrée complète (currentEntry) et non sa partie resolved.
- Le décorateur : {value, moduleName, visible} ; visible vaut au départ Config.ShowContextDecoratorInBreadcrumbs.
- serialize/deserialize utilisent ResolvedRoute.toStorable/fromStorable (routeNode et fonctions non conservés). lastActiveScopeByRoute n'est pas sérialisé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationState.clearDecorator()` | Réinitialise le décorateur (valeur et module à nil, visibilité par défaut de la config). | 132 |
| `ui_router_navigationState.clearLastActiveScope(routeName)` | Oublie la dernière portée active d'une route (ignoré si routeName est nil). | 26 |
| `ui_router_navigationState.clearPendingEntry()` | Supprime l'entrée en attente non validée. | 44 |
| `ui_router_navigationState.deserialize(data)` | Restaure l'état depuis les données de serialize (sans effet si data est nil). Sans champ decorator, le décorateur est réinitialisé. *(interne)* | 153 |
| `ui_router_navigationState.getBreadcrumbs()` | Renvoie le fil d'Ariane de l'entrée courante ({} si aucun). | 82 |
| `ui_router_navigationState.getCurrentEntry()` | Renvoie l'entrée de navigation courante (validée). | 54 |
| `ui_router_navigationState.getCurrentResolved()` | Raccourci de compatibilité : renvoie l'entrée courante complète (voir notes). | 70 |
| `ui_router_navigationState.getCurrentRouteNode()` | Renvoie la configuration de route (routeNode, avec ses hooks) de l'entrée courante. | 74 |
| `ui_router_navigationState.getDecorator()` | Renvoie la valeur du décorateur. | 116 |
| `ui_router_navigationState.getDecoratorModule()` | Renvoie le module propriétaire du décorateur. | 120 |
| `ui_router_navigationState.getLastActiveScope(routeName)` | Renvoie la dernière portée active mémorisée pour la route. | 22 |
| `ui_router_navigationState.getPendingEntry()` | Renvoie l'entrée en attente. | 58 |
| `ui_router_navigationState.getPendingRouteNode()` | Renvoie le routeNode de l'entrée en attente. | 78 |
| `ui_router_navigationState.getPreviousEntry()` | Renvoie l'entrée précédente. | 62 |
| `ui_router_navigationState.isDecoratorVisible()` | Indique si le décorateur est visible. | 128 |
| `ui_router_navigationState.promotePendingEntry()` | Promeut l'entrée en attente en entrée courante (l'ancienne courante devient précédente). | 48 |
| `ui_router_navigationState.promotePendingStates()` | Raccourci de compatibilité : appelle promotePendingEntry. | 95 |
| `ui_router_navigationState.reset()` | Remet à zéro les trois entrées, les dernières portées actives et le décorateur. | 167 |
| `ui_router_navigationState.serialize()` | Sérialise les entrées précédente/courante/en attente (formes stockables) et le décorateur. *(interne)* | 140 |
| `ui_router_navigationState.setDecorator(value, moduleName)` | Définit la valeur du décorateur et son module. | 111 |
| `ui_router_navigationState.setDecoratorVisible(visible)` | Affiche ou masque le décorateur. | 124 |
| `ui_router_navigationState.setLastActiveScope(routeName, scopeId)` | Mémorise la dernière portée active d'une route. | 18 |
| `ui_router_navigationState.setPendingEntry(entry)` | Définit l'entrée de navigation en attente de validation par le framework. | 38 |
| `ui_router_navigationState.setPendingState(routeNode, data)` | Raccourci de compatibilité : construit l'entrée en attente à partir d'un routeNode et de {request, resolved, origin}. | 86 |
| `ui_router_navigationState.setRequest()` | Raccourci de compatibilité : ne fait rien. | 99 |

### Détail des paramètres

#### `ui_router_navigationState.clearLastActiveScope(routeName)`

Oublie la dernière portée active d'une route (ignoré si routeName est nil).

- `routeName` (*string|nil*) : Nom de route.

#### `ui_router_navigationState.deserialize(data)`

Restaure l'état depuis les données de serialize (sans effet si data est nil). Sans champ decorator, le décorateur est réinitialisé.

- `data` (*table|nil*) : Données produites par serialize.

#### `ui_router_navigationState.getBreadcrumbs()`

Renvoie le fil d'Ariane de l'entrée courante ({} si aucun).

- **renvoie** : table[] Miettes de pain.

#### `ui_router_navigationState.getCurrentEntry()`

Renvoie l'entrée de navigation courante (validée).

- **renvoie** : table|nil Entrée {request, resolved, origin, toRoute, fromRoute, routeNode}.

#### `ui_router_navigationState.getCurrentResolved()`

Raccourci de compatibilité : renvoie l'entrée courante complète (voir notes).

- **renvoie** : table|nil Entrée courante.

#### `ui_router_navigationState.getCurrentRouteNode()`

Renvoie la configuration de route (routeNode, avec ses hooks) de l'entrée courante.

- **renvoie** : table|nil Nœud de route.

#### `ui_router_navigationState.getDecorator()`

Renvoie la valeur du décorateur.

- **renvoie** : any Décorateur ou nil.

#### `ui_router_navigationState.getDecoratorModule()`

Renvoie le module propriétaire du décorateur.

- **renvoie** : string|nil Nom du module.

#### `ui_router_navigationState.getLastActiveScope(routeName)`

Renvoie la dernière portée active mémorisée pour la route.

- `routeName` (*string*) : Nom de route.
- **renvoie** : string|nil Identifiant de portée.

#### `ui_router_navigationState.getPendingEntry()`

Renvoie l'entrée en attente.

- **renvoie** : table|nil Entrée en attente.

#### `ui_router_navigationState.getPendingRouteNode()`

Renvoie le routeNode de l'entrée en attente.

- **renvoie** : table|nil Nœud de route.

#### `ui_router_navigationState.getPreviousEntry()`

Renvoie l'entrée précédente.

- **renvoie** : table|nil Entrée précédente.

#### `ui_router_navigationState.isDecoratorVisible()`

Indique si le décorateur est visible.

- **renvoie** : boolean Visibilité.

#### `ui_router_navigationState.serialize()`

Sérialise les entrées précédente/courante/en attente (formes stockables) et le décorateur.

- **renvoie** : table {previousEntry, currentEntry, pendingEntry, decorator={value, moduleName, visible}}.

#### `ui_router_navigationState.setDecorator(value, moduleName)`

Définit la valeur du décorateur et son module.

- `value` (*any*) : Valeur du décorateur.
- `moduleName` (*string*) : Module propriétaire (premier segment du nom de route).

#### `ui_router_navigationState.setDecoratorVisible(visible)`

Affiche ou masque le décorateur.

- `visible` (*boolean*) : Visibilité.

#### `ui_router_navigationState.setLastActiveScope(routeName, scopeId)`

Mémorise la dernière portée active d'une route.

- `routeName` (*string*) : Nom de route.
- `scopeId` (*string*) : Identifiant de portée.

#### `ui_router_navigationState.setPendingEntry(entry)`

Définit l'entrée de navigation en attente de validation par le framework.

- `entry` (*table*) : Entrée de navigation.

#### `ui_router_navigationState.setPendingState(routeNode, data)`

Raccourci de compatibilité : construit l'entrée en attente à partir d'un routeNode et de {request, resolved, origin}.

- `routeNode` (*table*) : Nœud de route.
- `data` (*table*) : {request, resolved, origin}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationState.lua`.*

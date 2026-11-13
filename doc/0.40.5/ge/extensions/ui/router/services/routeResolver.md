# `ui_router_services_routeResolver`

*Fichier : `lua/ge/extensions/ui/router/services/routeResolver.lua` · VM : Game Engine (GE) · 70 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_services_routeResolver` : `extensions.load("ui_router_services_routeResolver")`, puis la globale `ui_router_services_routeResolver`

Service OBSOLÈTE du routeur UI : le flux principal construit désormais les NavigationEntries directement avec ResolvedRoute.createEntry(). Ce module reste pour d'éventuels appelants externes : il résout un nom de route en table résolue et compare deux routes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_services_routeResolver.isEqualRoutes(routeA, routeB)` | Compare deux routes : même `name` et mêmes `params` (comparaison valeur à valeur, non récursive). | 42 |
| `ui_router_services_routeResolver.resolve(routeName, params, currentRoute)` | Résout un nom de route (relatif possible, résolu avec utils.resolveRelativeRoute si une route courante est fournie) en route résolue via routeManager.getRoute puis ResolvedRoute.createResolved. Renvoie nil avec un avertissement si la route est introuvable ou la création échoue. Obsolète. | 15 |

### Détail des paramètres

#### `ui_router_services_routeResolver.isEqualRoutes(routeA, routeB)`

Compare deux routes : même `name` et mêmes `params` (comparaison valeur à valeur, non récursive).

- `routeA` (*table*) : Première route.
- `routeB` (*table*) : Seconde route.
- **renvoie** : boolean true si identiques ; false si l'une est nil.

#### `ui_router_services_routeResolver.resolve(routeName, params, currentRoute)`

Résout un nom de route (relatif possible, résolu avec utils.resolveRelativeRoute si une route courante est fournie) en route résolue via routeManager.getRoute puis ResolvedRoute.createResolved. Renvoie nil avec un avertissement si la route est introuvable ou la création échoue. Obsolète.

- `routeName` (*string*) : Nom de la route.
- `params` (*table|nil*) : Paramètres de la requête.
- `currentRoute` (*table|nil*) : Route courante (pour les noms relatifs).
- **renvoie** : table|nil Route résolue.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/services/routeResolver.lua`.*

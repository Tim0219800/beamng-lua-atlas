# `ui_router_models_ResolvedRoute`

*Fichier : `lua/ge/extensions/ui/router/models/ResolvedRoute.lua` · VM : Game Engine (GE) · 195 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_models_ResolvedRoute` : `extensions.load("ui_router_models_ResolvedRoute")`, puis la globale `ui_router_models_ResolvedRoute`

Construit l'entrée de navigation canonique (NavigationEntry) utilisée partout dans le routeur : {request, resolved, origin, toRoute, fromRoute, routeNode}. Une fois créée, l'entrée est à traiter comme immuable. Fournit aussi la conversion en forme stockable/sérialisable (sans fonctions) et sa validation.

## Remarques

- request = {name, fullRoute, params, query, options} ; resolved = copie de la configuration de route sans children, onEnter, onMount, onLeave ni fonctions, plus name, params, query et les extras (breadcrumbs, scope…). resolved.ui reçoit par défaut uiTypes {"angular", "vue"} et uiTypesFilter any.
- request.params contient seulement les vrais paramètres d'écran ; les clés de contrôle du routeur (preferredScope, decorator, showDecorator…) restent dans request.options pour que reload/back puissent les retrouver.
- routeNode référence la configuration de route d'origine (avec ses hooks) ; il n'est ni sérialisé ni restauré (nil après fromStorable).
- validate exige request.name (chaîne), resolved.name (chaîne), resolved.screenId (chaîne non vide) et resolved.ui.uiTypes (tableau).
- Alias dépréciés conservés : createNew (ne fait rien), create, toMinimal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName)` | Alias déprécié : crée une requête puis la route résolue (moduleName ajouté en extra). | 179 |
| `ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry)` | Crée l'entrée de navigation complète, avec origin = {route = nom de la requête précédente} si une entrée précédente existe. | 90 |
| `ui_router_models_ResolvedRoute.createNew()` | Alias déprécié, ne fait rien. | 176 |
| `ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute)` | Crée la requête de navigation. | 41 |
| `ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras)` | Construit la route résolue à partir de la configuration de route, de la requête et d'extras (copie sans hooks ni fonctions). | 53 |
| `ui_router_models_ResolvedRoute.fromStorable(data)` | Reconstruit une entrée à partir de données stockées (routeNode = nil ; toRoute recalculé si absent). | 129 |
| `ui_router_models_ResolvedRoute.toCompatRoute(resolved)` | Vue réduite de compatibilité d'une route résolue. | 80 |
| `ui_router_models_ResolvedRoute.toMinimal(route)` | Alias déprécié : vue minimale {name, params, query}. | 186 |
| `ui_router_models_ResolvedRoute.toStorable(entry)` | Copie l'entrée en retirant les fonctions de resolved et le routeNode, pour sérialisation. | 108 |
| `ui_router_models_ResolvedRoute.validate(entry)` | Valide la structure d'une entrée de navigation. | 141 |

### Détail des paramètres

#### `ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName)`

Alias déprécié : crée une requête puis la route résolue (moduleName ajouté en extra).

- `config` (*table*) : Configuration de route.
- `name` (*string*) : Nom de route.
- `params` (*table|nil*) : Paramètres.
- `query` (*table|nil*) : Requête.
- `moduleName` (*string|nil*) : Nom du module.
- **renvoie** : table Route résolue.

#### `ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry)`

Crée l'entrée de navigation complète, avec origin = {route = nom de la requête précédente} si une entrée précédente existe.

- `routeConfig` (*table*) : Configuration de route (devient routeNode).
- `request` (*table*) : Requête.
- `extras` (*table|nil*) : Extras pour resolved.
- `previousEntry` (*table|nil*) : Entrée précédente.
- **renvoie** : table {request, resolved, origin, toRoute, fromRoute, routeNode}.

#### `ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute)`

Crée la requête de navigation.

- `name` (*string*) : Nom canonique de la route.
- `params` (*table|nil*) : Paramètres ({} par défaut).
- `query` (*table|nil*) : Paramètres de requête ({} par défaut).
- `options` (*table|nil*) : Options de navigation ({} par défaut).
- `fullRoute` (*string|nil*) : Référence complète base[:scope] ; sinon le nom canonique.
- **renvoie** : table {name, fullRoute, params, query, options}.

#### `ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras)`

Construit la route résolue à partir de la configuration de route, de la requête et d'extras (copie sans hooks ni fonctions).

- `routeConfig` (*table|nil*) : Configuration de route.
- `request` (*table*) : Requête (name, params, query).
- `extras` (*table|nil*) : Champs ajoutés dans resolved (breadcrumbs, scope…).
- **renvoie** : table Route résolue.

#### `ui_router_models_ResolvedRoute.fromStorable(data)`

Reconstruit une entrée à partir de données stockées (routeNode = nil ; toRoute recalculé si absent).

- `data` (*table|nil*) : Données produites par toStorable.
- **renvoie** : table|nil Entrée de navigation.

#### `ui_router_models_ResolvedRoute.toCompatRoute(resolved)`

Vue réduite de compatibilité d'une route résolue.

- `resolved` (*table|nil*) : Route résolue.
- **renvoie** : table|nil {name, screenId (ou name), params, meta} ou nil.

#### `ui_router_models_ResolvedRoute.toMinimal(route)`

Alias déprécié : vue minimale {name, params, query}.

- `route` (*table*) : Route.
- **renvoie** : table {name, params, query}.

#### `ui_router_models_ResolvedRoute.toStorable(entry)`

Copie l'entrée en retirant les fonctions de resolved et le routeNode, pour sérialisation.

- `entry` (*table|nil*) : Entrée de navigation.
- **renvoie** : table|nil {request, resolved, origin, toRoute, fromRoute}.

#### `ui_router_models_ResolvedRoute.validate(entry)`

Valide la structure d'une entrée de navigation.

- `entry` (*table|nil*) : Entrée à valider.
- **renvoie** : boolean true si valide.
- **renvoie** : string[] Liste des erreurs.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/models/ResolvedRoute.lua`.*

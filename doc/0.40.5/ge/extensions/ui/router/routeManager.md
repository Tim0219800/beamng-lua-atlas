# `ui_router_routeManager`

*Fichier : `lua/ge/extensions/ui/router/routeManager.lua` · VM : Game Engine (GE) · 748 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeManager` : `extensions.load("ui_router_routeManager")`, puis la globale `ui_router_routeManager`

Gestionnaire des routes du routeur UI. Il construit l'arbre des routes à partir du registre racine (routes.lua), des modules du dossier routes/ (via les `include`), puis y superpose les routes d'exécution (routes Vue synchronisées ou routes enregistrées par des mods). Il résout une route par son nom pointé (ex. « menu.options »), applique l'héritage de la configuration `ui`, calcule la cible de retour (`backTarget`) et réconcilie la route active quand les routes changent. Un moddeur l'utilise surtout via registerModRoutes / unregisterModRoutes.

## Exemple

```lua
local res = extensions.ui_router_routeManager.registerModRoutes("monMod", {
  { name = "monMod", meta = { uiTypes = {"vue"} } }
})
if not res.success then dump(res.errors) end
-- plus tard
extensions.ui_router_routeManager.unregisterModRoutes("monMod")
```

## Remarques

- Les noms de routes sont pointés : le premier segment désigne le module (fichier de routes/), les suivants les enfants. Un nom à un seul segment est d'abord cherché dans le module « global » (routes plates).
- registerModRoutes/unregisterModRoutes sont transactionnels : si l'analyse échoue, l'état précédent est conservé et `result.success` vaut false avec `result.errors`.
- Pour un même nom de route, la source enregistrée en dernier gagne, sans composition (voir runtimeRouteRegistry).
- Après un changement, la route active est rechargée (`ui_router.reload`) si sa config a changé, ou le routeur bascule sur `fallbackRoute`/« pause » (si une mission est chargée)/« menu » si elle a disparu.
- Les références relatives (resolveRouteName) utilisent '.' et '..' séparés par '/', ex. « ./enfant », « ../frère ».
- addModule (interne) : addRuntimeModule appelle dump() à chaque module synthétisé, ce qui pollue la console.
- routes.lua déclare `include = "livery"` mais aucun fichier routes/livery.lua n'existe : l'entrée est ignorée avec un avertissement « Included route module ... not found or cyclic ».
- Bug mineur : si le fichier routes/<module>.lua existe mais que l'extension correspondante ne se charge pas, findModule indexe `mod.Children` sur nil (erreur).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeManager.addVueRoutes(routesObject)` | Synchronisation Vue (dev/HMR) : enregistre le tableau de routes brut dans la source réservée « __vueSync ». Sans réconciliation de la route active. Les erreurs sont journalisées. | 588 |
| `ui_router_routeManager.getAllRoutes()` | Renvoie la liste (sans doublon) de tous les noms de routes connus : arbres enregistrés (sauf modules marqués ExcludeFromDiscovery), routes globales et routes d'exécution effectives. | 342 |
| `ui_router_routeManager.getModuleDecorator(routeName)` | Renvoie le `ContextDecorator` du module de la route, ou par défaut { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }. | 597 |
| `ui_router_routeManager.getRoute(routeKey)` | Renvoie la configuration complète d'une route (copie) : héritage `ui` appliqué, `name`, `backTarget` calculé (route parente non abstraite, ou fallbackTarget) et `screenId` (par défaut le nom). Renvoie nil si la route n'existe pas. | 539 |
| `ui_router_routeManager.getRouteNodes(routeName)` | Renvoie la liste des nœuds de la racine jusqu'à la route demandée, chacun avec `key` et `routeName`. | 553 |
| `ui_router_routeManager.registerModRoutes(sourceId, routes, options)` | Enregistre (ou remplace) les routes d'une source, reconstruit l'état d'exécution puis réconcilie la route active (rechargement ou repli). | 696 |
| `ui_router_routeManager.removeRuntimeRoutes()` | Supprime uniquement la source « __vueSync » ; les sources enregistrées par des mods restent. Sans réconciliation. | 611 |
| `ui_router_routeManager.resolveAllRoutes()` | Vide le cache et reconstruit tous les modules de routes : lit le module global déclaré dans routes.lua (`Global.include`), les modules racines et les modules d'exécution. *(interne)* | 722 |
| `ui_router_routeManager.resolveRouteName(reference, baseRouteName)` | Résout une référence éventuellement relative par rapport à une route de base. Les références qui ne commencent pas par '.' sont renvoyées telles quelles. | 452 |
| `ui_router_routeManager.unregisterModRoutes(sourceId, options)` | Retire une source du registre, reconstruit l'état et réconcilie la route active. Retirer une source inconnue réussit avec existed=false. | 709 |

### Détail des paramètres

#### `ui_router_routeManager.addVueRoutes(routesObject)`

Synchronisation Vue (dev/HMR) : enregistre le tableau de routes brut dans la source réservée « __vueSync ». Sans réconciliation de la route active. Les erreurs sont journalisées.

- `routesObject` (*table*) : Tableau de routes Vue brut.

#### `ui_router_routeManager.getAllRoutes()`

Renvoie la liste (sans doublon) de tous les noms de routes connus : arbres enregistrés (sauf modules marqués ExcludeFromDiscovery), routes globales et routes d'exécution effectives.

- **renvoie** : string[] Noms de routes pointés.

#### `ui_router_routeManager.getModuleDecorator(routeName)`

Renvoie le `ContextDecorator` du module de la route, ou par défaut { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }.

- `routeName` (*string*) : Nom pointé de la route.
- **renvoie** : table Décorateur de contexte.

#### `ui_router_routeManager.getRoute(routeKey)`

Renvoie la configuration complète d'une route (copie) : héritage `ui` appliqué, `name`, `backTarget` calculé (route parente non abstraite, ou fallbackTarget) et `screenId` (par défaut le nom). Renvoie nil si la route n'existe pas.

- `routeKey` (*string*) : Nom pointé de la route.
- **renvoie** : table|nil Config de la route.

#### `ui_router_routeManager.getRouteNodes(routeName)`

Renvoie la liste des nœuds de la racine jusqu'à la route demandée, chacun avec `key` et `routeName`.

- `routeName` (*string*) : Nom pointé de la route.
- **renvoie** : table[]|nil Nœuds, ou nil si un segment est introuvable.

#### `ui_router_routeManager.registerModRoutes(sourceId, routes, options)`

Enregistre (ou remplace) les routes d'une source, reconstruit l'état d'exécution puis réconcilie la route active (rechargement ou repli).

- `sourceId` (*string*) : Identifiant non vide de la source (ex. nom du mod).
- `routes` (*table*) : Tableau de routes au format Vue (name, meta, children…).
- `options` (*table|nil*) : `fallbackRoute` : route de repli si la route active disparaît.
- **renvoie** : table {success, sourceId, isNew, names, added, removed, changed, reconciliation} ou {success=false, errors}. reconciliation = {performed, action = none|fallback|reload, routeName, success, reason}.

#### `ui_router_routeManager.resolveRouteName(reference, baseRouteName)`

Résout une référence éventuellement relative par rapport à une route de base. Les références qui ne commencent pas par '.' sont renvoyées telles quelles.

- `reference` (*string*) : Référence absolue ou relative (« ./x », « ../x »).
- `baseRouteName` (*string|nil*) : Route de base (requise pour une référence relative).
- **renvoie** : string|nil Nom résolu, ou nil en cas d'échec.
- **renvoie** : string|nil Raison de l'échec : « invalid_relative_route » ou « relative_route_without_base ».

#### `ui_router_routeManager.unregisterModRoutes(sourceId, options)`

Retire une source du registre, reconstruit l'état et réconcilie la route active. Retirer une source inconnue réussit avec existed=false.

- `sourceId` (*string*) : Identifiant de la source.
- `options` (*table|nil*) : `fallbackRoute`, comme pour registerModRoutes.
- **renvoie** : table Résultat du registre + `reconciliation`.

## Champs

| Champ | Type | Description |
|---|---|---|
| `RegisteredRoutes` | table<string, table> | Cache des arbres de routes résolus par nom de module. Vidé par invalidateCache et reconstruit par resolveAllRoutes. |
| `RuntimeRouteModules` | table<string, table> | Modules synthétisés pour les familles de routes qui n'existent qu'à l'exécution (aucun fichier dans routes/). |
| `RuntimeRoutes` | table<string, table> | Nom de route -> définition gagnante venant du registre d'exécution ; superposée à l'arbre statique. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeManager.lua`.*

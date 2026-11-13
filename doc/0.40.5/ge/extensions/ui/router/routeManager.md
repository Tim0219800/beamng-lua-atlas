# `ui_router_routeManager`

*Fichier : `lua/ge/extensions/ui/router/routeManager.lua` · VM : Game Engine (GE) · 748 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeManager` : `extensions.load("ui_router_routeManager")`, puis la globale `ui_router_routeManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeManager.addVueRoutes(routesObject)` | Non-reconciling Vue dev/HMR sync entry point. Routes flow into the reserved<br> Vue-sync source only, so this can never disturb mod-registered sources. Active<br> route reconciliation is intentionally not performed here. | 588 |
| `ui_router_routeManager.getAllRoutes()` |  | 342 |
| `ui_router_routeManager.getModuleDecorator(routeName)` |  | 597 |
| `ui_router_routeManager.getRoute(routeKey)` |  | 539 |
| `ui_router_routeManager.getRouteNodes(routeName)` |  | 553 |
| `ui_router_routeManager.registerModRoutes(sourceId, routes, options)` |  | 696 |
| `ui_router_routeManager.removeRuntimeRoutes()` | Non-reconciling counterpart to addVueRoutes: clears only the reserved<br> Vue-sync source, leaving any mod-registered runtime sources intact. | 611 |
| `ui_router_routeManager.resolveAllRoutes()` |  | 722 |
| `ui_router_routeManager.resolveRouteName(reference, baseRouteName)` | Resolve a possibly-relative route reference against a base (committed) route<br> name. Absolute references (dotted names, global one-segment names, and<br> '/'-prefixed names) pass through unchanged. Relative references use '.' /<br> '..' segments separated by '/', e.g. "./child", "../sibling", "../../x".<br> Returns resolvedName, nil on success or nil, errorReason on failure. | 452 |
| `ui_router_routeManager.unregisterModRoutes(sourceId, options)` |  | 709 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `RegisteredRoutes` | table |  |
| `RuntimeRouteModules` | table |  |
| `RuntimeRoutes` | table |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeManager.lua`.*

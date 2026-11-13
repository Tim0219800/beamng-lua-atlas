# `ui_router_navigationState`

*Fichier : `lua/ge/extensions/ui/router/navigationState.lua` · VM : Game Engine (GE) · 176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationState` : `extensions.load("ui_router_navigationState")`, puis la globale `ui_router_navigationState`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationState.clearDecorator()` |  | 132 |
| `ui_router_navigationState.clearLastActiveScope(routeName)` |  | 26 |
| `ui_router_navigationState.clearPendingEntry()` | Drop an uncommitted pending entry. Used on timeout, rejection, explicit cancellation,<br> and preemption so a superseded/aborted navigation never leaves stale pending state behind. | 44 |
| `ui_router_navigationState.deserialize(data)` |  | 153 |
| `ui_router_navigationState.getBreadcrumbs()` |  | 82 |
| `ui_router_navigationState.getCurrentEntry()` |  | 54 |
| `ui_router_navigationState.getCurrentResolved()` |  | 70 |
| `ui_router_navigationState.getCurrentRouteNode()` |  | 74 |
| `ui_router_navigationState.getDecorator()` |  | 116 |
| `ui_router_navigationState.getDecoratorModule()` |  | 120 |
| `ui_router_navigationState.getLastActiveScope(routeName)` |  | 22 |
| `ui_router_navigationState.getPendingEntry()` |  | 58 |
| `ui_router_navigationState.getPendingRouteNode()` |  | 78 |
| `ui_router_navigationState.getPreviousEntry()` |  | 62 |
| `ui_router_navigationState.isDecoratorVisible()` |  | 128 |
| `ui_router_navigationState.promotePendingEntry()` |  | 48 |
| `ui_router_navigationState.promotePendingStates()` |  | 95 |
| `ui_router_navigationState.reset()` |  | 167 |
| `ui_router_navigationState.serialize()` |  | 140 |
| `ui_router_navigationState.setDecorator(value, moduleName)` |  | 111 |
| `ui_router_navigationState.setDecoratorVisible(visible)` |  | 124 |
| `ui_router_navigationState.setLastActiveScope(routeName, scopeId)` |  | 18 |
| `ui_router_navigationState.setPendingEntry(entry)` |  | 38 |
| `ui_router_navigationState.setPendingState(routeNode, data)` |  | 86 |
| `ui_router_navigationState.setRequest()` |  | 99 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationState.lua`.*

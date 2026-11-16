# `ui_router_routeFailure.test`

*Fichier : `lua/ge/extensions/ui/router/routeFailure.test.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeFailure.test` : `extensions.load("ui_router_routeFailure.test")`, puis la globale `ui_router_routeFailure.test`

Tests du contrat d'échec de transition de router.lua : routeMounted refusé avant la validation, retour arrière de routeChangeFailed pour une navigation non validée, rejets sans transition active, après validation ou avec un identifiant périmé. Fichier lancé par le framework de tests, pas une API pour moddeur.

## Remarques

- Lancement : extensions.testFramework_TestManager:runTestFiles("routeFailure").
- Les tests pilotent le singleton ui_router réel avec une transition fabriquée, puis réinitialisent TransitionManager et restaurent l'éventuelle entrée en attente.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx)` | routeChangeFailed est rejeté une fois la route déjà validée. *(interne)* | 103 |
| `ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx)` | routeChangeFailed est rejeté s'il n'y a aucune transition active. *(interne)* | 94 |
| `ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx)` | routeChangeFailed rejette un identifiant de transition différent pour ne pas annuler une navigation plus récente. *(interne)* | 124 |
| `ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx)` | routeChangeFailed efface l'entrée en attente et termine la transition. *(interne)* | 76 |
| `ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx)` | routeMounted est rejeté avec not_committed tant que le changement de route n'est pas validé. *(interne)* | 61 |

### Détail des paramètres

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx)`

routeChangeFailed est rejeté une fois la route déjà validée.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx)`

routeChangeFailed est rejeté s'il n'y a aucune transition active.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx)`

routeChangeFailed rejette un identifiant de transition différent pour ne pas annuler une navigation plus récente.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx)`

routeChangeFailed efface l'entrée en attente et termine la transition.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx)`

routeMounted est rejeté avec not_committed tant que le changement de route n'est pas validé.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeFailure.test.lua`.*

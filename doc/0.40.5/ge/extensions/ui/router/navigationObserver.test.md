# `ui_router_navigationObserver.test`

*Fichier : `lua/ge/extensions/ui/router/navigationObserver.test.lua` · VM : Game Engine (GE) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationObserver.test` : `extensions.load("ui_router_navigationObserver.test")`, puis la globale `ui_router_navigationObserver.test`

Tests unitaires du module non-shipping NavigationObserver (classification duplicate_navigation / conflicting_navigation, attribution de l'appelant, avertissement unique, reset). Ce n'est pas une API pour moddeur : fichier lancé par le framework de tests.

## Remarques

- Lancement : extensions.testFramework_TestManager:runTestFiles("navigationObserver").

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx)` | Vérifie que beginAttempt ignore les cadres internes du routeur et attribue l'appelant Lua externe. *(interne)* | 119 |
| `ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx)` | Vérifie le repli sur « bridge/unknown » quand aucun cadre Lua n'est disponible. *(interne)* | 135 |
| `ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx)` | Vérifie que des options de routeur différentes donnent conflicting_navigation. *(interne)* | 103 |
| `ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx)` | Vérifie que des paramètres effectifs différents donnent conflicting_navigation. *(interne)* | 75 |
| `ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx)` | Vérifie qu'une route différente donne conflicting_navigation. *(interne)* | 61 |
| `ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx)` | Vérifie qu'une portée différente donne conflicting_navigation. *(interne)* | 89 |
| `ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx)` | Vérifie que deux requêtes identiques (route, portée, params, options) sont classées duplicate_navigation. *(interne)* | 42 |
| `ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx)` | Vérifie que reportPreemption ne fait rien si une des tentatives manque. *(interne)* | 192 |
| `ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx)` | Vérifie qu'une tentative préemptée n'est signalée qu'une fois. *(interne)* | 154 |
| `ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx)` | Vérifie que reset() remet à zéro le compteur, la tentative courante et l'état de déduplication. *(interne)* | 171 |
| `ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx)` | Vérifie qu'une tentative ne se préempte jamais elle-même. *(interne)* | 203 |

### Détail des paramètres

#### `ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx)`

Vérifie que beginAttempt ignore les cadres internes du routeur et attribue l'appelant Lua externe.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx)`

Vérifie le repli sur « bridge/unknown » quand aucun cadre Lua n'est disponible.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx)`

Vérifie que des options de routeur différentes donnent conflicting_navigation.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx)`

Vérifie que des paramètres effectifs différents donnent conflicting_navigation.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx)`

Vérifie qu'une route différente donne conflicting_navigation.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx)`

Vérifie qu'une portée différente donne conflicting_navigation.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx)`

Vérifie que deux requêtes identiques (route, portée, params, options) sont classées duplicate_navigation.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx)`

Vérifie que reportPreemption ne fait rien si une des tentatives manque.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx)`

Vérifie qu'une tentative préemptée n'est signalée qu'une fois.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx)`

Vérifie que reset() remet à zéro le compteur, la tentative courante et l'état de déduplication.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx)`

Vérifie qu'une tentative ne se préempte jamais elle-même.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationObserver.test.lua`.*

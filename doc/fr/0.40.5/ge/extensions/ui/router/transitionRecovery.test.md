# `ui_router_transitionRecovery.test`

*Fichier : `lua/ge/extensions/ui/router/transitionRecovery.test.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_transitionRecovery.test` : `extensions.load("ui_router_transitionRecovery.test")`, puis la globale `ui_router_transitionRecovery.test`

Tests ciblés du contrat de reprise au démarrage de Vue pour le routeur : renvoi de la transition toutes les secondes sans limite (phase startup), accusés de réception qui ne servent que de télémétrie (routeChangeReceived), arrêt des renvois par routeNavigationStarted, rejet des accusés à identifiant de transition périmé, conservation de l'identifiant à l'annulation et nettoyage de l'entrée en attente. Utilise Config, TransitionManager et NavigationState. Lancement : extensions.testFramework_TestManager:runTestFiles("transitionRecovery").

## Remarques

- Les fonctions testXxx(ctx) sont exécutées par testFramework_TestManager ; le jeu ne les appelle pas en usage normal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx)` | L'annulation renvoie l'identifiant de la transition démarrée (utilisé dans la charge utile d'annulation). *(interne)* | 161 |
| `ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx)` | Annuler sans transition en cours renvoie un identifiant nil. *(interne)* | 175 |
| `ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx)` | NavigationState efface l'entrée en attente non validée. *(interne)* | 185 |
| `ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx)` | routeNavigationStarted arrête les renvois. *(interne)* | 87 |
| `ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx)` | Après un long démarrage, les minuteurs de fin de transition repartent à zéro une fois la navigation démarrée. *(interne)* | 101 |
| `ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx)` | routeChangeReceived est de la télémétrie : il n'arrête pas les renvois. *(interne)* | 71 |
| `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx)` | Un accusé de fin avec un identifiant périmé est rejeté. *(interne)* | 146 |
| `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx)` | Un accusé de progression avec un identifiant de transition périmé est rejeté. *(interne)* | 129 |
| `ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx)` | L'intervalle de renvoi au démarrage dans Config vaut une seconde. *(interne)* | 47 |
| `ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx)` | En phase startup, la transition est renvoyée chaque seconde, indéfiniment. *(interne)* | 54 |

### Détail des paramètres

#### `ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx)`

L'annulation renvoie l'identifiant de la transition démarrée (utilisé dans la charge utile d'annulation).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx)`

Annuler sans transition en cours renvoie un identifiant nil.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx)`

NavigationState efface l'entrée en attente non validée.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx)`

routeNavigationStarted arrête les renvois.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx)`

Après un long démarrage, les minuteurs de fin de transition repartent à zéro une fois la navigation démarrée.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx)`

routeChangeReceived est de la télémétrie : il n'arrête pas les renvois.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx)`

Un accusé de fin avec un identifiant périmé est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx)`

Un accusé de progression avec un identifiant de transition périmé est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx)`

L'intervalle de renvoi au démarrage dans Config vaut une seconde.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx)`

En phase startup, la transition est renvoyée chaque seconde, indéfiniment.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/transitionRecovery.test.lua`.*

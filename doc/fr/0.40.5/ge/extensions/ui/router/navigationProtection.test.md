# `ui_router_navigationProtection.test`

*Fichier : `lua/ge/extensions/ui/router/navigationProtection.test.lua` · VM : Game Engine (GE) · 395 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_navigationProtection.test` : `extensions.load("ui_router_navigationProtection.test")`, puis la globale `ui_router_navigationProtection.test`

Tests du verrou de navigation protégée (options.cancellable == false) de router.lua : acquisition, blocage à l'admission, conservation entre validation et montage, et libération sur tous les chemins terminaux (cancel, rejet, échec, timeout, reset, désérialisation). Fichier lancé par le framework de tests, pas une API pour moddeur.

## Remarques

- Lancement : extensions.testFramework_TestManager:runTestFiles("navigationProtection").
- Les tests de chemins terminaux fabriquent une transition dont la session porte un jeton de protection et utilisent les points d'accès __test_getProtectionToken/__test_setProtectionToken de ui_router ; les tests d'acquisition utilisent une route de mod temporaire ("navprotect") annulée avant validation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_navigationProtection.test.testCancelReleasesProtection(ctx)` | M.cancel libère le verrou. *(interne)* | 239 |
| `ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx)` | cancellable nil ou true : pas de verrou, la dernière navigation l'emporte. *(interne)* | 127 |
| `ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx)` | onDeserialize abandonne un verrou périmé sans toucher à l'état de navigation persistant. *(interne)* | 317 |
| `ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx)` | routeChangeFailed libère le verrou. *(interne)* | 270 |
| `ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx)` | Sans navigation protégée active, navigate n'est pas bloqué à l'admission. *(interne)* | 210 |
| `ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx)` | La porte d'admission rejette une requête plus récente avant résolution de route ou gardes. *(interne)* | 181 |
| `ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx)` | Les requêtes répétées ou identiques sont toutes bloquées pendant la protection (pas de file d'attente). *(interne)* | 195 |
| `ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx)` | cancellable=false acquiert le verrou, bloque les navigations suivantes ; cancel le libère. *(interne)* | 153 |
| `ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx)` | Le verrou est conservé entre validation et montage, puis libéré à la fin complète. *(interne)* | 328 |
| `ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx)` | Une route sans accusé de montage libère le verrou à routeChangeComplete. *(interne)* | 352 |
| `ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx)` | routeChangeRejected libère le verrou. *(interne)* | 255 |
| `ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx)` | Le nettoyage d'une ancienne transition ne peut pas effacer le verrou d'une navigation protégée plus récente. *(interne)* | 223 |
| `ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx)` | reload transmet cancellable=false à la transition rejouée, qui acquiert le verrou. *(interne)* | 375 |
| `ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx)` | resetStates efface le verrou. *(interne)* | 305 |
| `ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx)` | Un timeout de transition libère le verrou. *(interne)* | 288 |

### Détail des paramètres

#### `ui_router_navigationProtection.test.testCancelReleasesProtection(ctx)`

M.cancel libère le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx)`

cancellable nil ou true : pas de verrou, la dernière navigation l'emporte.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx)`

onDeserialize abandonne un verrou périmé sans toucher à l'état de navigation persistant.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx)`

routeChangeFailed libère le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx)`

Sans navigation protégée active, navigate n'est pas bloqué à l'admission.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx)`

La porte d'admission rejette une requête plus récente avant résolution de route ou gardes.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx)`

Les requêtes répétées ou identiques sont toutes bloquées pendant la protection (pas de file d'attente).

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx)`

cancellable=false acquiert le verrou, bloque les navigations suivantes ; cancel le libère.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx)`

Le verrou est conservé entre validation et montage, puis libéré à la fin complète.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx)`

Une route sans accusé de montage libère le verrou à routeChangeComplete.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx)`

routeChangeRejected libère le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx)`

Le nettoyage d'une ancienne transition ne peut pas effacer le verrou d'une navigation protégée plus récente.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx)`

reload transmet cancellable=false à la transition rejouée, qui acquiert le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx)`

resetStates efface le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx)`

Un timeout de transition libère le verrou.

- `ctx` (*table*) : Contexte du framework de tests (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/navigationProtection.test.lua`.*

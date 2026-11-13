---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationProtection.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests du verrou de navigation protégée (options.cancellable == false) de router.lua : acquisition, blocage à l'admission, conservation entre validation et montage, et libération sur tous les chemins terminaux (cancel, rejet, échec, timeout, reset, désérialisation). Fichier lancé par le framework de tests, pas une API pour moddeur.
--- Accès : extension `ui_router_navigationProtection.test` : `extensions.load("ui_router_navigationProtection.test")`, puis la globale `ui_router_navigationProtection.test`
---@class ui_router_navigationProtection.test
ui_router_navigationProtection.test = {}

--- M.cancel libère le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:239
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testCancelReleasesProtection(ctx) end

--- cancellable nil ou true : pas de verrou, la dernière navigation l'emporte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:127
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx) end

--- onDeserialize abandonne un verrou périmé sans toucher à l'état de navigation persistant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:317
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx) end

--- routeChangeFailed libère le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:270
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx) end

--- Sans navigation protégée active, navigate n'est pas bloqué à l'admission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:210
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx) end

--- La porte d'admission rejette une requête plus récente avant résolution de route ou gardes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:181
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx) end

--- Les requêtes répétées ou identiques sont toutes bloquées pendant la protection (pas de file d'attente).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:195
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx) end

--- cancellable=false acquiert le verrou, bloque les navigations suivantes ; cancel le libère.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:153
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx) end

--- Le verrou est conservé entre validation et montage, puis libéré à la fin complète.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:328
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx) end

--- Une route sans accusé de montage libère le verrou à routeChangeComplete.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:352
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx) end

--- routeChangeRejected libère le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:255
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx) end

--- Le nettoyage d'une ancienne transition ne peut pas effacer le verrou d'une navigation protégée plus récente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:223
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx) end

--- reload transmet cancellable=false à la transition rejouée, qui acquiert le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:375
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx) end

--- resetStates efface le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:305
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx) end

--- Un timeout de transition libère le verrou.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationProtection.test.lua:288
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx) end


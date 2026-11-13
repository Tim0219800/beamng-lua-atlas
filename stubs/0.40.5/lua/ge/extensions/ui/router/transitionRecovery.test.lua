---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/transitionRecovery.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests ciblés du contrat de reprise au démarrage de Vue pour le routeur : renvoi de la transition toutes les secondes sans limite (phase startup), accusés de réception qui ne servent que de télémétrie (routeChangeReceived), arrêt des renvois par routeNavigationStarted, rejet des accusés à identifiant de transition périmé, conservation de l'identifiant à l'annulation et nettoyage de l'entrée en attente. Utilise Config, TransitionManager et NavigationState. Lancement : extensions.testFramework_TestManager:runTestFiles("transitionRecovery").
--- Accès : extension `ui_router_transitionRecovery.test` : `extensions.load("ui_router_transitionRecovery.test")`, puis la globale `ui_router_transitionRecovery.test`
---@class ui_router_transitionRecovery.test
ui_router_transitionRecovery.test = {}

--- L'annulation renvoie l'identifiant de la transition démarrée (utilisé dans la charge utile d'annulation).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:161
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx) end

--- Annuler sans transition en cours renvoie un identifiant nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:175
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx) end

--- NavigationState efface l'entrée en attente non validée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:185
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx) end

--- routeNavigationStarted arrête les renvois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:87
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx) end

--- Après un long démarrage, les minuteurs de fin de transition repartent à zéro une fois la navigation démarrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:101
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx) end

--- routeChangeReceived est de la télémétrie : il n'arrête pas les renvois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:71
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx) end

--- Un accusé de fin avec un identifiant périmé est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:146
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx) end

--- Un accusé de progression avec un identifiant de transition périmé est rejeté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:129
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx) end

--- L'intervalle de renvoi au démarrage dans Config vaut une seconde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:47
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx) end

--- En phase startup, la transition est renvoyée chaque seconde, indéfiniment.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/transitionRecovery.test.lua:54
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx) end


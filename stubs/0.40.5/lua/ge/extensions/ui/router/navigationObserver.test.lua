---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationObserver.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires du module non-shipping NavigationObserver (classification duplicate_navigation / conflicting_navigation, attribution de l'appelant, avertissement unique, reset). Ce n'est pas une API pour moddeur : fichier lancé par le framework de tests.
--- Accès : extension `ui_router_navigationObserver.test` : `extensions.load("ui_router_navigationObserver.test")`, puis la globale `ui_router_navigationObserver.test`
---@class ui_router_navigationObserver.test
ui_router_navigationObserver.test = {}

--- Vérifie que beginAttempt ignore les cadres internes du routeur et attribue l'appelant Lua externe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:119
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx) end

--- Vérifie le repli sur « bridge/unknown » quand aucun cadre Lua n'est disponible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:135
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx) end

--- Vérifie que des options de routeur différentes donnent conflicting_navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:103
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx) end

--- Vérifie que des paramètres effectifs différents donnent conflicting_navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:75
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx) end

--- Vérifie qu'une route différente donne conflicting_navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:61
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx) end

--- Vérifie qu'une portée différente donne conflicting_navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:89
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx) end

--- Vérifie que deux requêtes identiques (route, portée, params, options) sont classées duplicate_navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:42
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx) end

--- Vérifie que reportPreemption ne fait rien si une des tentatives manque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:192
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx) end

--- Vérifie qu'une tentative préemptée n'est signalée qu'une fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:154
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx) end

--- Vérifie que reset() remet à zéro le compteur, la tentative courante et l'état de déduplication.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:171
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx) end

--- Vérifie qu'une tentative ne se préempte jamais elle-même.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/navigationObserver.test.lua:203
---@param ctx table Contexte du framework de tests (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx) end


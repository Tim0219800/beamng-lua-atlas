---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeManager.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires du routeManager (résolution des noms de routes relatifs, cibles de retour relatives, valeur par défaut de `uiNav`). Fichier de test du jeu, sans intérêt direct pour un moddeur sauf comme exemples d'usage de resolveRouteName et getRoute. Lancement : extensions.testFramework_TestManager:runTestFiles("routeManager"). Le fichier contient aussi, en commentaire, un test manuel de navigation relative (ui_router.navigate("./options:options-search") depuis « pause » doit donner name = « pause.options »).
--- Accès : extension `ui_router_routeManager.test` : `extensions.load("ui_router_routeManager.test")`, puis la globale `ui_router_routeManager.test`
---@class ui_router_routeManager.test
ui_router_routeManager.test = {}

--- Les références globales à un segment (« play ») et préfixées par '/' (« /mainmenu ») restent absolues, même sans route de base.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:31
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx) end

--- Une référence absolue pointée (« pause.options ») passe sans changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:24
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx) end

--- Le `backTarget` relatif d'un parent abstrait est résolu par rapport à ce parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:192
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx) end

--- Une référence vide ou nil échoue avec « invalid_relative_route ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:100
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testInvalidReferenceFails(ctx) end

--- Remonter au-dessus de la racine échoue (« ../../options » ou « .. » depuis « pause » donnent « invalid_relative_route »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:89
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeAboveRootFails(ctx) end

--- Avec des routes temporaires (registerModRoutes puis unregisterModRoutes), un `backTarget` relatif « .. » est résolu par rapport à la route qui le déclare.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:124
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx) end

--- « ./options » depuis « pause » donne « pause.options ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:38
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeChild(ctx) end

--- « ./category » depuis « pause.options » donne « pause.options.category ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:45
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeDeeperChild(ctx) end

--- Un `fallbackTarget` relatif est résolu de la même façon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:143
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx) end

--- Un nom canonique déjà résolu (« pause.options ») reste identique si on le résout à nouveau (stabilité au rechargement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:70
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx) end

--- « ../../system » depuis « pause.options.category » donne « pause.system ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:65
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeMultiParent(ctx) end

--- « .. » depuis « pause.options » donne « pause ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:55
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeParent(ctx) end

--- « . » depuis « pause.options » donne « pause.options » (la route de base elle-même).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:60
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeSelf(ctx) end

--- « ../options » depuis « pause.system » donne « pause.options ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:50
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeSibling(ctx) end

--- Une référence relative sans route de base (nil ou chaîne vide) échoue avec « relative_route_without_base ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:78
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx) end

--- `ui.uiNav` vaut true quand la route ne le définit pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:154
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx) end

--- `ui.uiNav = false` explicite n'est pas écrasé par l'héritage des valeurs par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:165
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx) end

--- La route statique « multiseat » a uiNav = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:184
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx) end

--- La route statique « play » a uiNav = false (désactivation de la navigation UI).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeManager.test.lua:176
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de routeReference (analyse « route?clé=valeur:portée », décodage URL, fusion des paramètres explicites et inline) et de la propagation des paramètres effectifs aux hooks onEnter/onMount via ResolvedRoute et navigationContext. Lancement : extensions.testFramework_TestManager:runTestFiles("routeReference").
--- Accès : extension `ui_router_routeReference.test` : `extensions.load("ui_router_routeReference.test")`, puis la globale `ui_router_routeReference.test`
---@class ui_router_routeReference.test
ui_router_routeReference.test = {}

--- Une clé sans '=' vaut une chaîne vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:76
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx) end

--- La référence canonique (sans requête) se ré-analyse sans dérive au rechargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:146
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx) end

--- Les segments vides de la requête (« a=1&&b=2 ») sont ignorés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:106
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx) end

--- mergeParams : les paramètres explicites l'emportent sur les inline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:122
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx) end

--- Une route vide : la référence entière est traitée comme le nom de route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:92
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx) end

--- Une portée vide est ignorée (scope = nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:85
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx) end

--- Une référence qui commence par '?' est traitée comme un nom de route entier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:99
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx) end

--- mergeParams sans explicites conserve les inline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:131
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx) end

--- mergeParams sans inline conserve les explicites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:138
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx) end

--- Une référence non-chaîne est renvoyée telle quelle avec des params vides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:113
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx) end

--- Reproduit la construction du routeur (parse, merge, requête, entrée) et vérifie que onEnter et onMount reçoivent les mêmes paramètres effectifs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:165
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx) end

--- Une route simple n'a ni portée ni paramètres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:15
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx) end

--- « route?a=1:portée » : paramètres et portée extraits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:40
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testQueryAndScopeReference(ctx) end

--- « route?a=1 » : paramètres extraits, pas de portée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:31
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testQueryOnlyReference(ctx) end

--- La partie route reste relative (« ./options ») après parse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:48
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx) end

--- Une clé répétée garde la dernière valeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:70
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx) end

--- La requête mémorise les paramètres effectifs et `fullRoute` ne contient plus la requête inline.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:196
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx) end

--- « route:portée » : portée extraite, aucun paramètre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:23
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testScopeOnlyReference(ctx) end

--- Les clés encodées et les délimiteurs encodés sont décodés correctement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:64
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx) end

--- Décodage de '+' (espace) et des séquences %XX dans les valeurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/router/routeReference.test.lua:56
---@param ctx table Contexte de test du testFramework (setDescription, assert, assertEqual).
function ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx) end


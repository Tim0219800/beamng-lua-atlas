# `ui_router_routeReference.test`

*Fichier : `lua/ge/extensions/ui/router/routeReference.test.lua` · VM : Game Engine (GE) · 209 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeReference.test` : `extensions.load("ui_router_routeReference.test")`, puis la globale `ui_router_routeReference.test`

Tests unitaires de routeReference (analyse « route?clé=valeur:portée », décodage URL, fusion des paramètres explicites et inline) et de la propagation des paramètres effectifs aux hooks onEnter/onMount via ResolvedRoute et navigationContext. Lancement : extensions.testFramework_TestManager:runTestFiles("routeReference").

## Remarques

- Les fonctions testXxx(ctx) sont exécutées par testFramework_TestManager ; le jeu ne les appelle pas en usage normal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx)` | Une clé sans '=' vaut une chaîne vide. *(interne)* | 76 |
| `ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx)` | La référence canonique (sans requête) se ré-analyse sans dérive au rechargement. *(interne)* | 146 |
| `ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx)` | Les segments vides de la requête (« a=1&&b=2 ») sont ignorés. *(interne)* | 106 |
| `ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx)` | mergeParams : les paramètres explicites l'emportent sur les inline. *(interne)* | 122 |
| `ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx)` | Une route vide : la référence entière est traitée comme le nom de route. *(interne)* | 92 |
| `ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx)` | Une portée vide est ignorée (scope = nil). *(interne)* | 85 |
| `ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx)` | Une référence qui commence par '?' est traitée comme un nom de route entier. *(interne)* | 99 |
| `ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx)` | mergeParams sans explicites conserve les inline. *(interne)* | 131 |
| `ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx)` | mergeParams sans inline conserve les explicites. *(interne)* | 138 |
| `ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx)` | Une référence non-chaîne est renvoyée telle quelle avec des params vides. *(interne)* | 113 |
| `ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx)` | Reproduit la construction du routeur (parse, merge, requête, entrée) et vérifie que onEnter et onMount reçoivent les mêmes paramètres effectifs. *(interne)* | 165 |
| `ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx)` | Une route simple n'a ni portée ni paramètres. *(interne)* | 15 |
| `ui_router_routeReference.test.testQueryAndScopeReference(ctx)` | « route?a=1:portée » : paramètres et portée extraits. *(interne)* | 40 |
| `ui_router_routeReference.test.testQueryOnlyReference(ctx)` | « route?a=1 » : paramètres extraits, pas de portée. *(interne)* | 31 |
| `ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx)` | La partie route reste relative (« ./options ») après parse. *(interne)* | 48 |
| `ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx)` | Une clé répétée garde la dernière valeur. *(interne)* | 70 |
| `ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx)` | La requête mémorise les paramètres effectifs et `fullRoute` ne contient plus la requête inline. *(interne)* | 196 |
| `ui_router_routeReference.test.testScopeOnlyReference(ctx)` | « route:portée » : portée extraite, aucun paramètre. *(interne)* | 23 |
| `ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx)` | Les clés encodées et les délimiteurs encodés sont décodés correctement. *(interne)* | 64 |
| `ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx)` | Décodage de '+' (espace) et des séquences %XX dans les valeurs. *(interne)* | 56 |

### Détail des paramètres

#### `ui_router_routeReference.test.testBareKeyResolvesToEmptyString(ctx)`

Une clé sans '=' vaut une chaîne vide.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testCanonicalReferenceReparsesWithoutQuery(ctx)`

La référence canonique (sans requête) se ré-analyse sans dérive au rechargement.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testEmptyQuerySegmentsIgnored(ctx)`

Les segments vides de la requête (« a=1&&b=2 ») sont ignorés.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testExplicitParamsOverrideInline(ctx)`

mergeParams : les paramètres explicites l'emportent sur les inline.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedEmptyRouteTreatedAsWhole(ctx)`

Une route vide : la référence entière est traitée comme le nom de route.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedEmptyScopeTreatedAsPlain(ctx)`

Une portée vide est ignorée (scope = nil).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMalformedLeadingQueryTreatedAsWhole(ctx)`

Une référence qui commence par '?' est traitée comme un nom de route entier.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMergeWithoutExplicitKeepsInline(ctx)`

mergeParams sans explicites conserve les inline.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testMergeWithoutInlineKeepsExplicit(ctx)`

mergeParams sans inline conserve les explicites.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testNonStringReferencePassesThrough(ctx)`

Une référence non-chaîne est renvoyée telle quelle avec des params vides.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testOnEnterAndOnMountShareEffectiveParams(ctx)`

Reproduit la construction du routeur (parse, merge, requête, entrée) et vérifie que onEnter et onMount reçoivent les mêmes paramètres effectifs.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testPlainRouteHasNoDecoration(ctx)`

Une route simple n'a ni portée ni paramètres.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testQueryAndScopeReference(ctx)`

« route?a=1:portée » : paramètres et portée extraits.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testQueryOnlyReference(ctx)`

« route?a=1 » : paramètres extraits, pas de portée.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRelativeRoutePreservedThroughParse(ctx)`

La partie route reste relative (« ./options ») après parse.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRepeatedInlineKeyKeepsLastValue(ctx)`

Une clé répétée garde la dernière valeur.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testRequestPersistsEffectiveParamsWithoutQueryInFullRoute(ctx)`

La requête mémorise les paramètres effectifs et `fullRoute` ne contient plus la requête inline.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testScopeOnlyReference(ctx)`

« route:portée » : portée extraite, aucun paramètre.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testUrlDecodingOfEncodedKeyAndDelimiters(ctx)`

Les clés encodées et les délimiteurs encodés sont décodés correctement.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeReference.test.testUrlDecodingOfQueryValues(ctx)`

Décodage de '+' (espace) et des séquences %XX dans les valeurs.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeReference.test.lua`.*

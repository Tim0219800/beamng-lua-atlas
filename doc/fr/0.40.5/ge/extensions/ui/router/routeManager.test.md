# `ui_router_routeManager.test`

*Fichier : `lua/ge/extensions/ui/router/routeManager.test.lua` · VM : Game Engine (GE) · 208 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeManager.test` : `extensions.load("ui_router_routeManager.test")`, puis la globale `ui_router_routeManager.test`

Tests unitaires du routeManager (résolution des noms de routes relatifs, cibles de retour relatives, valeur par défaut de `uiNav`). Fichier de test du jeu, sans intérêt direct pour un moddeur sauf comme exemples d'usage de resolveRouteName et getRoute. Lancement : extensions.testFramework_TestManager:runTestFiles("routeManager"). Le fichier contient aussi, en commentaire, un test manuel de navigation relative (ui_router.navigate("./options:options-search") depuis « pause » doit donner name = « pause.options »).

## Remarques

- Chaque fonction testXxx(ctx) est une fonction de test exécutée par testFramework_TestManager ; elles ne sont pas appelées par le jeu en dehors des tests.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx)` | Les références globales à un segment (« play ») et préfixées par '/' (« /mainmenu ») restent absolues, même sans route de base. *(interne)* | 31 |
| `ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx)` | Une référence absolue pointée (« pause.options ») passe sans changement. *(interne)* | 24 |
| `ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx)` | Le `backTarget` relatif d'un parent abstrait est résolu par rapport à ce parent. *(interne)* | 192 |
| `ui_router_routeManager.test.testInvalidReferenceFails(ctx)` | Une référence vide ou nil échoue avec « invalid_relative_route ». *(interne)* | 100 |
| `ui_router_routeManager.test.testRelativeAboveRootFails(ctx)` | Remonter au-dessus de la racine échoue (« ../../options » ou « .. » depuis « pause » donnent « invalid_relative_route »). *(interne)* | 89 |
| `ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx)` | Avec des routes temporaires (registerModRoutes puis unregisterModRoutes), un `backTarget` relatif « .. » est résolu par rapport à la route qui le déclare. *(interne)* | 124 |
| `ui_router_routeManager.test.testRelativeChild(ctx)` | « ./options » depuis « pause » donne « pause.options ». *(interne)* | 38 |
| `ui_router_routeManager.test.testRelativeDeeperChild(ctx)` | « ./category » depuis « pause.options » donne « pause.options.category ». *(interne)* | 45 |
| `ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx)` | Un `fallbackTarget` relatif est résolu de la même façon. *(interne)* | 143 |
| `ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx)` | Un nom canonique déjà résolu (« pause.options ») reste identique si on le résout à nouveau (stabilité au rechargement). *(interne)* | 70 |
| `ui_router_routeManager.test.testRelativeMultiParent(ctx)` | « ../../system » depuis « pause.options.category » donne « pause.system ». *(interne)* | 65 |
| `ui_router_routeManager.test.testRelativeParent(ctx)` | « .. » depuis « pause.options » donne « pause ». *(interne)* | 55 |
| `ui_router_routeManager.test.testRelativeSelf(ctx)` | « . » depuis « pause.options » donne « pause.options » (la route de base elle-même). *(interne)* | 60 |
| `ui_router_routeManager.test.testRelativeSibling(ctx)` | « ../options » depuis « pause.system » donne « pause.options ». *(interne)* | 50 |
| `ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx)` | Une référence relative sans route de base (nil ou chaîne vide) échoue avec « relative_route_without_base ». *(interne)* | 78 |
| `ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx)` | `ui.uiNav` vaut true quand la route ne le définit pas. *(interne)* | 154 |
| `ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx)` | `ui.uiNav = false` explicite n'est pas écrasé par l'héritage des valeurs par défaut. *(interne)* | 165 |
| `ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx)` | La route statique « multiseat » a uiNav = false. *(interne)* | 184 |
| `ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx)` | La route statique « play » a uiNav = false (désactivation de la navigation UI). *(interne)* | 176 |

### Détail des paramètres

#### `ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx)`

Les références globales à un segment (« play ») et préfixées par '/' (« /mainmenu ») restent absolues, même sans route de base.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx)`

Une référence absolue pointée (« pause.options ») passe sans changement.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx)`

Le `backTarget` relatif d'un parent abstrait est résolu par rapport à ce parent.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testInvalidReferenceFails(ctx)`

Une référence vide ou nil échoue avec « invalid_relative_route ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeAboveRootFails(ctx)`

Remonter au-dessus de la racine échoue (« ../../options » ou « .. » depuis « pause » donnent « invalid_relative_route »).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx)`

Avec des routes temporaires (registerModRoutes puis unregisterModRoutes), un `backTarget` relatif « .. » est résolu par rapport à la route qui le déclare.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeChild(ctx)`

« ./options » depuis « pause » donne « pause.options ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeDeeperChild(ctx)`

« ./category » depuis « pause.options » donne « pause.options.category ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx)`

Un `fallbackTarget` relatif est résolu de la même façon.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx)`

Un nom canonique déjà résolu (« pause.options ») reste identique si on le résout à nouveau (stabilité au rechargement).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeMultiParent(ctx)`

« ../../system » depuis « pause.options.category » donne « pause.system ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeParent(ctx)`

« .. » depuis « pause.options » donne « pause ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeSelf(ctx)`

« . » depuis « pause.options » donne « pause.options » (la route de base elle-même).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeSibling(ctx)`

« ../options » depuis « pause.system » donne « pause.options ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx)`

Une référence relative sans route de base (nil ou chaîne vide) échoue avec « relative_route_without_base ».

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx)`

`ui.uiNav` vaut true quand la route ne le définit pas.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx)`

`ui.uiNav = false` explicite n'est pas écrasé par l'héritage des valeurs par défaut.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx)`

La route statique « multiseat » a uiNav = false.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx)`

La route statique « play » a uiNav = false (désactivation de la navigation UI).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeManager.test.lua`.*

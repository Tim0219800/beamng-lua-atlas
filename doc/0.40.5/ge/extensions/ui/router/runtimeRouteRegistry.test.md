# `ui_router_runtimeRouteRegistry.test`

*Fichier : `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua` · VM : Game Engine (GE) · 367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_runtimeRouteRegistry.test` : `extensions.load("ui_router_runtimeRouteRegistry.test")`, puis la globale `ui_router_runtimeRouteRegistry.test`

Tests unitaires du registre de routes d'exécution (analyse des routes Vue brutes, validation transactionnelle, précédence des sources, diffs ajouté/retiré/modifié, isolation des instances). Lancement : extensions.testFramework_TestManager:runTestFiles("runtimeRouteRegistry"). Utile comme exemples du format de routes accepté par registerModRoutes.

## Remarques

- Les fonctions testXxx(ctx) sont exécutées par testFramework_TestManager ; le jeu ne les appelle pas en usage normal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx)` | meta.luaRoute applique uniquement les clés autorisées. *(interne)* | 123 |
| `ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx)` | Un `name` en tableau crée plusieurs routes partageant la même définition. *(interne)* | 79 |
| `ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx)` | getEffectiveRoutes renvoie des copies profondes : les modifier n'affecte pas le registre. *(interne)* | 335 |
| `ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx)` | Une ré-inscription invalide laisse l'instantané précédent intact (transactionnel). *(interne)* | 202 |
| `ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx)` | Un sourceId vide ou non-chaîne est rejeté. *(interne)* | 359 |
| `ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx)` | Les champs meta (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav…) sont reportés dans `ui`. *(interne)* | 94 |
| `ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx)` | La source la plus récente gagne pour un même nom, sans fusion. *(interne)* | 217 |
| `ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx)` | Les enfants imbriqués sur plusieurs niveaux sont tous analysés. *(interne)* | 56 |
| `ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx)` | Une route nommée reçoit les valeurs par défaut Vue (runtime, ui.uiTypes = vue, filtre only). *(interne)* | 20 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx)` | Ré-enregistrer une source retire les noms qui ne figurent plus dans la nouvelle liste. *(interne)* | 285 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx)` | Ré-enregistrer une source conserve son rang de priorité. *(interne)* | 230 |
| `ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx)` | register renvoie les listes added et changed correctes. *(interne)* | 297 |
| `ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx)` | backTarget et fallbackTarget simultanés sont rejetés. *(interne)* | 177 |
| `ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx)` | Un nom de route en double dans une source est rejeté. *(interne)* | 185 |
| `ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx)` | Un hook donné comme fonction (et non chaîne) est rejeté. *(interne)* | 169 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx)` | Un hook de cycle de vie qui n'est pas « module.func » est rejeté. *(interne)* | 160 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx)` | Un `name` de type invalide (ni chaîne ni tableau de chaînes) est rejeté. *(interne)* | 194 |
| `ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx)` | Deux instances de registre sont indépendantes. *(interne)* | 349 |
| `ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx)` | getSourceOrder suit l'ordre de première inscription. *(interne)* | 270 |
| `ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx)` | Un nœud sans nom ne produit pas de route mais ses enfants oui. *(interne)* | 38 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx)` | Retirer une source inconnue réussit sans effet (existed = false). *(interne)* | 324 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx)` | unregister renvoie la liste removed correcte. *(interne)* | 313 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx)` | Retirer la source gagnante restaure la définition de la source précédente. *(interne)* | 257 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx)` | Retirer puis ré-enregistrer une source lui donne le rang le plus récent. *(interne)* | 243 |

### Détail des paramètres

#### `ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx)`

meta.luaRoute applique uniquement les clés autorisées.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx)`

Un `name` en tableau crée plusieurs routes partageant la même définition.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx)`

getEffectiveRoutes renvoie des copies profondes : les modifier n'affecte pas le registre.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx)`

Une ré-inscription invalide laisse l'instantané précédent intact (transactionnel).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx)`

Un sourceId vide ou non-chaîne est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx)`

Les champs meta (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav…) sont reportés dans `ui`.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx)`

La source la plus récente gagne pour un même nom, sans fusion.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx)`

Les enfants imbriqués sur plusieurs niveaux sont tous analysés.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx)`

Une route nommée reçoit les valeurs par défaut Vue (runtime, ui.uiTypes = vue, filtre only).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx)`

Ré-enregistrer une source retire les noms qui ne figurent plus dans la nouvelle liste.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx)`

Ré-enregistrer une source conserve son rang de priorité.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx)`

register renvoie les listes added et changed correctes.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx)`

backTarget et fallbackTarget simultanés sont rejetés.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx)`

Un nom de route en double dans une source est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx)`

Un hook donné comme fonction (et non chaîne) est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx)`

Un hook de cycle de vie qui n'est pas « module.func » est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx)`

Un `name` de type invalide (ni chaîne ni tableau de chaînes) est rejeté.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx)`

Deux instances de registre sont indépendantes.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx)`

getSourceOrder suit l'ordre de première inscription.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx)`

Un nœud sans nom ne produit pas de route mais ses enfants oui.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx)`

Retirer une source inconnue réussit sans effet (existed = false).

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx)`

unregister renvoie la liste removed correcte.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx)`

Retirer la source gagnante restaure la définition de la source précédente.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx)`

Retirer puis ré-enregistrer une source lui donne le rang le plus récent.

- `ctx` (*table*) : Contexte de test du testFramework (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua`.*

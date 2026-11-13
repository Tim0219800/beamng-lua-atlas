# `ui_router_runtimeRouteRegistry.test`

*Fichier : `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua` · VM : Game Engine (GE) · 367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_runtimeRouteRegistry.test` : `extensions.load("ui_router_runtimeRouteRegistry.test")`, puis la globale `ui_router_runtimeRouteRegistry.test`

Run with:
 require("testFramework/TestManager"):runTestFiles("runtimeRouteRegistry")
 or: extensions.testFramework_TestManager:runTestFiles("runtimeRouteRegistry")

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx)` |  | 123 |
| `ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx)` |  | 79 |
| `ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx)` |  | 335 |
| `ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx)` |  | 202 |
| `ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx)` |  | 359 |
| `ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx)` |  | 94 |
| `ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx)` |  | 217 |
| `ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx)` |  | 56 |
| `ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx)` |  | 20 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx)` |  | 285 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx)` |  | 230 |
| `ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx)` |  | 297 |
| `ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx)` |  | 177 |
| `ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx)` |  | 185 |
| `ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx)` |  | 169 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx)` |  | 160 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx)` |  | 194 |
| `ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx)` |  | 349 |
| `ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx)` |  | 270 |
| `ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx)` |  | 38 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx)` |  | 324 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx)` |  | 313 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx)` |  | 257 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx)` |  | 243 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua`.*

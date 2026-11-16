# `ui_router_runtimeRouteRegistry.test`

*File: `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua` · VM: Game Engine (GE) · 367 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_runtimeRouteRegistry.test`: `extensions.load("ui_router_runtimeRouteRegistry.test")`, then the global `ui_router_runtimeRouteRegistry.test`

Unit tests of the runtime route registry (parsing of raw Vue routes, transactional validation, source precedence, added/removed/changed diffs, instance isolation). Run with: extensions.testFramework_TestManager:runTestFiles("runtimeRouteRegistry"). Useful as examples of the route format accepted by registerModRoutes.

## Notes

- The testXxx(ctx) functions are run by testFramework_TestManager; the game does not call them in normal use.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx)` | meta.luaRoute applies only the allowed keys. *(internal)* | 123 |
| `ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx)` | An array `name` creates several routes sharing the same definition. *(internal)* | 79 |
| `ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx)` | getEffectiveRoutes returns deep copies: modifying them does not affect the registry. *(internal)* | 335 |
| `ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx)` | An invalid re-registration leaves the previous snapshot intact (transactional). *(internal)* | 202 |
| `ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx)` | An empty or non-string sourceId is rejected. *(internal)* | 359 |
| `ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx)` | The meta fields (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav...) are carried over into `ui`. *(internal)* | 94 |
| `ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx)` | The most recent source wins for the same name, with no merging. *(internal)* | 217 |
| `ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx)` | Children nested over several levels are all parsed. *(internal)* | 56 |
| `ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx)` | A named route gets the Vue defaults (runtime, ui.uiTypes = vue, filter only). *(internal)* | 20 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx)` | Re-registering a source removes the names that are no longer in the new list. *(internal)* | 285 |
| `ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx)` | Re-registering a source keeps its priority rank. *(internal)* | 230 |
| `ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx)` | register returns the correct added and changed lists. *(internal)* | 297 |
| `ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx)` | Simultaneous backTarget and fallbackTarget are rejected. *(internal)* | 177 |
| `ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx)` | A duplicate route name within a source is rejected. *(internal)* | 185 |
| `ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx)` | A hook given as a function (not a string) is rejected. *(internal)* | 169 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx)` | A lifecycle hook that is not "module.func" is rejected. *(internal)* | 160 |
| `ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx)` | A `name` of invalid type (neither string nor array of strings) is rejected. *(internal)* | 194 |
| `ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx)` | Two registry instances are independent. *(internal)* | 349 |
| `ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx)` | getSourceOrder follows the order of first registration. *(internal)* | 270 |
| `ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx)` | A node without a name produces no route but its children do. *(internal)* | 38 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx)` | Unregistering an unknown source succeeds with no effect (existed = false). *(internal)* | 324 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx)` | unregister returns the correct removed list. *(internal)* | 313 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx)` | Unregistering the winning source restores the definition of the previous source. *(internal)* | 257 |
| `ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx)` | Unregistering then re-registering a source gives it the most recent rank. *(internal)* | 243 |

### Parameter details

#### `ui_router_runtimeRouteRegistry.test.testAppliesAllowlistedLuaRouteOverrides(ctx)`

meta.luaRoute applies only the allowed keys.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testArrayRouteNamesShareDefinition(ctx)`

An array `name` creates several routes sharing the same definition.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testEffectiveRoutesAreDeepCopied(ctx)`

getEffectiveRoutes returns deep copies: modifying them does not affect the registry.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testFailedReRegistrationKeepsPreviousSnapshot(ctx)`

An invalid re-registration leaves the previous snapshot intact (transactional).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testInvalidSourceIdRejected(ctx)`

An empty or non-string sourceId is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testMapsUiFieldsFromMeta(ctx)`

The meta fields (uiTypes, infoBar, topBar, uiApps, triggerPause, uiNav...) are carried over into `ui`.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testNewestSourceWinsWithoutComposition(ctx)`

The most recent source wins for the same name, with no merging.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testParsesDeeplyNestedChildren(ctx)`

Children nested over several levels are all parsed.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testParsesSingleNamedRouteWithVueDefaults(ctx)`

A named route gets the Vue defaults (runtime, ui.uiTypes = vue, filter only).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testReRegistrationRemovesStaleNames(ctx)`

Re-registering a source removes the names that are no longer in the new list.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testReRegistrationRetainsOriginalPrecedence(ctx)`

Re-registering a source keeps its priority rank.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRegisterReportsAddedAndChangedDiffs(ctx)`

register returns the correct added and changed lists.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsBackTargetAndFallbackTargetTogether(ctx)`

Simultaneous backTarget and fallbackTarget are rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsDuplicateRouteNameWithinSource(ctx)`

A duplicate route name within a source is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsFunctionLifecycleHook(ctx)`

A hook given as a function (not a string) is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsInvalidLifecycleHook(ctx)`

A lifecycle hook that is not "module.func" is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testRejectsInvalidNameShape(ctx)`

A `name` of invalid type (neither string nor array of strings) is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testSeparateRegistriesDoNotShareState(ctx)`

Two registry instances are independent.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testSourceOrderTracksFirstRegistration(ctx)`

getSourceOrder follows the order of first registration.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnnamedGroupEmitsChildrenButNotItself(ctx)`

A node without a name produces no route but its children do.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterMissingSourceIsNoop(ctx)`

Unregistering an unknown source succeeds with no effect (existed = false).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterReportsRemovedDiff(ctx)`

unregister returns the correct removed list.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterRestoresPreviousWinner(ctx)`

Unregistering the winning source restores the definition of the previous source.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_runtimeRouteRegistry.test.testUnregisterThenRegisterCreatesNewPrecedence(ctx)`

Unregistering then re-registering a source gives it the most recent rank.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/runtimeRouteRegistry.test.lua`.*

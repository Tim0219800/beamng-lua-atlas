# `ui_router_routeManager.test`

*File: `lua/ge/extensions/ui/router/routeManager.test.lua` · VM: Game Engine (GE) · 208 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeManager.test`: `extensions.load("ui_router_routeManager.test")`, then the global `ui_router_routeManager.test`

Unit tests of routeManager (resolution of relative route names, relative back targets, default value of `uiNav`). Game test file, of no direct interest to a modder except as usage examples of resolveRouteName and getRoute. Run with: extensions.testFramework_TestManager:runTestFiles("routeManager"). The file also contains, in a comment, a manual relative navigation test (ui_router.navigate("./options:options-search") from "pause" must give name = "pause.options").

## Notes

- Each testXxx(ctx) function is a test function run by testFramework_TestManager; the game does not call them outside tests.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx)` | Single-segment global references ("play") and '/'-prefixed ones ("/mainmenu") stay absolute, even without a base route. *(internal)* | 31 |
| `ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx)` | An absolute dotted reference ("pause.options") passes through unchanged. *(internal)* | 24 |
| `ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx)` | The relative `backTarget` of an abstract parent is resolved against that parent. *(internal)* | 192 |
| `ui_router_routeManager.test.testInvalidReferenceFails(ctx)` | An empty or nil reference fails with "invalid_relative_route". *(internal)* | 100 |
| `ui_router_routeManager.test.testRelativeAboveRootFails(ctx)` | Going above the root fails ("../../options" or ".." from "pause" give "invalid_relative_route"). *(internal)* | 89 |
| `ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx)` | With temporary routes (registerModRoutes then unregisterModRoutes), a relative `backTarget` ".." is resolved against the route that declares it. *(internal)* | 124 |
| `ui_router_routeManager.test.testRelativeChild(ctx)` | "./options" from "pause" gives "pause.options". *(internal)* | 38 |
| `ui_router_routeManager.test.testRelativeDeeperChild(ctx)` | "./category" from "pause.options" gives "pause.options.category". *(internal)* | 45 |
| `ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx)` | A relative `fallbackTarget` is resolved the same way. *(internal)* | 143 |
| `ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx)` | An already resolved canonical name ("pause.options") stays identical if resolved again (stability on reload). *(internal)* | 70 |
| `ui_router_routeManager.test.testRelativeMultiParent(ctx)` | "../../system" from "pause.options.category" gives "pause.system". *(internal)* | 65 |
| `ui_router_routeManager.test.testRelativeParent(ctx)` | ".." from "pause.options" gives "pause". *(internal)* | 55 |
| `ui_router_routeManager.test.testRelativeSelf(ctx)` | "." from "pause.options" gives "pause.options" (the base route itself). *(internal)* | 60 |
| `ui_router_routeManager.test.testRelativeSibling(ctx)` | "../options" from "pause.system" gives "pause.options". *(internal)* | 50 |
| `ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx)` | A relative reference without a base route (nil or empty string) fails with "relative_route_without_base". *(internal)* | 78 |
| `ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx)` | `ui.uiNav` is true when the route does not define it. *(internal)* | 154 |
| `ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx)` | An explicit `ui.uiNav = false` is not overwritten by default value inheritance. *(internal)* | 165 |
| `ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx)` | The static route "multiseat" has uiNav = false. *(internal)* | 184 |
| `ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx)` | The static route "play" has uiNav = false (UI navigation disabled). *(internal)* | 176 |

### Parameter details

#### `ui_router_routeManager.test.testAbsoluteGlobalReferencesUnchanged(ctx)`

Single-segment global references ("play") and '/'-prefixed ones ("/mainmenu") stay absolute, even without a base route.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testAbsoluteReferenceUnchanged(ctx)`

An absolute dotted reference ("pause.options") passes through unchanged.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testAbstractParentRelativeBackTargetUsesParentBase(ctx)`

The relative `backTarget` of an abstract parent is resolved against that parent.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testInvalidReferenceFails(ctx)`

An empty or nil reference fails with "invalid_relative_route".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeAboveRootFails(ctx)`

Going above the root fails ("../../options" or ".." from "pause" give "invalid_relative_route").

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeBackTargetResolvesToParent(ctx)`

With temporary routes (registerModRoutes then unregisterModRoutes), a relative `backTarget` ".." is resolved against the route that declares it.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeChild(ctx)`

"./options" from "pause" gives "pause.options".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeDeeperChild(ctx)`

"./category" from "pause.options" gives "pause.options.category".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeFallbackTargetResolves(ctx)`

A relative `fallbackTarget` is resolved the same way.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeIdempotentAfterResolution(ctx)`

An already resolved canonical name ("pause.options") stays identical if resolved again (stability on reload).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeMultiParent(ctx)`

"../../system" from "pause.options.category" gives "pause.system".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeParent(ctx)`

".." from "pause.options" gives "pause".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeSelf(ctx)`

"." from "pause.options" gives "pause.options" (the base route itself).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeSibling(ctx)`

"../options" from "pause.system" gives "pause.options".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testRelativeWithoutBaseFails(ctx)`

A relative reference without a base route (nil or empty string) fails with "relative_route_without_base".

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavDefaultsToTrueWhenOmitted(ctx)`

`ui.uiNav` is true when the route does not define it.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavExplicitFalseSurvivesInheritance(ctx)`

An explicit `ui.uiNav = false` is not overwritten by default value inheritance.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavStaticMultiseatOptOut(ctx)`

The static route "multiseat" has uiNav = false.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeManager.test.testUiNavStaticPlayOptOut(ctx)`

The static route "play" has uiNav = false (UI navigation disabled).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeManager.test.lua`.*

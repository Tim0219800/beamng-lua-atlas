# `ui_router_navigationObserver.test`

*File: `lua/ge/extensions/ui/router/navigationObserver.test.lua` · VM: Game Engine (GE) · 214 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_navigationObserver.test`: `extensions.load("ui_router_navigationObserver.test")`, then the global `ui_router_navigationObserver.test`

Unit tests of the non-shipping NavigationObserver module (duplicate_navigation / conflicting_navigation classification, caller attribution, single warning, reset). Not an API for modders: file run by the test framework.

## Notes

- Launch: extensions.testFramework_TestManager:runTestFiles("navigationObserver").

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx)` | Checks that beginAttempt ignores the router's internal frames and attributes the external Lua caller. *(internal)* | 119 |
| `ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx)` | Checks the fallback to "bridge/unknown" when no Lua frame is available. *(internal)* | 135 |
| `ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx)` | Checks that different router options give conflicting_navigation. *(internal)* | 103 |
| `ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx)` | Checks that different effective parameters give conflicting_navigation. *(internal)* | 75 |
| `ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx)` | Checks that a different route gives conflicting_navigation. *(internal)* | 61 |
| `ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx)` | Checks that a different scope gives conflicting_navigation. *(internal)* | 89 |
| `ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx)` | Checks that two identical requests (route, scope, params, options) are classified duplicate_navigation. *(internal)* | 42 |
| `ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx)` | Checks that reportPreemption does nothing if one of the attempts is missing. *(internal)* | 192 |
| `ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx)` | Checks that a preempted attempt is reported only once. *(internal)* | 154 |
| `ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx)` | Checks that reset() resets the counter, the current attempt and the deduplication state. *(internal)* | 171 |
| `ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx)` | Checks that an attempt never preempts itself. *(internal)* | 203 |

### Parameter details

#### `ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx)`

Checks that beginAttempt ignores the router's internal frames and attributes the external Lua caller.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx)`

Checks the fallback to "bridge/unknown" when no Lua frame is available.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx)`

Checks that different router options give conflicting_navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx)`

Checks that different effective parameters give conflicting_navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx)`

Checks that a different route gives conflicting_navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx)`

Checks that a different scope gives conflicting_navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx)`

Checks that two identical requests (route, scope, params, options) are classified duplicate_navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx)`

Checks that reportPreemption does nothing if one of the attempts is missing.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx)`

Checks that a preempted attempt is reported only once.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx)`

Checks that reset() resets the counter, the current attempt and the deduplication state.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx)`

Checks that an attempt never preempts itself.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/navigationObserver.test.lua`.*

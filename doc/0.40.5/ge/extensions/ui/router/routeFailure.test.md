# `ui_router_routeFailure.test`

*File: `lua/ge/extensions/ui/router/routeFailure.test.lua` · VM: Game Engine (GE) · 138 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeFailure.test`: `extensions.load("ui_router_routeFailure.test")`, then the global `ui_router_routeFailure.test`

Tests of the transition failure contract of router.lua: routeMounted rejected before commit, routeChangeFailed rollback for an uncommitted navigation, rejections with no active transition, after commit or with a stale identifier. File run by the test framework, not an API for modders.

## Notes

- Run with: extensions.testFramework_TestManager:runTestFiles("routeFailure").
- The tests drive the real ui_router singleton with a fabricated transition, then reset TransitionManager and restore any pending entry.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx)` | routeChangeFailed is rejected once the route is already committed. *(internal)* | 103 |
| `ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx)` | routeChangeFailed is rejected if there is no active transition. *(internal)* | 94 |
| `ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx)` | routeChangeFailed rejects a different transition identifier so as not to cancel a more recent navigation. *(internal)* | 124 |
| `ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx)` | routeChangeFailed clears the pending entry and ends the transition. *(internal)* | 76 |
| `ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx)` | routeMounted is rejected with not_committed until the route change is committed. *(internal)* | 61 |

### Parameter details

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx)`

routeChangeFailed is rejected once the route is already committed.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx)`

routeChangeFailed is rejected if there is no active transition.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx)`

routeChangeFailed rejects a different transition identifier so as not to cancel a more recent navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx)`

routeChangeFailed clears the pending entry and ends the transition.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx)`

routeMounted is rejected with not_committed until the route change is committed.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeFailure.test.lua`.*

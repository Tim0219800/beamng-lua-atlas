# `ui_router_transitionRecovery.test`

*File: `lua/ge/extensions/ui/router/transitionRecovery.test.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_transitionRecovery.test`: `extensions.load("ui_router_transitionRecovery.test")`, then the global `ui_router_transitionRecovery.test`

Targeted tests of the Vue startup recovery contract for the router: transition resent every second without limit (startup phase), acknowledgments that serve only as telemetry (routeChangeReceived), resends stopped by routeNavigationStarted, rejection of acknowledgments with a stale transition identifier, identifier kept on cancellation and cleanup of the pending entry. Uses Config, TransitionManager and NavigationState. Run with: extensions.testFramework_TestManager:runTestFiles("transitionRecovery").

## Notes

- The testXxx(ctx) functions are run by testFramework_TestManager; the game does not call them in normal use.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx)` | Cancellation returns the identifier of the started transition (used in the cancellation payload). *(internal)* | 161 |
| `ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx)` | Cancelling with no transition in progress returns a nil identifier. *(internal)* | 175 |
| `ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx)` | NavigationState clears the uncommitted pending entry. *(internal)* | 185 |
| `ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx)` | routeNavigationStarted stops the resends. *(internal)* | 87 |
| `ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx)` | After a long startup, the end-of-transition timers restart from zero once navigation has started. *(internal)* | 101 |
| `ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx)` | routeChangeReceived is telemetry: it does not stop the resends. *(internal)* | 71 |
| `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx)` | A completion acknowledgment with a stale identifier is rejected. *(internal)* | 146 |
| `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx)` | A progress acknowledgment with a stale transition identifier is rejected. *(internal)* | 129 |
| `ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx)` | The startup resend interval in Config is one second. *(internal)* | 47 |
| `ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx)` | In the startup phase, the transition is resent every second, indefinitely. *(internal)* | 54 |

### Parameter details

#### `ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx)`

Cancellation returns the identifier of the started transition (used in the cancellation payload).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx)`

Cancelling with no transition in progress returns a nil identifier.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx)`

NavigationState clears the uncommitted pending entry.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx)`

routeNavigationStarted stops the resends.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx)`

After a long startup, the end-of-transition timers restart from zero once navigation has started.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx)`

routeChangeReceived is telemetry: it does not stop the resends.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx)`

A completion acknowledgment with a stale identifier is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx)`

A progress acknowledgment with a stale transition identifier is rejected.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx)`

The startup resend interval in Config is one second.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx)`

In the startup phase, the transition is resent every second, indefinitely.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/transitionRecovery.test.lua`.*

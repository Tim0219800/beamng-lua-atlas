# `ui_router_navigationProtection.test`

*File: `lua/ge/extensions/ui/router/navigationProtection.test.lua` · VM: Game Engine (GE) · 395 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_navigationProtection.test`: `extensions.load("ui_router_navigationProtection.test")`, then the global `ui_router_navigationProtection.test`

Tests of the protected navigation lock (options.cancellable == false) of router.lua: acquisition, blocking at admission, retention between commit and mount, and release on all terminal paths (cancel, rejection, failure, timeout, reset, deserialization). File run by the test framework, not an API for modders.

## Notes

- Launch: extensions.testFramework_TestManager:runTestFiles("navigationProtection").
- The terminal path tests build a transition whose session carries a protection token and use the access points __test_getProtectionToken/__test_setProtectionToken of ui_router; the acquisition tests use a temporary mod route ("navprotect") cancelled before commit.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_navigationProtection.test.testCancelReleasesProtection(ctx)` | M.cancel releases the lock. *(internal)* | 239 |
| `ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx)` | cancellable nil or true: no lock, the last navigation wins. *(internal)* | 127 |
| `ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx)` | onDeserialize drops a stale lock without touching the persistent navigation state. *(internal)* | 317 |
| `ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx)` | routeChangeFailed releases the lock. *(internal)* | 270 |
| `ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx)` | Without an active protected navigation, navigate is not blocked at admission. *(internal)* | 210 |
| `ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx)` | The admission gate rejects a newer request before route resolution or guards. *(internal)* | 181 |
| `ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx)` | Repeated or identical requests are all blocked during protection (no queue). *(internal)* | 195 |
| `ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx)` | cancellable=false acquires the lock, blocks following navigations; cancel releases it. *(internal)* | 153 |
| `ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx)` | The lock is kept between commit and mount, then released at full completion. *(internal)* | 328 |
| `ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx)` | A route without a mount acknowledgment releases the lock at routeChangeComplete. *(internal)* | 352 |
| `ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx)` | routeChangeRejected releases the lock. *(internal)* | 255 |
| `ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx)` | Cleanup of an old transition cannot clear the lock of a newer protected navigation. *(internal)* | 223 |
| `ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx)` | reload passes cancellable=false to the replayed transition, which acquires the lock. *(internal)* | 375 |
| `ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx)` | resetStates clears the lock. *(internal)* | 305 |
| `ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx)` | A transition timeout releases the lock. *(internal)* | 288 |

### Parameter details

#### `ui_router_navigationProtection.test.testCancelReleasesProtection(ctx)`

M.cancel releases the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx)`

cancellable nil or true: no lock, the last navigation wins.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx)`

onDeserialize drops a stale lock without touching the persistent navigation state.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx)`

routeChangeFailed releases the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx)`

Without an active protected navigation, navigate is not blocked at admission.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx)`

The admission gate rejects a newer request before route resolution or guards.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx)`

Repeated or identical requests are all blocked during protection (no queue).

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx)`

cancellable=false acquires the lock, blocks following navigations; cancel releases it.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx)`

The lock is kept between commit and mount, then released at full completion.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx)`

A route without a mount acknowledgment releases the lock at routeChangeComplete.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx)`

routeChangeRejected releases the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx)`

Cleanup of an old transition cannot clear the lock of a newer protected navigation.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx)`

reload passes cancellable=false to the replayed transition, which acquires the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx)`

resetStates clears the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

#### `ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx)`

A transition timeout releases the lock.

- `ctx` (*table*) : Test framework context (setDescription, assert, assertEqual).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/navigationProtection.test.lua`.*

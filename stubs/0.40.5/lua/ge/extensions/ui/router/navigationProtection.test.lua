---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationProtection.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests of the protected navigation lock (options.cancellable == false) of router.lua: acquisition, blocking at admission, retention between commit and mount, and release on all terminal paths (cancel, rejection, failure, timeout, reset, deserialization). File run by the test framework, not an API for modders.
--- Access: extension `ui_router_navigationProtection.test`: `extensions.load("ui_router_navigationProtection.test")`, then the global `ui_router_navigationProtection.test`
---@class ui_router_navigationProtection.test
ui_router_navigationProtection.test = {}

--- M.cancel releases the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:239
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testCancelReleasesProtection(ctx) end

--- cancellable nil or true: no lock, the last navigation wins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:127
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testDefaultNavigationsDoNotAcquireProtection(ctx) end

--- onDeserialize drops a stale lock without touching the persistent navigation state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:317
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testDeserializeClearsStaleProtection(ctx) end

--- routeChangeFailed releases the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:270
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testFrameworkFailureReleasesProtection(ctx) end

--- Without an active protected navigation, navigate is not blocked at admission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:210
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testIdleRouterDoesNotBlockNavigation(ctx) end

--- The admission gate rejects a newer request before route resolution or guards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:181
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedLockBlocksBeforeResolution(ctx) end

--- Repeated or identical requests are all blocked during protection (no queue).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:195
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedLockBlocksIdenticalAndRepeatedRequests(ctx) end

--- cancellable=false acquires the lock, blocks following navigations; cancel releases it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:153
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectedNavigationAcquiresBlocksAndCancelReleases(ctx) end

--- The lock is kept between commit and mount, then released at full completion.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:328
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectionHeldAcrossCommitAndReleasedOnMount(ctx) end

--- A route without a mount acknowledgment releases the lock at routeChangeComplete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:352
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testProtectionReleasedOnNonMountCompletion(ctx) end

--- routeChangeRejected releases the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:255
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testRejectionReleasesProtection(ctx) end

--- Cleanup of an old transition cannot clear the lock of a newer protected navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:223
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testReleaseOfNonMatchingTokenPreservesLock(ctx) end

--- reload passes cancellable=false to the replayed transition, which acquires the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:375
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testReloadForwardsCancellableFalse(ctx) end

--- resetStates clears the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:305
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testResetStatesReleasesProtection(ctx) end

--- A transition timeout releases the lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationProtection.test.lua:288
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationProtection.test.testTimeoutReleasesProtection(ctx) end


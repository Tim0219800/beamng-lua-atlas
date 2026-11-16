---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/transitionRecovery.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Targeted tests of the Vue startup recovery contract for the router: transition resent every second without limit (startup phase), acknowledgments that serve only as telemetry (routeChangeReceived), resends stopped by routeNavigationStarted, rejection of acknowledgments with a stale transition identifier, identifier kept on cancellation and cleanup of the pending entry. Uses Config, TransitionManager and NavigationState. Run with: extensions.testFramework_TestManager:runTestFiles("transitionRecovery").
--- Access: extension `ui_router_transitionRecovery.test`: `extensions.load("ui_router_transitionRecovery.test")`, then the global `ui_router_transitionRecovery.test`
---@class ui_router_transitionRecovery.test
ui_router_transitionRecovery.test = {}

--- Cancellation returns the identifier of the started transition (used in the cancellation payload).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:161
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testCancelReturnsStartedTransitionId(ctx) end

--- Cancelling with no transition in progress returns a nil identifier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:175
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testCancelWhenIdleReturnsNilId(ctx) end

--- NavigationState clears the uncommitted pending entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:185
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testClearPendingEntryRemovesUncommittedEntry(ctx) end

--- routeNavigationStarted stops the resends.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:87
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testNavigationStartedStopsResends(ctx) end

--- After a long startup, the end-of-transition timers restart from zero once navigation has started.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:101
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testPostStartTimersResetAfterLongStartup(ctx) end

--- routeChangeReceived is telemetry: it does not stop the resends.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:71
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testReceivedDoesNotStopStartupResends(ctx) end

--- A completion acknowledgment with a stale identifier is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:146
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnComplete(ctx) end

--- A progress acknowledgment with a stale transition identifier is rejected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:129
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStaleTransitionIdIsRejectedOnProgress(ctx) end

--- The startup resend interval in Config is one second.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:47
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStartupResendIntervalIsOneSecond(ctx) end

--- In the startup phase, the transition is resent every second, indefinitely.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/transitionRecovery.test.lua:54
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_transitionRecovery.test.testStartupResendsEverySecondIndefinitely(ctx) end


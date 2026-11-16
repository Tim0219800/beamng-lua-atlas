---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationObserver.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of the non-shipping NavigationObserver module (duplicate_navigation / conflicting_navigation classification, caller attribution, single warning, reset). Not an API for modders: file run by the test framework.
--- Access: extension `ui_router_navigationObserver.test`: `extensions.load("ui_router_navigationObserver.test")`, then the global `ui_router_navigationObserver.test`
---@class ui_router_navigationObserver.test
ui_router_navigationObserver.test = {}

--- Checks that beginAttempt ignores the router's internal frames and attributes the external Lua caller.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:119
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testBeginAttemptAttributesExternalCaller(ctx) end

--- Checks the fallback to "bridge/unknown" when no Lua frame is available.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:135
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testBeginAttemptFallsBackToBridgeUnknown(ctx) end

--- Checks that different router options give conflicting_navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:103
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentOptionsIsConflict(ctx) end

--- Checks that different effective parameters give conflicting_navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:75
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentParamsIsConflict(ctx) end

--- Checks that a different route gives conflicting_navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:61
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentRouteIsConflict(ctx) end

--- Checks that a different scope gives conflicting_navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:89
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testDifferentScopeIsConflict(ctx) end

--- Checks that two identical requests (route, scope, params, options) are classified duplicate_navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:42
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testIdenticalRequestsAreDuplicate(ctx) end

--- Checks that reportPreemption does nothing if one of the attempts is missing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:192
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testMissingAttemptsAreNotReported(ctx) end

--- Checks that a preempted attempt is reported only once.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:154
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testPreemptedAttemptIsReportedOnlyOnce(ctx) end

--- Checks that reset() resets the counter, the current attempt and the deduplication state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:171
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testResetClearsCounterAndReportState(ctx) end

--- Checks that an attempt never preempts itself.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.test.lua:203
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_navigationObserver.test.testSelfPreemptionIsNotReported(ctx) end


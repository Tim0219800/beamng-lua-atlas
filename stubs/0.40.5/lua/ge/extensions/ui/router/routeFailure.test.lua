---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeFailure.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests of the transition failure contract of router.lua: routeMounted rejected before commit, routeChangeFailed rollback for an uncommitted navigation, rejections with no active transition, after commit or with a stale identifier. File run by the test framework, not an API for modders.
--- Access: extension `ui_router_routeFailure.test`: `extensions.load("ui_router_routeFailure.test")`, then the global `ui_router_routeFailure.test`
---@class ui_router_routeFailure.test
ui_router_routeFailure.test = {}

--- routeChangeFailed is rejected once the route is already committed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeFailure.test.lua:103
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectedAfterCommit(ctx) end

--- routeChangeFailed is rejected if there is no active transition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeFailure.test.lua:94
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectedWithoutActiveTransition(ctx) end

--- routeChangeFailed rejects a different transition identifier so as not to cancel a more recent navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeFailure.test.lua:124
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRejectsStaleTransitionId(ctx) end

--- routeChangeFailed clears the pending entry and ends the transition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeFailure.test.lua:76
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteChangeFailedRollsBackUncommittedNavigation(ctx) end

--- routeMounted is rejected with not_committed until the route change is committed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/routeFailure.test.lua:61
---@param ctx table Test framework context (setDescription, assert, assertEqual).
function ui_router_routeFailure.test.testRouteMountedRejectedBeforeCommit(ctx) end


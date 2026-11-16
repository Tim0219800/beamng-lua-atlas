---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/performanceSpatialGameplayExit. Each test receives a `ctx` context (assert, assertEqual) from the game's test runner and injects fake gameplay modules via the `source` parameter (level "italy", vehicle at (1.24, -2.26, 3.01), camera at (10.04, 20.06, 30.01)). It is not an extension to load.
--- Access: extension `telemetry_performanceSpatialGameplayExit.test`: `extensions.load("telemetry_performanceSpatialGameplayExit.test")`, then the global `telemetry_performanceSpatialGameplayExit.test`
---@class telemetry_performanceSpatialGameplayExit.test
telemetry_performanceSpatialGameplayExit.test = {}

--- An active drag, drift or crawl takes precedence over an active career delivery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:244
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx) end

--- Checks that each family (scenario, free delivery, career delivery, test drive, certification, drag, drift, crawl) is recognized with the right activityType and activityId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:58
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx) end

--- capture takes the vehicle's position (rounded to 0.1), otherwise the camera's.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:146
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx) end

--- capture converts a numeric id to a string, omits an invalid id without losing the event, and returns nil for an unknown exitKind/activityType or an untracked level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:165
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx) end

--- A finished crawl is no longer active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:293
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx) end

--- A finished drag (isCompleted) is no longer active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:211
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx) end

--- A scenario in the post state is not an active activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:188
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx) end

--- A drift challenge in the conclusion phase is no longer active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:200
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx) end

--- The drag key is computed with the highest-level drag data, and the prefix ":" is completed with the current level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:224
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx) end

--- A foreground mission takes precedence over a drag in progress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:39
---@param ctx table Test context.
function telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx) end


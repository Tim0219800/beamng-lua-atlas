---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/performanceSpatialSnapshot (runTestFiles("performanceSpatialSnapshot")).
--- Access: extension `telemetry_performanceSpatialSnapshot.test`: `extensions.load("telemetry_performanceSpatialSnapshot.test")`, then the global `telemetry_performanceSpatialSnapshot.test`
---@class telemetry_performanceSpatialSnapshot.test
telemetry_performanceSpatialSnapshot.test = {}

--- Checks that framePhases and renderStats are absent by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:15
---@param ctx table Test framework context.
function telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx) end

--- Checks that renderTimingTrackingEnabled adds framePhases without renderStats.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:22
---@param ctx table Test framework context.
function telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx) end

--- Checks that sceneComplexityTrackingEnabled adds renderStats (including a numeric visibleObjectCount) without framePhases.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua:29
---@param ctx table Test framework context.
function telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx) end


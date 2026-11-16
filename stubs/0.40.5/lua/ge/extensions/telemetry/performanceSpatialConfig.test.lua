---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of telemetry/performanceSpatialConfig (runTestFiles("performanceSpatialConfig")).
--- Access: extension `telemetry_performanceSpatialConfig.test`: `extensions.load("telemetry_performanceSpatialConfig.test")`, then the global `telemetry_performanceSpatialConfig.test`
---@class telemetry_performanceSpatialConfig.test
telemetry_performanceSpatialConfig.test = {}

--- Checks that with an empty config, the interval is 0 and all advanced tracking is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:11
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx) end

--- Checks that sceneComplexityTrackingEnabled and renderTimingTrackingEnabled must be explicitly enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:48
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx) end

--- Checks that out-of-range dip thresholds are brought back within their bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:71
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx) end

--- Checks that gameplayExitTrackingEnabled must be explicitly set to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:34
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx) end

--- Checks that the levels list becomes a lookup table name -> true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:60
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx) end

--- Checks that recoveryTrackingEnabled must be explicitly set to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:28
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx) end

--- Checks that shaderGenerationTrackingEnabled must be explicitly set to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua:41
---@param ctx table Test framework context.
function telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx) end


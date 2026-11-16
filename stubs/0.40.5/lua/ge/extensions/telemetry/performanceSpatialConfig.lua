---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility module (loaded by require) that reads and validates the server configuration of the performanceSpatial tracker. Numbers are clamped (NaN/infinity replaced by the default value); all advanced collection options are disabled by default and must be enabled explicitly.
--- Access: extension `telemetry_performanceSpatialConfig`: `extensions.load("telemetry_performanceSpatialConfig")`, then the global `telemetry_performanceSpatialConfig`
---@class telemetry_performanceSpatialConfig
telemetry_performanceSpatialConfig = {}

--- Returns the normalized configuration: sampleIntervalSeconds, the booleans dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, optionally levels (lookup table) and detector (dip thresholds).
---Source: lua/ge/extensions/telemetry/performanceSpatialConfig.lua:17
---@param config table|nil Raw module configuration (a non-table value is treated as {}).
---@return table  Validated configuration.
function telemetry_performanceSpatialConfig.read(config) end


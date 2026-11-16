---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility module (loaded by require) that builds the performance snapshot sent by the performanceSpatial tracker: FPS (instantaneous, average, min, p99), frame time, CPU/GPU, FPS cap cause, camera position and settings, world state (time scale, vehicle count, split screen, traffic) and, optionally, the time breakdown by frame phase and render statistics. Values are rounded.
--- Access: extension `telemetry_performanceSpatialSnapshot`: `extensions.load("telemetry_performanceSpatialSnapshot")`, then the global `telemetry_performanceSpatialSnapshot`
---@class telemetry_performanceSpatialSnapshot
telemetry_performanceSpatialSnapshot = {}

--- Returns an event table: level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, and optionally framePhases and renderStats.
---Source: lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua:168
---@param level string Current level name.
---@param fpsInstant number Instantaneous FPS.
---@param frameMs number Frame duration in ms.
---@param activeGpu any Description of the active GPU, copied as is.
---@param options table|nil renderTimingTrackingEnabled, sceneComplexityTrackingEnabled.
---@return table  Performance event.
function telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options) end


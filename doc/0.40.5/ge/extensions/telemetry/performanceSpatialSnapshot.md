# `telemetry_performanceSpatialSnapshot`

*File: `lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua` · VM: Game Engine (GE) · 192 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialSnapshot`: `extensions.load("telemetry_performanceSpatialSnapshot")`, then the global `telemetry_performanceSpatialSnapshot`

Utility module (loaded by require) that builds the performance snapshot sent by the performanceSpatial tracker: FPS (instantaneous, average, min, p99), frame time, CPU/GPU, FPS cap cause, camera position and settings, world state (time scale, vehicle count, split screen, traffic) and, optionally, the time breakdown by frame phase and render statistics. Values are rounded.

## Notes

- framePhases is only added if options.renderTimingTrackingEnabled; renderStats only if options.sceneComplexityTrackingEnabled.
- The phases come from Engine.Debug.getLastPerformanceMetrics; gpuWaitMs falls back to the FramePresent phase if absent.
- Camera position rounded to 0.1 m, angles to 0.1 degree.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options)` | Returns an event table: level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, and optionally framePhases and renderStats. | 168 |

### Parameter details

#### `telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options)`

Returns an event table: level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, and optionally framePhases and renderStats.

- `level` (*string*) : Current level name.
- `fpsInstant` (*number*) : Instantaneous FPS.
- `frameMs` (*number*) : Frame duration in ms.
- `activeGpu` (*any*) : Description of the active GPU, copied as is.
- `options` (*table|nil*) : renderTimingTrackingEnabled, sceneComplexityTrackingEnabled.
- **returns**: table Performance event.

## Calls into the engine (C++)

- `be:` `getObjectCount`, `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua`.*

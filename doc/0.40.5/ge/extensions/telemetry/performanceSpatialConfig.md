# `telemetry_performanceSpatialConfig`

*File: `lua/ge/extensions/telemetry/performanceSpatialConfig.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialConfig`: `extensions.load("telemetry_performanceSpatialConfig")`, then the global `telemetry_performanceSpatialConfig`

Utility module (loaded by require) that reads and validates the server configuration of the performanceSpatial tracker. Numbers are clamped (NaN/infinity replaced by the default value); all advanced collection options are disabled by default and must be enabled explicitly.

## Notes

- spatialSampleIntervalSeconds: 0 disables sampling, otherwise clamped to 1..3600 s.
- levels: at most 64 names (<= 128 characters, [%w_.-]) converted to a lookup table name -> true.
- Dip detection thresholds (only if dipTrackingEnabled): dipFpsThreshold 30 (1..360), dipFrameTimeRatio 2 (1.1..10), dipMinDurationMs 250 (50..10000), dipCooldownSeconds 5 (0..3600), maxDipEventsPerSession 100 (1..1000).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialConfig.read(config)` | Returns the normalized configuration: sampleIntervalSeconds, the booleans dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, optionally levels (lookup table) and detector (dip thresholds). | 17 |

### Parameter details

#### `telemetry_performanceSpatialConfig.read(config)`

Returns the normalized configuration: sampleIntervalSeconds, the booleans dipTrackingEnabled, recoveryTrackingEnabled, gameplayExitTrackingEnabled, shaderGenerationTrackingEnabled, sceneComplexityTrackingEnabled, renderTimingTrackingEnabled, optionally levels (lookup table) and detector (dip thresholds).

- `config` (*table|nil*) : Raw module configuration (a non-table value is treated as {}).
- **returns**: table Validated configuration.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialConfig.lua`.*

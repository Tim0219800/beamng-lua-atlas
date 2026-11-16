# `telemetry_performanceSpatialSnapshot.test`

*File: `lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialSnapshot.test`: `extensions.load("telemetry_performanceSpatialSnapshot.test")`, then the global `telemetry_performanceSpatialSnapshot.test`

Unit tests of telemetry/performanceSpatialSnapshot (runTestFiles("performanceSpatialSnapshot")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx)` | Checks that framePhases and renderStats are absent by default. *(internal)* | 15 |
| `telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx)` | Checks that renderTimingTrackingEnabled adds framePhases without renderStats. *(internal)* | 22 |
| `telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx)` | Checks that sceneComplexityTrackingEnabled adds renderStats (including a numeric visibleObjectCount) without framePhases. *(internal)* | 29 |

### Parameter details

#### `telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx)`

Checks that framePhases and renderStats are absent by default.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx)`

Checks that renderTimingTrackingEnabled adds framePhases without renderStats.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx)`

Checks that sceneComplexityTrackingEnabled adds renderStats (including a numeric visibleObjectCount) without framePhases.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua`.*

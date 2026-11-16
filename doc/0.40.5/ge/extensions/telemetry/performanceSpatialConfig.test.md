# `telemetry_performanceSpatialConfig.test`

*File: `lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialConfig.test`: `extensions.load("telemetry_performanceSpatialConfig.test")`, then the global `telemetry_performanceSpatialConfig.test`

Unit tests of telemetry/performanceSpatialConfig (runTestFiles("performanceSpatialConfig")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx)` | Checks that with an empty config, the interval is 0 and all advanced tracking is disabled. *(internal)* | 11 |
| `telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx)` | Checks that sceneComplexityTrackingEnabled and renderTimingTrackingEnabled must be explicitly enabled. *(internal)* | 48 |
| `telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx)` | Checks that out-of-range dip thresholds are brought back within their bounds. *(internal)* | 71 |
| `telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx)` | Checks that gameplayExitTrackingEnabled must be explicitly set to true. *(internal)* | 34 |
| `telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx)` | Checks that the levels list becomes a lookup table name -> true. *(internal)* | 60 |
| `telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx)` | Checks that recoveryTrackingEnabled must be explicitly set to true. *(internal)* | 28 |
| `telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx)` | Checks that shaderGenerationTrackingEnabled must be explicitly set to true. *(internal)* | 41 |

### Parameter details

#### `telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx)`

Checks that with an empty config, the interval is 0 and all advanced tracking is disabled.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx)`

Checks that sceneComplexityTrackingEnabled and renderTimingTrackingEnabled must be explicitly enabled.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx)`

Checks that out-of-range dip thresholds are brought back within their bounds.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx)`

Checks that gameplayExitTrackingEnabled must be explicitly set to true.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx)`

Checks that the levels list becomes a lookup table name -> true.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx)`

Checks that recoveryTrackingEnabled must be explicitly set to true.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx)`

Checks that shaderGenerationTrackingEnabled must be explicitly set to true.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua`.*

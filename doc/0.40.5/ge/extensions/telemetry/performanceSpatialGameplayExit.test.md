# `telemetry_performanceSpatialGameplayExit.test`

*File: `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua` · VM: Game Engine (GE) · 311 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialGameplayExit.test`: `extensions.load("telemetry_performanceSpatialGameplayExit.test")`, then the global `telemetry_performanceSpatialGameplayExit.test`

Unit tests of telemetry/performanceSpatialGameplayExit. Each test receives a `ctx` context (assert, assertEqual) from the game's test runner and injects fake gameplay modules via the `source` parameter (level "italy", vehicle at (1.24, -2.26, 3.01), camera at (10.04, 20.06, 30.01)). It is not an extension to load.

## Notes

- The tests document the expected behavior: the mission takes precedence over the rest, an active attempt (drag, drift, crawl) takes precedence over career delivery, and finished activities (scenario in post state, drag isCompleted, drift in conclusion, crawl isCompleted) no longer count as active.
- They also check the rounding to 0.1 m, the fallback vehicle then camera, the rejection of an unknown exitKind ("failure"), an unknown activityType and an untracked level.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx)` | An active drag, drift or crawl takes precedence over an active career delivery. *(internal)* | 244 |
| `telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx)` | Checks that each family (scenario, free delivery, career delivery, test drive, certification, drag, drift, crawl) is recognized with the right activityType and activityId. *(internal)* | 58 |
| `telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx)` | capture takes the vehicle's position (rounded to 0.1), otherwise the camera's. *(internal)* | 146 |
| `telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx)` | capture converts a numeric id to a string, omits an invalid id without losing the event, and returns nil for an unknown exitKind/activityType or an untracked level. *(internal)* | 165 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx)` | A finished crawl is no longer active. *(internal)* | 293 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx)` | A finished drag (isCompleted) is no longer active. *(internal)* | 211 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx)` | A scenario in the post state is not an active activity. *(internal)* | 188 |
| `telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx)` | A drift challenge in the conclusion phase is no longer active. *(internal)* | 200 |
| `telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx)` | The drag key is computed with the highest-level drag data, and the prefix ":" is completed with the current level. *(internal)* | 224 |
| `telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx)` | A foreground mission takes precedence over a drag in progress. *(internal)* | 39 |

### Parameter details

#### `telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx)`

An active drag, drift or crawl takes precedence over an active career delivery.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx)`

Checks that each family (scenario, free delivery, career delivery, test drive, certification, drag, drift, crawl) is recognized with the right activityType and activityId.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx)`

capture takes the vehicle's position (rounded to 0.1), otherwise the camera's.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx)`

capture converts a numeric id to a string, omits an invalid id without losing the event, and returns nil for an unknown exitKind/activityType or an untracked level.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx)`

A finished crawl is no longer active.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx)`

A finished drag (isCompleted) is no longer active.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx)`

A scenario in the post state is not an active activity.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx)`

A drift challenge in the conclusion phase is no longer active.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx)`

The drag key is computed with the highest-level drag data, and the prefix ":" is completed with the current level.

- `ctx` (*table*) : Test context.

#### `telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx)`

A foreground mission takes precedence over a drag in progress.

- `ctx` (*table*) : Test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua`.*

# `telemetry_performanceSpatialDetector.test`

*File: `lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua` · VM: Game Engine (GE) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialDetector.test`: `extensions.load("telemetry_performanceSpatialDetector.test")`, then the global `telemetry_performanceSpatialDetector.test`

Unit tests of telemetry/performanceSpatialDetector (runTestFiles("performanceSpatialDetector")).

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx)` | Checks that a drop below the absolute FPS threshold produces an event on return to normal. *(internal)* | 27 |
| `telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx)` | Checks that the cooldown delay suppresses a new episode. *(internal)* | 132 |
| `telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx)` | Checks that a drop shorter than dipMinDurationMs produces nothing. *(internal)* | 51 |
| `telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx)` | Checks that with absoluteAllowed = false, a capped FPS does not trigger an absolute dip. *(internal)* | 99 |
| `telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx)` | Checks that an episode exceeding maxEpisodeMs is split. *(internal)* | 121 |
| `telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx)` | Checks that finish() closes an open, sustained episode. *(internal)* | 109 |
| `telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx)` | Checks that the worst frame is captured once then that the event is emitted on recovery. *(internal)* | 75 |
| `telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx)` | Checks that an episode with no observed duration (a single sample) does not emit an event. *(internal)* | 65 |
| `telemetry_performanceSpatialDetector.test.testRelativeDip(ctx)` | Checks that a frame time above baseline * ratio produces an event. *(internal)* | 39 |
| `telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx)` | Checks that maxDipEventsPerSession caps the number of events. *(internal)* | 153 |

### Parameter details

#### `telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx)`

Checks that a drop below the absolute FPS threshold produces an event on return to normal.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx)`

Checks that the cooldown delay suppresses a new episode.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx)`

Checks that a drop shorter than dipMinDurationMs produces nothing.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx)`

Checks that with absoluteAllowed = false, a capped FPS does not trigger an absolute dip.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx)`

Checks that an episode exceeding maxEpisodeMs is split.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx)`

Checks that finish() closes an open, sustained episode.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx)`

Checks that the worst frame is captured once then that the event is emitted on recovery.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx)`

Checks that an episode with no observed duration (a single sample) does not emit an event.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testRelativeDip(ctx)`

Checks that a frame time above baseline * ratio produces an event.

- `ctx` (*table*) : Test framework context.

#### `telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx)`

Checks that maxDipEventsPerSession caps the number of events.

- `ctx` (*table*) : Test framework context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua`.*

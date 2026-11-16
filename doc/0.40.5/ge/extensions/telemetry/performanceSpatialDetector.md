# `telemetry_performanceSpatialDetector`

*File: `lua/ge/extensions/telemetry/performanceSpatialDetector.lua` · VM: Game Engine (GE) · 123 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialDetector`: `extensions.load("telemetry_performanceSpatialDetector")`, then the global `telemetry_performanceSpatialDetector`

Performance dip detector for the performanceSpatial tracker. It follows an exponential moving average of the frame time (baseline, alpha 0.05) and opens an episode when the FPS drops below an absolute threshold or when the frame time exceeds baseline * ratio. The episode ends on return to normal and only produces an event if it lasted long enough. A cooldown delay and a per-session event cap limit the noise.

## Notes

- Times are in milliseconds. An episode is automatically split after maxEpisodeMs (1,800,000 ms by default).
- The event's 'trigger' field is 'absolute', 'relative' or 'both'.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialDetector.new(config)` | Creates a detector. | 107 |

### Parameter details

#### `telemetry_performanceSpatialDetector.new(config)`

Creates a detector.

- `config` (*table*) : dipFpsThreshold, dipFrameTimeRatio, dipMinDurationMs, dipCooldownSeconds, maxDipEventsPerSession, maxEpisodeMs (optional).
- **returns**: Detector Detector instance.

## Class `Detector`

Detector returned by new(config).

| Method | Description | Line |
|---|---|---|
| `Detector:canReport(nowMs)` | True if the cooldown delay has elapsed and the session's event cap is not reached. | 58 |
| `Detector:finish(nowMs)` | Forces the end of the open episode and returns its event if it lasted at least dipMinDurationMs. | 62 |
| `Detector:reset()` | Forgets the baseline and the current episode. | 53 |
| `Detector:update(nowMs, fps, frameMs, absoluteAllowed)` | Processes a sample. Returns a "capture this frame" boolean (episode start or new worst frame time) then possibly the event of a finished episode. Outside an episode, updates the baseline. | 66 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialDetector.lua`.*

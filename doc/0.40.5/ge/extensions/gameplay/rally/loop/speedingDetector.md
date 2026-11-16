# `gameplay_rally_loop_speedingDetector`

*File: `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua` · VM: Game Engine (GE) · 262 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/loop/speedingDetector")` (file under extensions/ but not a regular extension)

Detects player speeding on the road sections of a rally loop. Every second, the player vehicle's speed is sampled into a circular buffer of 5 values; if the average exceeds the limit, a penalty is drawn at random with a probability proportional to the excess. Penalties are spaced at least 60 s apart and passed to the manager via recordSpeedingPenalty.

## Example

```lua
local det = require('gameplay_rally_loop_speedingDetector')(manager)
-- every frame:
det:update(dtSim, 70, false)
```

## Notes

- Normal mode: probability = min(excess / 60 * 0.05, 0.05), i.e. 5% at most at 60 km/h over. Strict mode: min(excess / 5 * 0.2, 0.2), i.e. 20% at most at 5 km/h over.
- The draw uses math.random() on the average of the last 5 seconds, not the instantaneous speed.
- The test starts with the penalty delay already elapsed (timeSinceLastPenalty = 60), so the first penalty is possible immediately.
- drawDebug (not called: the call is commented out in update) shows, in strict mode, a probability based on the instantaneous speed, which differs from the actual computation in update (average).
- The module returns a constructor: require('gameplay_rally_loop_speedingDetector')(manager). Speeds in km/h (vehicle speed in m/s * 3.6).

## Class `C`

Speed detector. Instance fields: manager, currentLimitKph, bufferSize (5), data (circular buffer), writeIndex, count, sampleRate (1 s), penaltyRateLimit (60 s), penalties (list of triggered penalties), maxSpeedOver/maxProbability (60 / 0.05), strictMaxSpeedOver/strictMaxProbability (5 / 0.2), strictMode.

The module returns a constructor: `local obj = require("gameplay_rally_loop_speedingDetector")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addSample(sample)` | Adds a speed to the circular buffer, overwriting the oldest if needed. | 42 |
| `C:drawDebug()` | ImGui window "Speeding Detector Debug": limit, current and average speeds, probability, penalties and samples. Currently never called by update. | 155 |
| `C:getAverageSpeed()` | Average of the valid samples in the buffer. | 49 |
| `C:getCurrentSpeedKph()` | Speed of player vehicle 0 in km/h (speed norm * 3.6). | 35 |
| `C:init(manager)` | Initializes the buffer and parameters. Called by the constructor. | 9 |
| `C:stochasticPenalty(maxSpeedOver, maxProbability)` | Randomly decides whether a penalty is triggered based on the average relative to the limit: linear probability from 0 (at the limit) to maxProbability (at maxSpeedOver above). | 60 |
| `C:update(dtSim, limitKph, strictMode)` | Call every frame. Accumulates time, takes a sample every second and, if the 60 s delay has elapsed, draws a penalty; on a penalty, stores {averageSpeed, instantSpeed, speedLimit, speedOver, probability, strictMode} and calls manager:recordSpeedingPenalty. | 86 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua`.*

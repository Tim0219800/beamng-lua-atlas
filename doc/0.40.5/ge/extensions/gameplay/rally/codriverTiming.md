# `gameplay_rally_codriverTiming`

*File: `lua/ge/extensions/gameplay/rally/codriverTiming.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_codriverTiming`: `extensions.load("gameplay_rally_codriverTiming")`, then the global `gameplay_rally_codriverTiming`

Computes the rally co-driver delay: the gap (in seconds) between the end of a note announcement and the car's arrival at the corner. The minimum delay comes from the user setting 'rallyCodriverTiming' (plus an offset specific to the voice pack); it increases with speed between startSpeedMph and endSpeedMph up to an extra maxDelayOffsetSeconds. Default values are read from /gameplay/rally/codriverTiming.json.

## Example

```lua
local d = gameplay_rally_codriverTiming.delayForSpeed(speedMph, true, 0)
```

## Notes

- Speeds are in mph (not m/s).
- Defaults if the JSON is missing: maxDelayOffsetSeconds=0.5, startSpeedMph=40, endSpeedMph=80.
- enableSpeedScaling == false (strict comparison) disables the speed-dependent part; nil leaves it active.
- nudge clamps the minimum delay between 1 and 10 s and writes it to the settings.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_codriverTiming.config()` | Returns the loaded (and cached) configuration: maxDelayOffsetSeconds, startSpeedMph, endSpeedMph. | 28 |
| `gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds)` | Delay for a given speed: minDelay below startSpeedMph, then linear interpolation up to minDelay + maxDelayOffsetSeconds at endSpeedMph (capped). | 42 |
| `gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds)` | Maximum delay in seconds (reached at endSpeedMph): minDelay + maxDelayOffsetSeconds, or minDelay if speed scaling is disabled. | 36 |
| `gameplay_rally_codriverTiming.minDelay(offsetSeconds)` | Minimum delay in seconds: rallyCodriverTiming setting + voice pack offset. | 32 |
| `gameplay_rally_codriverTiming.nudge(tick)` | Shifts the delay range by 'tick' seconds: only the minimum (rallyCodriverTiming setting, clamped to [1, 10]) moves, the maximum follows via the offset. Saves the new setting. | 54 |

### Parameter details

#### `gameplay_rally_codriverTiming.config()`

Returns the loaded (and cached) configuration: maxDelayOffsetSeconds, startSpeedMph, endSpeedMph.

- **returns**: table {maxDelayOffsetSeconds, startSpeedMph, endSpeedMph}.

#### `gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds)`

Delay for a given speed: minDelay below startSpeedMph, then linear interpolation up to minDelay + maxDelayOffsetSeconds at endSpeedMph (capped).

- `speedMph` (*number*) : Vehicle speed in mph.
- `enableSpeedScaling` (*boolean|nil*) : false to always return the minimum.
- `offsetSeconds` (*number|nil*) : Voice pack offset.
- **returns**: number Timeout in seconds.

#### `gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds)`

Maximum delay in seconds (reached at endSpeedMph): minDelay + maxDelayOffsetSeconds, or minDelay if speed scaling is disabled.

- `enableSpeedScaling` (*boolean|nil*) : false to disable the speed-related part.
- `offsetSeconds` (*number|nil*) : Voice pack offset.
- **returns**: number Maximum delay in seconds.

#### `gameplay_rally_codriverTiming.minDelay(offsetSeconds)`

Minimum delay in seconds: rallyCodriverTiming setting + voice pack offset.

- `offsetSeconds` (*number|nil*) : Voice pack offset (0 if nil).
- **returns**: number Minimum delay in seconds.

#### `gameplay_rally_codriverTiming.nudge(tick)`

Shifts the delay range by 'tick' seconds: only the minimum (rallyCodriverTiming setting, clamped to [1, 10]) moves, the maximum follows via the offset. Saves the new setting.

- `tick` (*number*) : Change in seconds (positive or negative).
- **returns**: number New minimum delay.
- **returns**: number New maximum delay (min + maxDelayOffsetSeconds).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/codriverTiming.lua`.*

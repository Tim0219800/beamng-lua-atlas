# `performanceLogger`

*File: `lua/vehicle/extensions/performanceLogger.lua` · VM: Vehicle · 63 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `performanceLogger`: `extensions.load (vehicle VM)("performanceLogger")`, then the global `performanceLogger`

Small profiling tool: measures durations in milliseconds with HighPerfTimer, either a single measurement (startMeasurement / stopMeasurement) or an average over N measurements written to the log (measureAverage).

## Example

```lua
local pl = extensions.performanceLogger
pl.startMeasurement('monCode')
-- ... code to measure ...
pl.measureAverage('monCode', 100)  -- log after 100 measurements
```

## Notes

- measureAverage stops the named timer, accumulates, then after stopCount measurements writes a log 'name: x ms (avg over N measurements)' and resets the accumulation. startMeasurement must be called again before each measurement (it resets the timer).
- showMin = true displays the minimum of the averages already observed instead of the current average.
- Anomaly: the result is formatted with '%.5f' from a string (tostring); works thanks to LuaJIT's numeric string conversion.
- Misspelled names are kept as is in the code: stopAvergage (without the 'a' before 'g').
- measureAverage/stopMeasurement raise a Lua error if startMeasurement has not been called with that name.

## Functions

| Function | Description | Line |
|---|---|---|
| `performanceLogger.measureAverage(name, stopCount, showMin)` | Stops the timer, adds the measurement to the average and, after stopCount measurements, writes the average to the log. | 28 |
| `performanceLogger.onInit()` | Initialization hook: clears timers and measurements. *(internal)* *(hook)* | 48 |
| `performanceLogger.onReset()` | Same function as onInit. *(internal)* *(hook)* | 48 |
| `performanceLogger.startMeasurement(name)` | Creates (or resets) the named timer. | 12 |
| `performanceLogger.stopAvergage(name)` | Ends the named average and returns the accumulated average (removes the timer). | 22 |
| `performanceLogger.stopMeasurement(name)` | Stops the timer and returns the measured duration. | 41 |

### Parameter details

#### `performanceLogger.measureAverage(name, stopCount, showMin)`

Stops the timer, adds the measurement to the average and, after stopCount measurements, writes the average to the log.

- `name` (*string*) : Name of the measurement.
- `stopCount` (*integer*) : Number of measurements before display.
- `showMin` (*boolean|nil*) : Display the minimum of the averages.

#### `performanceLogger.startMeasurement(name)`

Creates (or resets) the named timer.

- `name` (*string*) : Name of the measurement.

#### `performanceLogger.stopAvergage(name)`

Ends the named average and returns the accumulated average (removes the timer).

- `name` (*string*) : Name of the measurement.
- **returns**: number Average in milliseconds.

#### `performanceLogger.stopMeasurement(name)`

Stops the timer and returns the measured duration.

- `name` (*string*) : Name of the measurement.
- **returns**: number Duration in milliseconds.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/performanceLogger.lua`.*

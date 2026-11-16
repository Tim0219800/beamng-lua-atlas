# `odometer`

*File: `lua/vehicle/extensions/odometer.lua` · VM: Vehicle · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `odometer`: `extensions.load (vehicle VM)("odometer")`, then the global `odometer`

'Relative' odometer for statistics: integrates the distance traveled from electrics.values.wheelspeed with a 'rope' filter (±5 cm) to ignore back-and-forth oscillations, then submits the distance to gameplayStatistic (metrics 'vehicle/odometer/<model>.length' and 'vehicle/total_odometer.length'). Only counts when the AI is disabled.

## Example

```lua
local d = extensions.odometer.getRelativeRecording()  -- cumulative distance in m
```

## Notes

- Algorithm: lead accumulates |wheelspeed| * dt * sign(avgWheelAV); as soon as |lead| exceeds ropeLength (0.05 m) the excess is added to relativeOdometer and lead is clamped.
- submitStatistic sends nothing if ai.mode ~= 'disabled' or if less than 1 m has been accumulated since the last send. If the average speed since the send exceeds 150 m/s (550 km/h) the distance is discarded as inconsistent. A NaN relativeOdometer is reset to the previous value with an error log.
- Automatic send every 30 s of accumulated time (when the AI is disabled) and on each reset. The model name is extracted from v.vehicleDirectory (pattern /vehicles/<model>).
- Anomaly: submitedTime is only reset to 0 after a periodic send; the average speed tested (distance / submitedTime) is therefore computed over time accumulated since the last periodic send, not since the last submitStatistic.
- startRecording is empty (the reset is commented out); onExtensionLoaded is empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `odometer.getRelativeRecording()` | Returns the cumulative relative distance. | 39 |
| `odometer.onExtensionLoaded()` | Load hook; empty. *(internal)* *(hook)* | 43 |
| `odometer.onReset()` | Vehicle reset hook: submits the accumulated distance to the statistics. *(internal)* *(hook)* | 15 |
| `odometer.startRecording()` | Intended to reset the recording; does nothing (commented-out code). | 35 |
| `odometer.submitStatistic()` | Sends the distance not yet submitted to gameplayStatistic (conditions described in the notes). | 46 |
| `odometer.updateGFX(dt)` | Called every frame: integrates the distance and triggers the periodic send. *(internal)* | 19 |

### Parameter details

#### `odometer.getRelativeRecording()`

Returns the cumulative relative distance.

- **returns**: number Distance in meters.

#### `odometer.updateGFX(dt)`

Called every frame: integrates the distance and triggers the periodic send.

- `dt` (*number*) : Time step in seconds.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/odometer.lua`.*

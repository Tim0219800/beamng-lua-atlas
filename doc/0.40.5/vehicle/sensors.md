# `sensors`

*File: `lua/vehicle/sensors.lua` · VM: Vehicle · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `sensors`

Exposes the accelerations measured at the vehicle's reference node (gx, gy, gz) as well as their smoothed version (gx2, gy2, gz2). The raw values come from an FFI structure provided by the engine (obj:getSensorsFFI()) and are copied at each updateGFX. Used by the AI, ESC, post-crash braking, gauges and simulator protocols.

## Example

```lua
local ay = sensors.gy2 -- smoothed lateral acceleration
if math.abs(sensors.gx2) > 5 then print('hard braking/acceleration') end
```

## Notes

- Units: the code does not specify them; the usages (postCrashBrake compares sensors.gz2 - powertrain.currentGravity to a threshold, esc.lua compares gy2 to 3) indicate m/s² (inferred from code).
- Axes (inferred from usages): gx = sensor X axis (esc.lua/protocols.lua use it as lateral acceleration), gy = Y axis (esc.lua integrates it as longitudinal acceleration; ai.lua uses -gy as forward acceleration), gz = non-inertial vertical axis (sensorZnonInertial; postCrashBrake compares it to powertrain.currentGravity). The exact direction of the axes is not documented in the Lua code (inferred from usages).
- gx, gy, gz are the raw values of the FFI structure (sensorX, sensorY, sensorZnonInertial). gx2/gy2/gz2 are smoothed by newTemporalSmoothingNonLinear(7).
- All values are updated in updateGFX only: before the first updateGFX, ffiSensors is 0 (a number) then an FFI structure after init().
- The update order relative to other modules (ai, esc...) depends on the main loop; these modules read the value from the last updateGFX.

## Functions

| Function | Description | Line |
|---|---|---|
| `sensors.init()` | Fetches the sensors FFI structure from the engine then calls reset(). Called when the vehicle loads. *(internal)* | 36 |
| `sensors.reset()` | Resets the three temporal smoothers. Called when the vehicle is reset. *(internal)* | 19 |
| `sensors.updateGFX(dt)` | Copies the raw accelerations from ffiSensors into gx/gy/gz and updates the smoothed values gx2/gy2/gz2. Called every graphics frame by the main loop. *(internal)* | 25 |

### Parameter details

#### `sensors.updateGFX(dt)`

Copies the raw accelerations from ffiSensors into gx/gy/gz and updates the smoothed values gx2/gy2/gz2. Called every graphics frame by the main loop.

- `dt` (*number*) : Frame time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `ffiSensors` | table|number | FFI structure returned by obj:getSensorsFFI() (fields sensorX, sensorY, sensorZnonInertial...). Is 0 before init(). |
| `gx` | number | Raw acceleration on the sensor X axis (ffiSensors.sensorX). |
| `gx2` | number | gx temporally smoothed (non-linear smoothing, parameter 7). |
| `gy` | number | Raw acceleration on the sensor Y axis (ffiSensors.sensorY). |
| `gy2` | number | gy temporally smoothed. |
| `gz` | number | Raw non-inertial vertical acceleration (ffiSensors.sensorZnonInertial). |
| `gz2` | number | gz temporally smoothed. |

## Calls into the engine (C++)

- `obj:` `getSensorsFFI`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/sensors.lua`.*

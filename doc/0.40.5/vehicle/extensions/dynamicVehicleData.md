# `dynamicVehicleData`

*File: `lua/vehicle/extensions/dynamicVehicleData.lua` · VM: Vehicle · 1121 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `dynamicVehicleData`: `extensions.load (vehicle VM)("dynamicVehicleData")`, then the global `dynamicVehicleData`

Internal tool for automatically generating vehicle performance sheets (files vehicles/<model>/info_<config>.json), driven from the GE by util_saveDynamicData. A coroutine runs static measurements (weight, power, torque, peak RPMs, engine type, induction, fuel, transmission, layout, bounding box) then dynamic ones (accelerations, braking, off-road score) by repositioning the vehicle, then updates the info file by recursive merge.

## Example

```lua
-- called by the GE: extensions.dynamicVehicleData.performTests('vivace', 'base')
```

## Notes

- Keys written in the info file: Weight (kg rounded to 5), PowerPeakRPM, TorquePeakRPM ('min - max' range if the gap exceeds 500 RPM, values rounded to 50), Torque (N·m rounded to 5), Power (rounded), Weight/Power, Propulsion (Electric, ICE, Hybrid, Other), Induction Type (NA, Turbo, SC, N2O and combinations; only for ICE/Hybrid), Fuel Type (Gasoline, Diesel, Battery, Hybrid, ...), Transmission, Drivetrain (layout), BoundingBox (two points: min and max relative to the ref node), Top Speed, 0-100 km/h, 0-200 km/h, 0-300 km/h, 100-200 km/h, 0-60 mph, 0-100 mph, 0-200 mph, 60-100 mph, 100-0 km/h, 60-0 mph, Braking G, Off-Road Score.
- Before each write, the whitelist keys are erased from the existing file, then the new values are merged (tableMergeRecursive); compareData warns in the log if a numeric value changes by more than 10%.
- The dynamic tests depend on the GE: be:resetVehicle(0), setPositionRotation and autoplace on player 0's vehicle, with 2 s waits. updateGFX resumes the coroutine every frame, sends a heartbeat to the GE and triggers util_saveDynamicData.vehicleDone() at the end.
- The braking test is only run if the vehicle was able to reach 115 km/h during the accelerations.
- For vehicles without an engine (category engine), only the Weight key is recorded by the static performance data.
- performTests does not check for the presence of wheels: the acceleration tests stop if wheels.wheelCount <= 0.
- getPowertrainLayout is exported and returns a string describing the layout ('Other' by default, depending on the detected driven wheels).

## Functions

| Function | Description | Line |
|---|---|---|
| `dynamicVehicleData.getPowertrainLayout()` | Determines the vehicle's transmission layout from the driven wheels (text value, 'Other' if undetermined). | 499 |
| `dynamicVehicleData.onInit()` | Initialization hook; empty. *(internal)* *(hook)* | 86 |
| `dynamicVehicleData.onReset()` | Same function as onInit. *(internal)* *(hook)* | 86 |
| `dynamicVehicleData.performTests(_model_key, _config_key)` | Launches the complete sequence (static data then dynamic tests) in a coroutine for the indicated model and configuration. | 1071 |
| `dynamicVehicleData.updateGFX(dt)` | Called every frame: increments the internal timer, resumes the test coroutine and sends the heartbeat/killswitch to the GE. *(internal)* | 1053 |

### Parameter details

#### `dynamicVehicleData.getPowertrainLayout()`

Determines the vehicle's transmission layout from the driven wheels (text value, 'Other' if undetermined).

- **returns**: string Layout: 'FWD', 'RWD', 'AWD', '4WD', 'NxM' (wheels x driven wheels) or 'Other'.

#### `dynamicVehicleData.performTests(_model_key, _config_key)`

Launches the complete sequence (static data then dynamic tests) in a coroutine for the indicated model and configuration.

- `_model_key` (*string*) : Model name (vehicles/ folder).
- `_config_key` (*string*) : Configuration name.

#### `dynamicVehicleData.updateGFX(dt)`

Called every frame: increments the internal timer, resumes the test coroutine and sends the heartbeat/killswitch to the GE.

- `dt` (*number*) : Time step in seconds.

## Calls into the engine (C++)

- `obj:` `calcBeamStats`, `getGravity`, `getPosition`, `queueGameEngineLua`

**Loads extensions:** `cruiseControl`, `perfectLaunch`, `straightLine`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/dynamicVehicleData.lua`.*

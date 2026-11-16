# `drivetrain`

*File: `lua/vehicle/drivetrain.lua` · VM: Vehicle · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `drivetrain`

Backward compatibility layer: reproduces the old `drivetrain` API by reading the devices of the new `powertrain` system ('mainEngine' and 'gearbox') every frame. An old mod or script that reads drivetrain.rpm, drivetrain.gear, drivetrain.torque... keeps working. New developments should use powertrain directly.

## Example

```lua
local rpm = drivetrain.rpm
local gear = drivetrain.gear
drivetrain.shiftToGear(1)
```

## Notes

- The fields are recomputed by updateProxy (updateGFX) every frame from powertrain.getDevice('mainEngine') and ('gearbox'). rpm = engine outputAV1 * 9.5493 (rad/s to RPM).
- updateProxy also writes electrics.values.gear_M = gearbox gearIndex (key read by the UI).
- Fields never updated by updateProxy (keep their initial value): brake, fuelLeakRate, fuel, fuelCapacity, fuelUsage, shifterPosition, wheelCount, avgAV. M.shifterMode is forced to 2 every frame. M.esc is an array of nop functions.
- M.engineAV is nil if the 'mainEngine' engine does not exist (the other fields fall back to 0); init does not reset it to zero.
- setShifterMode: only mode 2 gives 'arcade', any other mode gives 'realistic' (modes 0, 1 and 3 are not distinguished).

## Functions

| Function | Description | Line |
|---|---|---|
| `drivetrain.init()` | Called at init and reset: assigns M.wheels and resets rpm, engineDisabled, gear, torqueTransmission and engineLoad to zero. *(internal)* | 66 |
| `drivetrain.reset()` | Same as init. *(internal)* | 66 |
| `drivetrain.setShifterMode(v)` | Sets the gearbox mode: mode 2 gives 'arcade', any other value 'realistic' (controller.mainController.setGearboxMode). | 49 |
| `drivetrain.shiftToGear(gear)` | Requests a gear via controller.mainController.shiftToGearIndex. | 62 |
| `drivetrain.updateGFX()` | Called every frame (updateProxy): copies the state of the main engine and gearbox into the drivetrain fields. *(internal)* | 31 |

### Parameter details

#### `drivetrain.setShifterMode(v)`

Sets the gearbox mode: mode 2 gives 'arcade', any other value 'realistic' (controller.mainController.setGearboxMode).

- `v` (*integer*) : 0 manual, 1 manual with auto clutch, 2 arcade, 3 realistic automatic (code comment).

#### `drivetrain.shiftToGear(gear)`

Requests a gear via controller.mainController.shiftToGearIndex.

- `gear` (*integer*) : Wanted gear index.

#### `drivetrain.updateGFX()`

Called every frame (updateProxy): copies the state of the main engine and gearbox into the drivetrain fields.


## Fields

| Field | Type | Description |
|---|---|---|
| `avgAV` | number | Never updated. |
| `brake` | number | Never updated (stays at 0). |
| `engineAV` | number|nil | Engine angular velocity (rad/s) or nil without a main engine. |
| `engineDisabled` | boolean | isDisabled of the main engine. |
| `engineLoad` | number | engineLoad of the main engine. |
| `esc` | table | Fake compatibility ESC object: update, updateGFX, toggleESCMode, getCarData are nop, escPulse = 0. |
| `fuel` | number | Default value 100, never updated. |
| `fuelCapacity` | number | Default value 100, never updated. |
| `fuelLeakRate` | number | Fuel leak rate (L/s); never updated. |
| `fuelUsage` | number | Never updated. |
| `gear` | integer | Gear index of the gearbox ('gearbox'). |
| `rpm` | number | Engine speed in RPM. |
| `shifterMode` | integer | Always 2 (arcade) after updateGFX. |
| `shifterPosition` | number | Never updated. |
| `throttle` | number | Copy of electrics.values.throttle. |
| `torque` | number | Main engine output torque (outputTorque1, N·m). |
| `torqueTransmission` | number | Gearbox output torque (N·m). |
| `wheelCount` | integer | Never updated. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/drivetrain.lua`.*

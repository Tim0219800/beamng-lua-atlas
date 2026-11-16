# `cruiseControl`

*File: `lua/vehicle/extensions/cruiseControl.lua` · VM: Vehicle · 139 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `cruiseControl`: `extensions.load (vehicle VM)("cruiseControl")`, then the global `cruiseControl`

Cruise control: a PID drives electrics.values.throttleOverride to keep the wheel speed (electrics.values.wheelspeed, m/s) at a setpoint. It stops on braking, after post-crash braking and does not drive the pedal if the driver presses the clutch or the throttle. A modder can drive it via setSpeed, changeSpeed, holdCurrentSpeed and setEnabled.

## Example

```lua
extensions.cruiseControl.setSpeed(100 / 3.6)  -- 100 km/h in m/s, enables the cruise control
extensions.cruiseControl.setEnabled(false)
```

## Notes

- Units: speeds in m/s. M.minimumSpeed = 30 / 3.6 (30 km/h): the setpoint is always clamped to this minimum; holdCurrentSpeed does nothing if the current speed is lower.
- Writes electrics.values.throttleOverride (nil when disabled), cruiseControlTarget (setpoint) and cruiseControlActive (boolean). Reads electrics.values.wheelspeed and postCrashBrakeTriggered. Sends the state to the UI with the 'CruiseControlState' hook ({targetSpeed, isEnabled}) if the first player is seated.
- The setpoint is ramped (target acceleration 3 m/s², changeable by setTargetAcceleration) to avoid integrator windup; the PID is newPIDStandard(0.3, 2, 0, ...) and the output is smoothed by a temporal smoother.
- If input.throttle > 0 or input.clutch > 0, the cruise control stays active but does not override the pedal: throttleOverride takes the value of input.throttle.
- hasReachedTargetSpeed becomes true when the relative error to the setpoint is <= 3%.
- disableOnReset (local, always false): the cruise control therefore stays armed on vehicle reset; only hasReachedTargetSpeed and the internal state are reset.
- Anomaly: the onReset log says 'Cruise Control online' at each reset.

## Functions

| Function | Description | Line |
|---|---|---|
| `cruiseControl.changeSpeed(offset)` | Enables the cruise control and adds an offset to the current setpoint. | 81 |
| `cruiseControl.getConfiguration()` | Returns the current configuration. | 123 |
| `cruiseControl.holdCurrentSpeed()` | Sets the setpoint to the current speed if it exceeds the minimum speed. | 89 |
| `cruiseControl.onReset()` | Vehicle reset hook: resets hasReachedTargetSpeed, the state and the smoother to zero. *(internal)* *(hook)* | 23 |
| `cruiseControl.requestState()` | Publishes the state (electrics.cruiseControlTarget/Active) and sends 'CruiseControlState' to the UI. | 110 |
| `cruiseControl.setEnabled(enabled)` | Enables or disables the cruise control; resets throttleOverride to nil and the smoother to zero. | 97 |
| `cruiseControl.setSpeed(speed)` | Enables the cruise control with the given setpoint (clamped to the minimum). | 73 |
| `cruiseControl.setTargetAcceleration(target)` | Sets the acceleration (in m/s²) of the setpoint ramp. | 106 |
| `cruiseControl.updateGFX(dt)` | Called every frame: if active, applies the PID regulation and handles the stop conditions. *(internal)* | 34 |

### Parameter details

#### `cruiseControl.changeSpeed(offset)`

Enables the cruise control and adds an offset to the current setpoint.

- `offset` (*number*) : Change in m/s (positive or negative).

#### `cruiseControl.getConfiguration()`

Returns the current configuration.

- **returns**: table {isEnabled, targetSpeed, minimumSpeed, hasReachedTargetSpeed}.

#### `cruiseControl.setEnabled(enabled)`

Enables or disables the cruise control; resets throttleOverride to nil and the smoother to zero.

- `enabled` (*boolean*) : true to enable.

#### `cruiseControl.setSpeed(speed)`

Enables the cruise control with the given setpoint (clamped to the minimum).

- `speed` (*number*) : Setpoint in m/s.

#### `cruiseControl.setTargetAcceleration(target)`

Sets the acceleration (in m/s²) of the setpoint ramp.

- `target` (*number*) : Target acceleration, default 3.

#### `cruiseControl.updateGFX(dt)`

Called every frame: if active, applies the PID regulation and handles the stop conditions.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `hasReachedTargetSpeed` | boolean | true when the speed is within 3% of the setpoint. |
| `minimumSpeed` | number | Minimum setpoint in m/s (30 km/h). |

**UI events (guihooks.trigger):** `CruiseControlState`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/cruiseControl.lua`.*

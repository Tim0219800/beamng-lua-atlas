# `input_haptics`

*File: `lua/vehicle/extensions/input/haptics.lua` · VM: Vehicle · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `input_haptics`: `extensions.load (vehicle VM)("input_haptics")`, then the global `input_haptics`

Generates gamepad vibrations (haptic feedback) from vehicle dynamics: acceleration jerks, wheel slip energy, locked wheels under braking (brake trigger) and spinning driven wheels (throttle trigger). The forces are sent to the device driver via hydros.getForceFeedbackFunction() on the supplied FFB ids. Called by the input system, not by a modder in general.

## Example

```lua
haptics.setFFBIDs(idMoteur, idGachetteAccel, idGachetteFrein)
haptics.setFFBPeriod(1 / 30)
```

## Notes

- The update only happens when the wall clock (os.clockhp) exceeds nextDriverUpdate (FFB period, default 1/30 s): gamepad drivers do not care about simulation time.
- An FFB id of -1 disables the corresponding output. The triggers only receive force if hydros.enableThrottleForceFeedback / enableBrakeForceFeedback are true; otherwise they receive 0.
- Vibrations start at 20% of hydros.ffbSpeedFast (normalized speed) to avoid vibrations at standstill. The overall intensity is multiplied by hydros.wheelFFBForceCoef / 100.
- Jerk thresholds: lateral 50, longitudinal 20, vertical 15 (jerk unit = acceleration/s). The minimum slip taken into account is wheelSlipMin = 15000 (slip energy).
- Active ABS braking disables the locked-wheel counting; absTrigger is computed but not used afterwards.
- Anomaly: setJerkMin sets the global variable `jerkMin` which is read nowhere (the real thresholds are jerkMinX/Y/Z): no effect.
- Anomaly: setFFBSpeedFast (not exported) sets a global variable ffbSpeedFast that is never used; the code reads hydros.ffbSpeedFast.

## Functions

| Function | Description | Line |
|---|---|---|
| `input_haptics.initHaptics()` | Lists the driven wheels (powertrain.getPoweredWheelNames) and the wheel count. To be called after the vehicle has loaded. *(internal)* | 48 |
| `input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake)` | Sets the ids of the force feedback outputs (-1 = disabled). *(internal)* | 33 |
| `input_haptics.setFFBPeriod(period)` | Sets the period between two sends to the driver (seconds) and schedules the next send. *(internal)* | 39 |
| `input_haptics.setJerkForceMultiplier(multiplier)` | Multiplier of the vibration component due to jerks (debug). | 182 |
| `input_haptics.setJerkMin(min)` | Intended to set the jerk threshold; no real effect (see notes). | 184 |
| `input_haptics.setWheelSlipForceMultiplier(multiplier)` | Multiplier of the vibration component due to wheel slip (debug). | 181 |
| `input_haptics.setWheelSlipMin(min)` | Minimum slip energy threshold to trigger vibration (debug). | 183 |
| `input_haptics.vibrationUpdate(dt)` | Computes and sends the vibration forces (main motor, throttle trigger, brake trigger) if the FFB period has elapsed. *(internal)* | 60 |

### Parameter details

#### `input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake)`

Sets the ids of the force feedback outputs (-1 = disabled).

- `_FFBID` (*integer*) : Main vibration output.
- `_FFBID_accelerate` (*integer*) : Throttle trigger output.
- `_FFBID_brake` (*integer*) : Brake trigger output.

#### `input_haptics.setFFBPeriod(period)`

Sets the period between two sends to the driver (seconds) and schedules the next send.

- `period` (*number*) : Period in seconds (default 1/30).

#### `input_haptics.setJerkForceMultiplier(multiplier)`

Multiplier of the vibration component due to jerks (debug).

- `multiplier` (*number*) : Default 1.

#### `input_haptics.setJerkMin(min)`

Intended to set the jerk threshold; no real effect (see notes).

- `min` (*number*) : Threshold (unused).

#### `input_haptics.setWheelSlipForceMultiplier(multiplier)`

Multiplier of the vibration component due to wheel slip (debug).

- `multiplier` (*number*) : Default 1.

#### `input_haptics.setWheelSlipMin(min)`

Minimum slip energy threshold to trigger vibration (debug).

- `min` (*number*) : Default 15000.

#### `input_haptics.vibrationUpdate(dt)`

Computes and sends the vibration forces (main motor, throttle trigger, brake trigger) if the FFB period has elapsed.

- `dt` (*number*) : Simulation time step in seconds.

## Calls into the engine (C++)

- `obj:` `getSmoothRefVelocityXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/input/haptics.lua`.*

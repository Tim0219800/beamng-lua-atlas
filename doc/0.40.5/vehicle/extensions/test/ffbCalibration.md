# `test_ffbCalibration`

*File: `lua/vehicle/extensions/test/ffbCalibration.lua` · VM: Vehicle · 273 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `test_ffbCalibration`: `extensions.load (vehicle VM)("test_ffbCalibration")`, then the global `test_ffbCalibration`

Automatic steering wheel force feedback (FFB) calibration procedure. The vehicle is launched by the cruise control (cruiseControl) then the wheel is turned progressively; at each physics step the module records speed, steering wheel angle and normalized force at the wheel (hydros.forceAtWheelNorm, raw and smoothed). At the end it computes a recommended correction of the FFB coefficient and sends everything back to the game Lua via test_ffbCalibration.onFFBCalibrationFinished(data encoded with lpack). Modes: "steerPeak" (stops when the force has passed its peak), "steerFull" (goes to the end stop), "straight" (records driving straight).

## Example

```lua
extensions.load('test_ffbCalibration')
test_ffbCalibration.start('steerPeak', true) -- fastmotion: physics x100
```

## Notes

- Flow in steer* mode: (1) cruise control climbs to speedTarget (40 km/h x 2 = 22.2 m/s); if > 30 s of simulation, falls back to 0.9 x the speed reached (cruiseControlFailures +1). (2) Gradual 1 s steering toward lastSteeringInput. (3) Linear ramp of the wheel from 0 to 1 over 20 s (timeToFulllock), recorded into data.values = {speed km/h, wheel input 0..1, FFB, smoothed FFB}. (4) Ends at full lock (endReason "fullLock"), if the force drops below 80% of the peak after 0.1 of angle ("noIssues"), or on safety timeout 120 s ("timeout"). If the speed drops below 40 km/h, the cruise is restarted (cruiseControlRestarts +1).
- Result in data.FFB: endReason, cruiseControlFailures/Restarts, speedTarget/speedMin (km/h), FFBcoef (v.data.input.FFBcoef), maxValueTarget (= 10 x targetPeak = 2), correctionAdvice and correctionAdviceSm (= 2 / FFBMaxValue or smoothed), maxValue, maxValueSm, maxAngle.
- start disables hydros.enableFFB and enables hydros.enableFFBflood, sets the gearbox to 'arcade' mode, locks the steering wheel input source to "ffbCalibration" (input.setAllowedInputSource); finish sets the gearbox back to 'realistic', brakes, disengages the clutch and gives the wheel input back. finish does NOT restore hydros.enableFFB nor enableFFBflood (code behavior).
- fastmotion: start calls be:setPhysicsSpeedFactor(100) on the GE side; finish resets the factor to 0 (GE call), a value which according to the name probably means "normal" (inferred, not verified here).
- Inconsistency: in "straight" mode, speedTarget = 200 * 3.6 (i.e. 720 m/s) instead of 200 / 3.6; the conversion seems inverted. Straight mode only launches the target via cruiseControl.setSpeed anyway.
- In straight mode, the end by timeout (40 s) is reported as endReason = "noIssues".
- State variables and internal parameters: detectionPeakPercent (0.8, set to 0 in steerFull), detectionStDiff (0.1), targetPeak (0.2).
- start calls finish() without data if v.data.input.steeringWheelLock is missing; in that case data stays nil and lpack.encode(nil) is returned to the GE. The parameters of the M.mode module are stored in M.

## Functions

| Function | Description | Line |
|---|---|---|
| `test_ffbCalibration.finish()` | Ends the calibration: sets physics back to normal speed (GE side), gives control back (input, cruise, gearbox, brake, clutch), computes the FFB correction advice, sends the data to the GE via test_ffbCalibration.onFFBCalibrationFinished and frees `data`. | 184 |
| `test_ffbCalibration.onExtensionLoaded()` | Load hook: calls enablePhysicsStepHook() to receive onPhysicsStep. *(internal)* *(hook)* | 263 |
| `test_ffbCalibration.onPhysicsStep(dtSim)` | Physics step hook (enabled by enablePhysicsStepHook in onExtensionLoaded, called by main.lua at the physics frequency). Updates airspeed (obj:getGroundSpeed) then runs the logic of the current mode. *(internal)* *(hook)* | 173 |
| `test_ffbCalibration.start(mode, fastmotion)` | Starts an FFB calibration in the given mode: initializes all counters and the results table, takes control of the steering wheel and gearbox, loads cruiseControl, sets the target speed and disables normal FFB. | 207 |

### Parameter details

#### `test_ffbCalibration.onPhysicsStep(dtSim)`

Physics step hook (enabled by enablePhysicsStepHook in onExtensionLoaded, called by main.lua at the physics frequency). Updates airspeed (obj:getGroundSpeed) then runs the logic of the current mode.

- `dtSim` (*number*) : Physics step in seconds.

#### `test_ffbCalibration.start(mode, fastmotion)`

Starts an FFB calibration in the given mode: initializes all counters and the results table, takes control of the steering wheel and gearbox, loads cruiseControl, sets the target speed and disables normal FFB.

- `mode` (*string*) : "steerPeak", "steerFull" or "straight"; any other value: error log and finish().
- `fastmotion` (*boolean|nil*) : true to speed up physics (x100) during calibration.

## Calls into the engine (C++)

- `obj:` `getGroundSpeed`, `queueGameEngineLua`

**Loads extensions:** `cruiseControl`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/test/ffbCalibration.lua`.*

# `escCalibration`

*File: `lua/vehicle/extensions/escCalibration.lua` · VM: Vehicle · 229 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `escCalibration`: `extensions.load (vehicle VM)("escCalibration")`, then the global `escCalibration`

Internal ESC calibration tool: automates a 'skew stiffness' test by sweeping 13 speeds (40 to 100 km/h) and 14 steering angles (0.5° to 7°), with the cruise control and the 'esc' controller. The result is written to skewStiffnessPivot.csv and progress is sent to the UI via the 'ESCSkewStiffnessChange' hook.

## Example

```lua
extensions.load('escCalibration')
extensions.escCalibration.startSkewStiffnessTest()  -- requires an 'esc' controller
```

## Notes

- States: Idling, Initialization (measures the maximum wheel angle by steering fully 2 x 2 s), Starting, Settling (waits for the target speed via cruiseControl.hasReachedTargetSpeed then esc.calibrationSettled), Measuring (waits for esc.calibrationMeasurementReady), Increasing Angle / Increasing Speed, Finished (writes the CSV, cuts the cruise control, restores normal physics speed).
- Depends on the 'esc' controller (fields wheelAngleFront, pauseESCAction, doSettle, calibrationSettled, doMeasure, calibrationMeasurementReady, stiffnessFront, stiffnessRear, functions startESCCalibration/stopESCCalibration) and loads the cruiseControl extension.
- During the test, be:setPhysicsSpeedFactor(1) is requested from the GE (maximum physics speed); it is reset to 0 at the end or on stop.
- CSV columns: Speed,Angle,Front,Rear,Ratio,gForce, Float Angle, Test. The last two columns (floatAngle, test) are never filled in testResults and are therefore nil. The file is written to the game's working directory (relative path).
- gForce = sensors.gx2 / |gravity| (gravity clamped to a minimum of 0.1). Progress in % = completed steps / (13 x 14).
- Steering is commanded by input.event('steering', -targetAngle/maxAngle, 1).

## Functions

| Function | Description | Line |
|---|---|---|
| `escCalibration.onInit()` | Initialization hook: resets all counters and results to zero, physics speed to normal and the state to Idling. *(internal)* *(hook)* | 165 |
| `escCalibration.onReset()` | Same function as onInit. *(internal)* *(hook)* | 165 |
| `escCalibration.startSkewStiffnessTest()` | Starts the test: gets the 'esc' controller (aborts with a log error if it does not exist), loads cruiseControl, starts the ESC calibration and switches to the Initialization state. | 191 |
| `escCalibration.stopSkewStiffnessTest()` | Stops the test: cuts the cruise control, stops the ESC calibration, restores normal physics speed and switches to the Finished state (the CSV will then be written on the next frame). | 209 |
| `escCalibration.updateGFX(dt)` | Called every frame: advances the test state machine and drives the steering. *(internal)* | 57 |

### Parameter details

#### `escCalibration.updateGFX(dt)`

Called every frame: advances the test state machine and drives the steering.

- `dt` (*number*) : Time step in seconds.

**UI events (guihooks.trigger):** `ESCSkewStiffnessChange`

## Calls into the engine (C++)

- `obj:` `getGravity`, `queueGameEngineLua`

**Loads extensions:** `cruiseControl`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/escCalibration.lua`.*

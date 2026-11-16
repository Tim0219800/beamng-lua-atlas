# `escMeasurement`

*File: `lua/vehicle/extensions/escMeasurement.lua` · VM: Vehicle · 558 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `escMeasurement`: `extensions.load (vehicle VM)("escMeasurement")`, then the global `escMeasurement`

Internal tool for automatic ESC measurement/calibration (drivingDynamics/CMU controller), driven from the GE by util_calibrateESC. A worker coroutine runs a skew stiffness test by sweeping speeds (30 to 150 km/h, 2 m/s steps) and steering angles (0.5° to 20°), then writes the result to vehicles/<model>/drivingDynamics/<config>.stat.json. A second test (STM, yaw measurements at 200 km/h) exists but is disabled in performTests.

## Example

```lua
-- called by the GE: extensions.escMeasurement.performTests('vivace', 'base')
```

## Notes

- performTests(vehicleName, configName) creates a coroutine resumed at each updateGFX; at its end (Testend state) it writes the files, stops the test, then the VM calls util_calibrateESC.vehicleDone() (killswitch) on the GE side. updateGFX also sends util_calibrateESC.heartbeat() every frame (watchdog).
- Requires exactly one 'drivingDynamics/CMU' controller; otherwise error log and Testend state.
- States: Idling, Initialization (measures the maximum wheel angle by steering fully 2 x 2 s), Settling (internal regulator toward the target speed, smoothed steering), Measuring (average over 100 front/rear stiffness measurements), Finished, Testend.
- The internal speed regulator (updateCC) writes electrics.values.throttleOverride, limits lateral acceleration to about 1.6 g and imposes setAggressionOverride(1) on the vehicleController.
- Output: skewStiffnessFront/Rear rounded down to the thousand (N/rad, inferred from code) in the .stat.json; STMMeasurements.csv (speed, wheel angle, average yaw) if STM measurements exist.
- During the test, be:setPhysicsSpeedFactor(2) is requested from the GE; reset to 0 at the end.
- Anomaly: startSkewStiffnessTest registers M.updateFixedStepCallback via M.*; if the module is reloaded, the reference may change. The STM test (startSTMMeasurementsTest) is not exported.
- Anomaly: in stopSkewStiffnessTest, setState(finishedState) no longer produces file output; the writing is done by combineTestData called earlier in the coroutine.

## Functions

| Function | Description | Line |
|---|---|---|
| `escMeasurement.onInit()` | Initialization hook: resets state, counters, measurements and physics speed to zero (Idling state). *(internal)* *(hook)* | 442 |
| `escMeasurement.onReset()` | Same function as onInit. *(internal)* *(hook)* | 442 |
| `escMeasurement.performTests(vehicleName, configName)` | Launches the complete calibration sequence in a coroutine and stores model/config for the output file name. | 507 |
| `escMeasurement.startSkewStiffnessTest()` | Starts the skew stiffness test: gets the CMU, registers the fixed-step callback, disables the ESC systems for calibration and switches to Initialization. | 457 |
| `escMeasurement.stopSkewStiffnessTest()` | Stops the test: cuts the internal regulator, restores normal physics speed, Finished state. | 499 |
| `escMeasurement.updateFixedStepCallback(dt)` | Callback called by the CMU at a fixed physics step: runs the skew stiffness test logic. *(internal)* | 390 |
| `escMeasurement.updateGFX(dt)` | Called every frame: resumes the worker coroutine, sends the heartbeat to the GE and triggers the killswitch when it is finished. *(internal)* | 115 |
| `escMeasurement.updateGFXCallback(dt)` | GFX callback of the CMU; empty. *(internal)* | 394 |

### Parameter details

#### `escMeasurement.performTests(vehicleName, configName)`

Launches the complete calibration sequence in a coroutine and stores model/config for the output file name.

- `vehicleName` (*string*) : Model name (vehicles/ folder).
- `configName` (*string*) : Configuration name.

#### `escMeasurement.updateFixedStepCallback(dt)`

Callback called by the CMU at a fixed physics step: runs the skew stiffness test logic.

- `dt` (*number*) : Time step in seconds.

#### `escMeasurement.updateGFX(dt)`

Called every frame: resumes the worker coroutine, sends the heartbeat to the GE and triggers the killswitch when it is finished.

- `dt` (*number*) : Time step in seconds (unused).

#### `escMeasurement.updateGFXCallback(dt)`

GFX callback of the CMU; empty.

- `dt` (*number*) : Time step in seconds.

**UI events (guihooks.trigger):** `ESCSkewStiffnessChange`

## Calls into the engine (C++)

- `obj:` `getDirectionVector`, `getGravity`, `getVelocity`, `queueGameEngineLua`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/escMeasurement.lua`.*

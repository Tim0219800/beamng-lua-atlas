# `hydros`

*File: `lua/vehicle/hydros.lua` · VM: Vehicle · 790 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `hydros`

Manages jbeam hydros (beams/torsion bars driven by an input: steering, dump beds, cranes, etc.) and steering wheel force feedback (FFB). At init it reads v.data.hydros (beams) and v.data.torsionHydros, normalizes their limits and center, and separates steering hydros (inputSource 'steering_input') from the others. At each physics step (update) it moves each hydro toward its command (cmd, read from electrics.values via inputFlex) with inRate/outRate rates; for the physical steering wheel, the wheel position drives the steering and the force measured on the steering beams is sent back to the hardware (FFBcalc: smoothing, compression, damping, software stop "softlock"). Also provides a virtual wheel for tests (enableVirtualWheel).

## Example

```lua
-- read the normalized steering wheel force (-1..1)
local f = hydros.forceAtWheelNorm
-- temporarily cut the hardware FFB
hydros.enableFFB = false
hydros.setFFBConfig({forceCoef = 80, smoothing = 40})
```

## Notes

- UNITS/SCALES: FFmax = 10 (maximum internal force of the FFB driver). forceAtDriver is in [-10, 10]; forceAtDriverNorm and forceAtWheelNorm = value / 10; curForceLimit grows from 0 to wheelFFBForceLimit over a few seconds after spawn/reset/pause (anti-spike), curForceLimitNorm = curForceLimit / 10. The field descriptions automatically generated in the extraction page are shifted by one; the definitions below are those from the code.
- Each hydro (table in M.hydros) receives at init: bcid (cid of the beam or the bar), fIsBroken/fgetDisplacement/fsetRelDisplacement (obj functions adapted to beam or torsion bar), center, multOut/multIn/cOut/cIn (input -> state conversion), cmd (command), state (position about -1..1), _inrate/_outrate (per physics step), smoothrate. jbeam keys used: beamCID/cid, inputSource (e.g. 'throttle', 'steering' -> normalized to 'steering_input'), inputFactor, inputCenter, inputInLimit, inputOutLimit, inLimit, outLimit, inRate, outRate, autoCenterRate, analogue, forceLimit, steeringWheelLock, steeringAutocenterEnabled, lowspeedCoefFFB.
- The inputFlex mechanism lets a hydro with forceLimit "give way": if the beam's stress exceeds forceLimit, the source input is shifted to limit the effort (hysteresis).
- The extension hook onFFBConfigChanged(config) is called by the engine when the FFB devices change (steering / accelerate / brake devices). It chooses FFBID, the send frequency (30 Hz minimum, up to 400 Hz by heuristic on ffbSendms, or the user frequency capped), the corrected response curve (responseCurve), the gamepad vibration mode, and calls input_haptics.
- FFB updates are limited in real time (wall clock os.clockhp) to FFBperiod (1/200 s by default), not in simulated time; enableFFBflood removes this limit (debug).
- Bug spotted: sendHydroStateToGUI sends `M.state`, which is not defined anywhere in this file (nil). The torqueCurrent field is only defined after onFFBConfigChanged (value ffbParams.torqueCurrent or 100).
- M.update and M.updateGFX are replaced by nop if the vehicle has no hydro (init/reset). isPhysicsStepUsed() returns true only when update is not nop (used by main.lua).
- An optional field M.testHook(dtSim, simWheelPos, hydroPos) can be defined by test tools (e.g. ffbCalibration) to intercept the FFB computation.

## Functions

| Function | Description | Line |
|---|---|---|
| `hydros.debugDraw()` | Called by main.lua:onDebugDraw. Resets the FFB smoother when the real frame time is aberrant (less than 10 fps or at standstill) to avoid spikes. *(internal)* | 288 |
| `hydros.destroy()` | Called when the vehicle is removed (main.lua:onDespawnObject): cuts all FFB interfaces (force 0). *(internal)* | 731 |
| `hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun)` | Enables or disables a virtual wheel (software simulation of an FFB wheel): enables FFB with FFBID 0, replaces the force send function and the angle read function. | 116 |
| `hydros.getAngleFunction()` | Returns the function that gives the current wheel angle: the virtual wheel's if enabled, otherwise a function reading electrics.values.steering_input. | 761 |
| `hydros.getFFBConfig()` | Returns the current FFB configuration. | 488 |
| `hydros.getFFBID()` | Returns the identifier of the steering FFB device (-1 if none). | 753 |
| `hydros.getForceFeedbackFunction()` | Returns the current force send function (obj.sendForceFeedback, or the virtual wheel's). | 749 |
| `hydros.init()` | Prepares the hydros from v.data.hydros and v.data.torsionHydros: computation of multipliers/centers, steering / others split, inputFlex, vehicle FFB coefficient (v.data.input.FFBcoef x 1.2), haptics initialization, then reset(). Called by main.lua (initSystems). *(internal)* | 603 |
| `hydros.isPhysicsStepUsed()` | Indicates whether hydros needs the physics step (update active). *(internal)* | 745 |
| `hydros.onFFBConfigChanged(newFFBConfig)` | Hook called when the FFB device configuration changes: cuts the interfaces, rereads steering/accelerate/brake, chooses FFBID, force, smoothing, softlock, response curve, send frequency and configures input_haptics. *(internal)* *(hook)* | 513 |
| `hydros.reset()` | Resets the hydro states to center, reinitializes FFB smoothers and the virtual wheel, cuts the FFB interfaces; re-enables update/updateGFX if there are hydros (otherwise nop). *(internal)* | 701 |
| `hydros.resetFFBSmoother()` | Resets the FFB force smoother and the force limit to 0 (anti-spike). | 203 |
| `hydros.sendHydroStateToGUI()` | Sends guihooks.trigger('HydrosUpdate', M.state); M.state is never defined in this file (see notes). *(internal)* | 735 |
| `hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine)` | Sends the RPM LEDs to the FFB device (obj:sendRPMLeds) if FFBID is valid and deviceLightingMode is 'default'. | 739 |
| `hydros.setExternalForce(force)` | Adds an external force to the steering wheel FFB computation (before the force coefficient). | 134 |
| `hydros.setFFBConfig(ffbParams)` | Updates FFB parameters on the fly (only the fields provided are modified) then cuts the FFB interfaces. | 498 |
| `hydros.update(dtSim)` | Physics step (main.lua:onPhysicsStep, after controller.update). Moves each hydro toward its command; for steering hydros with FFB active, follows the real wheel position and runs the FFB computation (FFBcalc). *(internal)* | 418 |
| `hydros.updateGFX(dt)` | Graphics frame (after extensions and electrics, before powertrain). Updates the virtual wheel, inputFlex, commands (cmd) and smoothing rates, the wheel motion model for FFB, the force limit, the force coefficient according to speed, and electrics.values.steering (angle in degrees). *(internal)* | 293 |

### Parameter details

#### `hydros.enableVirtualWheel(isEnabled, wheelAngleFun, sendForceFun)`

Enables or disables a virtual wheel (software simulation of an FFB wheel): enables FFB with FFBID 0, replaces the force send function and the angle read function.

- `isEnabled` (*boolean|nil*) : true (default if nil) to enable.
- `wheelAngleFun` (*function|nil*) : Function returning the wheel angle -1..1 (virtual wheel by default).
- `sendForceFun` (*function|nil*) : Force send function (o, FFBID, torque, dampCoef, inertia, friction); virtualSendForceFeedback by default.

#### `hydros.getAngleFunction()`

Returns the function that gives the current wheel angle: the virtual wheel's if enabled, otherwise a function reading electrics.values.steering_input.

- **returns**: function Argument-less function returning the angle.

#### `hydros.getFFBConfig()`

Returns the current FFB configuration.

- **returns**: table {forceCoef, softlockForce, smoothing, gforceCoef, wheelFFBDampLimit}.

#### `hydros.getFFBID()`

Returns the identifier of the steering FFB device (-1 if none).

- **returns**: integer FFBID (>= 0 valid).

#### `hydros.getForceFeedbackFunction()`

Returns the current force send function (obj.sendForceFeedback, or the virtual wheel's).

- **returns**: function Function sendForceFeedback(obj, FFBID, force, ...).

#### `hydros.isPhysicsStepUsed()`

Indicates whether hydros needs the physics step (update active).

- **returns**: boolean true if M.update ~= nop.

#### `hydros.onFFBConfigChanged(newFFBConfig)`

Hook called when the FFB device configuration changes: cuts the interfaces, rereads steering/accelerate/brake, chooses FFBID, force, smoothing, softlock, response curve, send frequency and configures input_haptics.

- `newFFBConfig` (*table|nil*) : Config {steering = {FFBID, ffbParams, ffbSendms}, accelerate = {FFBID}, brake = {FFBID}}; nil to disable.

#### `hydros.sendRPMLeds(currentRPM, rpmFirstLedTurnsOn, rpmRedLine)`

Sends the RPM LEDs to the FFB device (obj:sendRPMLeds) if FFBID is valid and deviceLightingMode is 'default'.

- `currentRPM` (*number*) : Current engine RPM.
- `rpmFirstLedTurnsOn` (*number*) : RPM at which the first LED lights up.
- `rpmRedLine` (*number*) : RPM of the red zone.

#### `hydros.setExternalForce(force)`

Adds an external force to the steering wheel FFB computation (before the force coefficient).

- `force` (*number*) : External force (same scale as the wheel displacement).

#### `hydros.setFFBConfig(ffbParams)`

Updates FFB parameters on the fly (only the fields provided are modified) then cuts the FFB interfaces.

- `ffbParams` (*table*) : Possible fields: forceCoef, softlockForce (0..1), smoothing, gforceCoef, enableThrottleForceFeedback, enableBrakeForceFeedback, deviceLightingMode, wheelFFBDampLimit.

#### `hydros.update(dtSim)`

Physics step (main.lua:onPhysicsStep, after controller.update). Moves each hydro toward its command; for steering hydros with FFB active, follows the real wheel position and runs the FFB computation (FFBcalc).

- `dtSim` (*number*) : Physics step in seconds.

#### `hydros.updateGFX(dt)`

Graphics frame (after extensions and electrics, before powertrain). Updates the virtual wheel, inputFlex, commands (cmd) and smoothing rates, the wheel motion model for FFB, the force limit, the force coefficient according to speed, and electrics.values.steering (angle in degrees).

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `GforceCoef` | number | Effect coefficient of lateral G forces (sensors.gx) on the steering wheel force (default 0). |
| `curForceLimit` | number | Current force limit (spike preventer): restarts from 0 after spawn/reload/pause and climbs up to wheelFFBForceLimit. |
| `curForceLimitNorm` | number | curForceLimit / FFmax. |
| `deviceLightingMode` | string | Device lighting configuration ('off' by default; 'default' enables sending the RPM LEDs). |
| `enableBrakeForceFeedback` | boolean | Enables brake force feedback in gamepad vibration mode (default true). |
| `enableFFB` | boolean | true by default; when set to false the real requests to the FFB hardware are ignored (the computations continue). |
| `enableFFBflood` | boolean | false by default; true = ignores the time checks and sends at ~2 kHz (debug only: saturates the drivers). |
| `enableThrottleForceFeedback` | boolean | Enables throttle force feedback in gamepad vibration mode (default true). |
| `enableVibration` | boolean | false by default; true in vibration mode (gamepad), the steering wheel FFB is then disabled (FFBHydrosExist = false). |
| `ffbSpeedFast` | number | Speed (m/s) above which the FFB force reaches its normal coefficient (5 / 3.6). |
| `forceAtDriver` | number | Force sent to the hardware driver in [-FFmax, FFmax]. |
| `forceAtDriverNorm` | number | Force sent to the hardware driver, normalized. |
| `forceAtWheelNorm` | number | Force measured at the wheel, normalized (force / FFmax). |
| `hydros` | table[] | List of all hydros (beams then torsion bars) with their computed fields. |
| `wheelFFBForceCoef` | number | FFB force coefficient at normal speed (default 100). |
| `wheelFFBForceCoefCurrent` | number | Current coefficient, interpolated between low and normal speed according to the speed (ffbSpeedFast), 0 when the AI is driving. |
| `wheelFFBForceCoefLowSpeed` | number | Force coefficient at parking speeds (initially = wheelFFBForceCoef; = forceCoef/10 if lowspeedCoef). |
| `wheelFFBForceCompressionCoef` | number | Fraction of the limit from which the force is compressed (0..1, default 0.9). |
| `wheelFFBForceLimit` | number | Stable FFB force limit (scale 0..FFmax = 10). |
| `wheelPowerSteeringCoef` | number | Power steering coefficient (default 1) applied to the wheel displacement in the FFB force. |

**UI events (guihooks.trigger):** `HydrosUpdate`

## Calls into the engine (C++)

- `obj:` `getBeamRefLength`, `getBeamStress`, `getId`, `getRealdt`, `sendRPMLeds`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/hydros.lua`.*

# `powertrain_electricMotor`

*File: `lua/vehicle/powertrain/electricMotor.lua` · VM: Vehicle · 724 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `electricMotor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `electricMotor`: electric motor of category `engine`. It produces a torque from a torque/RPM curve (jbeam key `torque`), the throttle (`electrics.values.throttle`) and regeneration (`regenThrottle`). It consumes energy from registered `electricBattery` batteries (registerStorage), applies electrical efficiency, handles a temporary rev limiter, ignition, engine sounds and the torque reaction on the body. With a child clutch (category clutchlike) it integrates its own speed; without a clutch it directly imposes the output torque on the child.

## Example

```lua
local m = powertrain.getDevice("mainMotor")
print(m.outputAV1 * 9.5493, m.engineLoad, m.maxPower, m.maxTorque) -- RPM, 0..1, kW, N·m
m:setTempRevLimiter(5000 * 0.10472) -- limit at 5000 RPM
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio, cumulativeGearRatio, friction (N·m), dynamicFriction (N·m per rad/s), inertia (kg·m², default 0.1), electricsThrottleName ('throttle'), electricsRegenThrottleName ('regenThrottle'), electricsThrottleFactorName ('throttleFactor'), isAffectedByIgnitionLevel (true), defaultMotorDirection (1), torqueReactionNodes_nodes (3 nodes), torque (table with rpm/torque header, required), regenTorqueCurve (rpm/torque table), regenFadeRPM (1000), maxRegenPower (kW, = maxPower), maxRegenTorque (= maxTorque), minimumWantedRegenTorque (0), maximumWantedRegenTorque (= maxRegenTorque), electricalEfficiency (number or table {load 0..1, efficiency}), energyStorage, breakTriggerBeam, soundConfig (name of a jbeam sound configuration table).
- Main fields: outputAV1 (rad/s, rotor speed; with a clutch it is integrated by the motor, without a clutch it is imposed by the child), outputRPM (RPM, updated in updateGFX), outputTorque1 (N·m to the child; with a clutch = torqueDiff of the clutch), inputAV (always 0), torqueCurve (table keyed by integer RPM, N·m), regenCurve (same for regeneration), maxRPM (RPM), maxAV (rad/s), maxTorque (N·m), maxPower (hp/PS according to torqueToPower, = value from getTorqueData), maxRegenTorque, throttle (0..1 after smoothing), engineLoad and instantEngineLoad (-1..1 without clutch, 0..1 with), torqueCoef (0..1, reduces the available torque from outside), maxTorqueLimit (N·m, math.huge by default), outputTorqueState (0 or 1), isDisabled, hasEnergy, spentEnergy (J accumulated before being drawn from the batteries), grossWorkPerUpdate, frictionLossPerUpdate, motorDirection (+1 or -1), isBroken, torqueReactionNodes ({-1,-1,-1} if absent), engineNodeID.
- velocityUpdate is nop: a motor does not receive a speed from its parent. Its speed comes from the clutch (updateTorqueWithClutch integrates outputAV1) or from the wheel/transmission downstream (without a clutch).
- Without a clutch, the motor also applies the inertial reaction torque (inertia * dOutputAV/dt) via obj:applyTorqueAxisCouple on torqueReactionNodes; 3 valid nodes are therefore needed.
- Regeneration only happens if throttle is 0 (actualTorque = throttle > 0 and torque or regenTorque) and exists only in the version without a clutch. A negative regeneration torque recharges the batteries because spentEnergy becomes negative.
- Cut-off: disable() and lockUp() set outputTorqueState to 0; lockUp also sets outputAVState to 0 (locked rotor, used by onBreak). enable() is automatically called when a battery regains energy.
- Power cap: the torque is limited to maxPowerThrottleMap = maxPower * 735.499 W / (speed) only in the version with a clutch.
- The fields are read from `v.data`, so validate/new must run in the vehicle VM after the jbeam data is loaded. M.requiredExternalInertiaOutputs is not defined in this module (shallowcopy of nil).
- Minor bug: reset does not reread electricsRegenThrottleName, torque/torqueCurve or the sounds; resetSounds only resets the smoothers when soundConfig exists.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_electricMotor.new(jbeamData)` | Builds the electric motor: reads the torque curve (required), the regeneration curve (provided or computed from maxRegenPower/maxRegenTorque/regenFadeRPM), the electrical efficiency, the torque reaction nodes, and prepares the curve data (getTorqueData). *(internal)* | 505 |

### Parameter details

#### `powertrain_electricMotor.new(jbeamData)`

Builds the electric motor: reads the torque curve (required), the regeneration curve (provided or computed from maxRegenPower/maxRegenTorque/regenFadeRPM), the electrical efficiency, the torque reaction nodes, and prepares the curve data (getTorqueData).

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true}: lets clutches and gearboxes recognize the motor as a valid parent. |
| `outputPorts` | table<integer, boolean> | {[1]=true}: one output port. |

## Class `device`

Object returned by new(jbeamData). torqueUpdate is updateTorqueWithClutch or updateTorqueWithoutClutch depending on the presence of a child clutch.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Takes the cumulative inertia and ratio of the first child as cumulativeInertia and cumulativeGearRatio. | 323 |
| `device:disable()` | Cuts the motor: outputTorqueState = 0, isDisabled = true. | 88 |
| `device:enable()` | Re-enables the motor: outputTorqueState = 1, isDisabled = false. | 93 |
| `device:getSoundConfiguration()` | Returns the soundConfiguration table (parameters of the already initialized engine sounds, by reference). | 337 |
| `device:getTorqueData()` | Computes the torque and power curves net of friction and returns {maxRPM, curves, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID}. Used by the interface and by the clutches/gearboxes (maxTorque). | 22 |
| `device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference)` | Stores the configuration of a sound sample and asks the game engine (GE Lua) to initialize it: core_sounds.initEngineSound. | 417 |
| `device:initSounds(jbeamData)` | Creates the sound configuration from the jbeam table designated by soundConfig (smoothers, gains, EQ, sample) and enables updateSounds. Logs an error if the configuration cannot be found. | 432 |
| `device:lockUp()` | Locks the motor: torque 0, output speed forced to 0 (outputAVState = 0) and isDisabled = true. Called by onBreak. | 98 |
| `device:onBreak()` | Called when the break beam breaks: calls lockUp. | 292 |
| `device:registerStorage(storageName)` | Registers a battery (storage of type electricBattery with capacity > 0) as the motor's energy source and recomputes the ratios. | 311 |
| `device:reset(jbeamData)` | Resets the state (speeds, torque, throttle, load, energy, limiter, coefficients), rereads friction, dynamicFriction, inertia, defaultMotorDirection from the jbeam and recomputes the curve data. | 341 |
| `device:resetSounds(jbeamData)` | Resets the sound smoothers if the sound configuration exists; stops the old engine sounds. Logs an error if soundConfig cannot be found. | 398 |
| `device:resetTempRevLimiter()` | Disables the temporary rev limiter (very high cut-off value, isTempRevLimiterActive = false). | 303 |
| `device:scaleFriction(friction)` | Multiplies the motor friction (friction) by the given factor. | 80 |
| `device:scaleOutputTorque(state)` | Multiplies outputTorqueState (0..1) by state. Used to reduce the available torque; note that the effect is cumulative. | 84 |
| `device:sendTorqueData(data)` | Sends the GUI event 'TorqueCurveChanged' with the curve data (computed if not provided). | 73 |
| `device:setEngineSoundParameterList(soundID, params, reference)` | Stores and sends (core_sounds.setEngineSoundParameterList) a list of sound parameters for an engine sound. | 425 |
| `device:setIgnition(value)` | Sets the ignition coefficient: 1 if value > 0, otherwise 0. Only has an effect if isAffectedByIgnitionLevel is true (default). | 288 |
| `device:setTempRevLimiter(revLimiterAV, maxOvershootAV)` | Enables a temporary rev limiter: the throttle is reduced between revLimiterAV and revLimiterAV + maxOvershootAV. | 296 |
| `device:torqueUpdate(dt)` | Called at each physics step. Computes the smoothed throttle (with temporary rev limiter and ignition), the torque from the curve, the load, the gross work, the spent energy and the friction torque. With a clutch: integrates outputAV1 and takes outputTorque1 = clutch.torqueDiff. Without a clutch: includes regeneration and applies the inertial reaction torque to the body. | dyn |
| `device:updateEnergyStorageRatios()` | Recomputes the share of energy drawn (or returned during regeneration) by each registered battery according to the number of batteries with energy. | 104 |
| `device:updateEnergyUsage()` | Removes spentEnergy from the registered batteries (or adds to them during regeneration), updates the counters of non-empty batteries and calls disable/enable depending on whether energy remains. Does nothing without device.energyStorage. | 116 |
| `device:updateGFX(dt)` | Per-frame update: calls updateEnergyUsage, computes outputRPM and resets the work and friction loss counters. | 154 |
| `device:updateSounds(dt)` | Defined only if a valid soundConfig is present (otherwise nop). Smooths RPM and load and calls obj:setEngineSound with the fundamental frequency. | 163 |
| `device:validate()` | Detects the child clutch (a single child of category clutchlike), sets clutchChild and the effective inertia, registers the motor in powertrain.engineData and selects the torqueUpdate version. Without a child: clutchChild = {torqueDiff = 0}. | 273 |
| `device:velocityUpdate()` | Always nop for a motor: the output speed is computed in torqueUpdate or imposed from downstream. | dyn |

**UI events (guihooks.trigger):** `TorqueCurveChanged`

## Calls into the engine (C++)

- `obj:` `applyTorqueAxisCouple`, `getId`, `queueGameEngineLua`, `setEngineSound`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/electricMotor.lua`.*

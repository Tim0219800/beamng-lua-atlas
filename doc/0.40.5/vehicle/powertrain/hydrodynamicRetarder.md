# `powertrain_hydrodynamicRetarder`

*File: `lua/vehicle/powertrain/hydrodynamicRetarder.lua` · VM: Vehicle · 284 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `hydrodynamicRetarder` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `hydrodynamicRetarder`: hydrodynamic retarder (truck/bus engine brake) mounted as a branch on the shaft. It has a virtual rotor (inertia `virtualInertia`) whose speed `outputAV1` it integrates itself; it returns `inputAV = outputAV1 * gearRatio` to its parent. When the requested coefficient is > 0, it applies a braking torque read from the `brakeTorque` curve (torque according to the rotor speed), smoothed by `strengthSmoothing`. The dissipated power can be returned to the engine coolant (`thermals.additionalCoolantEnergyPerStep`). Categories `retarder` and `torqueConsumer`, without an output port.

## Example

```lua
local ret = powertrain.getDevice("retarder")
ret:setRetarderCoef(0.6) -- braking at 60 % (0..1)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, friction (N·m), dynamicFriction, strengthSmoothing (10), gearRatio (1, ratio between input shaft and rotor), virtualInertia (kg·m², 0.1), torqueDropOffRange (RPM, default 500, min 10, rounded down), brakeTorque (table with header {rpm, torque}, REQUIRED, at least two rows, distinct rpm, torque in N·m), coolantEnergyCoef (0..1, default 1, share of the dissipated power sent to the coolant), breakTriggerBeam, retarderWhineEvent, retarderWhinePitchCoefSmoothing (100).
- Main fields: inputAV (rad/s parent side), outputAV1 (rad/s, rotor speed), outputTorque1 (always 0), gearRatio, desiredRetarderCoef (0..1 requested by setRetarderCoef), brakeTorqueCurve (table keyed by integer rotor RPM, N·m), torqueDropOffRange, virtualInertia, invVirtualInertia, coolantEnergyCoef, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken.
- The braking torque = -sign(rotorAV) * brakeTorqueCurve[|rotorRPM|] * smoothed coefficient. Beyond the last row of the curve, the torque decreases linearly to 0 over torqueDropOffRange RPM. The braking torque of the curve is tabulated in ROTOR RPM (outputAV1), not that of the input shaft.
- validate returns false if the brakeTorque curve is missing or invalid: the device is then rejected. A broken rotor or one without a curve switches to updateTorqueBroken (the rotor accelerates freely without braking).
- The thermal system is only fed if the propulsion engine (powertrain.getPropulsionDeviceForDevice) has thermals.additionalCoolantEnergyPerStep.
- Minor bugs: the log messages cite 'hydrodynamicRetarder2.new' (old name); calculateInertia divides by gearRatio² without protecting against gearRatio == 0; M.requiredExternalInertiaOutputs is not defined in this module; initSounds uses obj:createSFXSource (and not createSFXSource2).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_hydrodynamicRetarder.new(jbeamData)` | Builds the retarder: reads and validates the brakeTorque curve, builds the per-RPM curve with the decay zone, sets the virtual inertia and the smoothers. *(internal)* | 154 |

### Parameter details

#### `powertrain_hydrodynamicRetarder.new(jbeamData)`

Builds the retarder: reads and validates the brakeTorque curve, builds the per-RPM curve with the decay zone, sets the virtual inertia and the smoothers.

- `jbeamData` (*table*) : jbeam data of the component (brakeTorque required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {retarder=true, torqueConsumer=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData). velocityUpdate and torqueUpdate are set by selectUpdates.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 75 |
| `device:calculateInertia()` | cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio; computes invVirtualInertia. | 112 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}. | 94 |
| `device:initSounds(jbeamData)` | Creates the retarder sound loop (disabled at start) and the speed smoother. | 126 |
| `device:onBreak()` | Marks the retarder as broken and switches to the torque version without braking. | 107 |
| `device:reset(jbeamData)` | Resets speeds, torque, requested coefficient, smoother, wear/damage coefficients; rereads friction and dynamicFriction. | 136 |
| `device:resetSounds()` | Resets the sound speed smoother. | 122 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table {damageFrictionCoef, isBroken}); calls onBreak if isBroken. | 79 |
| `device:setRetarderCoef(coef)` | Sets the requested braking force (0 = none, 1 = maximum of the curve). The actual torque follows via a smoother. To be called from a controller (retarder lever). | 17 |
| `device:torqueUpdate(dt)` | Called at each physics step: integrates the rotor speed with the parent torque (minus friction) plus the braking torque, and adds the dissipated power to the energy of the cooling circuit. "Broken or no curve" version: without braking. | dyn |
| `device:updateGFX(dt)` | Per-frame update: does nothing. | 66 |
| `device:updateSounds(dt)` | Sets the volume, pitch and color of the retarder whine sound from the smoothed speed and the requested coefficient. | 21 |
| `device:validate()` | Called after the powertrain is built; returns false if the brakeTorque curve is missing or invalid. | 103 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio, written into the parent's speed field. | 31 |

## Calls into the engine (C++)

- `obj:` `createSFXSource`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/hydrodynamicRetarder.lua`.*

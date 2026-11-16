# `powertrain_sequentialGearbox`

*File: `lua/vehicle/powertrain/sequentialGearbox.lua` · VM: Vehicle · 436 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `sequentialGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `sequentialGearbox`: sequential gearbox (racing type) whose gear can only change one step at a time (plus one, minus one). No synchronizers or grinding: the gear shift takes effect at the next per-frame update (updateGFX). Like manualGearbox, the parent must be a clutch. Handles neutral (virtual mass), locking (setLock), wear/damage and "straight-cut" type gear sounds. A sequential gearbox controller calls setGearIndex.

## Example

```lua
local gb = powertrain.getDevice("gearbox")
gb:setGearIndex(gb.gearIndex + 1) -- shift up one gear (limited to +/- 1 per call)
print(gb.gearIndex, gb.gearRatio)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio, friction (N·m), dynamicFriction (N·m per rad/s), torqueLossCoef (0..1), gearRatios (required list: values >= 0 = forward gears at indices 0, 1, 2…; values < 0 = reverse gears, same indexing as manualGearbox), gearWhineCoefs / gearWhineCoefsOutput / gearWhineCoefsInput, gearboxNode_nodes, breakTriggerBeam, and for the sounds: gearWhineOutputEvent ('event:>Vehicle>Transmission>straight_01>twine_out_race'), gearWhineInputEvent, forward/reverse Input/Output PitchCoef, gearWhine*Smoothing.
- Main fields: gearIndex (current gear, 0 = neutral), targetGearIndex (gear waiting for the update, nil otherwise), gearRatio, gearRatios (table keyed by gearIndex), minGearIndex, maxGearIndex, maxGearRatio, minGearRatio, gearCount, inputAV (rad/s clutch side), outputAV1 (rad/s, set by the child), outputTorque1 (N·m), lockCoef (0 if locked), virtualMassAV, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken, transmissionNodeID.
- setGearIndex limits the jump: the requested gear is clamped to [gearIndex - 1, gearIndex + 1] (and to [minGearIndex, maxGearIndex]). From neutral (gearIndex = 0) the change is immediate; from an engaged gear, it is deferred to the next updateGFX (targetGearIndex). In neutral, as soon as a gear is entered, powertrain.calculateTreeInertia is called.
- Neutral or broken gearbox (gearRatio == 0 or isBroken): velocityUpdate/torqueUpdate switch to the "neutral" versions (virtual mass, zero output torque).
- Minor bug: calculateInertia computes invCumulativeInertia = 1 / cumulativeInertia without protection against a zero inertia; validate reads device.parent.parent without checking that device.parent is not nil.
- setGearIndex at construction: maxExpectedInputTorque is 0, which sets invMaxExpectedOutputTorque to infinity until validate; no observable effect because the sound is only active afterwards.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_sequentialGearbox.new(jbeamData)` | Builds the sequential gearbox: forward and reverse ratio table, gear whine coefficients, transmission node, then goes to neutral. *(internal)* | 306 |

### Parameter details

#### `powertrain_sequentialGearbox.new(jbeamData)`

Builds the sequential gearbox: forward and reverse ratio table, gear whine coefficients, transmission node, then goes to neutral.

- `jbeamData` (*table*) : jbeam data of the component (gearRatios required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the gear (normal or neutral).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 146 |
| `device:calculateInertia()` | Takes the inertia and cumulative ratios of the first child; cumulativeInertia = inertia / gearRatio² (2 * maxGearRatio in neutral). | 216 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}. | 165 |
| `device:initSounds(jbeamData)` | Creates the gear sound loops (input and output), the smoothers and the pitch coefficients, and sets the FMOD parameter c_gearboxMaxPower. | 247 |
| `device:onBreak()` | Marks the gearbox as broken and switches to neutral mode (virtual mass). | 134 |
| `device:reset(jbeamData)` | Resets the state (speeds, torque, coefficients, locking) and goes back to neutral. | 281 |
| `device:resetSounds()` | Resets the gear sound smoothers and values. | 235 |
| `device:setGearIndex(index)` | Requests a gear. The gear is clamped to ±1 step around the current gear and to [minGearIndex, maxGearIndex]. From neutral, it is applied immediately; otherwise deferred to the next updateGFX. | 112 |
| `device:setLock(enabled)` | Locks (lockCoef = 0) or unlocks (1) the transmission and propagates the call to the parent if it has setLock. | 139 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table); calls onBreak if isBroken. | 150 |
| `device:torqueUpdate(dt)` | Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio * lockCoef, and feeds the sound smoothers. In neutral, integrates the virtual mass and sets the output torque to 0. | 71 |
| `device:updateGFX(dt)` | Per-frame update: applies the pending gear change (targetGearIndex), updates gearRatio, invMaxExpectedOutputTorque and the powertrain inertia. | 95 |
| `device:updateSounds(dt)` | Updates the volume and pitch of the gear sound loops (input and output) from smoothed speeds and torques. Called every frame. | 19 |
| `device:validate()` | Checks that the parent is a clutch (or a fake one), otherwise logs errors and returns false. Determines transmissionNodeID and the expected values (max torque, speed, power) to normalize the sounds. | 174 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef (or virtual mass in neutral), written to the parent. | 66 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/sequentialGearbox.lua`.*

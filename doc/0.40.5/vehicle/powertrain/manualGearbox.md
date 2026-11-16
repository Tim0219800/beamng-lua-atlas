# `powertrain_manualGearbox`

*File: `lua/vehicle/powertrain/manualGearbox.lua` · VM: Vehicle · 670 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `manualGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `manualGearbox`: manual gearbox with fixed ratios. The active gear is chosen by setGearIndex (integer indices: 0 neutral, positive = forward gears, negative = reverse). It simulates synchronizers (wear, gear grinding with "grinding" torque), neutral (virtual mass), friction, locking (setLock) and the gear whine/grinding sounds. Its parent must be a clutch (category `clutch`). A modder or a controller (e.g. manual gearbox controller) calls setGearIndex; the game reads gearIndex, gearRatio, outputAV1.

## Example

```lua
local gb = powertrain.getDevice("gearbox")
gb:setGearIndex(2)            -- 2nd, without synchro simulation
gb:setGearIndex(3, 0.15)      -- 3rd with 0.15 s of synchro time available
print(gb.gearIndex, gb.gearRatio, gb.isGrindingShift)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio, friction (N·m), dynamicFriction (N·m per rad/s), torqueLossCoef (0..1), neutralFriction (= friction), neutralDynamicFriction (= dynamicFriction), gearRatios (list, required: values >= 0 = forward gears starting at index 0 (neutral, value normally 0), values < 0 = reverse gears), gearDamageThreshold (3000, unused), gearWhineCoefs / gearWhineCoefsOutput / gearWhineCoefsInput, synchronizerSettings (table with header gearIndex, maxClutchRPMDifference (default 50), requiredClutchInput (0.8), maxSynchroRPMDifference (infinite), maxSynchroRate (5000), synchroWearCoef (0.000005)), gearboxNode_nodes (first node = transmissionNodeID), breakTriggerBeam, and for the sounds: gearGrindSoundFile, gearGrindEvent, gearWhineOutputEvent, gearWhineInputEvent, forwardInputPitchCoef, forwardOutputPitchCoef, reverseInputPitchCoef (0.7), reverseOutputPitchCoef (0.7), gearWhine*PitchCoefSmoothing (50), gearWhine*VolumeCoefSmoothing (10), gearWhineFixedCoefOutput (0.7), gearWhineFixedCoefInput (0.4).
- Gear indexing: the jbeam list gearRatios separates the values >= 0 (forward, indices 0, 1, 2…) and < 0 (reverse). For n reverse gears, the first negative value in the list takes the index -n, the last one the index -1. gearRatios[0] is neutral (ratio 0 expected).
- Main fields: gearIndex, gearRatio (current ratio, signed, 0 = neutral), gearRatios (table keyed by gearIndex), minGearIndex, maxGearIndex, maxGearRatio, minGearRatio, gearCount, inputAV (rad/s, clutch side), outputAV1 (rad/s, output shaft side, set by the child), outputTorque1 (N·m), inputTorque, lockCoef (0 if locked by setLock), isBroken, isGrindingShift, grindingShiftTargetIndex, grindingTorque, synchroWear (table per gear, 0..1), virtualMassAV, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, transmissionNodeID.
- Neutral or broken gearbox (gearRatio == 0 or isBroken): velocityUpdate/torqueUpdate switch to the "neutral" versions where the input accelerates a virtual mass (virtualMassAV) and outputTorque1 only contains the grinding reaction.
- setGearIndex(index) without availableSyncTime: the shift always succeeds (compatibility). With availableSyncTime: the shift fails (grinding) if the speed difference exceeds the synchro capacity, if the clutch is not depressed enough (requiredClutchInput) or if the available synchro time is too short. A grind activates setGearGrinding and applies a torque (max 50 N·m) until the speed gap drops below 20 rad/s.
- The synchro wear of a gear reaches 1: the ratio is set to 0 (the gear becomes unusable until reset).
- Minor bug: reset calls device:setGearIndex(0), which requires a valid parent; reset sets isShiftGrinding = false but the field actually used is isGrindingShift.
- Minor bug: calculateInertia computes invCumulativeInertia = 1 / cumulativeInertia without protection against a zero inertia (division by zero gives inf if there is no child).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_manualGearbox.new(jbeamData)` | Builds the gearbox: reads gearRatios and builds the forward/reverse index tables, the gear whine coefficients, the synchronizer settings and the transmission node, then goes to neutral via setGearIndex(0). *(internal)* | 486 |

### Parameter details

#### `powertrain_manualGearbox.new(jbeamData)`

Builds the gearbox: reads gearRatios and builds the forward/reverse index tables, the gear whine coefficients, the synchronizer settings and the transmission node, then goes to neutral via setGearIndex(0).

- `jbeamData` (*table*) : jbeam data of the component (gearRatios required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}: a single output port. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 289 |
| `device:calculateInertia()` | Takes the inertia and cumulative ratios of the first child; cumulativeInertia = downstream inertia / gearRatio² (with 2 * maxGearRatio in neutral). | 372 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and the table {damageFrictionCoef, synchroWear, isBroken}. | 316 |
| `device:initSounds(jbeamData)` | Creates the sound objects (grinding, input and output gear whine), the smoothers and the pitch/volume coefficients from the jbeam, and sets the FMOD parameter c_gearboxMaxPower. | 403 |
| `device:onBreak()` | Marks the gearbox as broken and switches to neutral mode (virtualMassAV). Called when the breakTriggerBeam beam breaks or via setPartCondition. | 277 |
| `device:reset(jbeamData)` | Resets the state (speeds, torque, wear, original ratios, synchros, damage) then goes back to neutral. | 446 |
| `device:resetSounds()` | Resets the sound smoothers and values (gear whine). | 391 |
| `device:setGearGrinding(active, targetGearIndex, maxGrindingTorque)` | Enables or stops the grinding state: stores the targeted gear and the max torque, starts or stops the grinding sound loop. | 150 |
| `device:setGearIndex(index, availableSyncTime)` | Engages a gear. The index is clamped to [minGearIndex, maxGearIndex]. Without availableSyncTime, the shift always succeeds; with it, simulates the synchros and can trigger a grind (shift refused: the gear stays the old one). Recomputes the powertrain inertia if the gear is non-zero. 0 = neutral. | 196 |
| `device:setLock(enabled)` | Locks or unlocks the transmission: lockCoef = 0 (locked, no torque or speed transmitted) or 1. Propagates the call to the parent (clutch) if it has setLock. | 282 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer), damage (integrity number 0..1 or table) and synchro wear. Calls onBreak if the table indicates isBroken. | 293 |
| `device:torqueUpdate(dt)` | Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio * lockCoef, and feeds the sound smoothers. In neutral, calls updateGrinding, integrates the virtual mass and returns the grinding reaction. | 71 |
| `device:updateGFX(dt)` | Per-frame update: currently empty (the debug and gear skip code is commented out). | 178 |
| `device:updateGrinding(dt)` | During a grinding shift: computes the grinding torque and its sign, wears the synchro of the targeted gear, engages the gear when the speed gap falls below 20 rad/s, plays the grinding sound and displays "Synchronizer damage" messages. | 99 |
| `device:updateSounds(dt)` | Updates the volume and pitch of the gear whine sound loops (input and output) from the smoothed speeds/torques and the current gear. Called every frame by the powertrain. | 19 |
| `device:validate()` | Checks that the parent is a clutch (or a fake one), logs an error and returns false otherwise. Determines transmissionNodeID and the expected values (max engine torque and speed, power) used to normalize the sounds. | 329 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef (or virtual mass in neutral) and written to the parent. | 66 |

## Calls into the engine (C++)

- `obj:` `playSFX`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/manualGearbox.lua`.*

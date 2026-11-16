# `powertrain_dctGearbox`

*File: `lua/vehicle/powertrain/dctGearbox.lua` · VM: Vehicle · 500 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `dctGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `dctGearbox`: dual-clutch gearbox (DCT). It contains two internal clutches (lane 1 and lane 2) that each receive a preselected gear (setGearIndex1 / setGearIndex2). It is of category `clutchlike` and `gearbox`: the engine takes it directly as a child (the parent must be an engine) and reads its `torqueDiff` value. The clutch ratios come from `electrics.values.clutchRatio1` and `clutchRatio2`, driven by a DCT gearbox controller. Modes: 'neutral', 'park', or other (forward/reverse depending on the gears).

## Example

```lua
local dct = powertrain.getDevice("gearbox")
dct:setGearIndex1(1)   -- lane 1 on 1st gear
dct:setGearIndex2(2)   -- lane 2 preselected on 2nd
-- the controller sets electrics.values.clutchRatio1 / clutchRatio2
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, friction (N·m), dynamicFriction, torqueLossCoef (0..1, read but not used in the calculations of this file), additionalEngineInertia (kg·m², read by the engine), electricsClutchRatio1Name ('clutchRatio1'), electricsClutchRatio2Name ('clutchRatio2'), clutchStiffness (1), lockDampRatio1 / lockDampRatio2 (0.15), lockTorque (N·m, otherwise 1.25 * max engine torque + inertia * max RPM), lockSpring (N·m/rad, otherwise computed), parkLockTorque (1000), parkLockDampRatio (0.4), parkLockSpring, gearRatios (required list, same indexing as manualGearbox), gearWhineCoefs / gearWhineCoefsOutput / gearWhineCoefsInput, gearboxNode_nodes, breakTriggerBeam, and for the sounds: gearWhineOutputEvent, gearWhineInputEvent, forward/reverse Input/Output PitchCoef, gearWhine*Smoothing.
- Gear indexing: identical to manualGearbox. gearRatios[0] is neutral, values >= 0 = forward, values < 0 = reverse (the first negative value in the list takes the lowest index).
- Main fields: inputAV (rad/s, = parent.outputAV1), outputAV1 (rad/s, set by the child), outputTorque1 (N·m), gearRatio1 / gearRatio2 (ratios of the two lanes), gearIndex1 / gearIndex2, clutchAV1 / clutchAV2 (speeds at the output of each clutch, = outputAV1 * gearRatioN * lockCoef), clutchRatio1 / clutchRatio2 (0..1), clutchRatio (max of both), clutchAngle1 / clutchAngle2 (rad), torqueDiff1 / torqueDiff2 (N·m transmitted by each clutch), torqueDiff (sum, seen by the engine as load torque), lockTorque, minGearIndex, maxGearIndex, maxGearRatio, minGearRatio, cumulativeInertia1/2, cumulativeGearRatio (ratio of the most engaged lane), mode, lockCoef.
- If the input speed is below half of the engine idle speed (inputAV < idleAV * 0.5), both clutches are forced open (anti-stall).
- Inconsistencies: the device has no useful gearIndex or gearRatio fields (gearRatio is always 0), whereas updateSounds reads them: the gear whine coefficients then use gearWhineCoefs[nil] = 0 and gearRatio >= 0 is always true ("forward" pitch). setPartCondition does not handle isBroken (no onBreak on this device).
- calculateInertia reads device.clutchRatio1/2 (values from the last frame) to choose cumulativeGearRatio; there is no guard against a zero parent inertia.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_dctGearbox.new(jbeamData)` | Builds the DCT gearbox: gear table (forward/reverse), parameters of the two clutches and of the parking lock, gear whine coefficients, then preselects gears 1 and 2. *(internal)* | 351 |

### Parameter details

#### `powertrain_dctGearbox.new(jbeamData)`

Builds the DCT gearbox: gear table (forward/reverse), parameters of the two clutches and of the parking lock, gear whine coefficients, then preselects gears 1 and 2.

- `jbeamData` (*table*) : jbeam data of the component (gearRatios required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, gearbox=true}: the engine recognizes it as a clutch. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the mode (normal, neutral, park).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Reduces the lock torque coefficient (damageLockTorqueCoef, minimum 0.2) according to the damage. | 145 |
| `device:calculateInertia()` | Computes the cumulative inertias of each lane (capped at half of the engine inertia), the springs and dampings of the two clutches, the maximum clutch angle, the parking lock and the cumulative ratios. | 233 |
| `device:getPartCondition()` | Returns the integrity 0..1 (according to damageLockTorqueCoef) and the table {damageLockTorqueCoef}. | 162 |
| `device:initSounds(jbeamData)` | Creates the gear sound loops (input and output), the smoothers and the pitch coefficients from the jbeam, and sets the FMOD parameter c_gearboxMaxPower. | 281 |
| `device:reset(jbeamData)` | Resets the state of the two clutches, the torques and the wear/damage coefficients, then preselects gears 1 and 2. | 315 |
| `device:resetSounds()` | Resets the gear sound smoothers and values. | 269 |
| `device:setGearIndex1(index)` | Preselects the gear of lane 1 (index clamped to [minGearIndex, maxGearIndex]) and recomputes the powertrain inertia. | 211 |
| `device:setGearIndex2(index)` | Preselects the gear of lane 2 (index clamped) and recomputes the powertrain inertia. | 220 |
| `device:setLock(enabled)` | Locks (lockCoef = 0) or unlocks (1) the transmission. | 229 |
| `device:setMode(mode)` | Changes the mode ('neutral', 'park' or other) without validation, and selects the corresponding update functions. 'park' resets parkEngaged to 0. | 206 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (lock torque from 1 to 0.7 between 30000 km and 500000 km) and damage (integrity number 0..1 or table {damageLockTorqueCoef}). | 149 |
| `device:torqueUpdate(dt)` | Called at each physics step: computes the two clutch torques (spring on the clutch angle + damping, clamped by lockTorque), torqueDiff = sum and outputTorque1 = sum of the torques * ratios. In neutral: everything at 0. In park: parking lock torque. | 111 |
| `device:updateSounds(dt)` | Updates the volume and pitch of the gear sound loops (input and output) from smoothed speeds and torques. Called every frame. | 19 |
| `device:validate()` | Checks that the parent is an engine (otherwise logs an error and returns false). Computes the default lockTorque, and the expected values (torque, speed, power) to normalize the sounds. | 172 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = parent.outputAV1; clutchAV1/2 = outputAV1 * gearRatio1/2 * lockCoef. Does not write a speed into the parent: the engine reads torqueDiff directly. | 105 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/dctGearbox.lua`.*

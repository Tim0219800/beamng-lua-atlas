# `powertrain_automaticGearbox`

*File: `lua/vehicle/powertrain/automaticGearbox.lua` · VM: Vehicle · 514 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `automaticGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain device type `automaticGearbox`: simplified planetary/hydraulic automatic gearbox. It has indexed gears (gearIndex), drive / neutral / park modes, a progressive interpolation of the ratio during shifts (simulates the opening/closing of internal clutches), friction, a loss on upshifts, a parking lock, an anti-rollback viscous damper and gear whine sounds. The parent must be a viscous coupling device (category viscouscoupling, in practice a torque converter). Gear selection is driven by a controller (gearbox controller), not by this module.

## Example

```lua
local gb = powertrain.getDevice('transmission')
gb:setGearIndex(2, 0.3)   -- 2nd gear, shift lasting at least 0.3 s
powertrain.setDeviceMode('transmission', 'neutral')
```

## Notes

- JBEAM KEYS: gearRatios (list; values >= 0 become the forward ratios of index 0, 1, 2… in order, negative ones the reverse gears), gearRatio (initial, default 1), friction (0), dynamicFriction (0), torqueLossCoef (0..1), shiftEfficiency (0.5: fraction of the torque transmitted during a shift), gearChangeTime (0.5 s, minimum interpolation duration), parkLockTorque (1000 N·m), parkLockSpring, parkLockDampRatio (0.4), oneWayViscousCoef (5), oneWayViscousTorque (coef x 25), oneWayViscousSmoothing (50), gearboxNode_nodes (gearbox node for the sounds), breakTriggerBeam, gearWhineCoefs / gearWhineCoefsInput / gearWhineCoefsOutput, gearWhineFixedCoefInput (0.4) / Output (0.7), gearWhineInputEvent / gearWhineOutputEvent, forward/reverse Input/OutputPitchCoef (1 / 0.7), gearWhine*Smoothing.
- INDEXING: gearIndex 0 = neutral (ratio 0 or first element), 1..N forward, -1..-M reverse, bounded by minGearIndex / maxGearIndex. Careful: for the reverse gears the loop in new() maps gearRatios[-k] in a particular order (with 2 reverse gears, [-2] receives the 1st negative value of the jbeam list and [-1] the 2nd), to be checked before relying on it.
- FIELDS: gearRatio (current interpolated ratio), desiredGearRatio, gearIndex, mode, isShifting / isShiftingUp / isShiftingDown, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), virtualMassAV (speed of the virtual mass in neutral/park), lockCoef (1 normal, 0 locked by setLock), shiftLossCoef, parkClutchAngle / parkEngaged, wear/damage coefs, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, transmissionNodeID.
- Physics: in drive, inputAV = outputAV1 x gearRatio x lockCoef and outputTorque = ((input torque x shiftLossCoef - friction) x gearRatio - anti-rollback torque) x lockCoef. In neutral/park, a virtual mass takes its place (the gearbox disconnects from the output) and park locks the output with a spring when the vehicle is almost stopped (|outputAV1| < 100 rad/s).
- Inconsistencies spotted: the device has no onBreak method; powertrain.breakDevice (breakTriggerBeam beam broken) and setPartCondition with isBroken call device:onBreak(), which would crash. Moreover, powertrain.setDeviceMode / toggleDeviceMode use device.availableModes (not defined here): mode changes go through setMode called by the gearbox controller.
- Device category: gearbox (the engine does not accept it as a direct child: a viscous coupling or a clutch is needed between the two).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_automaticGearbox.new(jbeamData)` | Device factory called by powertrain.init for the type 'automaticGearbox'. Builds the ratio, sound, parking lock and anti-rollback tables, then selects gear 0. *(internal)* | 366 |

### Parameter details

#### `powertrain_automaticGearbox.new(jbeamData)`

Device factory called by powertrain.init for the type 'automaticGearbox'. Builds the ratio, sound, parking lock and anti-rollback tables, then selects gear 0.

- `jbeamData` (*table*) : jbeam data; gearRatios is mandatory.
- **returns**: table The automaticGearbox device.

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox = true}. |
| `outputPorts` | table<integer, boolean> | {[1] = true}. |
| `requiredExternalInertiaOutputs` | integer[] | {1}: powertrain adds a dummy shaft on this port if nothing is connected to it. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Applies deformation damage: increases friction, reduces the shift speed (floor 0.2). | 161 |
| `device:calculateInertia()` | Computes the cumulative inertia referred to the input (child inertia / ratio²), the parking lock parameters and the cumulative ratios. | 257 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and the state table {damageFrictionCoef, damageGearRatioChangeRateCoef, isBroken}. | 188 |
| `device:initSounds(jbeamData)` | Creates the whine sound loops (input/output) and their smoothers from the gearWhine* jbeam keys. | 292 |
| `device:reset(jbeamData)` | Resets everything to the initial state (speeds, 'drive' mode, wear, damage, parking) and selects gear 0. | 328 |
| `device:resetSounds()` | Resets the gear noise smoothers and values. | 280 |
| `device:setGearIndex(index, gearChangeTime)` | Selects a gear by its index (bounded to [minGearIndex, maxGearIndex]). The real ratio is then interpolated in updateGFX; during the shift the torque is reduced by shiftEfficiency. | 241 |
| `device:setLock(enabled)` | Enables (true) or disables the lock: lockCoef = 0 disconnects the input and leaves only the parking lock, 1 normal operation; resets parkClutchAngle to 0. | 252 |
| `device:setMode(mode)` | Changes the mode ('drive', 'neutral' or 'park') and selects the corresponding update functions. | 236 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear and integrity (number or table): friction and shift speed coefficients; calls onBreak if isBroken (nonexistent method, see notes). | 166 |
| `device:torqueUpdate(dt)` | Physics step (torques). Computes outputTorque1 according to the mode, the friction, the parking lock and the anti-rollback, and feeds the gear noise smoothers. | 79 |
| `device:updateGFX(dt)` | Once per frame: advances gearRatio toward desiredGearRatio at the speed gearRatioChangeRate (influenced by wear/damage), recomputes the inertia when the ratio is reached, updates isShifting*, and engages park if mode is 'park' and speed is low. | 115 |
| `device:updateSounds(dt)` | Called by powertrain.updateGFX: updates volume and pitch of the input and output gear whine loops. | 19 |
| `device:validate()` | Checks that the parent is a viscous coupling (viscouscoupling); computes the expected torques/speeds (from the grandparent engine if present, otherwise 100 N·m and 6000 RPM) to normalize the sounds. | 204 |
| `device:velocityUpdate(dt)` | Physics step (velocities). Function selected according to the mode: updateVelocity (drive), neutralUpdateVelocity or parkUpdateVelocity (virtual mass). Writes the input speed into the parent. | 74 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/automaticGearbox.lua`.*

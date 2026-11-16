# `powertrain_centrifugalClutch`

*File: `lua/vehicle/powertrain/centrifugalClutch.lua` · VM: Vehicle · 306 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `centrifugalClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain device type `centrifugalClutch`: centrifugal clutch (categories clutchlike and clutch) placed directly after a combustion engine. It engages automatically with the input RPM (between engageRPMStart and engageRPMEnd): the engagement ratio clutchRatio goes from 0 to 1, and the transmitted torque follows a spring/damper on the clutch angle, limited by lockTorque. It also models heating (temperature, thermal efficiency, smoke, permanent damage) and wear. Useful for scooters, karts, lawn mowers... The parent must be an engine (category engine) and it has a single child on port 1.

## Example

```lua
// jbeam (powertrain section): {"name":"clutch","type":"centrifugalClutch","inputName":"mainEngine","inputIndex":1, "engageRPMStart":1500, "engageRPMEnd":2500}
```

## Notes

- JBEAM KEYS: engageRPMStart (default 800), engageRPMEnd (1100), lockTorque (default computed in validate: max engine torque x 1.25 + maxRPM x engine inertia x pi/30), lockSpring (otherwise derived from powertrain.stabilityCoef), lockSpringCoef (1), lockDampRatio (0.15, 1 = critical damping), lockDampSmoothing (0), clutchAngleSmoothing (0), clutchStiffness (1), clutchFreePlay (0.125 rad), additionalEngineInertia (0, added to the engine inertia), thermalsEnabled (default true), coolingCoef (0.8), maxClutchTemp (300, °C, permanent damage beyond), warningTemp (100 °C), maxSafeClutchTemp (150 °C), clutchOverheatRange (100 °C), clutchMass (1 kg), clutchSpecificHeat (490), electricsClutchRatioName (read but never used in this file).
- FIELDS: inputAV (rad/s, = outputAV1 of the parent), outputAV1 (rad/s to the child), outputTorque1 and torqueDiff (transmitted torque, N·m; the engine reads torqueDiff as load), clutchRatio (0..1), clutchAngle, lockSpring, lockDamp, maxClutchAngle, lockTorque, clutchTemperature (°C), thermalEfficiency (0.5..1, 0.25 if damaged), clutchPermanentlyDamaged, frictionLossPerUpdate (dissipated energy), damage*/wear* Coef. The device ratio is fixed (gearRatio = 1).
- Operation: the torque is clamp(min(1,|free angle|) x |free angle| x sign x lockSpring + damping x clutchRatio, ± lockTorque x thermalEfficiency x damage x wear) (quadratic spring, then linear after 1 rad); the dissipation torqueDiff x ΔAV x dt heats the clutch, which cools toward the outside temperature.
- Temperature UI messages: « High clutch temperature... », « Clutch overheating... », « Clutch permanently damaged! » (every 0.9 s). UI stream 'clutchThermalData' sent if requested. Clutch smoke via obj:addParticleByNodesRelative on the child's transmissionNodeID.
- Inconsistencies found: the device has no onBreak method; if a breakTriggerBeam beam is defined or if setPartCondition receives isBroken, powertrain would call device:onBreak() (nil). validate logs under the tag 'frictionClutch.validate' (copied from another file). updateGFX assumes device.children[1] exists (crashes without a child).
- No setMode method: powertrain.setDeviceMode does not apply to it (device.availableModes absent).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_centrifugalClutch.new(jbeamData)` | Device factory called by powertrain.init for a jbeam entry of type 'centrifugalClutch'. Reads the jbeam keys (see notes) and returns the device. *(internal)* | 232 |

### Parameter details

#### `powertrain_centrifugalClutch.new(jbeamData)`

Device factory called by powertrain.init for a jbeam entry of type 'centrifugalClutch'. Reads the jbeam keys (see notes) and returns the device.

- `jbeamData` (*table*) : jbeam data of the device.
- **returns**: table The centrifugalClutch device.

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike = true, clutch = true}. clutchlike is required by the combustionEngine engine for its children. |
| `outputPorts` | table<integer, boolean> | {[1] = true}: a single output port. |
| `requiredExternalInertiaOutputs` | integer[] | {1}: powertrain adds a dummy shaft on this port if no child is connected to it. |

## Class `device`

Object returned by new(jbeamData). Methods called by powertrain.lua.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Applies deformation damage: increases the free play and reduces the lock torque (floor 0.2), then recomputes the inertia. | 123 |
| `device:calculateInertia()` | Takes over the child's inertia and ratios (inertia capped at half of the engine's) and recomputes lockSpring, lockDamp and maxClutchAngle. | 178 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if permanently damaged) and the state table {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}. | 149 |
| `device:reset(jbeamData)` | Resets all states to their initial values (speeds, angle, outside temperature, wear and damage) then selects the update functions. | 202 |
| `device:setLock(enabled)` | Locks/unlocks the clutch heating: enabled = true sets clutchThermalsCoef to 0 (dissipated energy is no longer counted as heat), false sets it to 1. | 119 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer) and integrity (number or state table): free play and lock torque coefficients, permanent damage state; recomputes the inertia. | 129 |
| `device:torqueUpdate(dt)` | Physics step (torques): computes clutchRatio from the input RPM, the clutch angle and the transmitted torque (torqueDiff = outputTorque1), and accumulates the friction loss. | 84 |
| `device:updateGFX(dt)` | Once per frame: computes the energy dissipated in the clutch and its cooling, updates clutchTemperature (clamped to [outside temperature, maxClutchTemp]) and thermalEfficiency, produces smoke and warning messages, signals permanent damage, resets frictionLossPerUpdate to 0 and publishes 'clutchThermalData'. | 20 |
| `device:validate()` | Checks that the parent is an engine (category engine), otherwise logs an error and returns false (aborts init). Computes the default lockTorque. | 166 |
| `device:velocityUpdate(dt)` | Physics step (speeds): inputAV = output speed of the parent (outputAV1 of the engine). | 80 |

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/centrifugalClutch.lua`.*

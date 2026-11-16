# `powertrain_frictionClutch`

*File: `lua/vehicle/powertrain/frictionClutch.lua` · VM: Vehicle · 306 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `frictionClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `frictionClutch`: friction clutch placed right after an engine (the parent must be of category `engine`). It models a locking spring on a clutch angle, damping, free play, wear/damage and a thermal model (temperature, efficiency, smoke, messages to the player, permanent damage). The clutch ratio comes from `electrics.values.clutchRatio` (1 = engaged, 0 = disengaged). A modder sets its parameters in the jbeam or reads its temperature.

## Example

```lua
local clutch = powertrain.getDevice("clutch")
print(clutch.clutchTemperature, clutch.thermalEfficiency) -- °C, 0.5..1 (0.25 if destroyed)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, additionalEngineInertia (kg·m², default 0), electricsClutchRatioName (default 'clutchRatio'), lockDampRatio (default 0.15, 1 = critical damping), lockDampSmoothing (0), clutchAngleSmoothing (0), clutchStiffness (1), clutchFreePlay (rad, 0.125), lockSpringCoef (1), lockTorque (N·m, otherwise computed in validate), lockSpring (N·m/rad, otherwise computed), thermalsEnabled (true), coolingCoef (1), maxClutchTemp (°C, 500, permanent damage), warningTemp (200), maxSafeClutchTemp (300), clutchOverheatRange (100), clutchMass (kg, 10), clutchSpecificHeat (J/kg/K, 490).
- Main fields: inputAV (rad/s, = parent.outputAV1), outputAV1 (rad/s, set by the child/the powertrain), outputTorque1 (N·m, transmitted torque = torqueDiff), torqueDiff, clutchAngle (rad), clutchRatio, lockTorque (N·m max transmissible), lockSpring, lockDamp, maxClutchAngle, thermalEfficiency (0.5 to 1, 0.25 if clutchPermanentlyDamaged), clutchTemperature (°C), clutchPermanentlyDamaged, cumulativeInertia, cumulativeGearRatio (gearRatio fixed at 1).
- The transmitted torque is limited to ± lockTorque * thermalEfficiency * damageLockTorqueCoef * wearLockTorqueCoef. The spring is quadratic up to 1 rad then linear.
- The injected heat is frictionLossPerUpdate = sum of torqueDiff * (inputAV - outputAV1) * dt (joules); it is reset to 0 in updateGFX. setLock(true) cuts this input (clutchThermalsCoef = 0).
- updateGFX sends the GUI stream 'clutchThermalData' if the stream is requested, shows messages 'High clutch temperature...', 'Clutch overheating...', 'Clutch permanently damaged!' and triggers damageTracker.setDamage('powertrain', name, true).
- Minor bug: if child 1 does not exist, updateGFX indexes device.children[1].transmissionNodeID without checking when the smoke timer reaches 1 (potential error if device.children is empty).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_frictionClutch.new(jbeamData)` | Builds the frictionClutch device: wear/damage coefficients, smoothings, thermal parameters (warning, safe and destruction temperatures, mass and specific heat) and selects velocityUpdate/torqueUpdate. *(internal)* | 232 |

### Parameter details

#### `powertrain_frictionClutch.new(jbeamData)`

Builds the frictionClutch device: wear/damage coefficients, smoothings, thermal parameters (warning, safe and destruction temperatures, mass and specific heat) and selects velocityUpdate/torqueUpdate.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}: a single output port. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}: port 1 receives its inertia from outside (the powertrain handles the inertia on the output side). |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the free play (damageClutchFreePlayCoef) and reduces the lock torque (min 0.2) according to the damage, then recomputes the inertia. | 123 |
| `device:calculateInertia()` | Takes the inertia and cumulative ratios of the first child, caps the inertia at half of the engine's, and computes lockSpring, lockDamp and maxClutchAngle. | 178 |
| `device:getPartCondition()` | Returns the integrity 0..1 (minimum of free play and lock torque, 0 if destroyed) and the corresponding state table. | 149 |
| `device:reset(jbeamData)` | Resets speeds, torque, angle, smoothers, temperature (to the environment's), wear/damage coefficients and permanent damage state. | 202 |
| `device:setLock(enabled)` | Enables or not the thermal "lock": if enabled is true, the clutch no longer heats up (clutchThermalsCoef = 0), otherwise it heats normally. | 119 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (according to the odometer) and damage (according to the integrity: number 0..1 or table) then recomputes the inertia. Also restores clutchPermanentlyDamaged. | 129 |
| `device:torqueUpdate(dt)` | Called at each physics step: integrates the clutch angle according to the speed difference, applies free play and spring/damping, clamps by lockTorque, writes outputTorque1 and accumulates the friction loss. | 83 |
| `device:updateGFX(dt)` | Non-physics update (once per frame): clutch heating and cooling, thermal efficiency, smoke, warning messages, permanent damage, sending of the GUI stream 'clutchThermalData'. Resets frictionLossPerUpdate to 0. | 19 |
| `device:validate()` | Checks that the parent is an engine (deviceCategories.engine), otherwise logs errors and returns false. Computes the default lockTorque = 1.25 * max engine torque + engine inertia * max speed (rad/s). | 166 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = parent.outputAV1. | 79 |

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `getEnvTemperature`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/frictionClutch.lua`.*

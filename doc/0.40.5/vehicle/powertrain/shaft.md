# `powertrain_shaft`

*File: `lua/vehicle/powertrain/shaft.lua` · VM: Vehicle · 373 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `shaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `shaft`: a drive shaft with a fixed reduction ratio, friction losses and cumulative inertia. It can also be linked directly to a wheel (jbeam key `connectedWheel`), in which case it applies the propulsion torque and the friction torque to the wheel. It can be disconnected (mode `disconnected`) or broken; it then accelerates a virtual mass instead of the downstream drivetrain. A modder uses it via the `powertrain` jbeam; the module only exposes `new`.

## Example

```lua
-- jbeam: ["wheelShaftFL", "shaft", "differential_F", 1, {"connectedWheel":"FL", "friction":0.5}]
local d = powertrain.getDevice("wheelShaftFL")
d:setMode("disconnected") -- only if canDisconnect=true in the jbeam
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (default 1), friction (N·m, default 0), dynamicFriction (N·m per rad/s, default 0), torqueLossCoef (fraction of the input torque lost, default 0), electricsName, visualShaftAVName, node, connectedWheel (wheel name from powertrain.wheels), outputPortOverride (list of output port indices), canDisconnect, isDisconnected, breakTriggerBeam (empty string = cancels the beam).
- Main fields of the device: inputAV (rad/s, parent side speed = output * gearRatio), outputAV1 (rad/s, or outputAV<N> if outputPortOverride; child or wheel side speed), outputTorque1 (N·m, same), gearRatio, friction, dynamicFriction, torqueLossCoef, cumulativeInertia (kg·m² reflected to the input side), invCumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, virtualInertia (default 2 kg·m², used if nothing is connected), virtualMassAV (rad/s), isBroken, mode, availableModes, defaultMode, wearFrictionCoef, damageFrictionCoef.
- The names outputAV1/outputTorque1 are actually computed: device.outputAVName / device.outputTorqueName are 'outputAV'..N and 'outputTorque'..N with N = last index of outputPortOverride (1 by default). Same for parentOutputAVName / parentOutputTorqueName, set by the powertrain.
- velocityUpdate and torqueUpdate are reassigned by selectUpdates depending on the state: normal, linked to a wheel, disconnected/broken, or disconnected wheel. Do not call them assuming a fixed version.
- Disconnected or broken: outputTorque is set to 0 and a virtual torque accelerates virtualMassAV with invCumulativeInertia; for a wheel, propulsionTorque is 0 and frictionTorque is friction.
- Connected mode with wheel: the reaction torque is accumulated in powertrain.torqueReactionCoefs[wheel.torsionReactorIdx] as an absolute value.
- isPhysicallyDisconnected is true by default in new; it is set back to the real value by the powertrain. As long as it is true, validate forces the 'disconnected' mode and setMode refuses any other mode.
- Wear: wearFrictionCoef = linearScale(odometer, 3e7, 1e9, 1, 1.5). Damage: damageFrictionCoef goes from 1 to 50 when the integrity drops from 1 to 0.
- The exported fields M.outputPorts = {[1]=true} and M.deviceCategories = {shaft=true} are copied into each device. new also reads M.requiredExternalInertiaOutputs, which is never defined in this file (shallowcopy of nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_shaft.new(jbeamData)` | Builds a shaft device from a jbeam entry. Reads gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect and breakTriggerBeam, chooses the output field names and selects the update functions. *(internal)* | 277 |

### Parameter details

#### `powertrain_shaft.new(jbeamData)`

Builds a shaft device from a jbeam entry. Reads gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect and breakTriggerBeam, chooses the output field names and selects the update functions.

- `jbeamData` (*table*) : jbeam data of the component (name, type, gearRatio, friction, connectedWheel…).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | Categories of the component: {shaft=true}. Used by searches such as 'walk up to the parent differential'. |
| `outputPorts` | table<integer, boolean> | Default output ports: {[1]=true}. Copied into each device (replaced if outputPortOverride). |

## Class `device`

Object returned by new(jbeamData). The methods are set on the instance; velocityUpdate/torqueUpdate are assigned dynamically.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases damageFrictionCoef proportionally to the damage received (0.01 of damage = +0.1). | 88 |
| `device:calculateInertia()` | Computes cumulativeInertia, invCumulativeInertia, cumulativeGearRatio and maxCumulativeGearRatio. Takes the inertia of the first child, or the inertia of the wheel nodes around the axis (sum of mass * distance²), or virtualInertia. Divided by gearRatio². Called by the powertrain during init. | 219 |
| `device:getPartCondition()` | Returns the state of the part for saving: integrity 0..1 (0 if broken) and table {damageFrictionCoef, isBroken}. | 107 |
| `device:getState()` | Defined only if the shaft has several modes. Returns the stateData table containing the key '<name>Mode' = current mode. | 197 |
| `device:onBreak()` | Marks the shaft as broken (isBroken = true) and switches to the disconnected update functions. Called by the broken beams system / setPartCondition. | 213 |
| `device:reset(jbeamData)` | Resets the dynamic state (inputAV, virtualMassAV, wear coefficients, isBroken, outputs to 0) and rereads gearRatio and friction from jbeamData. Called on vehicle reset. | 253 |
| `device:setMode(mode)` | Changes the mode ('connected' or 'disconnected') if it is in availableModes. Ignored otherwise. A physically disconnected shaft stays 'disconnected'. Reselects the update functions and updates the UI button. | 178 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies the wear/damage state of a part: wearFrictionCoef according to the odometer, damageFrictionCoef according to the integrity. If the integrity is a table with isBroken, calls onBreak. | 92 |
| `device:setState(data)` | Defined only if the shaft has several modes. Restores the mode from data['<name>Mode'] if it is a string different from the current mode. | 202 |
| `device:torqueUpdate(dt)` | Called at each physics step, from upstream to downstream. Computes the output torque = (parent torque - friction losses) * gearRatio; for a wheel, writes propulsionTorque and frictionTorque. Disconnected version: accelerates the virtual mass and sets outputTorque to 0. | 58 |
| `device:updateSimpleControlButtons()` | If the shaft has several modes and uiSimpleModeControl, updates the simple UI button (extensions.ui_simplePowertrainControl.setButton) that calls powertrain.toggleDeviceMode(name). | 157 |
| `device:validate()` | Called by the powertrain after construction. Forces disconnected mode if isPhysicallyDisconnected. For a shaft with no child or wheel, takes the default virtualInertia of the ancestor differential. For a wheel shaft, finds the ancestor torsionReactor and declares its reaction nodes to the wheel (setEngineAxisCoupleNodes). | 116 |
| `device:velocityUpdate(dt)` | Called at each physics step, from downstream to upstream. Computes inputAV = outputAV * gearRatio and writes it into the parent's speed field. Wheel version: reads wheel.angularVelocity * wheelDirection. Disconnected version: uses virtualMassAV instead. | 52 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/shaft.lua`.*

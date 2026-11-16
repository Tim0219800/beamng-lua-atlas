# `powertrain_splitShaft`

*File: `lua/vehicle/powertrain/splitShaft.lua` · VM: Vehicle · 319 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `splitShaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `splitShaft`: two-output splitter, typically a 4x4 transfer case or an axle coupler. One output is "primary" (receives all the input torque) and the other "secondary" (receives a coupling torque). Coupling types (`splitType`): `viscous` (torque proportional to the speed difference, with exponent) or `locked` (quadratic spring coupling, bounded by lockTorque). Can be disconnected (`disconnected` mode: the secondary output receives nothing). Categories `shaft` and `differential`.

## Example

```lua
local tc = powertrain.getDevice("transfercase")
tc:setMode("disconnected") -- only if canDisconnect=true in the jbeam (2-wheel drive)
tc.clutchRatio = 0.5       -- weakens the coupling in locked mode
```

## Notes

- jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction, torqueLossCoef (0..1), defaultVirtualInertia, splitType ('viscous' by default or 'locked'), primaryOutputID (1 or 2, default 1), canDisconnect, isDisconnected, lockTorque (N·m, 500), defaultClutchRatio (1), lockDampRatio (0.15), clutchStiffness (1), lockSpringCoef (1), lockSpring (N·m/rad, otherwise computed), viscousCoef (10), viscousTorque (= viscousCoef * 10), viscousExponent (1), viscousSmoothing (25), breakTriggerBeam.
- Main fields: inputAV (rad/s on the parent side = outputAV(primary) * gearRatio), outputAV1 / outputAV2 (rad/s, set by the children), outputTorque1 / outputTorque2 (N·m), primaryOutputID and secondaryOutputID, splitType, mode ('connected' or 'disconnected'), availableModes, clutchRatio (0..1, modulates the coupling in locked mode), shaftAngle (rad), lockTorque, lockSpring, lockDamp, maxShaftAngle, viscousCoef, viscousTorque, viscousExponent, cumulativeInertia, cumulativeGearRatio, isBroken.
- The torque sent to the secondary is bounded to ± lockTorque (locked) or ± viscousTorque (viscous), multiplied by the wear/damage coefficients. The primary receives (input torque - losses) * gearRatio - secondary torque. Disconnected or broken: the secondary receives 0 and the primary all the torque.
- Pitfall: the cumulative inertia only accounts for the primary output; the inertia of the secondary output is only used to calibrate the spring and damping of the locked coupling. A setMode to 'connected' is ignored as long as isPhysicallyDisconnected is true (default state before validation by the powertrain).
- Bugs: getPartCondition computes lockTorqueIntegrityValue and viscousTorqueIntegrityValue from damageFrictionCoef and not from damageLockTorqueCoef / damageViscousTorqueCoef (copy-paste), so the integrity does not have the expected effect; onBreak sets virtualMassAV = outputAV1 but virtualMassAV is never used in this file; calculateInertia assumes lockSpring > 0 (division) when the secondary has no inertia; getState/setState only exist if several modes are available.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_splitShaft.new(jbeamData)` | Builds the splitter: primary and secondary outputs, coupling type (viscous or locked), available modes and coupling parameters. *(internal)* | 223 |

### Parameter details

#### `powertrain_splitShaft.new(jbeamData)`

Builds the splitter: primary and secondary outputs, coupling type (viscous or locked), available modes and coupling parameters.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true, differential=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true, [2]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1, 2}: both outputs receive their inertia from their children. |

## Class `device`

Object returned by new(jbeamData). torqueUpdate depends on splitType and mode.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the friction, lock torque and viscous torque damage coefficients according to the damage. | 60 |
| `device:calculateInertia()` | Takes the cumulative inertia and ratios of the primary output; computes lockSpring, lockDamp and maxShaftAngle from the inertia of the secondary output. | 156 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and the damage state table (see bug in notes). | 89 |
| `device:getState()` | Defined only if there are several modes. Returns stateData with the key '<name>Mode' = current mode. | 124 |
| `device:onBreak()` | Sets isBroken = true and switches to the disconnected torque functions (secondary without torque). | 149 |
| `device:reset(jbeamData)` | Resets speeds, torques, shaft angle, viscous smoother, wear/damage coefficients and mode; rereads gearRatio, friction, viscousCoef and defaultClutchRatio. | 183 |
| `device:setMode(mode)` | Changes the mode ('connected' or 'disconnected', must be in availableModes). A physically disconnected device stays 'disconnected'. Reselects torqueUpdate. | 106 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (based on the odometer) and damage (integrity number 0..1 or table) to the friction, lock and viscosity coefficients; calls onBreak if isBroken. | 66 |
| `device:setState(data)` | Defined only if there are several modes. Restores the mode from data['<name>Mode']. | 129 |
| `device:torqueUpdate()` | Called at each physics step: computes the secondary torque (viscous: coef * \|ΔAV\|^exponent, or locked: quadratic spring on the shaft angle + damping) and the primary torque. Disconnected: secondary at 0. | 42 |
| `device:validate()` | Called after the powertrain is built: forces the 'disconnected' mode if isPhysicallyDisconnected; returns true. | 140 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = speed of the primary output * gearRatio, written to the parent. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/splitShaft.lua`.*

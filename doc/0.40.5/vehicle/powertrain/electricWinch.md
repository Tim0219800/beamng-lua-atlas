# `powertrain_electricWinch`

*File: `lua/vehicle/powertrain/electricWinch.lua` · VM: Vehicle · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `electricWinch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `electricWinch`: very basic electric winch, of category `winch` and `torqueConsumer`, without an output port. Its code is a prototype: at each physics step it pulls on the beam tagged `ropeTest` with a fixed force of 500000 N multiplied by the ignition level, with no jbeam tuning parameter. A modder does not use it in practice; see hydraulicWinch (empty) and linearActuator for real actuators.

## Notes

- No winch-specific jbeam key is read, apart from name, type, inputName, inputIndex, gearRatio (1), friction and dynamicFriction.
- The behavior is hardcoded: torqueUpdate calls obj:actuateBeam(beamstate.tagBeamMap.ropeTest[1], force, 10, 0, 0, 10, 0, 100, 0, 0) with force = -electrics.values.ignitionLevel * 500000. If no beam is tagged 'ropeTest', beamstate.tagBeamMap.ropeTest is nil and a Lua error occurs.
- outputTorque1 is always 0. inputAV = outputAV1 * gearRatio; the value is written into the parent's speed field (device.parent[parentOutputAVName]).
- Inconsistencies: calculateInertia reads device.maxGearRatio, which is never defined (maxCumulativeGearRatio becomes nil) and the division by gearRatio² with an output inertia of 0 gives 0; new defines neither onBreak nor validate, whereas setPartCondition calls device:onBreak() if isBroken. M.requiredExternalInertiaOutputs is not defined in this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_electricWinch.new(jbeamData)` | Builds the winch device with the standard fields (gearRatio, friction, wear/damage coefficients, inertia) and the update functions. It does not call selectUpdates: velocityUpdate and torqueUpdate are set directly. *(internal)* | 77 |

### Parameter details

#### `powertrain_electricWinch.new(jbeamData)`

Builds the winch device with the standard fields (gearRatio, friction, wear/damage coefficients, inertia) and the update functions. It does not call selectUpdates: velocityUpdate and torqueUpdate are set directly.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {winch=true, torqueConsumer=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 24 |
| `device:calculateInertia()` | Sets cumulativeInertia = 0 (zero output inertia) and the cumulative ratios (maxCumulativeGearRatio stays nil, see notes). | 52 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and the table {damageFrictionCoef, isBroken}. | 43 |
| `device:reset(jbeamData)` | Resets speeds, torque, cumulative inertia, wear/damage coefficients and isBroken; rereads friction. | 61 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear and damage according to the odometer and the integrity; calls onBreak if the state indicates isBroken, but this device does not define onBreak. | 28 |
| `device:torqueUpdate()` | Called at each physics step: sets outputTorque1 to 0 and actuates the first beam tagged 'ropeTest' with a force of -ignitionLevel * 500000 N, speed limit 10 and stroke 0 to 100. | 15 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio, written to the parent. | 10 |

## Calls into the engine (C++)

- `obj:` `actuateBeam`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/electricWinch.lua`.*

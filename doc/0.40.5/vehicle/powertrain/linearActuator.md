# `powertrain_linearActuator`

*File: `lua/vehicle/powertrain/linearActuator.lua` · VM: Vehicle · 211 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `linearActuator` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `linearActuator`: screw jack (mechanical linear actuator) driven by a shaft. It converts the input torque into axial force on beams (obj:screwBeam) identified by the `beamTags` tags and measures the extension speed, which it returns to its parent as a rotation speed (speed / screw lead). Category `torqueConsumer`, without an output port. Useful for dump bed, platform or electric cylinder. It tracks the extension (`currentExtend`, `currentExtendPercent`).

## Example

```lua
local act = powertrain.getDevice("tailgateActuator")
print(act.currentExtend, act.currentExtendPercent, act.velocity) -- m, 0..1, m/s
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction, electricsName, virtualInertia (kg·m², 2), minExtend (m, 1), maxExtend (m, 2), frictionForce (N, 1), speedLimit (m/s, 100), movementIntentElectricsName, node, screwDiameter (m, 0.05), leadMillimeterPerRevolution (mm per revolution, REQUIRED), beamTags (list of beam tags), breakTriggerBeam.
- Main fields: inputAV (rad/s parent side = velocity / lead per radian * gearRatio), velocity (m/s, average over the beams), currentExtend (m, average of the beam lengths), currentExtendPercent (0..1 between minExtend and maxExtend), minExtend, maxExtend, screwDiameter, invLeadRadian (rad/m), leadAngle (rad), actuatorBeams (list of beam cids), actuatorBeamCount, speedLimit, frictionForce, cumulativeInertia (virtualInertia / gearRatio²), isBroken. outputTorque1/outputAV1 exist but are 0.
- The screw force = net torque * gearRatio / screwDiameter, split equally between the beams. If movementIntentElectricsName is defined and its value is exactly 0, the reported speed is forced to 0 (the actuator is considered stopped).
- Bugs / pitfalls: new crashes if leadMillimeterPerRevolution is absent (nil division), and invActuatorBeamCount = 1 / 0 = inf if no beam carries the requested tags (velocity and currentExtend then become nan). onBreak disconnects nothing (obj:breakBeam is commented out): the broken actuator keeps working. M.requiredExternalInertiaOutputs is not defined in this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_linearActuator.new(jbeamData)` | Builds the screw jack: screw geometry (diameter, lead, helix angle), extension limits, speed limit and the list of driving beams from the beamTags tags. *(internal)* | 128 |

### Parameter details

#### `powertrain_linearActuator.new(jbeamData)`

Builds the screw jack: screw geometry (diameter, lead, helix angle), extension limits, speed limit and the list of driving beams from the beamTags tags.

- `jbeamData` (*table*) : jbeam data of the component (leadMillimeterPerRevolution required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {torqueConsumer=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 52 |
| `device:calculateInertia()` | Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio. | 90 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}. | 71 |
| `device:onBreak()` | Marks the actuator as broken (isBroken = true) and reselects the updates (no real effect). | 84 |
| `device:reset(jbeamData)` | Resets speeds, extension, wear/damage coefficients and isBroken; rereads gearRatio and friction. | 103 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (coefficient from 1 to 1.5) and damage according to the odometer and the integrity; calls onBreak if isBroken. | 56 |
| `device:torqueUpdate()` | Called at each physics step: computes the screw force from the parent torque (minus friction), applies it to each beam via obj:screwBeam with minExtend/maxExtend/speedLimit, then updates velocity, currentExtend and currentExtendPercent. | 21 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 80 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = velocity * invLeadRadian * gearRatio, written to the parent; outputAV1 = 0. | 14 |

## Calls into the engine (C++)

- `obj:` `getBeamLength`, `screwBeam`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/linearActuator.lua`.*

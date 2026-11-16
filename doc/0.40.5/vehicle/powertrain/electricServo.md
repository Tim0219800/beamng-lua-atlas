# `powertrain_electricServo`

*File: `lua/vehicle/powertrain/electricServo.lua` · VM: Vehicle · 230 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `electricServo` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `electricServo`: electric servo that turns a "rotor" wheel (jbeam key `connectedRotator`, a wheel declared as a rotator) toward a target angle, with a proportional regulator (angularSpring) and a limited torque (stallTorque). Category `engine` but without an output port: it has no powertrain parent and directly applies `propulsionTorque` to the wheel. The target angle is set by setTargetAngle or by an electrics value (`electricsTargetAngleName`). A modder uses it for motorized arms, dump beds or joints.

## Example

```lua
local servo = powertrain.getDevice("armServo")
servo:setMinMaxAngles(-math.pi/2, math.pi/2)
servo:setTargetAngle(math.rad(45)) -- radians
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction (N·m), dynamicFriction (N·m per rad/s), angularSpring (1, gain in 1/rad: the "throttle" is min(|error| * angularSpring, 1)), rotationMode ('absolute' by default or 'shortest'), electricsTargetAngleName (if absent, the servo is driven only through the API), stallTorque (N·m, 1000), maxRPM (REQUIRED), connectedRotator, canDisconnect, isDisconnected, breakTriggerBeam.
- All angles are in radians. In 'absolute' mode, currentAngle is the cumulative rotation of the wheel since the reset (no wrapping). In 'shortest' mode, the target angle is brought into ]-2π, 2π[ with the sign preserved, clamped by minAngle/maxAngle if defined, and currentAngle is wrapped to take the shortest path.
- Main fields: targetAngle, currentAngle (rad), torqueDirection (+1 or -1), outputTorque1 (N·m, torque applied to the wheel before wheelDirection), outputAV1 (always 0), maxTorque (= stallTorque), maxRPM, maxAV (rad/s), wheel, wheelObj, wheelDirection, connectedRotator, mode ('connected' or 'disconnected'), isBroken, rotationMode, minAngle, maxAngle.
- The torque decreases with the wheel speed ("back-EMF" effect) when it goes in the direction of the motion: coefficient 1 - min(|wheelAV| / maxAV, 1); it is not attenuated if it brakes the wheel.
- updateGFX only exists if electricsTargetAngleName is defined: it reads electrics.values[name] (0 by default) and calls setTargetAngle.
- Bug: new assumes maxRPM is defined (device.maxRPM * rpmToAV): a Lua error occurs if the jbeam key maxRPM is absent. M.outputPorts = {} (no port). M.requiredExternalInertiaOutputs is not defined in this module. reset does not reset virtualMassAV, isBroken or the mode; if the wheel is not found (invalid connectedRotator) device.wheel is nil and torqueUpdate crashes.
- setTargetAngle accepts any number: in 'shortest' mode, an angle ≥ 2π is wrapped (an angle of 2π becomes 0).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_electricServo.new(jbeamData)` | Builds the servo, links it to the rotor wheel connectedRotator (declared via wheels.setWheelRotatorType(wheelID, 'rotator')), computes maxTorque and maxAV, determines the available modes. *(internal)* | 147 |

### Parameter details

#### `powertrain_electricServo.new(jbeamData)`

Builds the servo, links it to the rotor wheel connectedRotator (declared via wheels.setWheelRotatorType(wheelID, 'rotator')), computes maxTorque and maxAV, determines the available modes.

- `jbeamData` (*table*) : jbeam data of the component (maxRPM required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true}. |
| `outputPorts` | table | Empty table: no output port (the servo acts directly on the wheel). |

## Class `device`

Object returned by new(jbeamData). velocityUpdate is nop (or an empty function if disconnected); torqueUpdate is servoUpdateTorque or the disconnected version.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Computes the inertia of the rotor wheel around its axis (sum of mass * distance² of the wheel nodes) then cumulativeInertia = inertia / gearRatio². Called at powertrain initialization. | 118 |
| `device:onBreak()` | Marks the servo as broken, sets the output torque and the wheel torque to 0 and switches to the disconnected functions. | 107 |
| `device:reset(jbeamData)` | Resets the torque, the output speed and the target and current angles. | 140 |
| `device:setMinMaxAngles(minAngle, maxAngle)` | Defines the angle limits used by the 'shortest' mode (no effect in 'absolute' mode). | 68 |
| `device:setMode(mode)` | Changes the mode ('connected' or 'disconnected') without checking availableModes, then reselects the update functions. 'disconnected': zero torque. | 102 |
| `device:setTargetAngle(angle)` | Sets the target angle in radians. 'absolute' mode: value as is. 'shortest' mode: wrapped into ]-2π, 2π[, clamped to [minAngle, maxAngle] if defined, and currentAngle is adjusted to choose the shortest path. | 47 |
| `device:setTargetAngleRelative(angle)` | Adds angle to the current target angle (via setTargetAngle). | 64 |
| `device:torqueUpdate(dt)` | Called at each physics step: integrates the current angle with the wheel speed, computes the angle error, a proportional torque clamped by stallTorque and attenuated by the speed, subtracts the friction, and writes wheel.propulsionTorque. Disconnected or broken: torque 0. | 39 |
| `device:updateGFX(dt)` | Defined only if electricsTargetAngleName is set. Reads the target angle from electrics.values and calls setTargetAngle. Called every frame. | 73 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 98 |
| `device:velocityUpdate()` | Called at each physics step; does nothing (nop or empty function in disconnected or broken mode). | 36 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/electricServo.lua`.*

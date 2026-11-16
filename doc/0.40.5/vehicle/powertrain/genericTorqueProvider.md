# `powertrain_genericTorqueProvider`

*File: `lua/vehicle/powertrain/genericTorqueProvider.lua` · VM: Vehicle · 198 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `genericTorqueProvider` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `genericTorqueProvider`: generic torque source, of category `engine`, whose torque is simply `desiredOutputTorque` (N·m) set from outside by a controller or a script (the motor has no curve, throttle or energy). It subtracts the friction and exposes the minimal interface of an engine (scaleFriction, scaleOutputTorque, disable, enable, lockUp, getTorqueData…) so that clutches, gearboxes and controllers can treat it as an engine. Useful for an engine driven by a custom controller.

## Example

```lua
local gen = powertrain.getDevice("torqueSource")
gen.desiredOutputTorque = 120  -- N·m, to be rewritten at each step by your controller
print(gen.outputTorque1, gen.outputAV1)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio, cumulativeGearRatio, friction (N·m), dynamicFriction (N·m per rad/s), inertia (kg·m², default 0.1), torqueReactionNodes_nodes (3 nodes, optional, for the visual position), breakTriggerBeam.
- Main fields: desiredOutputTorque (N·m, to be written from outside), outputTorque1 (N·m = desired torque * outputTorqueState - friction), outputAV1 (rad/s, imposed by downstream or the parent), outputRPM (RPM, updated in updateGFX), outputTorqueState (0..1; 0 after disable/lockUp), isDisabled, friction, dynamicFriction, inertia, torqueReactionNodes.
- velocityUpdate is nop: a torque provider does not compute a speed. Unlike electricMotor, no integration of outputAV1 takes place here: it must come from downstream.
- Inconsistencies: setIgnition, cutIgnition, activateStarter, onBreak and sounds are nop (onBreak = nop: the lockUp method is never called on breakage); getTorqueData returns empty curves and zeros; calculateInertia does not divide by a ratio; clutchChild is {torqueDiff = 0} if there is no child but is never used in this file; validate adds {maxRPM = 0} to powertrain.engineData; M.requiredExternalInertiaOutputs is not defined in this module; new reads v.data.nodes[...] if torqueReactionNodes_nodes has 3 elements (error if an id is invalid).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_genericTorqueProvider.new(jbeamData)` | Builds the torque provider with the engine interface stubs (nop for sound, ignition, starter) and the visual position inferred from the torque reaction nodes. *(internal)* | 124 |

### Parameter details

#### `powertrain_genericTorqueProvider.new(jbeamData)`

Builds the torque provider with the engine interface stubs (nop for sound, ignition, starter) and the visual position inferred from the torque reaction nodes.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Takes the cumulative inertia and ratio of the first child as cumulativeInertia and cumulativeGearRatio. | 92 |
| `device:disable()` | Cuts the torque: outputTorqueState = 0 and isDisabled = true. | 34 |
| `device:enable()` | Restores the torque: outputTorqueState = 1 and isDisabled = false. | 39 |
| `device:getTorqueData()` | Returns an empty torque curve table: {maxRPM=0, curves={}, maxTorque=0, maxPower=0, maxTorqueRPM=0, maxPowerRPM=0, finalCurveName=1, deviceName, vehicleID}. | 15 |
| `device:lockUp()` | Same as disable: cuts the torque and sets isDisabled (no speed lock here). | 44 |
| `device:reset(jbeamData)` | Resets speed, torque, desired torque, outputTorqueState and isDisabled; rereads friction, dynamicFriction and inertia from the jbeam. | 106 |
| `device:scaleFriction(friction)` | Multiplies the friction (friction) by the given factor. | 26 |
| `device:scaleOutputTorque(state)` | Multiplies outputTorqueState by state (cumulative). | 30 |
| `device:sendTorqueData(data)` | Sends the GUI event 'TorqueCurveChanged' with the curve data (computed if not provided). | 19 |
| `device:torqueUpdate(dt)` | Called at each physics step: outputTorque1 = desiredOutputTorque * outputTorqueState - friction torque (limited by speed * inertia * 2000 for stability). | 55 |
| `device:updateGFX(dt)` | Per-frame update: outputRPM = outputAV1 in RPM. | 49 |
| `device:validate()` | If the device has no child, sets clutchChild = {torqueDiff = 0}; registers the engine in powertrain.engineData; selects the update functions. | 77 |
| `device:velocityUpdate()` | Always nop. | dyn |

**UI events (guihooks.trigger):** `TorqueCurveChanged`

## Calls into the engine (C++)

- `obj:` `getId`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/genericTorqueProvider.lua`.*

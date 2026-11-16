# `powertrain_torqueConverter`

*File: `lua/vehicle/powertrain/torqueConverter.lua` · VM: Vehicle · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `torqueConverter` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Hydraulic torque converter of an automatic gearbox, with lockup clutch. It plugs in behind an engine (the parent must be a device of category engine) and transmits a torque that depends on the speed difference between pump (input) and turbine (output), with torque multiplication up to stallTorqueRatio at low turbine speed. Lockup is driven by the electrics value 'lockupClutchRatio' (0 open, 1 locked). A modder uses it through the powertrain jbeam (type torqueConverter) and reads device.outputTorque1 / inputAV / outputAV1.

## Example

```lua
-- jbeam (powertrain section): ["torqueConverter", "torqueConverter", "mainEngine", 1, {"stallTorqueRatio":1.8, "lockupClutchTorque":300}]
local tc = powertrain.getDevice('torqueConverter')
print(tc.inputAV, tc.outputAV1, tc.outputTorque1)
```

## Notes

- Units: angular speeds in rad/s, torques in N·m, inertias in kg·m², fluidDensity 844 kg/m³ (fixed), converterDiameter in m.
- jbeam keys: lockupClutchRatioName (electrics name of the lockup, 'lockupClutchRatio'), lockupClutchTorque (N·m, 100), lockupClutchSpring (otherwise computed: stabilityCoef² x cumulative inertia), lockupClutchDampRatio (0.15, 1 = critical damping), couplingAVRatio (0.85: speed ratio beyond which there is no more multiplication), stallTorqueRatio (2: maximum torque multiplication), converterStiffness (10), converterDiameter (0.30 m), converterTorque (max N·m; otherwise engine maxTorque*1.25 + maxRPM*inertia*pi/30), kFactorSmoothing (75), additionalEngineInertia (0), breakTriggerBeam ('' = cancel), inputName, inputIndex.
- The output torque is (pump_torque * torqueRatio + lockup_torque) * impellerClutchCoef; impellerClutchCoef (1 by default) can be modified by an external controller (e.g. gearbox) to disconnect the converter.
- Categories: clutchlike and viscouscoupling. A single output port (outputPorts[1]); requiredExternalInertiaOutputs = {1}.
- The cumulative inertia seen upstream is that of the child divided by stallTorqueRatio; the cumulative ratios are multiplied by stallTorqueRatio (approximation noted as 'todo' in the code).
- Wear/damage: the lockup torque is multiplied by damageLockupClutchTorqueCoef and wearLockupClutchTorqueCoef; wear is 1 at 30,000,000 odometer and drops to 0.2 at 500,000,000 (odometer values in the game's internal unit, to be confirmed).
- Peculiarity: M.new does not initialize the fields with reset(); reset(device, jbeamData) returns the device (unlike other devices).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_torqueConverter.new(jbeamData)` | Builds a torque converter from the component's jbeam definition. *(internal)* | 136 |

### Parameter details

#### `powertrain_torqueConverter.new(jbeamData)`

Builds a torque converter from the component's jbeam definition.

- `jbeamData` (*table*) : Component jbeam data (name, type, inputName, inputIndex, keys listed in notes).
- **returns**: table Device object (see the device class).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | Categories: clutchlike, viscouscoupling. |
| `outputPorts` | table<integer, boolean> | Output ports: {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | Outputs whose inertia is supplied externally: {1}. |

## Class `device`

Object returned by new(jbeamData). Useful fields: inputAV (rad/s, pump speed = engine output speed), outputAV1 (rad/s, turbine speed, written by the child), outputTorque1 (N·m), torqueDiff (N·m, reaction torque on the input), lockupClutchAngle (rad), impellerClutchCoef, isBroken, mode.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Reduces the lockup torque when a deform group is damaged (removes up to 0.05 per 0.01 of damage) then recomputes the inertia. | 52 |
| `device:calculateInertia()` | Computes cumulative inertia, cumulative ratios, lockup stiffness and damping (lockupClutchSpring/Damp) and the maximum lockup angle from the first child. | 97 |
| `device:getPartCondition()` | Returns the part condition state. | 73 |
| `device:reset(jbeamData)` | Resets speeds, torque, break state, lockup angle, damage/wear coefficients. | 117 |
| `device:setMode(mode)` | Stores the mode and reinstalls the velocityUpdate/torqueUpdate functions (the mode has no other effect in this file). | 92 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies a wear/integrity state (part save set): wear according to the odometer and damage coefficient according to the integrity. | 58 |
| `device:torqueUpdate(dt)` | Physics step, torques stage: computes the hydraulic torque (smoothed K factor, limited to converterTorque), the torque multiplication (up to stallTorqueRatio) and the lockup torque (spring/damper limited to lockupClutchTorque), then outputTorque1 and torqueDiff. | 21 |
| `device:validate()` | Checks that the parent is an engine (category engine) and sets the default converterTorque. Called at powertrain initialization. | 80 |
| `device:velocityUpdate(dt)` | Physics step, speeds stage: copies the output speed of the parent engine (parent.outputAV1) into inputAV. Chosen by selectUpdates (modifiable via setMode). | 17 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/torqueConverter.lua`.*

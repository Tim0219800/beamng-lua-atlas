# `powertrain_cvtGearbox`

*File: `lua/vehicle/powertrain/cvtGearbox.lua` · VM: Vehicle · 256 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `cvtGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `cvtGearbox`: continuously variable transmission (CVT) with a variable ratio between minGearRatio and maxGearRatio. The ratio is not chosen by this file: an external controller calls setGearRatio each step. The possible modes are set by setMode: 'neutral' (virtual mass), 'park' (spring parking lock), 'reverse' (reverses the direction), otherwise forward. A one-way viscous coupling prevents rolling backward. The file contains no automatic control logic.

## Example

```lua
local cvt = powertrain.getDevice("gearbox")
cvt:setMode("drive")      -- any mode other than neutral/park/reverse = forward
cvt:setGearRatio(1.2)     -- clamped to [minGearRatio, maxGearRatio]
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (starting value, immediately overwritten by maxGearRatio), friction (N·m), dynamicFriction (N·m per rad/s), torqueLossCoef (0..1), minGearRatio (0.5), maxGearRatio (2.5), parkLockSpring (N·m/rad, otherwise computed), parkLockTorque (N·m, 1000), parkLockDampRatio (0.4), oneWayViscousCoef (5), oneWayViscousTorque (= oneWayViscousCoef * 25), oneWayViscousSmoothing (50), gearboxNode_nodes (first node = transmissionNodeID), breakTriggerBeam.
- Main fields: inputAV (rad/s engine/clutch side = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef), outputAV1 (rad/s, set by the child), outputTorque1 (N·m), gearRatio (current ratio, clamped), minGearRatio, maxGearRatio, mode ('neutral', 'park', 'reverse' or other), reverseGearRatioCoef (+1 or -1), lockCoef (0 if setLock(true)), virtualMassAV, parkEngaged (0 or 1), parkClutchAngle (rad), cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken. gearCount, minGearIndex, maxGearIndex and gearIndex are always 1 (compatibility with geared gearboxes).
- Park: the lock only engages (parkEngaged = 1) when |outputAV1| < 100 rad/s, then applies a spring/damper torque on parkClutchAngle, clamped by maxParkClutchAngle = parkLockTorque / parkLockSpring.
- The output torque is (input torque - friction) * gearRatio - one-way viscous torque, multiplied by reverseGearRatioCoef and lockCoef.
- Bug: setPartCondition calls device:onBreak() if the state contains isBroken = true, but cvtGearbox does not define onBreak (Lua error). There is also no logic for isBroken in selectUpdates.
- calculateInertia divides by maxGearRatio² and computes invCumulativeInertia = 1 / cumulativeInertia with no guard against a zero inertia.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_cvtGearbox.new(jbeamData)` | Builds the CVT gearbox: minimum/maximum ratio parameters, parking lock, one-way coupling, then sets the ratio to maxGearRatio. *(internal)* | 180 |

### Parameter details

#### `powertrain_cvtGearbox.new(jbeamData)`

Builds the CVT gearbox: minimum/maximum ratio parameters, parking lock, one-way coupling, then sets the ratio to maxGearRatio.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the mode (normal, neutral, park).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 82 |
| `device:calculateInertia()` | Takes the cumulative inertia and ratios of the first child; computes cumulativeInertia (divided by maxGearRatio²), the parking lock parameters (spring, damping, max angle) and the cumulative ratios. | 130 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}. | 101 |
| `device:reset(jbeamData)` | Resets speeds, torque, virtual mass, coefficients, the one-way smoother and the parking angle, then sets the ratio to maxGearRatio. | 152 |
| `device:setGearRatio(ratio)` | Sets the current ratio, clamped between minGearRatio and maxGearRatio. Called by a CVT controller. | 120 |
| `device:setLock(enabled)` | Locks (lockCoef = 0: no speed or torque transmitted) or unlocks (1) the transmission. | 126 |
| `device:setMode(mode)` | Changes the gearbox mode (no validation of the string). 'reverse' reverses the direction (reverseGearRatioCoef = -1); 'neutral' and 'park' select dedicated update functions with virtual mass; any other value = forward. | 114 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table {damageFrictionCoef, isBroken}). Calls onBreak if isBroken, which is not defined on this device (see notes). | 86 |
| `device:torqueUpdate(dt)` | Called at each physics step: computes outputTorque1 according to the mode. Normal: transmission with friction and one-way coupling; neutral: output torque 0 and acceleration of the virtual mass; park: spring/damper lock torque. | 48 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 110 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef, written to the parent. In neutral and park: uses the virtual mass. | 43 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/cvtGearbox.lua`.*

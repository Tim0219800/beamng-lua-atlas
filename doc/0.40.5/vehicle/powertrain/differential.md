# `powertrain_differential`

*File: `lua/vehicle/powertrain/differential.lua` · VM: Vehicle · 425 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `differential` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `differential`: splits the input torque between two outputs (port 1 and port 2) and computes the input speed from the two outputs. Several types (`diffType` in the jbeam, changeable in game via setMode): `open`, `torqueVectoring`, `lsd`, `viscous`, `locked`, `dually`, `activeLock`. It also handles a bevel torque ratio (gearRatio), friction losses, a slip speed limit, wear and damage. A modder declares it in the `powertrain` jbeam and can change its mode or set the active locking (`activeLockCoef`).

## Example

```lua
local diff = powertrain.getDevice("differential_R")
diff:setMode("locked") -- must appear in diffType of the jbeam
print(diff.outputTorque1, diff.outputTorque2, diff.outputAV1, diff.outputAV2)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (final drive ratio, default 1), friction (N·m), dynamicFriction (N·m per rad/s), torqueLossCoef (0..1, clamped), defaultVirtualInertia (kg·m², nil by default, taken over by shafts without a child), speedLimitCoef (default 1, multiplied by 3.5e-7), diffTorqueSplit (share of torque to output 1, default 0.5), diffType (string or list of modes; the first is the initial mode), defaultToggle, lsdPreload (N·m, 50), lsdLockCoef (0.2), lsdRevLockCoef (= lsdLockCoef), viscousCoef (5), viscousTorque (= viscousCoef*10), viscousExponent (1, never used), viscousSmoothing (25), lockTorque (N·m, 500), lockSpring (= lockTorque), lockDampRatio (0.1), activeLockTorque (= lockTorque).
- Main fields: inputAV (rad/s, parent side = weighted average of the outputs * gearRatio), outputAV1 / outputAV2 (rad/s, set by the children), outputTorque1 / outputTorque2 (N·m, torques sent to the children), inputTorque (N·m, input torque after friction), gearRatio, invGearRatio, diffTorqueSplitA (share of output 1) and diffTorqueSplitB (= 1 - A), mode, availableModes, defaultMode, diffAngle (rad), lockTorque, lockSpring, lockDamp, maxDiffAngle, activeLockCoef (0..1, active locking command used by an external controller), activeLockTorque, cumulativeInertia, cumulativeGearRatio.
- lsd mode: locking torque = lsdPreload + lsdLockCoef (or lsdRevLockCoef on deceleration) * |input torque| + activeLockTorque * activeLockCoef, quadratic spring on the differential angle. viscous mode: torque = viscousCoef * (outputAV1 - outputAV2), clamped to ± viscousTorque and smoothed. locked and dually modes: forced 50/50 split with spring+damper, limited to lockTorque. activeLock mode: locking only up to activeLockTorque * activeLockCoef.
- open and torqueVectoring modes use the same function (a small locking torque of 3.4 % of the input torque is added). An unknown mode writes an error 'Found unknown differential type' and leaves torqueUpdate undefined.
- The slip speed limit reduces the input torque by (speedLimitCoef * speed difference³), clamped to 100 %.
- If lockSpring and lockTorque are absent from the jbeam, calculateInertia computes them (lockSpringAutoCalc) from powertrain.stabilityCoef² and the smallest inertia of the children.
- Bug: setPartCondition calls device:onBreak() if the integrity contains isBroken, but this device does not define onBreak (Lua error if isBroken is true). getPartCondition reads device.isBroken, which is never initialized (nil).
- Minor bug: viscousTorque2Smoother and viscousExponent are created but never used. calculateInertia assumes that children[1] and children[2] exist for the lockDamp computation (error if a child is missing).
- In calculateInertia the inertia of children[1] is multiplied by diffTorqueSplitB and that of children[2] by diffTorqueSplitA (intentional crossing, because the torque share is the inverse of the reflected inertia).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_differential.new(jbeamData)` | Builds the differential device: reads gearRatio, frictions, torque split, differential type(s), LSD, viscous, locked and active locking parameters, then selects the torque function according to the mode. *(internal)* | 333 |

### Parameter details

#### `powertrain_differential.new(jbeamData)`

Builds the differential device: reads gearRatio, frictions, torque split, differential type(s), LSD, viscous, locked and active locking parameters, then selects the torque function according to the mode.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {differential=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true, [2]=true}: two output ports. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1, 2}: both outputs receive their inertia from their children. |

## Class `device`

Object returned by new(jbeamData). torqueUpdate is replaced according to the mode (selectUpdates).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Computes cumulativeInertia (weighted sum of the inertias of the two children, divided by gearRatio²), the cumulative ratios (logs a debug message if the two outputs have different ratios), and the locking parameters lockSpring/lockTorque/lockDamp/maxDiffAngle. | 259 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if isBroken) and the table {damageFrictionCoef, isBroken}. | 163 |
| `device:getState()` | Defined only if there are several modes. Returns stateData with the key '<name>Mode' = current mode. | 243 |
| `device:reset(jbeamData)` | Resets speeds, torques, viscous smoothers, diffAngle, activeLockCoef and wear/damage coefficients; rereads gearRatio and friction from the jbeam. | 302 |
| `device:setMode(mode)` | Changes the differential mode if it is in availableModes (diffType list of the jbeam); ignored otherwise. Reselects torqueUpdate and updates the UI button. Possible modes: open, torqueVectoring, lsd, viscous, locked, dually, activeLock. | 228 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (wearFrictionCoef from 1 to 2 between 30000 km and 1000 km*1000) and damage (damageFrictionCoef from 1 to 10) according to the odometer and the integrity (number 0..1 or table). | 141 |
| `device:setState(data)` | Defined only if there are several modes. Restores the mode from data['<name>Mode'] if it is a string different from the current mode. | 248 |
| `device:torqueUpdate(dt)` | Called at each physics step. Computes the input torque (parent torque minus friction, reduced by the slip limit, multiplied by gearRatio) then outputTorque1/outputTorque2 according to the active mode (open, lsd, viscous, locked, activeLock). | 102 |
| `device:updateSimpleControlButtons()` | If several modes are available and uiSimpleModeControl is true, updates the simple interface button with an icon according to the mode and the axle (inferred from the words front, rear, middle, center, transfer in the name). | 220 |
| `device:velocityUpdate()` | Called at each physics step: inputAV = (outputAV1 * splitA + outputAV2 * splitB) * gearRatio, written into the parent's speed field. | 17 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/differential.lua`.*

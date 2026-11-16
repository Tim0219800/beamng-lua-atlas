# `powertrain_multiShaft`

*File: `lua/vehicle/powertrain/multiShaft.lua` · VM: Vehicle · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `multiShaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `multiShaft`: torque splitter with N outputs (N = jbeam key `numberOfOutputPorts`), for example for a multi-axle drive or a transfer case with more than two outputs. Categories `shaft` and `differential`. The input torque is split equally between the outputs, corrected by a viscous coupling that brings the output speeds closer to the average. The input speed is the average of the output speeds. It has no mode, no damage/wear handling and no saveable state.

## Example

```lua
-- jbeam: ["transferCase", "multiShaft", "gearbox", 1, {"numberOfOutputPorts":3, "viscousCoef":50}]
local d = powertrain.getDevice("transferCase")
print(d.outputTorque1, d.outputTorque2, d.outputTorque3)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction (read but not used in the calculations), electricsName, visualShaftAVName, viscousCoef (N·m per rad/s; if absent: 100 * total output inertia, computed in calculateInertia), viscousSmoothing (25), defaultVirtualInertia, numberOfOutputPorts (default 0!).
- Main fields: inputAV (rad/s parent side), outputAV1..outputAV<N> (rad/s, set by the children), outputTorque1..outputTorque<N> (N·m), torqueDiff[i] (N·m of viscous coupling torque per output), numberOfOutputPorts, outputPorts (table {[i]=true}), outputAVNames and outputTorqueNames (arrays of names), requiredExternalInertiaOutputs ({1..N}), viscousCoef, gearRatio, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, mode ('connected' only).
- Output torque i = (parent torque * gearRatio) / N - smoothing((outputAV_i - inputAV/gearRatio) * viscousCoef). There is no limit on the coupling torque.
- Pitfalls: numberOfOutputPorts is 0 by default, which gives a device without outputs and a division by zero in velocityUpdate (inputAV = nan). calculateInertia assumes that cumulativeGearRatio and maxCumulativeGearRatio have been found (Lua error 'attempt to perform arithmetic on nil' if there is no child) and invCumulativeInertia = 1 / cumulativeInertia is not protected against 0. The functions applyDeformGroupDamage, setPartCondition, getPartCondition, setMode and onBreak do not exist on this device. The friction (friction) does not take part in the torque.
- The children numbered 1..N must exist (children[i]); the cumulative gear ratios of the children must be identical, otherwise a 'non-matching gear ratios' warning is logged.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_multiShaft.new(jbeamData)` | Builds the splitter: creates the N output ports, the names outputAV<i>/outputTorque<i>, the viscous coupling smoothers and the requiredExternalInertiaOutputs list. *(internal)* | 87 |

### Parameter details

#### `powertrain_multiShaft.new(jbeamData)`

Builds the splitter: creates the N output ports, the names outputAV<i>/outputTorque<i>, the viscous coupling smoothers and the requiredExternalInertiaOutputs list.

- `jbeamData` (*table*) : jbeam data of the component (numberOfOutputPorts required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true, differential=true}. |
| `outputPorts` | table<integer, boolean> | Default value of the module {[1]=true}, replaced in each device by {[1..N]=true} according to numberOfOutputPorts. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Sums the cumulative inertias of the N children (logs a warning if their cumulative ratios differ), then computes cumulativeInertia, viscousCoef (if not provided) and the cumulative ratios. | 41 |
| `device:reset(jbeamData)` | Resets speeds, torques, torqueDiff, smoothers, mode 'connected' and rereads gearRatio and friction. | 64 |
| `device:torqueUpdate(dt)` | Called at each physics step: splits the input torque (* gearRatio) equally and subtracts the smoothed viscous torque from each output. | 20 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 37 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = average of the output speeds * gearRatio, written into the parent's speed field. | 10 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/multiShaft.lua`.*

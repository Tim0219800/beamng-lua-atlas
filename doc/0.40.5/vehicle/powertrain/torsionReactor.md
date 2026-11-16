# `powertrain_torsionReactor`

*File: `lua/vehicle/powertrain/torsionReactor.lua` · VM: Vehicle · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `torsionReactor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

"Dummy shaft" device that serves as a torsion reactor: it transmits the torque of its parent to its children (multiplied by gearRatio) while keeping the torque reaction nodes (torqueReactionNodes_nodes) that allow applying the engine torque reaction to the body. The powertrain uses it as the anchor point for torque reactions. Category shaft, a single output port.

## Example

```lua
-- jbeam: ["torsionReactor", "torsionReactor", "mainEngine", 1, {"torqueReactionNodes_nodes":[10,11,12]}]
```

## Notes

- jbeam keys: gearRatio (1), torqueReactionNodes_nodes (list of 3 node numbers, only numbers are kept; absent = nil), electricsName, visualShaftAVName, inputName, inputIndex. breakTriggerBeam is always nil.
- validate: if the number of reaction nodes is not exactly 3, a warning is logged and torqueUpdate is replaced by updateTorqueDisabled, which does EXACTLY the same thing as updateTorque (no real effect, the two functions are identical).
- velocityUpdate writes device.parent[device.parentOutputAVName] = inputAV (parent field, name supplied by the powertrain), and torqueUpdate reads device.parent[device.parentOutputTorqueName]: these two names are set by powertrain.lua during wiring.
- Minor bug: new() reads shallowcopy(M.requiredExternalInertiaOutputs) while M.requiredExternalInertiaOutputs is not defined in this file (nil): device.requiredExternalInertiaOutputs is therefore nil (shallowcopy of nil).
- Minor bug: new() does not copy gearRatio to reset; reset(device, jbeamData) rereads jbeamData.gearRatio (1 by default), which is consistent. But onBreak = nop (nop is a game global).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_torsionReactor.new(jbeamData)` | Builds the device from the jbeam. Filters torqueReactionNodes_nodes to keep only the numeric values. *(internal)* | 67 |

### Parameter details

#### `powertrain_torsionReactor.new(jbeamData)`

Builds the device from the jbeam. Filters torqueReactionNodes_nodes to keep only the numeric values.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table Device object.

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {shaft=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |

## Class `device`

Object returned by new(jbeamData). Fields: gearRatio, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), torqueReactionNodes (list of 3 nodes or nil), cumulativeInertia (kg·m²), cumulativeGearRatio, parent/children (set by the powertrain).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Computes the cumulative inertia (that of the child divided by gearRatio²), its inverse and the cumulative ratios from the first child. | 37 |
| `device:reset(jbeamData)` | Resets speeds, torque and inertias; rereads gearRatio from the jbeam. | 54 |
| `device:torqueUpdate()` | Physics step: outputTorque1 = output torque of the parent * gearRatio. | 15 |
| `device:validate()` | Checks that the parent exists and that torqueReactionNodes contains 3 nodes (otherwise a warning and torqueUpdate disabled by name only). | 23 |
| `device:velocityUpdate(dt)` | Physics step: inputAV = outputAV1 * gearRatio, then copied into the parent field designated by parentOutputAVName. | 10 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/torsionReactor.lua`.*

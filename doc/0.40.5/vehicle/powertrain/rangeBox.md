# `powertrain_rangeBox`

*File: `lua/vehicle/powertrain/rangeBox.lua` · VM: Vehicle · 236 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `rangeBox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `rangeBox`: range box (reducer with two ranges "high" / "low", e.g. 4x4 low-range transfer case or truck range). The ratio only changes via setMode: 'high' selects the smallest ratio, 'low' the largest. The transmission always stays engaged (no neutral or synchro). A modder uses it to switch between high and low range; the user control goes through powertrain.toggleDeviceMode(name) or the simple interface button.

## Example

```lua
local rb = powertrain.getDevice("rangebox")
rb:setMode("low")  -- low range (largest ratio)
print(rb.mode, rb.gearRatio)
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (initial value, replaced), friction (N·m), dynamicFriction (N·m per rad/s), torqueLossCoef (0..1), gearRatios (required list of ratios; values >= 0 take the indices 0, 1, 2…, values < 0 the indices -1, -2… in the order of the list).
- Main fields: inputAV (rad/s parent side = outputAV1 * gearRatio), outputAV1 (rad/s, set by the child), outputTorque1 (N·m), gearRatio, gearIndex, gearRatios (indexed table), lowGearIndex, highGearIndex, minGearIndex, maxGearIndex, minGearRatio, maxGearRatio, gearCount, mode ('low' or 'high'), availableModes ({'high','low'}), defaultMode, cumulativeInertia, cumulativeGearRatio, maxCumulativeGearRatio, isBroken.
- At construction, the initial mode is 'low' if the low range index is 0, otherwise 'high'. The gear index is set to 0 (setGearIndex(0, true), without inertia recomputation).
- Indexing particularity compared to manualGearbox: here gearRatios[0] is the first element of the list (there is no neutral with ratio 0); negative reverse gears are numbered -1, -2… in the order of the list.
- Bugs / pitfalls: lowGearIndex/highGearIndex are determined during the iteration (comparison with maxGearRatio/minGearRatio updated afterwards), which gives the right result for increasing ratios but not necessarily for an unordered list. reset does not reset gearIndex, gearRatio or the mode to their initial values. new defines neither onBreak nor validate although setPartCondition can call onBreak. setMode silently ignores any value other than 'high' or 'low' and does not take availableModes into account.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_rangeBox.new(jbeamData)` | Builds the range box: ratio table (forward and reverse), high and low range indices, initial mode and saveable state. *(internal)* | 143 |

### Parameter details

#### `powertrain_rangeBox.new(jbeamData)`

Builds the range box: ratio table (forward and reverse), high and low range indices, initial mode and saveable state.

- `jbeamData` (*table*) : jbeam data of the component (gearRatios required).
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {gearbox=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Increases the damage friction coefficient (0.01 of damage = +0.1). | 82 |
| `device:calculateInertia()` | Takes the inertia and cumulative ratios of the first child; cumulativeInertia = inertia / gearRatio² (maxGearRatio if the ratio is 0). | 110 |
| `device:getPartCondition()` | Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}. | 101 |
| `device:getState()` | Returns stateData with the key '<name>Mode' = current mode (for saving). | 66 |
| `device:reset(jbeamData)` | Resets speeds, torque, cumulative inertia, wear/damage coefficients and isBroken; rereads friction. Does not reset the gear. | 127 |
| `device:setGearIndex(index, omitInertiaCaculation)` | Chooses the gear by its index (clamped to [minGearIndex, maxGearIndex]) and recomputes the powertrain inertia, unless omitInertiaCaculation is true. | 24 |
| `device:setMode(mode)` | Switches to 'high' range (smallest ratio) or 'low' range (largest ratio). Any other value is ignored. Updates the UI button. | 52 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table); calls onBreak if isBroken, which is not defined on this device. | 86 |
| `device:setState(data)` | Restores the mode from data['<name>Mode'] if it is a string different from the current mode. | 71 |
| `device:torqueUpdate()` | Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio. | 20 |
| `device:updateSimpleControlButtons()` | If several modes and uiSimpleModeControl: updates the simple interface button (icons powertrain_rangebox_high / low) for powertrain.toggleDeviceMode(name). | 33 |
| `device:velocityUpdate(dt)` | Called at each physics step: inputAV = outputAV1 * gearRatio, written to the parent. | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/rangeBox.lua`.*

# `powertrain_viscousClutch`

*File: `lua/vehicle/powertrain/viscousClutch.lua` · VM: Vehicle · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `viscousClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Viscous coupler placed behind an engine: transmits a torque proportional to the angular speed difference between input and output (viscousCoef, in N·m per rad/s), capped at viscousTorque. Can be progressively "engaged" above an RPM cutInRPM (cutInRPM, stallRPM). Serves as a simple automatic clutch (e.g. small vehicles, gearboxes without a driven clutch). Categories clutchlike and viscouscoupling; one output port.

## Example

```lua
-- jbeam: ["viscousClutch", "clutch", "mainEngine", 1, {"viscousCoef":20, "cutInRPM":1000, "stallRPM":300}]
```

## Notes

- jbeam keys: viscousCoef (10 N·m per rad/s), viscousTorque (max N·m; otherwise engine maxTorque*1.25 + maxRPM*inertia*pi/30), viscousSmoothing (25, exponential torque smoothing), cutInRPM (RPM, optional), stallRPM (0.1 RPM by default), additionalEngineInertia (0), breakTriggerBeam ('' = cancel), inputName, inputIndex.
- When cutInRPM is defined, the internal clutch coefficient is clamp((inputAV - cutInAV) / stallAV, 0, 1): engaged between cutInRPM and cutInRPM + stallRPM; with the default stallRPM = 0.1 the transition is almost instantaneous.
- device.clutchRatio (1 by default) can be modified from outside to disengage; the final torque = clamp(viscousCoef*(inputAV-outputAV1), ±viscousTorque) * min(clutchRatio, internal ratio), smoothed.
- rpm -> rad/s conversion: factor 0.104719755. Units: AV in rad/s, torques in N·m.
- Anomaly: reset() rereads viscousCoef from jbeamData (default 10), so a dynamically modified viscousCoef is restored on reset; it is not reread for viscousTorque.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_viscousClutch.new(jbeamData)` | Builds the viscous coupler from the jbeam. *(internal)* | 89 |

### Parameter details

#### `powertrain_viscousClutch.new(jbeamData)`

Builds the viscous coupler from the jbeam.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table Device object.

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, viscouscoupling=true}. |
| `outputPorts` | table<integer, boolean> | {[1]=true}. |
| `requiredExternalInertiaOutputs` | table<integer, integer> | {1}. |

## Class `device`

Object returned by new(jbeamData). Fields: inputAV, outputAV1 (rad/s), outputTorque1 and torqueDiff (N·m), clutchRatio (0..1), viscousCoef, viscousTorque, cutInAV, stallAV (rad/s), isBroken, mode.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:calculateInertia()` | Takes the cumulative inertia and ratios of the first child (the coupler adds no inertia). | 55 |
| `device:reset(jbeamData)` | Resets speeds, torque, clutchRatio=1, rereads viscousCoef and reinitializes the smoother. | 71 |
| `device:setMode(mode)` | Stores the mode and reinstalls velocityUpdate/torqueUpdate (the mode has no other effect here). | 50 |
| `device:torqueUpdate(dt)` | Physics step: computes the viscous torque (speed difference), applies clutchRatio and the engagement at cutInRPM, smooths and places the result in torqueDiff and outputTorque1. | 20 |
| `device:validate()` | Checks that the parent is an engine and sets the default viscousTorque. | 38 |
| `device:velocityUpdate(dt)` | Physics step: inputAV = output speed of the parent (engine). | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/viscousClutch.lua`.*

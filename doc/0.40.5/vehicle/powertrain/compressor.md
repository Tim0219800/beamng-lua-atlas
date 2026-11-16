# `powertrain_compressor`

*File: `lua/vehicle/powertrain/compressor.lua` · VM: Vehicle · 313 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `compressor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Powertrain component `compressor`: pneumatic air compressor (air brakes, air suspension of trucks). It is a torque consumer without an output port (leaf of the powertrain tree): it receives the speed of its parent, pumps air into a registered `pressureTank` tank (energyStorage) and returns a resisting torque `torqueDiff` to its parent. It disengages (deload) above the cut-out pressure and re-engages below the cut-in pressure. It plays compressor and purge sounds, and sends data to the GUI stream 'pneumaticsData'.

## Example

```lua
local comp = powertrain.getDevice("airCompressor")
print(comp.engaged, comp.pumpPressure, comp.pumpedAirFlow) -- bool, Pa, m^3/s
```

## Notes

- Jbeam keys read: name, type, inputName, inputIndex, gearRatio (1), friction, dynamicFriction, electricsName, visualShaftAVName, node, requiredEnergyType ('air'), energyStorage, pumpDisplacement (m³ per revolution, default 0.00035), pumpEfficiency (0.8), cutOutPressure (relative Pa, 900000), cutInPressure (80 % of cutOutPressure), motorThrottleElectricsName (name + 'Throttle', unused in this file), deloadWhenDisengaged (true), breakTriggerBeam, and for the sounds: purgeSoundNode, pumpPurgeEvent, purgeSoundVolume (0.5), compressorSoundNode, compressorLoopEvent, compressorSoundVolume (0.5).
- Main fields: inputAV (rad/s, = parent speed), torqueDiff (N·m, resisting torque returned to the parent), pumpedAirFlow (m³/s), pumpedEnergy (J added to the tank this step), pumpPressure (relative Pa), engaged (true if the compressor is charging), deloadCoef (0 = loaded, 1 = unloaded), pressureTank (storage of type pressureTank or nil), cumulativeInertia (virtualInertia = 1 kg·m² scaled by gearRatio²), isBroken.
- The game engine must know the categories: the compressor is declared clutchlike, clutch, pneumaticPowerSource and torqueConsumer. It has no output port (outputPorts = {}), but outputTorque1/outputAV1 exist at 0.
- The tank pressures are absolute in pressureTank.currentPressure; engaged/cutOut/cutIn use the relative pressure (current - powertrain.currentEnvPressure).
- Inconsistencies: updateVelocity rewrites parent[parentOutputAVName] = inputAV with the value it has just read (no effect); applyDeformGroupDamage and selectUpdates (isBroken case) are empty; a broken compressor keeps working. M.requiredExternalInertiaOutputs is not defined in this module.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_compressor.new(jbeamData)` | Builds the compressor: displacement (pumpDisplacement), efficiency, cut-out/cut-in pressures, mode and output names. *(internal)* | 228 |

### Parameter details

#### `powertrain_compressor.new(jbeamData)`

Builds the compressor: displacement (pumpDisplacement), efficiency, cut-out/cut-in pressures, mode and output names.

- `jbeamData` (*table*) : jbeam data of the component.
- **returns**: table The device (class `device`).

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {clutchlike=true, clutch=true, pneumaticPowerSource=true, torqueConsumer=true}. |
| `outputPorts` | table | Empty table: no output port. |

## Class `device`

Object returned by new(jbeamData).

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:applyDeformGroupDamage(damageAmount)` | Does nothing (empty body). | 113 |
| `device:calculateInertia()` | Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio. | 161 |
| `device:getPartCondition()` | Returns 1 (0 if broken) and the table {isBroken}. | 128 |
| `device:initSounds(jbeamData)` | Creates the compressor sound loop (started at volume 0), reads the sound nodes and events from the jbeam (by default the parent's engine node) and creates the pitch smoother. | 177 |
| `device:onBreak()` | Sets isBroken = true (with no other real effect because selectUpdates is empty in this case). | 141 |
| `device:registerStorage(storageName)` | Registers an air tank: the storage must be of type pressureTank and of the same energyType as requiredEnergyType, otherwise an error is logged. Stores the tank in pressureTank. | 146 |
| `device:reset(jbeamData)` | Resets speeds, pressure, flow and pumped energy, wear/damage coefficients, deloadCoef = 1 and the sound smoother; rereads gearRatio and friction. | 195 |
| `device:resetSounds(jbeamData)` | Does nothing. | 174 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed. | 116 |
| `device:torqueUpdate(dt)` | Called at each physics step: torqueDiff = pumpPressure * pumpDisplacement / (2π) if inputAV > 0, otherwise 0 (resisting torque of the compressor). | 70 |
| `device:updateGFX(dt)` | Per-frame update: sends the tank pressure (relative kPa) and the state 'Engaged' or 'Disengaged' to the GUI stream 'pneumaticsData', only if the stream is requested. | 78 |
| `device:updateSounds(dt)` | Sets the volume (according to inputAV from 10 to 20 rad/s), the pitch (smoothed RPM) and the color (1 - deloadCoef) of the compressor sound. | 94 |
| `device:validate()` | Called after the powertrain is built; always returns true. | 137 |
| `device:velocityUpdate(dt)` | Called at each physics step: reads inputAV from the parent, computes the air flow (max(0, inputAV/(2π) * pumpDisplacement * pumpEfficiency * (1 - deloadCoef))), adds the pumped energy to the tank, handles engaging/unloading according to the cut-out pressures (plays the purge sound on unloading) and computes pumpPressure. | 17 |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `playSFX`, `playSFXOnce`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/compressor.lua`.*

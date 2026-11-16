# `powertrain_combustionEngineThermals`

*File: `lua/vehicle/powertrain/combustionEngineThermals.lua` · VM: Vehicle · 1968 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `combustionEngineThermals` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Thermal and wear submodule of a combustion engine. It is NOT an independent powertrain component: it does not export `new` and is not listed in the jbeam. It is loaded by powertrain/combustionEngine.lua with rerequire (so one instance per engine; the file name can be overridden by the jbeam key `thermalsLuaFileName`) and stored in `device.thermals`. It simulates the temperatures of the block, cylinder walls, oil, coolant and exhaust, the radiator and its fans, coolant and oil leaks, oil starvation, damage (head gasket, rings, connecting rods, melting), the exhaust tree (isExhaust nodes and beams), backfires (afterfire), smoke, steam, cooling sounds.

## Example

```lua
local engine = powertrain.getDevice("mainEngine")
local t = engine.thermals
print(t.coolantTemperature, t.oilTemperature, t.engineBlockTemperature, t.headGasketBlown) -- °C, boolean
```

## Notes

- Temperature in °C everywhere (the environment comes from obj:getEnvTemperature() converted from K to °C). Energies are in J per time step, masses in kg, leak rates in kg/s.
- Everything is disabled unless the engine jbeam contains thermalsEnabled = true. Without it, init exits early, the update functions stay nop and only the initial temperatures are set (reset sets them to 80 °C or to the ambient temperature). An error (unknown material, no engineBlock node group, exhaust tree that cannot be built) also disables the thermals with a message in the log.
- Engine jbeam keys read (initThermals): thermalsEnabled, headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride, particulates, idleParticulates, coolantVolume (kg, minimum 1.5), oilVolume (L, default 5, converted x0.87), oilMinimumSafeVolume, oilMaximumSafeVolume, oilpanNodes_nodes ({bottom, top}), oilpanMaximumSafeG (1.2), engineBlockMaterial ('iron' or 'aluminium'/'aluminum'), engineBlockAirCoolingEfficiency (50), engineBlockAirflowCoef (1), blockFanMaxAirSpeed (0), radiatorFanType ('electric' or 'mechanical'), electricRadiatorFanOverrideIgnitionLevel (-1), radiatorArea, radiatorEffectiveness, radiatorFanMaxAirSpeed, mechanicalFanRPMCoef (0.5), radiatorFanTemperature (110), thermostatTemperature (90), airRegulatorClosedCoef (0.1), oilThermostatTemperature (110), oilRadiatorArea, oilRadiatorEffectiveness, isAirCooledOnly, cylinderWallTemperatureDamageThreshold (160), engineBlockTemperatureDamageThreshold (140), headGasketDamageThreshold / pistonRingDamageThreshold / connectingRodDamageThreshold (2000000), radiatorDeformThreshold (0.015), radiatorDamageDeformGroup ('radiator_damage'), hasOilStarvingDamage (true), node groups engineBlock._engineGroup_nodes and radiator._engineGroup_nodes (required if radiator).
- Sound/effect jbeam keys read in initSounds/initThermals: radiatorHissLoopEvent, radiatorFanLoopEvent, radiatorFanVolume (0.5), engineTick* and exhaustTick* (PeriodGain, MinRate, MaxRate, MinTemperature, Pitch, SizeBias, Volume, StartDelay, EventName) for the cooling ticks, instant/sustained/shiftAfterFireSound, ...AfterFireVolumeCoef, afterFireAudibleThreshold*, afterFireVisualThreshold*.
- Public fields of the module: engineBlockTemperature, cylinderWallTemperature, coolantTemperature, oilTemperature, exhaustTemperature (°C), radiatorFanSpin (degrees, 0..360), additionalCoolantEnergyPerStep (J added to the coolant at the next step, then reset to 0, usable by other components e.g. turbo/intercooler), exhaustEndNodes (list of exhaust outlets {start, finish, ...}), engineBlockOverheatDamage, oilOverheatDamage, cylinderWallOverheatDamage (damage accumulators in J, capped by the thresholds), headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted (booleans), debugData.engineThermalData (table sent to the GUI stream 'engineThermalData').
- Damage consequences: head gasket and rings = scaleOutputTorque(0.8) and leaks; block or wall melting = scaleFriction(10000) (engine nearly locked); oil > 150 °C = increased friction; oil starvation = increasing scaleFrictionInitial; rods = knocking sound. The parent engine must therefore provide scaleOutputTorque, scaleFriction, scaleFrictionInitial, exhaustEndNodesChanged, engineWorkPerUpdate, pumpingLossPerUpdate, frictionLossPerUpdate, engineLoad, invBurnEfficiencyTable, etc.
- Water cooling (default): the coolant is clamped to 130 °C; above 120 °C a leak of 0.01 kg/s (overpressure) starts. Air cooling (isAirCooledOnly): updateAirCoolingGFX sets M.coolantTemperature = nil at each step; do not read coolantTemperature on an air-cooled engine (engineThermalData.coolantTemperature then takes the oil value).
- GUI stream 'engineThermalData' sent only if streams.willSend('engineThermalData'). UI event 'ExhaustTreeDataChanged' sent by requestExhaustTreeData.
- Inconsistencies: setPartConditionExhaust does nothing and getPartConditionExhaust always returns 1. updateGFX calls updateHeatTicksGFX even if the thermals are disabled (the function then ends up using empty node lists but the temperature condition protects it).

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount)` | Increases the oil leak of the oil radiator (damageAmount * 0.1 kg/s, capped at 0.1) and signals 'oilRadiatorLeak'. Called for the 'oilRadiator' group. *(internal)* | 286 |
| `powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount)` | Increases the oil leak of the oil pan (damageAmount * 10 kg/s, capped at 1) and signals 'oilpanLeak' in the damageTracker. Called for the 'oilPan' group. *(internal)* | 281 |
| `powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount)` | Adds damage to the radiator (radiatorDamage), which produces a coolant leak beyond the radiatorDeformThreshold threshold. Called by the engine for the 'radiator' deformation group. *(internal)* | 277 |
| `powertrain_combustionEngineThermals.beamBroke(id)` | Called when a beam breaks. If it is an exhaust beam (isExhaust), cuts the branch of the exhaust tree, recomputes the outlets, notifies the engine (exhaustEndNodesChanged), updates the interface and shows an 'exhaustDamaged' message. *(internal)* | 1452 |
| `powertrain_combustionEngineThermals.getPartConditionExhaust()` | Always returns an integrity of 1 and an empty table (the exhaust state is not modeled). *(internal)* | 389 |
| `powertrain_combustionEngineThermals.getPartConditionRadiator()` | Returns the radiator integrity 0..1 (minimum of the radiator state and the remaining coolant mass) and the table {radiatorDamage, coolantMass}. *(internal)* | 376 |
| `powertrain_combustionEngineThermals.getPartConditionThermals()` | Returns the integrity 0..1 (minimum: gasket 0.3, rings 0.2, rods 0.1, melting 0) and the table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. *(internal)* | 396 |
| `powertrain_combustionEngineThermals.init(engine, engineJbeamData)` | Initializes the module for an engine: stores the parent engine then reads the thermal configuration from the jbeam (initThermals). Called by combustionEngine.new with device.thermals.init(device, jbeamData). *(internal)* | 1944 |
| `powertrain_combustionEngineThermals.initSounds(jbeamData)` | Creates the sound sources (radiator hiss, fan) and reads the parameters of the block and exhaust cooling ticks. Called by combustionEngine.initSounds. *(internal)* | 1888 |
| `powertrain_combustionEngineThermals.requestExhaustTreeData()` | Builds a graph of the exhaust (roots, nodes, edges, broken beams) and sends it to the interface via guihooks.trigger('ExhaustTreeDataChanged', data). | 1321 |
| `powertrain_combustionEngineThermals.reset(jbeamData)` | Resets the temperatures to the preheated temperature (thermostat - 10 °C) or ambient depending on the startThermalsPreHeated setting, clears the damage, leaks, fluid masses, timers, repairs the exhaust tree and resets the damageTracker entries. Only sets the temperatures if the thermals are disabled. *(internal)* | 1514 |
| `powertrain_combustionEngineThermals.resetSounds()` | Stops the radiator sounds; restarts the mechanical fan. Called by combustionEngine.resetSounds. *(internal)* | 1925 |
| `powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual)` | Does nothing: the exhaust state is not restored (empty body apart from the creation of a local table). *(internal)* | 337 |
| `powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual)` | Restores the radiator state (damage, coolant mass) from an integrity number 0..1 or a table {radiatorDamage, coolantMass}. *(internal)* | 324 |
| `powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual)` | Restores the engine damage: from a number 0..1 (gasket < 0.3, rings < 0.2, rods < 0.1) or a table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applies the consequences (reduced torque, friction, leaks). *(internal)* | 345 |
| `powertrain_combustionEngineThermals.updateGFX(dt)` | Per-frame update: cooling (water or air) and integration of the temperatures, damage, exhaust smoke and backfires, oil mechanics and oil starvation, cooling ticks. Called by combustionEngine.updateGFX. *(internal)* | 1937 |

### Parameter details

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount)`

Increases the oil leak of the oil radiator (damageAmount * 0.1 kg/s, capped at 0.1) and signals 'oilRadiatorLeak'. Called for the 'oilRadiator' group.

- `damageAmount` (*number*) : Amount of damage of the deformation group.

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount)`

Increases the oil leak of the oil pan (damageAmount * 10 kg/s, capped at 1) and signals 'oilpanLeak' in the damageTracker. Called for the 'oilPan' group.

- `damageAmount` (*number*) : Amount of damage of the deformation group.

#### `powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount)`

Adds damage to the radiator (radiatorDamage), which produces a coolant leak beyond the radiatorDeformThreshold threshold. Called by the engine for the 'radiator' deformation group.

- `damageAmount` (*number*) : Amount of damage of the deformation group.

#### `powertrain_combustionEngineThermals.beamBroke(id)`

Called when a beam breaks. If it is an exhaust beam (isExhaust), cuts the branch of the exhaust tree, recomputes the outlets, notifies the engine (exhaustEndNodesChanged), updates the interface and shows an 'exhaustDamaged' message.

- `id` (*integer*) : cid of the broken beam.

#### `powertrain_combustionEngineThermals.getPartConditionExhaust()`

Always returns an integrity of 1 and an empty table (the exhaust state is not modeled).

- **returns**: number Always 1.
- **returns**: table Empty table.

#### `powertrain_combustionEngineThermals.getPartConditionRadiator()`

Returns the radiator integrity 0..1 (minimum of the radiator state and the remaining coolant mass) and the table {radiatorDamage, coolantMass}.

- **returns**: number Integrity 0..1.
- **returns**: table {radiatorDamage, coolantMass}.

#### `powertrain_combustionEngineThermals.getPartConditionThermals()`

Returns the integrity 0..1 (minimum: gasket 0.3, rings 0.2, rods 0.1, melting 0) and the table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}.

- **returns**: number Integrity 0..1.
- **returns**: table Damage state table.

#### `powertrain_combustionEngineThermals.init(engine, engineJbeamData)`

Initializes the module for an engine: stores the parent engine then reads the thermal configuration from the jbeam (initThermals). Called by combustionEngine.new with device.thermals.init(device, jbeamData).

- `engine` (*table*) : Parent engine device (combustionEngine), used for RPM, load, work, etc.
- `engineJbeamData` (*table*) : Engine jbeam data (thermal keys listed in the notes).

#### `powertrain_combustionEngineThermals.initSounds(jbeamData)`

Creates the sound sources (radiator hiss, fan) and reads the parameters of the block and exhaust cooling ticks. Called by combustionEngine.initSounds.

- `jbeamData` (*table*) : jbeam data of the engine.

#### `powertrain_combustionEngineThermals.reset(jbeamData)`

Resets the temperatures to the preheated temperature (thermostat - 10 °C) or ambient depending on the startThermalsPreHeated setting, clears the damage, leaks, fluid masses, timers, repairs the exhaust tree and resets the damageTracker entries. Only sets the temperatures if the thermals are disabled.

- `jbeamData` (*table*) : Engine jbeam data (reads the overrides headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride).

#### `powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual)`

Does nothing: the exhaust state is not restored (empty body apart from the creation of a local table).

- `odometer` (*number*) : Not used.
- `integrity` (*number|table*) : Not used.
- `visual` (*any*) : Not used.

#### `powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual)`

Restores the radiator state (damage, coolant mass) from an integrity number 0..1 or a table {radiatorDamage, coolantMass}.

- `odometer` (*number*) : Distance traveled in meters (unused).
- `integrity` (*number|table*) : Number 0..1 or table {radiatorDamage, coolantMass}.
- `visual` (*any*) : Not used.

#### `powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual)`

Restores the engine damage: from a number 0..1 (gasket < 0.3, rings < 0.2, rods < 0.1) or a table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applies the consequences (reduced torque, friction, leaks).

- `odometer` (*number*) : Distance traveled in meters (unused).
- `integrity` (*number|table*) : Number 0..1 or state table.
- `visual` (*any*) : Not used.

#### `powertrain_combustionEngineThermals.updateGFX(dt)`

Per-frame update: cooling (water or air) and integration of the temperatures, damage, exhaust smoke and backfires, oil mechanics and oil starvation, cooling ticks. Called by combustionEngine.updateGFX.

- `dt` (*number*) : Frame duration in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `additionalCoolantEnergyPerStep` | number | Extra energy (J) added to the coolant at the next physics step, then reset to 0. |
| `connectingRodBearingsDamaged` | boolean | Connecting rod bearings damaged (knocking noise). |
| `coolantTemperature` | number|nil | Coolant temperature in °C. nil on an active air-cooled engine. |
| `cylinderWallOverheatDamage` | number | Accumulated wall overheat damage; at the pistonRingDamageThreshold threshold the rings are damaged. |
| `cylinderWallTemperature` | number | Cylinder wall temperature in °C. |
| `cylinderWallsMelted` | boolean | Cylinder walls melted (engine locked). |
| `debugData` | table | {engineThermalData = table}: same values as the GUI stream 'engineThermalData' (temperatures, exchanged energies, masses, leak rates, damage). |
| `engineBlockMelted` | boolean | Block melted (engine locked). |
| `engineBlockOverheatDamage` | number | Accumulated block overheat damage; reaching the headGasketDamageThreshold threshold blows the head gasket. |
| `engineBlockTemperature` | number | Engine block temperature in °C. |
| `exhaustEndNodes` | table | List of current exhaust outlets (elements {start, finish, afterFireAudioCoef, afterFireVisualCoef, afterFireVolumeCoef, afterFireMufflingCoef…}). Updated when an exhaust beam breaks or on reset. |
| `exhaustTemperature` | number | Exhaust temperature in °C. |
| `headGasketBlown` | boolean | Head gasket blown. |
| `oilOverheatDamage` | number | Accumulated oil overheat damage; at the connectingRodDamageThreshold threshold the connecting rod bearings are damaged. |
| `oilTemperature` | number | Oil temperature in °C (also used for the temperature gauge on air-cooled engines). |
| `pistonRingsDamaged` | boolean | Rings damaged. |
| `radiatorFanSpin` | number | Rotation angle of the radiator fan in degrees (0..360), for the animation. |

**UI events (guihooks.trigger):** `ExhaustTreeDataChanged`

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `createSFXSource2`, `getEnvTemperature`, `getFrontAirflowSpeed`, `getNodeForceNonInertial`, `inWater`, `playSFX`, `playSFXOnceCT`, `setVolumePitch`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/combustionEngineThermals.lua`.*

---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/combustionEngineThermals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Thermal and wear submodule of a combustion engine. It is NOT an independent powertrain component: it does not export `new` and is not listed in the jbeam. It is loaded by powertrain/combustionEngine.lua with rerequire (so one instance per engine; the file name can be overridden by the jbeam key `thermalsLuaFileName`) and stored in `device.thermals`. It simulates the temperatures of the block, cylinder walls, oil, coolant and exhaust, the radiator and its fans, coolant and oil leaks, oil starvation, damage (head gasket, rings, connecting rods, melting), the exhaust tree (isExhaust nodes and beams), backfires (afterfire), smoke, steam, cooling sounds.
--- Access: powertrain device type `combustionEngineThermals` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_combustionEngineThermals
---@field additionalCoolantEnergyPerStep number Extra energy (J) added to the coolant at the next physics step, then reset to 0.
---@field connectingRodBearingsDamaged boolean Connecting rod bearings damaged (knocking noise).
---@field coolantTemperature number|nil Coolant temperature in °C. nil on an active air-cooled engine.
---@field cylinderWallOverheatDamage number Accumulated wall overheat damage; at the pistonRingDamageThreshold threshold the rings are damaged.
---@field cylinderWallTemperature number Cylinder wall temperature in °C.
---@field cylinderWallsMelted boolean Cylinder walls melted (engine locked).
---@field debugData table {engineThermalData = table}: same values as the GUI stream 'engineThermalData' (temperatures, exchanged energies, masses, leak rates, damage).
---@field engineBlockMelted boolean Block melted (engine locked).
---@field engineBlockOverheatDamage number Accumulated block overheat damage; reaching the headGasketDamageThreshold threshold blows the head gasket.
---@field engineBlockTemperature number Engine block temperature in °C.
---@field exhaustEndNodes table List of current exhaust outlets (elements {start, finish, afterFireAudioCoef, afterFireVisualCoef, afterFireVolumeCoef, afterFireMufflingCoef…}). Updated when an exhaust beam breaks or on reset.
---@field exhaustTemperature number Exhaust temperature in °C.
---@field headGasketBlown boolean Head gasket blown.
---@field oilOverheatDamage number Accumulated oil overheat damage; at the connectingRodDamageThreshold threshold the connecting rod bearings are damaged.
---@field oilTemperature number Oil temperature in °C (also used for the temperature gauge on air-cooled engines).
---@field pistonRingsDamaged boolean Rings damaged.
---@field radiatorFanSpin number Rotation angle of the radiator fan in degrees (0..360), for the animation.
local powertrain_combustionEngineThermals = {}

--- Increases the oil leak of the oil radiator (damageAmount * 0.1 kg/s, capped at 0.1) and signals 'oilRadiatorLeak'. Called for the 'oilRadiator' group.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:286
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_combustionEngineThermals.applyDeformGroupDamageOilRadiator(damageAmount) end

--- Increases the oil leak of the oil pan (damageAmount * 10 kg/s, capped at 1) and signals 'oilpanLeak' in the damageTracker. Called for the 'oilPan' group.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:281
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_combustionEngineThermals.applyDeformGroupDamageOilpan(damageAmount) end

--- Adds damage to the radiator (radiatorDamage), which produces a coolant leak beyond the radiatorDeformThreshold threshold. Called by the engine for the 'radiator' deformation group.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:277
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_combustionEngineThermals.applyDeformGroupDamageRadiator(damageAmount) end

--- Called when a beam breaks. If it is an exhaust beam (isExhaust), cuts the branch of the exhaust tree, recomputes the outlets, notifies the engine (exhaustEndNodesChanged), updates the interface and shows an 'exhaustDamaged' message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1452
---@param id integer cid of the broken beam.
function powertrain_combustionEngineThermals.beamBroke(id) end

--- Always returns an integrity of 1 and an empty table (the exhaust state is not modeled).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:389
---@return number  Always 1.
---@return table  Empty table.
function powertrain_combustionEngineThermals.getPartConditionExhaust() end

--- Returns the radiator integrity 0..1 (minimum of the radiator state and the remaining coolant mass) and the table {radiatorDamage, coolantMass}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:376
---@return number  Integrity 0..1.
---@return table  {radiatorDamage, coolantMass}.
function powertrain_combustionEngineThermals.getPartConditionRadiator() end

--- Returns the integrity 0..1 (minimum: gasket 0.3, rings 0.2, rods 0.1, melting 0) and the table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:396
---@return number  Integrity 0..1.
---@return table  Damage state table.
function powertrain_combustionEngineThermals.getPartConditionThermals() end

--- Initializes the module for an engine: stores the parent engine then reads the thermal configuration from the jbeam (initThermals). Called by combustionEngine.new with device.thermals.init(device, jbeamData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1944
---@param engine table Parent engine device (combustionEngine), used for RPM, load, work, etc.
---@param engineJbeamData table Engine jbeam data (thermal keys listed in the notes).
function powertrain_combustionEngineThermals.init(engine, engineJbeamData) end

--- Creates the sound sources (radiator hiss, fan) and reads the parameters of the block and exhaust cooling ticks. Called by combustionEngine.initSounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1888
---@param jbeamData table jbeam data of the engine.
function powertrain_combustionEngineThermals.initSounds(jbeamData) end

--- Builds a graph of the exhaust (roots, nodes, edges, broken beams) and sends it to the interface via guihooks.trigger('ExhaustTreeDataChanged', data).
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1321
function powertrain_combustionEngineThermals.requestExhaustTreeData() end

--- Resets the temperatures to the preheated temperature (thermostat - 10 °C) or ambient depending on the startThermalsPreHeated setting, clears the damage, leaks, fluid masses, timers, repairs the exhaust tree and resets the damageTracker entries. Only sets the temperatures if the thermals are disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1514
---@param jbeamData table Engine jbeam data (reads the overrides headGasketBlownOverride, pistonRingsDamagedOverride, connectingRodBearingsDamagedOverride).
function powertrain_combustionEngineThermals.reset(jbeamData) end

--- Stops the radiator sounds; restarts the mechanical fan. Called by combustionEngine.resetSounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1925
function powertrain_combustionEngineThermals.resetSounds() end

--- Does nothing: the exhaust state is not restored (empty body apart from the creation of a local table).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:337
---@param odometer number Not used.
---@param integrity number|table Not used.
---@param visual any Not used.
function powertrain_combustionEngineThermals.setPartConditionExhaust(odometer, integrity, visual) end

--- Restores the radiator state (damage, coolant mass) from an integrity number 0..1 or a table {radiatorDamage, coolantMass}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:324
---@param odometer number Distance traveled in meters (unused).
---@param integrity number|table Number 0..1 or table {radiatorDamage, coolantMass}.
---@param visual any Not used.
function powertrain_combustionEngineThermals.setPartConditionRadiator(odometer, integrity, visual) end

--- Restores the engine damage: from a number 0..1 (gasket < 0.3, rings < 0.2, rods < 0.1) or a table {headGasketBlown, pistonRingsDamaged, connectingRodBearingsDamaged, engineBlockMelted, cylinderWallsMelted}. Applies the consequences (reduced torque, friction, leaks).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:345
---@param odometer number Distance traveled in meters (unused).
---@param integrity number|table Number 0..1 or state table.
---@param visual any Not used.
function powertrain_combustionEngineThermals.setPartConditionThermals(odometer, integrity, visual) end

--- Per-frame update: cooling (water or air) and integration of the temperatures, damage, exhaust smoke and backfires, oil mechanics and oil starvation, cooling ticks. Called by combustionEngine.updateGFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngineThermals.lua:1937
---@param dt number Frame duration in seconds.
function powertrain_combustionEngineThermals.updateGFX(dt) end

return powertrain_combustionEngineThermals

---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/compressor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `compressor`: pneumatic air compressor (air brakes, air suspension of trucks). It is a torque consumer without an output port (leaf of the powertrain tree): it receives the speed of its parent, pumps air into a registered `pressureTank` tank (energyStorage) and returns a resisting torque `torqueDiff` to its parent. It disengages (deload) above the cut-out pressure and re-engages below the cut-in pressure. It plays compressor and purge sounds, and sends data to the GUI stream 'pneumaticsData'.
--- Access: powertrain device type `compressor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_compressor
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true, pneumaticPowerSource=true, torqueConsumer=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_compressor = {}

--- Builds the compressor: displacement (pumpDisplacement), efficiency, cut-out/cut-in pressures, mode and output names.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:228
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_compressor.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_compressor_device
local powertrain_compressor_device = {}

--- Does nothing (empty body).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:113
---@param damageAmount number Amount of damage (ignored).
function powertrain_compressor_device:applyDeformGroupDamage(damageAmount) end

--- Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:161
function powertrain_compressor_device:calculateInertia() end

--- Returns 1 (0 if broken) and the table {isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:128
---@return number  Integrity.
---@return table  {isBroken}.
function powertrain_compressor_device:getPartCondition() end

--- Creates the compressor sound loop (started at volume 0), reads the sound nodes and events from the jbeam (by default the parent's engine node) and creates the pitch smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:177
---@param jbeamData table jbeam data of the component.
function powertrain_compressor_device:initSounds(jbeamData) end

--- Sets isBroken = true (with no other real effect because selectUpdates is empty in this case).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:141
function powertrain_compressor_device:onBreak() end

--- Registers an air tank: the storage must be of type pressureTank and of the same energyType as requiredEnergyType, otherwise an error is logged. Stores the tank in pressureTank.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:146
---@param storageName string Name of the energy storage (energyStorage.getStorage).
function powertrain_compressor_device:registerStorage(storageName) end

--- Resets speeds, pressure, flow and pumped energy, wear/damage coefficients, deloadCoef = 1 and the sound smoother; rereads gearRatio and friction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:195
---@param jbeamData table jbeam data of the component.
---@return table  The device.
function powertrain_compressor_device:reset(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:174
---@param jbeamData table jbeam data (ignored).
function powertrain_compressor_device:resetSounds(jbeamData) end

--- Applies isBroken from the integrity (number: not broken; table: isBroken field) by calling onBreak if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:116
---@param subSystem any Not used.
---@param odometer number Not used.
---@param integrity number|table Number 0..1 or table {isBroken}.
---@param visual any Not used.
function powertrain_compressor_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: torqueDiff = pumpPressure * pumpDisplacement / (2π) if inputAV > 0, otherwise 0 (resisting torque of the compressor).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:70
---@param dt number Time step in seconds (unused).
function powertrain_compressor_device:torqueUpdate(dt) end

--- Per-frame update: sends the tank pressure (relative kPa) and the state 'Engaged' or 'Disengaged' to the GUI stream 'pneumaticsData', only if the stream is requested.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:78
---@param dt number Frame duration in seconds (unused).
function powertrain_compressor_device:updateGFX(dt) end

--- Sets the volume (according to inputAV from 10 to 20 rad/s), the pitch (smoothed RPM) and the color (1 - deloadCoef) of the compressor sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:94
---@param dt number Frame duration in seconds.
function powertrain_compressor_device:updateSounds(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:137
---@return boolean  true.
function powertrain_compressor_device:validate() end

--- Called at each physics step: reads inputAV from the parent, computes the air flow (max(0, inputAV/(2π) * pumpDisplacement * pumpEfficiency * (1 - deloadCoef))), adds the pumped energy to the tank, handles engaging/unloading according to the cut-out pressures (plays the purge sound on unloading) and computes pumpPressure.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/compressor.lua:17
---@param dt number Time step in seconds.
function powertrain_compressor_device:velocityUpdate(dt) end

return powertrain_compressor

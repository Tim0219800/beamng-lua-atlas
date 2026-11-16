---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/nitrousOxideInjection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Nitrous oxide (NOS) injection submodule for a combustion engine. It is NOT an independent powertrain component: it does not export `new`; it is a module with global state in the file (a single instance per vehicle VM), initialized by the engine with `init(device, data)`. It reads three electrics values (arming, override, activation), adds torque to the engine (`engine.nitrousOxideTorque`) according to a per-RPM table, consumes energy from the registered `n2o` tanks and handles the purging of the lines (particles and sound).
--- Access: powertrain device type `nitrousOxideInjection` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_nitrousOxideInjection
---@field isActive boolean true if the injection is in progress (conditions met, liquid present, no purge).
---@field isArmed boolean true if the NOS is armed (electrics nitrousOxideArm >= 1).
---@field isExisting boolean Always true: allows testing whether the NOS module is present on the vehicle.
---@field updateGFX function Per-frame update function: nop until init, then the real function. Called by the engine after preparing nitrousOxideTorque.
---@field updateSounds function Sound function: nop (the real function is empty).
local powertrain_nitrousOxideInjection = {}

--- Returns the table of additional torque (N·m) per RPM of the engine torque curve (indexed like torqueCurve, k+1), without any activation condition. Used to draw the torque curve with NOS.
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:259
---@return table<integer, number>  Additional torque per speed (N·m).
function powertrain_nitrousOxideInjection.getAddedTorque() end

--- Returns the remaining purge time in seconds (0 if no purge).
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:53
---@return number  Remaining seconds.
function powertrain_nitrousOxideInjection.getPurgeTimeRemaining() end

--- Returns the average of the relative level (remainingRatio, 0..1) of the registered tanks, or 0 if there are none. Useful for a gauge.
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:57
---@return number  Average level 0..1.
function powertrain_nitrousOxideInjection.getTankRatio() end

--- Initializes the module for an engine: builds the additional torque tables per RPM (progressive ramp-up from cutInStart to cutInRPM), reads the electrics names, the minimum gear, the purge valves. Called by the combustion engine at initialization; with data nil, disables the module.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:193
---@param device table Combustion engine (idleRPM, maxRPM, outputAV1, throttle, nitrousOxideTorque, engineVolumeCoef, invBurnEfficiencyCoef…).
---@param data table|nil NOS jbeam data (addedPower in kW, cutInRPM, electricsArmName…); nil to disable.
function powertrain_nitrousOxideInjection.init(device, data) end

--- Reads the purge sound event and volume from the jbeam. Called at engine sound initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:248
---@param data table NOS jbeam data (purgeSoundEvent, purgeSoundVolume).
function powertrain_nitrousOxideInjection.initSounds(data) end

--- Starts the purging of the NOS lines for purgeTime seconds (particles and sound at the valves) if there are purge valves and liquid; otherwise resets the purge time to 0. Blocks the injection during the purge.
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:49
---@param purgeTime number Purge duration in seconds.
function powertrain_nitrousOxideInjection.purgeLines(purgeTime) end

--- Registers an energy tank (nitrous liquid) of the engine for NOS consumption. Called by the engine for each energy storage of the expected type.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:166
---@param storageName string Name of the storage (energyStorage.getStorage).
function powertrain_nitrousOxideInjection.registerStorage(storageName) end

--- Resets the states (arming, override, purge, registered tanks, energy). Called at vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:177
function powertrain_nitrousOxideInjection.reset() end

--- Stops the purge sounds of all valves. Called at sound reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/nitrousOxideInjection.lua:253
function powertrain_nitrousOxideInjection.resetSounds() end

return powertrain_nitrousOxideInjection

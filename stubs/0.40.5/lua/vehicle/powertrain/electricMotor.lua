---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricMotor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `electricMotor`: electric motor of category `engine`. It produces a torque from a torque/RPM curve (jbeam key `torque`), the throttle (`electrics.values.throttle`) and regeneration (`regenThrottle`). It consumes energy from registered `electricBattery` batteries (registerStorage), applies electrical efficiency, handles a temporary rev limiter, ignition, engine sounds and the torque reaction on the body. With a child clutch (category clutchlike) it integrates its own speed; without a clutch it directly imposes the output torque on the child.
--- Access: powertrain device type `electricMotor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_electricMotor
---@field deviceCategories table<string, boolean> {engine=true}: lets clutches and gearboxes recognize the motor as a valid parent.
---@field outputPorts table<integer, boolean> {[1]=true}: one output port.
local powertrain_electricMotor = {}

--- Builds the electric motor: reads the torque curve (required), the regeneration curve (provided or computed from maxRegenPower/maxRegenTorque/regenFadeRPM), the electrical efficiency, the torque reaction nodes, and prepares the curve data (getTorqueData).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:505
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_electricMotor.new(jbeamData) end

--- Object returned by new(jbeamData). torqueUpdate is updateTorqueWithClutch or updateTorqueWithoutClutch depending on the presence of a child clutch.
---@class powertrain_electricMotor_device
local powertrain_electricMotor_device = {}

--- Takes the cumulative inertia and ratio of the first child as cumulativeInertia and cumulativeGearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:323
function powertrain_electricMotor_device:calculateInertia() end

--- Cuts the motor: outputTorqueState = 0, isDisabled = true.
---Source: lua/vehicle/powertrain/electricMotor.lua:88
function powertrain_electricMotor_device:disable() end

--- Re-enables the motor: outputTorqueState = 1, isDisabled = false.
---Source: lua/vehicle/powertrain/electricMotor.lua:93
function powertrain_electricMotor_device:enable() end

--- Returns the soundConfiguration table (parameters of the already initialized engine sounds, by reference).
---Source: lua/vehicle/powertrain/electricMotor.lua:337
---@return table|nil  Sound configuration, nil if no sound has been initialized.
function powertrain_electricMotor_device:getSoundConfiguration() end

--- Computes the torque and power curves net of friction and returns {maxRPM, curves, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID}. Used by the interface and by the clutches/gearboxes (maxTorque).
---Source: lua/vehicle/powertrain/electricMotor.lua:22
---@return table  Torque curve data.
function powertrain_electricMotor_device:getTorqueData() end

--- Stores the configuration of a sound sample and asks the game engine (GE Lua) to initialize it: core_sounds.initEngineSound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:417
---@param soundID integer Engine sound identifier (powertrain.getEngineSoundID).
---@param samplePath string Path of the sfxBlend2D file.
---@param engineNodeIDs table<integer, integer> Nodes from which the sound is emitted.
---@param offLoadGain number No-load gain.
---@param onLoadGain number Under-load gain.
---@param reference string Storage key in soundConfiguration.
function powertrain_electricMotor_device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference) end

--- Creates the sound configuration from the jbeam table designated by soundConfig (smoothers, gains, EQ, sample) and enables updateSounds. Logs an error if the configuration cannot be found.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:432
---@param jbeamData table jbeam data of the component (soundConfig).
function powertrain_electricMotor_device:initSounds(jbeamData) end

--- Locks the motor: torque 0, output speed forced to 0 (outputAVState = 0) and isDisabled = true. Called by onBreak.
---Source: lua/vehicle/powertrain/electricMotor.lua:98
function powertrain_electricMotor_device:lockUp() end

--- Called when the break beam breaks: calls lockUp.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:292
function powertrain_electricMotor_device:onBreak() end

--- Registers a battery (storage of type electricBattery with capacity > 0) as the motor's energy source and recomputes the ratios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:311
---@param storageName string Name of the energy storage (energyStorage.getStorage).
function powertrain_electricMotor_device:registerStorage(storageName) end

--- Resets the state (speeds, torque, throttle, load, energy, limiter, coefficients), rereads friction, dynamicFriction, inertia, defaultMotorDirection from the jbeam and recomputes the curve data.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:341
---@param jbeamData table jbeam data of the component.
function powertrain_electricMotor_device:reset(jbeamData) end

--- Resets the sound smoothers if the sound configuration exists; stops the old engine sounds. Logs an error if soundConfig cannot be found.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:398
---@param jbeamData table jbeam data of the component.
function powertrain_electricMotor_device:resetSounds(jbeamData) end

--- Disables the temporary rev limiter (very high cut-off value, isTempRevLimiterActive = false).
---Source: lua/vehicle/powertrain/electricMotor.lua:303
function powertrain_electricMotor_device:resetTempRevLimiter() end

--- Multiplies the motor friction (friction) by the given factor.
---Source: lua/vehicle/powertrain/electricMotor.lua:80
---@param friction number Multiplicative factor.
function powertrain_electricMotor_device:scaleFriction(friction) end

--- Multiplies outputTorqueState (0..1) by state. Used to reduce the available torque; note that the effect is cumulative.
---Source: lua/vehicle/powertrain/electricMotor.lua:84
---@param state number Multiplicative factor.
function powertrain_electricMotor_device:scaleOutputTorque(state) end

--- Sends the GUI event 'TorqueCurveChanged' with the curve data (computed if not provided).
---Source: lua/vehicle/powertrain/electricMotor.lua:73
---@param data table|nil Result of getTorqueData; nil to recompute it.
function powertrain_electricMotor_device:sendTorqueData(data) end

--- Stores and sends (core_sounds.setEngineSoundParameterList) a list of sound parameters for an engine sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:425
---@param soundID integer Engine sound identifier.
---@param params table<string, number> FMOD parameters (gains, EQ frequencies…).
---@param reference string Storage key in soundConfiguration.
function powertrain_electricMotor_device:setEngineSoundParameterList(soundID, params, reference) end

--- Sets the ignition coefficient: 1 if value > 0, otherwise 0. Only has an effect if isAffectedByIgnitionLevel is true (default).
---Source: lua/vehicle/powertrain/electricMotor.lua:288
---@param value number Ignition level (> 0 = on).
function powertrain_electricMotor_device:setIgnition(value) end

--- Enables a temporary rev limiter: the throttle is reduced between revLimiterAV and revLimiterAV + maxOvershootAV.
---Source: lua/vehicle/powertrain/electricMotor.lua:296
---@param revLimiterAV number Cut-off angular speed in rad/s.
---@param maxOvershootAV number|nil Overshoot range in rad/s (default 1 % of revLimiterAV).
function powertrain_electricMotor_device:setTempRevLimiter(revLimiterAV, maxOvershootAV) end

--- Called at each physics step. Computes the smoothed throttle (with temporary rev limiter and ignition), the torque from the curve, the load, the gross work, the spent energy and the friction torque. With a clutch: integrates outputAV1 and takes outputTorque1 = clutch.torqueDiff. Without a clutch: includes regeneration and applies the inertial reaction torque to the body.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:dyn
---@param dt number Time step in seconds.
function powertrain_electricMotor_device:torqueUpdate(dt) end

--- Recomputes the share of energy drawn (or returned during regeneration) by each registered battery according to the number of batteries with energy.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:104
function powertrain_electricMotor_device:updateEnergyStorageRatios() end

--- Removes spentEnergy from the registered batteries (or adds to them during regeneration), updates the counters of non-empty batteries and calls disable/enable depending on whether energy remains. Does nothing without device.energyStorage.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:116
function powertrain_electricMotor_device:updateEnergyUsage() end

--- Per-frame update: calls updateEnergyUsage, computes outputRPM and resets the work and friction loss counters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:154
---@param dt number Frame duration in seconds.
function powertrain_electricMotor_device:updateGFX(dt) end

--- Defined only if a valid soundConfig is present (otherwise nop). Smooths RPM and load and calls obj:setEngineSound with the fundamental frequency.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:163
---@param dt number Frame duration in seconds.
function powertrain_electricMotor_device:updateSounds(dt) end

--- Detects the child clutch (a single child of category clutchlike), sets clutchChild and the effective inertia, registers the motor in powertrain.engineData and selects the torqueUpdate version. Without a child: clutchChild = {torqueDiff = 0}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:273
---@return boolean  Always true.
function powertrain_electricMotor_device:validate() end

--- Always nop for a motor: the output speed is computed in torqueUpdate or imposed from downstream.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricMotor.lua:dyn
function powertrain_electricMotor_device:velocityUpdate() end

return powertrain_electricMotor

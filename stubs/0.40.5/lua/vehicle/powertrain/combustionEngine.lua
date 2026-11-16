---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/combustionEngine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Factory of the powertrain device type `combustionEngine` (combustion engine). `new(jbeamData)` builds a device from a jbeam entry of the powertrain section: torque curve (with intake/exhaust modifiers, drop after the redline), rev limiter (3 types), regulated idle, starter, ignition, misfires, hydrolock, over-rev/over-torque damage, fuel consumption through the energyStorage, engine/exhaust sounds (FMOD blend) and optional submodules (thermals, turbocharger, supercharger, nitrousOxideInjection). The engine is always the root of a tree: its children must be `clutchlike` devices. A modder gets the device with powertrain.getDevice('name') or getDevicesByType('combustionEngine') and reads/writes its fields.
--- Access: powertrain device type `combustionEngine` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_combustionEngine
---@field deviceCategories table<string, boolean> {engine = true}. Copied (shallowcopy) into each device; powertrain.getDevicesByCategory('engine') finds the engines.
---@field outputPorts table<integer, boolean> Output ports announced to powertrain: {[1] = true} by default. new() replaces it with numberOfOutputPorts ports (true); validate sets to false those without a child (except port 1).
local powertrain_combustionEngine = {}

--- Combustion engine factory called by powertrain.init for a jbeam entry of type 'combustionEngine'. Reads the jbeam keys (see notes), builds the final torque curve (created by createCurve, keyed by integer RPM), the rev limiter, the idle smoothing, loads the thermals/turbo/supercharger/N2O submodules and returns the device (table with its methods).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1677
---@param jbeamData table jbeam data of the device (already merged with the jbeam section of the same name); idleRPM, maxRPM and torque are required.
---@return table  The combustionEngine device.
function powertrain_combustionEngine.new(jbeamData) end

--- Object returned by new(jbeamData). All methods are called with a colon (device:method(...)). Methods marked internal are called by powertrain.lua.
---@class powertrain_combustionEngine_device
local powertrain_combustionEngine_device = {}

--- Turns the ignition on (ignitionCoef = 1) and engages the starter if it is not already engaged: temporarily cuts the throttle (longer when cold, x4 for diesel versus x2 below -20 °C) and plays the starter sound.
---Source: lua/vehicle/powertrain/combustionEngine.lua:995
function powertrain_combustionEngine_device:activateStarter() end

--- Applies deformation damage according to the group type: 'main' increases frictions, idle error and ignition error probabilities; 'radiator', 'oilPan', 'oilRadiator' are relayed to the thermals; 'turbo' and 'supercharger' to their modules.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:830
---@param damageAmount number Damage added since the last time.
---@param groupType string Deformation group type (jbeam key deformGroups_<type>, 'main' by default).
function powertrain_combustionEngine_device:applyDeformGroupDamage(damageAmount, groupType) end

--- Limiting function chosen at construction according to revLimiterType: 'rpmDrop' (cuts the throttle until the RPM drops by revLimiterRPMDrop), 'timeBased' (cuts for revLimiterCutTime or until the drop of revLimiterMaxRPMDrop), 'soft' (progressive fade of the throttle), or disabled (returns the throttle unchanged). Called by torqueUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:660
---@param engineAV number Engine speed in rad/s.
---@param throttle number Requested throttle 0..1.
---@param dt number Time step in seconds.
---@return number  Throttle after limiting.
function powertrain_combustionEngine_device:applyRevLimiter(engineAV, throttle, dt) end

--- Relays the breakage of a beam to the thermals (radiator, exhaust...).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1068
---@param id integer Cid of the broken beam.
function powertrain_combustionEngine_device:beamBroke(id) end

--- Copies cumulativeInertia, cumulativeGearRatio and maxCumulativeGearRatio from the first child (clutch); 0/1/1 without a child.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1090
function powertrain_combustionEngine_device:calculateInertia() end

--- Handles flooding: if ALL waterDamage nodes are underwater (obj:inWater) the floodLevel rises proportionally to RPM, otherwise it drops more slowly; above 0.9 the engine is locked (lockUp). Sends UI messages in 10 % steps.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:329
---@param dt number Time step in seconds.
function powertrain_combustionEngine_device:checkHydroLocking(dt) end

--- Cuts the ignition (zero engine torque) for a given time; used by gearboxes for gear changes.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1015
---@param time number Cut duration in seconds.
function powertrain_combustionEngine_device:cutIgnition(time) end

--- Releases the starter; if the engine has exceeded 1.1 x starterMaxAV and the throttle cut is over, stops the sound, otherwise cuts it.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1019
function powertrain_combustionEngine_device:deactivateStarter() end

--- Disables the engine: torque at 0, isDisabled = true, starter disabled and starter sound stopped if it was running. Signals engineDisabled.
---Source: lua/vehicle/powertrain/combustionEngine.lua:264
function powertrain_combustionEngine_device:disable() end

--- Re-enables the engine (outputTorqueState = 1, isDisabled = false, starter allowed).
---Source: lua/vehicle/powertrain/combustionEngine.lua:279
function powertrain_combustionEngine_device:enable() end

--- Called by the thermals when the exhaust output nodes change (a pipe breaks): recomputes the node pairs, the gain and the base muffling of the exhaust sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1185
---@param endNodes table[]|nil List of ends {start, finish, exhaustAudioOpennessCoef, exhaustAudioGainChange}; empty list = fall back to the engine node.
function powertrain_combustionEngine_device:exhaustEndNodesChanged(endNodes) end

--- Returns the integrity of the engine (or of the subsystem 'exhaust', 'radiator', 'turbocharger'): value 0..1 (minimum of the friction, idle, ignition error and thermals criteria; 0 if broken) and state table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:890
---@param subSystem string|nil nil = whole engine.
---@return number  Integrity 0..1.
---@return table  Detailed state, usable by setPartCondition.
function powertrain_combustionEngine_device:getPartCondition(subSystem) end

--- Returns the soundConfiguration table (by reference 'engine'/'exhaust': blendFile, params, soundID).
---Source: lua/vehicle/powertrain/combustionEngine.lua:1229
---@return table  Current sound configuration.
function powertrain_combustionEngine_device:getSoundConfiguration() end

--- Computes the torque and power curves (minus friction) for each configuration (NA, N2O, Turbo, SC, combinations), sorted by priority, with the max torques/powers and their RPM.
---Source: lua/vehicle/powertrain/combustionEngine.lua:25
---@return table  {maxRPM, curves = {{torque, power, name, priority, dash, width}…}, maxTorque, maxPower, maxTorqueRPM, maxPowerRPM, finalCurveName, deviceName, vehicleID}; the curves are indexed by RPM + 1.
function powertrain_combustionEngine_device:getTorqueData() end

--- Creates the engine sound on the game side (core_sounds.initEngineSound queued on GE), stores the blend and sets the sound position for the debug display.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1106
---@param soundID integer Sound identifier (powertrain.getEngineSoundID).
---@param samplePath string Path of the .sfxBlend2D.json file.
---@param engineNodeIDs integer[] Sound source nodes.
---@param offLoadGain number No-load gain.
---@param onLoadGain number Under-load gain.
---@param reference string Key of soundConfiguration ('engine').
function powertrain_combustionEngine_device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference) end

--- Creates the exhaust sound (core_sounds.initExhaustSound) with pairs of nodes (exhaust start, end).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1115
---@param soundID integer Sound identifier.
---@param samplePath string Blend path.
---@param exhaustNodeIDPairs integer[][] List of {start, finish} pairs.
---@param offLoadGain number No-load gain.
---@param onLoadGain number Under-load gain.
---@param reference string Key of soundConfiguration ('exhaust').
function powertrain_combustionEngine_device:initExhaustSound(soundID, samplePath, exhaustNodeIDPairs, offLoadGain, onLoadGain, reference) end

--- Called by powertrain.initSounds. Creates the starter and shut-off sounds, reads soundConfig/soundConfigExhaust from the jbeam, initializes the engine and exhaust sound (equalizers, gains, fundamental frequency = cylinders/120 x RPM), creates the RPM/load smoothers, enables updateSounds, then initializes the submodule sounds. Disabled if old custom engine sounds are used.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1452
---@param jbeamData table jbeam data of the engine.
function powertrain_combustionEngine_device:initSounds(jbeamData) end

--- Locks the engine: torque and output speed forced to 0 (outputTorqueState = outputAVState = 0), isBroken = true, starter cut. Signals engineLockedUp and the broken powertrain.
---Source: lua/vehicle/powertrain/combustionEngine.lua:287
function powertrain_combustionEngine_device:lockUp() end

--- Called by powertrain.breakDevice: locks the engine (lockUp).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1064
function powertrain_combustionEngine_device:onBreak() end

--- Registers an energy tank: N2O tank -> nitrous module; electric battery -> starterBattery; tank of type requiredEnergyType -> list of consumed tanks. Ignores an unknown tank.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1072
---@param storageName string Name of the tank (energyStorage).
function powertrain_combustionEngine_device:registerStorage(storageName) end

--- Called by powertrain.reset: resets all dynamic states to their spawn values (idle speed if the ignition is on at spawn, frictions, idle, starter, stalling, flooding, limiters, ignition errors, damage, energies, wear), resets the submodules, recomputes getTorqueData and resets the damageTracker flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1308
---@param jbeamData table jbeam data of the engine.
function powertrain_combustionEngine_device:reset(jbeamData) end

--- Called on reset: resets the sound smoothers, recomputes the exhaust sound parameters and resets the submodule sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1257
---@param jbeamData table jbeam data of the engine.
function powertrain_combustionEngine_device:resetSounds(jbeamData) end

--- Disables the temporary limiter (limit set back to maxAV x 10) and resets the exhaust sound gain/muffling offset caused by the limiter.
---Source: lua/vehicle/powertrain/combustionEngine.lua:648
function powertrain_combustionEngine_device:resetTempRevLimiter() end

--- Multiplies the current friction by a factor (cumulative).
---Source: lua/vehicle/powertrain/combustionEngine.lua:254
---@param friction number Multiplicative factor.
function powertrain_combustionEngine_device:scaleFriction(friction) end

--- Sets friction = initialFriction x value (starts again from the jbeam friction).
---Source: lua/vehicle/powertrain/combustionEngine.lua:250
---@param friction number Factor applied to initialFriction.
function powertrain_combustionEngine_device:scaleFrictionInitial(friction) end

--- Reduces the output torque: outputTorqueState = max(state x state, min(maxReduction, state)). The minimum cannot resurrect an engine already at 0. Signals engineReducedTorque to the damageTracker.
---Source: lua/vehicle/powertrain/combustionEngine.lua:258
---@param state number Multiplicative factor (1 = no change).
---@param maxReduction number|nil Floor of the state (0 by default).
function powertrain_combustionEngine_device:scaleOutputTorque(state, maxReduction) end

--- Sends the torque curves to the UI via guihooks.trigger('TorqueCurveChanged', data). Called by powertrain.sendTorqueData when player 1 is seated.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:243
---@param data table|nil Already computed data; getTorqueData() if nil.
function powertrain_combustionEngine_device:sendTorqueData(data) end

--- Sets the desired anti-lag coefficient, passed to the turbo and to the exhaust sound in updateGFX (crashes if the engine has no turbocharger defined, see notes).
---Source: lua/vehicle/powertrain/combustionEngine.lua:1060
---@param coef number 0..1 (clamped).
function powertrain_combustionEngine_device:setAntilagCoef(coef) end

--- Sets the desired compression engine brake coefficient (applied only when the throttle is at 0).
---Source: lua/vehicle/powertrain/combustionEngine.lua:1056
---@param coef number 0..1 (clamped).
function powertrain_combustionEngine_device:setCompressionBrakeCoef(coef) end

--- Sends an FMOD parameter to the sound (via the GE) and stores it in soundConfiguration. Does not update the aggregated parameters (main_gain, muffled) nor the starter sounds: use the list version for that. Has no effect if soundID is nil.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1140
---@param soundID integer|nil Sound identifier.
---@param paramName string Parameter name.
---@param paramValue number Value.
---@param reference string 'engine' or 'exhaust'.
function powertrain_combustionEngine_device:setEngineSoundParameter(soundID, paramName, paramValue, reference) end

--- Sends a complete list of sound parameters. Recomputes main_gain (capped at 0 dB) and muffled from base_gain/base_muffled and the offsets, then adjusts the volume of the starter and shut-off sounds.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1153
---@param soundID integer|nil Sound identifier.
---@param params table Parameters (base_gain, gainOffset, gainOffsetRevLimiter, base_muffled, mufflingOffset, mufflingOffsetRevLimiter, eq_*…). The table is modified.
---@param reference string 'engine' or 'exhaust'.
function powertrain_combustionEngine_device:setEngineSoundParameterList(soundID, params, reference) end

--- Offsets the gain and muffling of the exhaust sound (used by exhaust/muffler systems). Has no effect if the exhaust sound is not configured.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1233
---@param mufflingOffset number Muffling offset.
---@param gainOffset number Gain offset in dB.
function powertrain_combustionEngine_device:setExhaustGainMufflingOffset(mufflingOffset, gainOffset) end

--- Same thing for the offset caused by the rev limiter (fields mufflingOffsetRevLimiter / gainOffsetRevLimiter).
---Source: lua/vehicle/powertrain/combustionEngine.lua:1245
---@param mufflingOffset number Muffling offset.
---@param gainOffset number Gain offset in dB.
function powertrain_combustionEngine_device:setExhaustGainMufflingOffsetRevLimiter(mufflingOffset, gainOffset) end

--- Changes the nodes of the exhaust sound (core_sounds.setExhaustSoundNodes) and updates their debug location.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1128
---@param soundID integer Exhaust sound identifier.
---@param exhaustNodeIDPairs integer[][] {start, finish} pairs.
function powertrain_combustionEngine_device:setExhaustSoundNodes(soundID, exhaustNodeIDPairs) end

--- Sets the ignition: ignitionCoef = 1 if value > 0 otherwise 0. At 0, stops the starter and, if the RPM exceeds 80 % of idle, requests the shut-off sound.
---Source: lua/vehicle/powertrain/combustionEngine.lua:1045
---@param value number Ignition level (0 = off).
function powertrain_combustionEngine_device:setIgnition(value) end

--- Applies the wear (odometer) and integrity state to the engine (without subsystem: friction coefficients, idle, ignition errors, thermals, possible breakage) or to a subsystem: 'radiator', 'exhaust' (thermals) or 'turbocharger'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:851
---@param subSystem string|nil nil = the engine itself; 'radiator', 'exhaust' or 'turbocharger'.
---@param odometer number Cumulative wear.
---@param integrity number|table Integrity 0..1 or state table from getPartCondition.
---@param visual any Visual condition passed to the submodules.
function powertrain_combustionEngine_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Stores where a sound (engine, exhaust) is located for the debug display of nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1215
---@param soundType string 'engine' or 'exhaust'.
---@param displayText string|nil Text displayed.
---@param nodeCids integer[] Nodes concerned.
function powertrain_combustionEngine_device:setSoundLocation(soundType, displayText, nodeCids) end

--- Enables a temporary rev limiter (lower than the normal limiter; the lowest of the two applies), useful for launch control or a speed limiter.
---Source: lua/vehicle/powertrain/combustionEngine.lua:641
---@param revLimiterAV number Limit speed in rad/s.
---@param maxOvershootAV number|nil Overshoot range in rad/s; 1 % of revLimiterAV if nil.
function powertrain_combustionEngine_device:setTempRevLimiter(revLimiterAV, maxOvershootAV) end

--- Core of the simulation, called at each physics step by powertrain.update (root to leaves). Computes throttle, torque, load, friction, engine brake, starter torque, then the new output speed passed to each active port, the returned load torque (sum of the clutches' torqueDiff), the inertia reaction applied via obj:applyTorqueAxisCouple, the spent energy and the afterfire fuel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:728
---@param dt number Physics step in seconds.
function powertrain_combustionEngine_device:torqueUpdate(dt) end

--- Distributes the consumption among the registered tanks of the right energy type that still have energy (ratio 1/N, 0 if empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:377
function powertrain_combustionEngine_device:updateEnergyStorageRatios() end

--- Fixed 100 Hz step called from torqueUpdate: idle throttle regulation (P on the RPM error, with randomness), reset of forcedInductionCoef to 1 then update of the turbo and supercharger fixed steps.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:704
---@param dt number Time accumulated since the last fixed step.
function powertrain_combustionEngine_device:updateFixedStep(dt) end

--- Removes spentEnergy from the tanks (storedEnergy) according to the ratios, updates hasFuel and remainingFuelRatio; disables the engine (disable) when out of fuel and re-enables it (enable) when fuel returns.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:390
function powertrain_combustionEngine_device:updateFuelUsage() end

--- Called once per frame by powertrain.updateGFX. Fuel consumption, RPM, starter and stalling logic, random ignition errors (slow and fast, more frequent when low on fuel), shut-off sounds, over-rev damage (possible lock-up, torque loss) and over-torque damage, lock-up if friction exceeds the available torque, compression brake and anti-lag, afterfire delays, update of the submodules (turbo, supercharger, N2O, thermals), air density, hydrolock, idle reading error, and reset of the energy counters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:428
---@param dt number Time step in seconds.
function powertrain_combustionEngine_device:updateGFX(dt) end

--- Redraws the debug text of the sound nodes (bdebug.setNodeDebugText).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:1220
function powertrain_combustionEngine_device:updateSoundNodeDebug() end

--- Dynamically assigned by initSounds only if engine/exhaust sounds are configured. Called by powertrain.updateGFX: smooths RPM and load, computes the audio load, sends obj:setEngineSound for the engine and the exhaust, and updates the turbo and supercharger sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:304
---@param dt number Time step in seconds.
function powertrain_combustionEngine_device:updateSounds(dt) end

--- Called by powertrain.init after the tree is built. Checks that all children are of category clutchlike (otherwise returns false and aborts init), adds their additionalEngineInertia to the engine inertia, registers the engine in powertrain.engineData, configures the active output ports and initializes outputAV/outputTorque (idle speed if the ignition is on at spawn).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:930
---@return boolean  false if a child is not a clutch.
function powertrain_combustionEngine_device:validate() end

--- Always nop for an engine (assigned by selectUpdates): the speed is computed in torqueUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/combustionEngine.lua:dyn
function powertrain_combustionEngine_device:velocityUpdate() end

return powertrain_combustionEngine

# `powertrain_combustionEngine`

*File: `lua/vehicle/powertrain/combustionEngine.lua` · VM: Vehicle · 2167 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** powertrain device type `combustionEngine` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`

Factory of the powertrain device type `combustionEngine` (combustion engine). `new(jbeamData)` builds a device from a jbeam entry of the powertrain section: torque curve (with intake/exhaust modifiers, drop after the redline), rev limiter (3 types), regulated idle, starter, ignition, misfires, hydrolock, over-rev/over-torque damage, fuel consumption through the energyStorage, engine/exhaust sounds (FMOD blend) and optional submodules (thermals, turbocharger, supercharger, nitrousOxideInjection). The engine is always the root of a tree: its children must be `clutchlike` devices. A modder gets the device with powertrain.getDevice('name') or getDevicesByType('combustionEngine') and reads/writes its fields.

## Example

```lua
local eng = powertrain.getDevicesByType('combustionEngine')[1]
print(eng.outputAV1 * 9.5493, eng.engineLoad, eng.combustionTorque) -- RPM, load 0..1, torque N·m
eng:setIgnition(0)          -- turns the ignition off
eng:cutIgnition(0.1)        -- cuts the ignition for 0.1 s (gear change)
eng:setTempRevLimiter(600)  -- temporary limiter (rad/s)
eng:scaleOutputTorque(0.5)  -- halves the torque
```

## Notes

- UNITS: internal angular speeds (outputAV1, idleAV, maxAV, revLimiterAV, starterMaxAV...) are in rad/s; the jbeam files give RPM (idleRPM, maxRPM, revLimiterRPM...), converted with rpmToAV = 0.104719755; avToRPM = 9.5493. Torques in N·m, inertia in kg·m², temperature in °C/K depending on the thermals submodule. device.maxPower is the max power from getTorqueData (computed with torqueToPower = 0.0001404345: torque x RPM, i.e. in hp/PS according to the factor; maxPowerThrottleMap = maxPower x 735.499 converts it to W).
- JBEAM KEYS READ by new: name, type, inputName, inputIndex, friction (constant friction torque, default 0), dynamicFriction (per rad/s, default 0), idleRPM (required), idleRPMRoughness (default 50), idleRPMRoughnessRate, idleRPMStartRate (1), idleRPMStartCoef (2), idleUpdateFrequency (100 Hz), idleUpdateFrequencyRandomness (0.01), idleControllerP (0.01), maxIdleThrottle (0.15), idleSmoothingUp/Down (100), maxRPM (required), maxPhysicalRPM (default maxRPM x 1.05), inertia (0.1), torque (table with header {rpm, torque}), torqueModMult, torqueModIntake, torqueModExhaust (rpm/torque tables: multiplier, then additive torques), torqueCompressionBrake (default rpm/torque 0/0, 1000/500, 3000/1500), hasRevLimiter (default true), revLimiterType ('rpmDrop' default, 'timeBased', 'soft'), revLimiterRPM, revLimiterRPMDrop (default 3 % of maxRPM), revLimiterCutTime (0.15 s), revLimiterMaxRPMDrop (500), revLimiterSmoothOvershootRPM (50), redlineTorqueDropOffRange (500, clamped 10..maxRPM), revLimiterActiveMaxExhaustFlowCoef (0.5), starterTorque (default friction x 15), starterMaxRPM (default idleRPM x 0.7), starterThrottleKillTime (0.5 s), numberOfOutputPorts (1), torqueReactionNodes_nodes (3 node ids), engineBrakeTorque (default friction x 2), burnEfficiency (number or table {load 0..1, efficiency}), requiredEnergyType (default 'gasoline'), energyStorage, instantAfterFireCoef, sustainedAfterFireCoef, sustainedAfterFireTime (1.5 s), maxOverRevDamage (1500), maxTorqueRating (-1 = disabled), maxOverTorqueDamage (1000), waterDamage._engineGroup_nodes (nodes tested for flooding), engineBlock._engineGroup_nodes (>= 2 nodes), thermalsLuaFileName / turbocharger / turbochargerLuaFileName / supercharger / superchargerLuaFileName / nitrousOxideInjection / nitrousOxideLuaFileName (jbeam section names and files), breakTriggerBeam, electricsThrottleName (default 'throttle'), electricsThrottleFactorName ('throttleFactor'), sounds: soundConfig, soundConfigExhaust, starterSample, starterSampleExhaust, shutOffSampleEngine, shutOffSampleExhaust, starterVolume, starterVolumeExhaust, shutOffVolumeEngine, shutOffVolumeExhaust, enginePlacement ('outside'/'inside'), rpmSmootherInRate/OutRate (15/25), loadSmootherInRate/OutRate (20), particulates, thermalsEnabled, engineBlockMaterial, oilVolume, *DamageThreshold (passed to thermals).
- MAIN FIELDS of the device: outputAV1 (rad/s, output speed toward the clutch) and outputRPM (RPM, updated in updateGFX), outputTorque1 (load torque returned by the clutch), inputAV, throttle (effective smoothed throttle 0..1), requestedThrottle, idleThrottle, engineLoad (smoothed load 0..1), instantEngineLoad, combustionTorque (net engine torque = produced torque - friction), frictionTorque, lastOutputTorque, nitrousOxideTorque, forcedInductionCoef, intakeAirDensityCoef (obj:getRelativeAirDensity), torqueCurve (table keyed by integer RPM -> N·m), compressionBrakeCurve, maxRPM, maxAV, idleRPM, idleAV, maxIdleAV/minIdleAV, maxPhysicalAV, maxPower, maxTorque, torqueData, inertia/initialInertia (inertia of the child clutches added in validate), friction/initialFriction/dynamicFriction, ignitionCoef (0/1), starterEngagedCoef, starterThrottleKillCoef, isStalled, isDisabled, isBroken, outputTorqueState (1 = normal, 0 = dead), outputAVState, floodLevel (0..1), revLimiterActive, revLimiterAV, hasRevLimiter, overRevDamage, overTorqueDamage, spentEnergy / spentEnergyNitrousOxide (energy to remove from the tanks per frame), hasFuel, remainingFuelRatio, requiredEnergyType, registeredEnergyStorages, thermals / turbocharger / supercharger / nitrousOxideInjection (submodules, each with isExisting), clutchChildren (children per port), activeOutputPorts, engineNodeID, engineBlockNodes, torqueReactionNodes, wear*/damage*Coef (friction/idle coefficients), soundConfiguration, engineSoundID / engineSoundIDExhaust.
- Read in electrics.values: throttle (name changeable via electricsThrottleName) and throttleFactor (can be overridden by device.throttleFactor), ignitionLevel at spawn; written: electricalLoadCoef (electrical load of the starter). Calls damageTracker.setDamage('engine', …) for: engineDisabled, engineLockedUp, engineReducedTorque, overRevDanger, mildOverrevDamage, catastrophicOverrevDamage, overTorqueDanger, catastrophicOverTorqueDamage, engineHydrolocked, engineIsHydrolocking, impactDamage.
- LOOP: the engine does not update any speed (velocityUpdate = nop); torqueUpdate(dt) (updateTorque) integrates at each physics step: throttle (idle + starter + ignition + limiter + smoothing) -> curve torque x air density x forced induction x throttle map + N2O -> friction, engine brake, compression brake, starter -> new speed = outputAV1 + dt x net torque / inertia, propagated to all active output ports. updateFixedStep runs at 100 Hz (idle regulation, turbo/supercharger). updateGFX(dt) (once per frame) handles fuel, starter, stalling, over-rev/over-torque, hydrolock, thermals, sounds.
- On damage: lockUp() (engine locked) is triggered by hydrolock, catastrophic over-rev, catastrophic over-torque, friction greater than max torque, or onBreak (break beam). A locked engine has outputAVState = 0 and isBroken = true.
- BUG found: the dummy submodules (turbocharger/supercharger without jbeam) have no setAntilagCoef, getTorqueCoefs, setPartCondition or applyDeformGroupDamage; updateGFX calls device.turbocharger.setAntilagCoef(...) when antiLagCoefDesired changes, which crashes (call of nil) on an engine without a turbo if setAntilagCoef is called. The dummy nitrousOxideInjection has no updateFixedStep (not called) but getAddedTorque = nop.
- BUG found: applyDeformGroupDamage uses min(x + y) with a single argument for fastIgnitionErrorChance and slowIgnitionErrorChance (probably a forgotten cap), so nothing limits these probabilities.
- BUG found: setPartCondition assigns fastIgnitionErrorChance / slowIgnitionErrorChance with integrityState.xxx without a default value; if the integrity state table does not contain them, they become nil and updateGFX will crash. The integrity table comes from getPartCondition, which does provide them.
- Inconsistencies: new() resets the damageTracker flag 'mildOverTorqueDamage' but reset() does not (and reset resets 'overRevDanger'/'overTorqueDanger', which new() does not). getTorqueData returns finalCurveName = 1 (number) while the curves are named by string. The loophole `hasResetSounds = ... or true` in powertrain.lua makes the condition always true.
- The engine companions (combustionEngineThermals, turbocharger, supercharger, nitrousOxideInjection) are loaded with rerequire so that each engine has its own instance; they are in the factory blacklist of powertrain.lua and are therefore not standalone devices.

## Functions

| Function | Description | Line |
|---|---|---|
| `powertrain_combustionEngine.new(jbeamData)` | Combustion engine factory called by powertrain.init for a jbeam entry of type 'combustionEngine'. Reads the jbeam keys (see notes), builds the final torque curve (created by createCurve, keyed by integer RPM), the rev limiter, the idle smoothing, loads the thermals/turbo/supercharger/N2O submodules and returns the device (table with its methods). *(internal)* | 1677 |

### Parameter details

#### `powertrain_combustionEngine.new(jbeamData)`

Combustion engine factory called by powertrain.init for a jbeam entry of type 'combustionEngine'. Reads the jbeam keys (see notes), builds the final torque curve (created by createCurve, keyed by integer RPM), the rev limiter, the idle smoothing, loads the thermals/turbo/supercharger/N2O submodules and returns the device (table with its methods).

- `jbeamData` (*table*) : jbeam data of the device (already merged with the jbeam section of the same name); idleRPM, maxRPM and torque are required.
- **returns**: table The combustionEngine device.

## Fields

| Field | Type | Description |
|---|---|---|
| `deviceCategories` | table<string, boolean> | {engine = true}. Copied (shallowcopy) into each device; powertrain.getDevicesByCategory('engine') finds the engines. |
| `outputPorts` | table<integer, boolean> | Output ports announced to powertrain: {[1] = true} by default. new() replaces it with numberOfOutputPorts ports (true); validate sets to false those without a child (except port 1). |

## Class `device`

Object returned by new(jbeamData). All methods are called with a colon (device:method(...)). Methods marked internal are called by powertrain.lua.

Object `device` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `device:activateStarter()` | Turns the ignition on (ignitionCoef = 1) and engages the starter if it is not already engaged: temporarily cuts the throttle (longer when cold, x4 for diesel versus x2 below -20 °C) and plays the starter sound. | 995 |
| `device:applyDeformGroupDamage(damageAmount, groupType)` | Applies deformation damage according to the group type: 'main' increases frictions, idle error and ignition error probabilities; 'radiator', 'oilPan', 'oilRadiator' are relayed to the thermals; 'turbo' and 'supercharger' to their modules. | 830 |
| `device:applyRevLimiter(engineAV, throttle, dt)` | Limiting function chosen at construction according to revLimiterType: 'rpmDrop' (cuts the throttle until the RPM drops by revLimiterRPMDrop), 'timeBased' (cuts for revLimiterCutTime or until the drop of revLimiterMaxRPMDrop), 'soft' (progressive fade of the throttle), or disabled (returns the throttle unchanged). Called by torqueUpdate. | 660 |
| `device:beamBroke(id)` | Relays the breakage of a beam to the thermals (radiator, exhaust...). | 1068 |
| `device:calculateInertia()` | Copies cumulativeInertia, cumulativeGearRatio and maxCumulativeGearRatio from the first child (clutch); 0/1/1 without a child. | 1090 |
| `device:checkHydroLocking(dt)` | Handles flooding: if ALL waterDamage nodes are underwater (obj:inWater) the floodLevel rises proportionally to RPM, otherwise it drops more slowly; above 0.9 the engine is locked (lockUp). Sends UI messages in 10 % steps. | 329 |
| `device:cutIgnition(time)` | Cuts the ignition (zero engine torque) for a given time; used by gearboxes for gear changes. | 1015 |
| `device:deactivateStarter()` | Releases the starter; if the engine has exceeded 1.1 x starterMaxAV and the throttle cut is over, stops the sound, otherwise cuts it. | 1019 |
| `device:disable()` | Disables the engine: torque at 0, isDisabled = true, starter disabled and starter sound stopped if it was running. Signals engineDisabled. | 264 |
| `device:enable()` | Re-enables the engine (outputTorqueState = 1, isDisabled = false, starter allowed). | 279 |
| `device:exhaustEndNodesChanged(endNodes)` | Called by the thermals when the exhaust output nodes change (a pipe breaks): recomputes the node pairs, the gain and the base muffling of the exhaust sound. | 1185 |
| `device:getPartCondition(subSystem)` | Returns the integrity of the engine (or of the subsystem 'exhaust', 'radiator', 'turbocharger'): value 0..1 (minimum of the friction, idle, ignition error and thermals criteria; 0 if broken) and state table. | 890 |
| `device:getSoundConfiguration()` | Returns the soundConfiguration table (by reference 'engine'/'exhaust': blendFile, params, soundID). | 1229 |
| `device:getTorqueData()` | Computes the torque and power curves (minus friction) for each configuration (NA, N2O, Turbo, SC, combinations), sorted by priority, with the max torques/powers and their RPM. | 25 |
| `device:initEngineSound(soundID, samplePath, engineNodeIDs, offLoadGain, onLoadGain, reference)` | Creates the engine sound on the game side (core_sounds.initEngineSound queued on GE), stores the blend and sets the sound position for the debug display. | 1106 |
| `device:initExhaustSound(soundID, samplePath, exhaustNodeIDPairs, offLoadGain, onLoadGain, reference)` | Creates the exhaust sound (core_sounds.initExhaustSound) with pairs of nodes (exhaust start, end). | 1115 |
| `device:initSounds(jbeamData)` | Called by powertrain.initSounds. Creates the starter and shut-off sounds, reads soundConfig/soundConfigExhaust from the jbeam, initializes the engine and exhaust sound (equalizers, gains, fundamental frequency = cylinders/120 x RPM), creates the RPM/load smoothers, enables updateSounds, then initializes the submodule sounds. Disabled if old custom engine sounds are used. | 1452 |
| `device:lockUp()` | Locks the engine: torque and output speed forced to 0 (outputTorqueState = outputAVState = 0), isBroken = true, starter cut. Signals engineLockedUp and the broken powertrain. | 287 |
| `device:onBreak()` | Called by powertrain.breakDevice: locks the engine (lockUp). | 1064 |
| `device:registerStorage(storageName)` | Registers an energy tank: N2O tank -> nitrous module; electric battery -> starterBattery; tank of type requiredEnergyType -> list of consumed tanks. Ignores an unknown tank. | 1072 |
| `device:reset(jbeamData)` | Called by powertrain.reset: resets all dynamic states to their spawn values (idle speed if the ignition is on at spawn, frictions, idle, starter, stalling, flooding, limiters, ignition errors, damage, energies, wear), resets the submodules, recomputes getTorqueData and resets the damageTracker flags. | 1308 |
| `device:resetSounds(jbeamData)` | Called on reset: resets the sound smoothers, recomputes the exhaust sound parameters and resets the submodule sounds. | 1257 |
| `device:resetTempRevLimiter()` | Disables the temporary limiter (limit set back to maxAV x 10) and resets the exhaust sound gain/muffling offset caused by the limiter. | 648 |
| `device:scaleFriction(friction)` | Multiplies the current friction by a factor (cumulative). | 254 |
| `device:scaleFrictionInitial(friction)` | Sets friction = initialFriction x value (starts again from the jbeam friction). | 250 |
| `device:scaleOutputTorque(state, maxReduction)` | Reduces the output torque: outputTorqueState = max(state x state, min(maxReduction, state)). The minimum cannot resurrect an engine already at 0. Signals engineReducedTorque to the damageTracker. | 258 |
| `device:sendTorqueData(data)` | Sends the torque curves to the UI via guihooks.trigger('TorqueCurveChanged', data). Called by powertrain.sendTorqueData when player 1 is seated. | 243 |
| `device:setAntilagCoef(coef)` | Sets the desired anti-lag coefficient, passed to the turbo and to the exhaust sound in updateGFX (crashes if the engine has no turbocharger defined, see notes). | 1060 |
| `device:setCompressionBrakeCoef(coef)` | Sets the desired compression engine brake coefficient (applied only when the throttle is at 0). | 1056 |
| `device:setEngineSoundParameter(soundID, paramName, paramValue, reference)` | Sends an FMOD parameter to the sound (via the GE) and stores it in soundConfiguration. Does not update the aggregated parameters (main_gain, muffled) nor the starter sounds: use the list version for that. Has no effect if soundID is nil. | 1140 |
| `device:setEngineSoundParameterList(soundID, params, reference)` | Sends a complete list of sound parameters. Recomputes main_gain (capped at 0 dB) and muffled from base_gain/base_muffled and the offsets, then adjusts the volume of the starter and shut-off sounds. | 1153 |
| `device:setExhaustGainMufflingOffset(mufflingOffset, gainOffset)` | Offsets the gain and muffling of the exhaust sound (used by exhaust/muffler systems). Has no effect if the exhaust sound is not configured. | 1233 |
| `device:setExhaustGainMufflingOffsetRevLimiter(mufflingOffset, gainOffset)` | Same thing for the offset caused by the rev limiter (fields mufflingOffsetRevLimiter / gainOffsetRevLimiter). | 1245 |
| `device:setExhaustSoundNodes(soundID, exhaustNodeIDPairs)` | Changes the nodes of the exhaust sound (core_sounds.setExhaustSoundNodes) and updates their debug location. | 1128 |
| `device:setIgnition(value)` | Sets the ignition: ignitionCoef = 1 if value > 0 otherwise 0. At 0, stops the starter and, if the RPM exceeds 80 % of idle, requests the shut-off sound. | 1045 |
| `device:setPartCondition(subSystem, odometer, integrity, visual)` | Applies the wear (odometer) and integrity state to the engine (without subsystem: friction coefficients, idle, ignition errors, thermals, possible breakage) or to a subsystem: 'radiator', 'exhaust' (thermals) or 'turbocharger'. | 851 |
| `device:setSoundLocation(soundType, displayText, nodeCids)` | Stores where a sound (engine, exhaust) is located for the debug display of nodes. | 1215 |
| `device:setTempRevLimiter(revLimiterAV, maxOvershootAV)` | Enables a temporary rev limiter (lower than the normal limiter; the lowest of the two applies), useful for launch control or a speed limiter. | 641 |
| `device:torqueUpdate(dt)` | Core of the simulation, called at each physics step by powertrain.update (root to leaves). Computes throttle, torque, load, friction, engine brake, starter torque, then the new output speed passed to each active port, the returned load torque (sum of the clutches' torqueDiff), the inertia reaction applied via obj:applyTorqueAxisCouple, the spent energy and the afterfire fuel. | 728 |
| `device:updateEnergyStorageRatios()` | Distributes the consumption among the registered tanks of the right energy type that still have energy (ratio 1/N, 0 if empty). | 377 |
| `device:updateFixedStep(dt)` | Fixed 100 Hz step called from torqueUpdate: idle throttle regulation (P on the RPM error, with randomness), reset of forcedInductionCoef to 1 then update of the turbo and supercharger fixed steps. | 704 |
| `device:updateFuelUsage()` | Removes spentEnergy from the tanks (storedEnergy) according to the ratios, updates hasFuel and remainingFuelRatio; disables the engine (disable) when out of fuel and re-enables it (enable) when fuel returns. | 390 |
| `device:updateGFX(dt)` | Called once per frame by powertrain.updateGFX. Fuel consumption, RPM, starter and stalling logic, random ignition errors (slow and fast, more frequent when low on fuel), shut-off sounds, over-rev damage (possible lock-up, torque loss) and over-torque damage, lock-up if friction exceeds the available torque, compression brake and anti-lag, afterfire delays, update of the submodules (turbo, supercharger, N2O, thermals), air density, hydrolock, idle reading error, and reset of the energy counters. | 428 |
| `device:updateSoundNodeDebug()` | Redraws the debug text of the sound nodes (bdebug.setNodeDebugText). | 1220 |
| `device:updateSounds(dt)` | Dynamically assigned by initSounds only if engine/exhaust sounds are configured. Called by powertrain.updateGFX: smooths RPM and load, computes the audio load, sends obj:setEngineSound for the engine and the exhaust, and updates the turbo and supercharger sounds. | 304 |
| `device:validate()` | Called by powertrain.init after the tree is built. Checks that all children are of category clutchlike (otherwise returns false and aborts init), adds their additionalEngineInertia to the engine inertia, registers the engine in powertrain.engineData, configures the active output ports and initializes outputAV/outputTorque (idle speed if the ignition is on at spawn). | 930 |
| `device:velocityUpdate()` | Always nop for an engine (assigned by selectUpdates): the speed is computed in torqueUpdate. | dyn |

**UI events (guihooks.trigger):** `TorqueCurveChanged`

## Calls into the engine (C++)

- `obj:` `addParticleByNodesRelative`, `applyTorqueAxisCouple`, `createSFXSource2`, `cutSFX`, `getId`, `getRelativeAirDensity`, `inWater`, `playSFX`, `queueGameEngineLua`, `setEngineSound`, `setVolume`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/powertrain/combustionEngine.lua`.*

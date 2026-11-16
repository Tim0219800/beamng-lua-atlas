---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/sequentialGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `sequentialGearbox`: sequential gearbox (racing type) whose gear can only change one step at a time (plus one, minus one). No synchronizers or grinding: the gear shift takes effect at the next per-frame update (updateGFX). Like manualGearbox, the parent must be a clutch. Handles neutral (virtual mass), locking (setLock), wear/damage and "straight-cut" type gear sounds. A sequential gearbox controller calls setGearIndex.
--- Access: powertrain device type `sequentialGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_sequentialGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_sequentialGearbox = {}

--- Builds the sequential gearbox: forward and reverse ratio table, gear whine coefficients, transmission node, then goes to neutral.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:306
---@param jbeamData table jbeam data of the component (gearRatios required).
---@return table  The device (class `device`).
function powertrain_sequentialGearbox.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the gear (normal or neutral).
---@class powertrain_sequentialGearbox_device
local powertrain_sequentialGearbox_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:146
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_sequentialGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Takes the inertia and cumulative ratios of the first child; cumulativeInertia = inertia / gearRatio² (2 * maxGearRatio in neutral).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:216
function powertrain_sequentialGearbox_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:165
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_sequentialGearbox_device:getPartCondition() end

--- Creates the gear sound loops (input and output), the smoothers and the pitch coefficients, and sets the FMOD parameter c_gearboxMaxPower.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:247
---@param jbeamData table jbeam data of the component.
function powertrain_sequentialGearbox_device:initSounds(jbeamData) end

--- Marks the gearbox as broken and switches to neutral mode (virtual mass).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:134
function powertrain_sequentialGearbox_device:onBreak() end

--- Resets the state (speeds, torque, coefficients, locking) and goes back to neutral.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:281
---@param jbeamData table jbeam data of the component.
function powertrain_sequentialGearbox_device:reset(jbeamData) end

--- Resets the gear sound smoothers and values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:235
function powertrain_sequentialGearbox_device:resetSounds() end

--- Requests a gear. The gear is clamped to ±1 step around the current gear and to [minGearIndex, maxGearIndex]. From neutral, it is applied immediately; otherwise deferred to the next updateGFX.
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:112
---@param index integer Desired gear index (0 neutral, >0 forward, <0 reverse).
function powertrain_sequentialGearbox_device:setGearIndex(index) end

--- Locks (lockCoef = 0) or unlocks (1) the transmission and propagates the call to the parent if it has setLock.
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:139
---@param enabled boolean true to lock.
function powertrain_sequentialGearbox_device:setLock(enabled) end

--- Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table); calls onBreak if isBroken.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:150
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_sequentialGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: outputTorque1 = (parent torque - friction) * gearRatio * lockCoef, and feeds the sound smoothers. In neutral, integrates the virtual mass and sets the output torque to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:71
---@param dt number Time step in seconds (used in neutral).
function powertrain_sequentialGearbox_device:torqueUpdate(dt) end

--- Per-frame update: applies the pending gear change (targetGearIndex), updates gearRatio, invMaxExpectedOutputTorque and the powertrain inertia.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:95
---@param dt number Frame duration in seconds (unused).
function powertrain_sequentialGearbox_device:updateGFX(dt) end

--- Updates the volume and pitch of the gear sound loops (input and output) from smoothed speeds and torques. Called every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:19
---@param dt number Frame duration in seconds.
function powertrain_sequentialGearbox_device:updateSounds(dt) end

--- Checks that the parent is a clutch (or a fake one), otherwise logs errors and returns false. Determines transmissionNodeID and the expected values (max torque, speed, power) to normalize the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:174
---@return boolean  false if the parent is not a clutch.
function powertrain_sequentialGearbox_device:validate() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio * lockCoef (or virtual mass in neutral), written to the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/sequentialGearbox.lua:66
---@param dt number Time step in seconds (unused).
function powertrain_sequentialGearbox_device:velocityUpdate(dt) end

return powertrain_sequentialGearbox

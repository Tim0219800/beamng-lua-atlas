---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/dctGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `dctGearbox`: dual-clutch gearbox (DCT). It contains two internal clutches (lane 1 and lane 2) that each receive a preselected gear (setGearIndex1 / setGearIndex2). It is of category `clutchlike` and `gearbox`: the engine takes it directly as a child (the parent must be an engine) and reads its `torqueDiff` value. The clutch ratios come from `electrics.values.clutchRatio1` and `clutchRatio2`, driven by a DCT gearbox controller. Modes: 'neutral', 'park', or other (forward/reverse depending on the gears).
--- Access: powertrain device type `dctGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_dctGearbox
---@field deviceCategories table<string, boolean> {clutchlike=true, gearbox=true}: the engine recognizes it as a clutch.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_dctGearbox = {}

--- Builds the DCT gearbox: gear table (forward/reverse), parameters of the two clutches and of the parking lock, gear whine coefficients, then preselects gears 1 and 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:351
---@param jbeamData table jbeam data of the component (gearRatios required).
---@return table  The device (class `device`).
function powertrain_dctGearbox.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate/torqueUpdate depend on the mode (normal, neutral, park).
---@class powertrain_dctGearbox_device
local powertrain_dctGearbox_device = {}

--- Reduces the lock torque coefficient (damageLockTorqueCoef, minimum 0.2) according to the damage.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:145
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_dctGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Computes the cumulative inertias of each lane (capped at half of the engine inertia), the springs and dampings of the two clutches, the maximum clutch angle, the parking lock and the cumulative ratios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:233
function powertrain_dctGearbox_device:calculateInertia() end

--- Returns the integrity 0..1 (according to damageLockTorqueCoef) and the table {damageLockTorqueCoef}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:162
---@return number  Integrity 0..1.
---@return table  {damageLockTorqueCoef}.
function powertrain_dctGearbox_device:getPartCondition() end

--- Creates the gear sound loops (input and output), the smoothers and the pitch coefficients from the jbeam, and sets the FMOD parameter c_gearboxMaxPower.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:281
---@param jbeamData table jbeam data of the component.
function powertrain_dctGearbox_device:initSounds(jbeamData) end

--- Resets the state of the two clutches, the torques and the wear/damage coefficients, then preselects gears 1 and 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:315
---@param jbeamData table jbeam data of the component (friction).
function powertrain_dctGearbox_device:reset(jbeamData) end

--- Resets the gear sound smoothers and values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:269
function powertrain_dctGearbox_device:resetSounds() end

--- Preselects the gear of lane 1 (index clamped to [minGearIndex, maxGearIndex]) and recomputes the powertrain inertia.
---Source: lua/vehicle/powertrain/dctGearbox.lua:211
---@param index integer Gear index (0 neutral, >0 forward, <0 reverse).
function powertrain_dctGearbox_device:setGearIndex1(index) end

--- Preselects the gear of lane 2 (index clamped) and recomputes the powertrain inertia.
---Source: lua/vehicle/powertrain/dctGearbox.lua:220
---@param index integer Gear index (0 neutral, >0 forward, <0 reverse).
function powertrain_dctGearbox_device:setGearIndex2(index) end

--- Locks (lockCoef = 0) or unlocks (1) the transmission.
---Source: lua/vehicle/powertrain/dctGearbox.lua:229
---@param enabled boolean true to lock.
function powertrain_dctGearbox_device:setLock(enabled) end

--- Changes the mode ('neutral', 'park' or other) without validation, and selects the corresponding update functions. 'park' resets parkEngaged to 0.
---Source: lua/vehicle/powertrain/dctGearbox.lua:206
---@param mode string 'neutral', 'park' or other (normal operation).
function powertrain_dctGearbox_device:setMode(mode) end

--- Applies wear (lock torque from 1 to 0.7 between 30000 km and 500000 km) and damage (integrity number 0..1 or table {damageLockTorqueCoef}).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:149
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageLockTorqueCoef}.
---@param visual any Not used.
function powertrain_dctGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: computes the two clutch torques (spring on the clutch angle + damping, clamped by lockTorque), torqueDiff = sum and outputTorque1 = sum of the torques * ratios. In neutral: everything at 0. In park: parking lock torque.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:111
---@param dt number Time step in seconds.
function powertrain_dctGearbox_device:torqueUpdate(dt) end

--- Updates the volume and pitch of the gear sound loops (input and output) from smoothed speeds and torques. Called every frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:19
---@param dt number Frame duration in seconds.
function powertrain_dctGearbox_device:updateSounds(dt) end

--- Checks that the parent is an engine (otherwise logs an error and returns false). Computes the default lockTorque, and the expected values (torque, speed, power) to normalize the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:172
---@return boolean  false if the parent is not an engine.
function powertrain_dctGearbox_device:validate() end

--- Called at each physics step: inputAV = parent.outputAV1; clutchAV1/2 = outputAV1 * gearRatio1/2 * lockCoef. Does not write a speed into the parent: the engine reads torqueDiff directly.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/dctGearbox.lua:105
---@param dt number Time step in seconds.
function powertrain_dctGearbox_device:velocityUpdate(dt) end

return powertrain_dctGearbox

---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/frictionClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `frictionClutch`: friction clutch placed right after an engine (the parent must be of category `engine`). It models a locking spring on a clutch angle, damping, free play, wear/damage and a thermal model (temperature, efficiency, smoke, messages to the player, permanent damage). The clutch ratio comes from `electrics.values.clutchRatio` (1 = engaged, 0 = disengaged). A modder sets its parameters in the jbeam or reads its temperature.
--- Access: powertrain device type `frictionClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_frictionClutch
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true}.
---@field outputPorts table<integer, boolean> {[1]=true}: a single output port.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}: port 1 receives its inertia from outside (the powertrain handles the inertia on the output side).
local powertrain_frictionClutch = {}

--- Builds the frictionClutch device: wear/damage coefficients, smoothings, thermal parameters (warning, safe and destruction temperatures, mass and specific heat) and selects velocityUpdate/torqueUpdate.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:232
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_frictionClutch.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_frictionClutch_device
local powertrain_frictionClutch_device = {}

--- Increases the free play (damageClutchFreePlayCoef) and reduces the lock torque (min 0.2) according to the damage, then recomputes the inertia.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:123
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_frictionClutch_device:applyDeformGroupDamage(damageAmount) end

--- Takes the inertia and cumulative ratios of the first child, caps the inertia at half of the engine's, and computes lockSpring, lockDamp and maxClutchAngle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:178
function powertrain_frictionClutch_device:calculateInertia() end

--- Returns the integrity 0..1 (minimum of free play and lock torque, 0 if destroyed) and the corresponding state table.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:149
---@return number  Integrity 0..1.
---@return table  {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
function powertrain_frictionClutch_device:getPartCondition() end

--- Resets speeds, torque, angle, smoothers, temperature (to the environment's), wear/damage coefficients and permanent damage state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:202
---@param jbeamData table jbeam data (not reread here).
function powertrain_frictionClutch_device:reset(jbeamData) end

--- Enables or not the thermal "lock": if enabled is true, the clutch no longer heats up (clutchThermalsCoef = 0), otherwise it heats normally.
---Source: lua/vehicle/powertrain/frictionClutch.lua:119
---@param enabled boolean true to disable heating.
function powertrain_frictionClutch_device:setLock(enabled) end

--- Applies wear (according to the odometer) and damage (according to the integrity: number 0..1 or table) then recomputes the inertia. Also restores clutchPermanentlyDamaged.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:129
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters (wear from 30000 km to 500000 km).
---@param integrity number|table Number 0..1 or table {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
---@param visual any Not used.
function powertrain_frictionClutch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: integrates the clutch angle according to the speed difference, applies free play and spring/damping, clamps by lockTorque, writes outputTorque1 and accumulates the friction loss.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:83
---@param dt number Time step in seconds.
function powertrain_frictionClutch_device:torqueUpdate(dt) end

--- Non-physics update (once per frame): clutch heating and cooling, thermal efficiency, smoke, warning messages, permanent damage, sending of the GUI stream 'clutchThermalData'. Resets frictionLossPerUpdate to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:19
---@param dt number Frame duration in seconds.
function powertrain_frictionClutch_device:updateGFX(dt) end

--- Checks that the parent is an engine (deviceCategories.engine), otherwise logs errors and returns false. Computes the default lockTorque = 1.25 * max engine torque + engine inertia * max speed (rad/s).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:166
---@return boolean  false if the parent is not an engine.
function powertrain_frictionClutch_device:validate() end

--- Called at each physics step: inputAV = parent.outputAV1.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/frictionClutch.lua:79
---@param dt number Time step in seconds (unused).
function powertrain_frictionClutch_device:velocityUpdate(dt) end

return powertrain_frictionClutch

---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/centrifugalClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain device type `centrifugalClutch`: centrifugal clutch (categories clutchlike and clutch) placed directly after a combustion engine. It engages automatically with the input RPM (between engageRPMStart and engageRPMEnd): the engagement ratio clutchRatio goes from 0 to 1, and the transmitted torque follows a spring/damper on the clutch angle, limited by lockTorque. It also models heating (temperature, thermal efficiency, smoke, permanent damage) and wear. Useful for scooters, karts, lawn mowers... The parent must be an engine (category engine) and it has a single child on port 1.
--- Access: powertrain device type `centrifugalClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_centrifugalClutch
---@field deviceCategories table<string, boolean> {clutchlike = true, clutch = true}. clutchlike is required by the combustionEngine engine for its children.
---@field outputPorts table<integer, boolean> {[1] = true}: a single output port.
---@field requiredExternalInertiaOutputs integer[] {1}: powertrain adds a dummy shaft on this port if no child is connected to it.
local powertrain_centrifugalClutch = {}

--- Device factory called by powertrain.init for a jbeam entry of type 'centrifugalClutch'. Reads the jbeam keys (see notes) and returns the device.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:232
---@param jbeamData table jbeam data of the device.
---@return table  The centrifugalClutch device.
function powertrain_centrifugalClutch.new(jbeamData) end

--- Object returned by new(jbeamData). Methods called by powertrain.lua.
---@class powertrain_centrifugalClutch_device
local powertrain_centrifugalClutch_device = {}

--- Applies deformation damage: increases the free play and reduces the lock torque (floor 0.2), then recomputes the inertia.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:123
---@param damageAmount number Damage added.
function powertrain_centrifugalClutch_device:applyDeformGroupDamage(damageAmount) end

--- Takes over the child's inertia and ratios (inertia capped at half of the engine's) and recomputes lockSpring, lockDamp and maxClutchAngle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:178
function powertrain_centrifugalClutch_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if permanently damaged) and the state table {damageClutchFreePlayCoef, damageLockTorqueCoef, clutchPermanentlyDamaged}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:149
---@return number  Integrity 0..1.
---@return table  Detailed state.
function powertrain_centrifugalClutch_device:getPartCondition() end

--- Resets all states to their initial values (speeds, angle, outside temperature, wear and damage) then selects the update functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:202
---@param jbeamData table jbeam data (unused here).
function powertrain_centrifugalClutch_device:reset(jbeamData) end

--- Locks/unlocks the clutch heating: enabled = true sets clutchThermalsCoef to 0 (dissipated energy is no longer counted as heat), false sets it to 1.
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:119
---@param enabled boolean true to disable heating.
function powertrain_centrifugalClutch_device:setLock(enabled) end

--- Applies wear (odometer) and integrity (number or state table): free play and lock torque coefficients, permanent damage state; recomputes the inertia.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:129
---@param subSystem string|nil Not used.
---@param odometer number Cumulative wear.
---@param integrity number|table Integrity 0..1 or state table from getPartCondition.
---@param visual any Not used.
function powertrain_centrifugalClutch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Physics step (torques): computes clutchRatio from the input RPM, the clutch angle and the transmitted torque (torqueDiff = outputTorque1), and accumulates the friction loss.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:84
---@param dt number Physics step in seconds.
function powertrain_centrifugalClutch_device:torqueUpdate(dt) end

--- Once per frame: computes the energy dissipated in the clutch and its cooling, updates clutchTemperature (clamped to [outside temperature, maxClutchTemp]) and thermalEfficiency, produces smoke and warning messages, signals permanent damage, resets frictionLossPerUpdate to 0 and publishes 'clutchThermalData'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:20
---@param dt number Time step in seconds.
function powertrain_centrifugalClutch_device:updateGFX(dt) end

--- Checks that the parent is an engine (category engine), otherwise logs an error and returns false (aborts init). Computes the default lockTorque.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:166
---@return boolean  false if the parent is not an engine.
function powertrain_centrifugalClutch_device:validate() end

--- Physics step (speeds): inputAV = output speed of the parent (outputAV1 of the engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/centrifugalClutch.lua:80
---@param dt number Physics step in seconds.
function powertrain_centrifugalClutch_device:velocityUpdate(dt) end

return powertrain_centrifugalClutch

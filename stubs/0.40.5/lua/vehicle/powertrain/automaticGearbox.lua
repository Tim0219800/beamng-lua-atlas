---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/automaticGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain device type `automaticGearbox`: simplified planetary/hydraulic automatic gearbox. It has indexed gears (gearIndex), drive / neutral / park modes, a progressive interpolation of the ratio during shifts (simulates the opening/closing of internal clutches), friction, a loss on upshifts, a parking lock, an anti-rollback viscous damper and gear whine sounds. The parent must be a viscous coupling device (category viscouscoupling, in practice a torque converter). Gear selection is driven by a controller (gearbox controller), not by this module.
--- Access: powertrain device type `automaticGearbox` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_automaticGearbox
---@field deviceCategories table<string, boolean> {gearbox = true}.
---@field outputPorts table<integer, boolean> {[1] = true}.
---@field requiredExternalInertiaOutputs integer[] {1}: powertrain adds a dummy shaft on this port if nothing is connected to it.
local powertrain_automaticGearbox = {}

--- Device factory called by powertrain.init for the type 'automaticGearbox'. Builds the ratio, sound, parking lock and anti-rollback tables, then selects gear 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:366
---@param jbeamData table jbeam data; gearRatios is mandatory.
---@return table  The automaticGearbox device.
function powertrain_automaticGearbox.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_automaticGearbox_device
local powertrain_automaticGearbox_device = {}

--- Applies deformation damage: increases friction, reduces the shift speed (floor 0.2).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:161
---@param damageAmount number Damage added.
function powertrain_automaticGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Computes the cumulative inertia referred to the input (child inertia / ratio²), the parking lock parameters and the cumulative ratios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:257
function powertrain_automaticGearbox_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and the state table {damageFrictionCoef, damageGearRatioChangeRateCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:188
---@return number  Integrity 0..1.
---@return table  Detailed state.
function powertrain_automaticGearbox_device:getPartCondition() end

--- Creates the whine sound loops (input/output) and their smoothers from the gearWhine* jbeam keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:292
---@param jbeamData table Jbeam data.
function powertrain_automaticGearbox_device:initSounds(jbeamData) end

--- Resets everything to the initial state (speeds, 'drive' mode, wear, damage, parking) and selects gear 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:328
---@param jbeamData table jbeam data (gearRatio, friction).
function powertrain_automaticGearbox_device:reset(jbeamData) end

--- Resets the gear noise smoothers and values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:280
function powertrain_automaticGearbox_device:resetSounds() end

--- Selects a gear by its index (bounded to [minGearIndex, maxGearIndex]). The real ratio is then interpolated in updateGFX; during the shift the torque is reduced by shiftEfficiency.
---Source: lua/vehicle/powertrain/automaticGearbox.lua:241
---@param index integer Gear index (0 neutral, positive forward, negative reverse).
---@param gearChangeTime number|nil Desired shift duration in s (at least minimumGearChangeTime = jbeam gearChangeTime).
function powertrain_automaticGearbox_device:setGearIndex(index, gearChangeTime) end

--- Enables (true) or disables the lock: lockCoef = 0 disconnects the input and leaves only the parking lock, 1 normal operation; resets parkClutchAngle to 0.
---Source: lua/vehicle/powertrain/automaticGearbox.lua:252
---@param enabled boolean true to disconnect/lock.
function powertrain_automaticGearbox_device:setLock(enabled) end

--- Changes the mode ('drive', 'neutral' or 'park') and selects the corresponding update functions.
---Source: lua/vehicle/powertrain/automaticGearbox.lua:236
---@param mode string 'drive', 'neutral' or 'park'.
function powertrain_automaticGearbox_device:setMode(mode) end

--- Applies wear and integrity (number or table): friction and shift speed coefficients; calls onBreak if isBroken (nonexistent method, see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:166
---@param subSystem string|nil Not used.
---@param odometer number Cumulative wear.
---@param integrity number|table Integrity 0..1 or state table.
---@param visual any Not used.
function powertrain_automaticGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Physics step (torques). Computes outputTorque1 according to the mode, the friction, the parking lock and the anti-rollback, and feeds the gear noise smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:79
---@param dt number Physics step in seconds.
function powertrain_automaticGearbox_device:torqueUpdate(dt) end

--- Once per frame: advances gearRatio toward desiredGearRatio at the speed gearRatioChangeRate (influenced by wear/damage), recomputes the inertia when the ratio is reached, updates isShifting*, and engages park if mode is 'park' and speed is low.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:115
---@param dt number Time step in seconds.
function powertrain_automaticGearbox_device:updateGFX(dt) end

--- Called by powertrain.updateGFX: updates volume and pitch of the input and output gear whine loops.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:19
---@param dt number Time step in seconds.
function powertrain_automaticGearbox_device:updateSounds(dt) end

--- Checks that the parent is a viscous coupling (viscouscoupling); computes the expected torques/speeds (from the grandparent engine if present, otherwise 100 N·m and 6000 RPM) to normalize the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:204
---@return boolean  false if the parent is not a viscous coupling.
function powertrain_automaticGearbox_device:validate() end

--- Physics step (velocities). Function selected according to the mode: updateVelocity (drive), neutralUpdateVelocity or parkUpdateVelocity (virtual mass). Writes the input speed into the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/automaticGearbox.lua:74
---@param dt number Physics step in seconds.
function powertrain_automaticGearbox_device:velocityUpdate(dt) end

return powertrain_automaticGearbox

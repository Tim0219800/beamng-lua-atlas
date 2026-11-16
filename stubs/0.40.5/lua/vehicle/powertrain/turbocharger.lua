---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/turbocharger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Turbo supercharging subsystem, attached to an engine (it is not a device of the drivetrain chain: init(device, jbeamData) receives the engine). Simulates the turbo shaft speed (exhaust gas torque - back pressure - friction, inertia), the boost pressure via a pressure/turbo-RPM curve, a wastegate (regulated by a PID), an intake blow-off valve (BOV/flutter), antilag, the turbo temperature (damage) and the sounds (whine, spin, BOV). Writes the engine's forcedInductionCoef coefficient and several electrics values (turboRPM, turboSpin, turboBoost, turboBoostMax, turboRpmRatio).
--- Access: powertrain device type `turbocharger` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_turbocharger
---@field isExisting boolean Always true: lets the engine know that a turbo module exists.
---@field turboAV number|nil Angular speed of the turbo shaft in rad/s; nil before init, updated at each physics step.
local powertrain_turbocharger = {}

--- Worsens friction and reduces exhaust power when a deform group of the turbo is damaged; reports 'inductionSystemDamaged' to the damage tracker.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:115
---@param damageAmount number Damage amount.
function powertrain_turbocharger.applyDeformGroupDamage(damageAmount) end

--- Returns the turbo integrity.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:136
---@return number  Integrity 0..1.
---@return table  {damageFrictionCoef, damageExhaustPowerCoef}.
function powertrain_turbocharger.getPartCondition() end

--- Estimates, for each RPM of the engine torque curve, the torque gain coefficient provided by the turbo (assuming the turbo at steady state and the wastegate at its average setpoint). Used by the power curve tools.
---Source: lua/vehicle/powertrain/turbocharger.lua:507
---@return table<integer, number>  Table keyed by rpm+1: coefficient (1 = no gain).
function powertrain_turbocharger.getTorqueCoefs() end

--- Initializes the turbo for a given engine: copies the jbeam, builds the pressure/exhaust/efficiency curves (createCurve), the per-gear wastegate tables, the smoothers, the coefficients and installs updateGFX/updateFixedStep/updateSounds. Called by the engine at initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:324
---@param device table Engine device to which the turbo is attached.
---@param jbeamData table|nil 'turbocharger' jbeam table (see notes). If nil, the turbo stays inactive.
function powertrain_turbocharger.init(device, jbeamData) end

--- Creates the hiss and whine audio sources on the engine node and reads the sound coefficients from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:482
---@param jbeamData table Unused (the internal copy of the jbeam is used).
function powertrain_turbocharger.initSounds(jbeamData) end

--- Resets the turbo state (speed, pressures, BOV, wastegate PID, antilag, damage/wear coefficients) and the smoothers. Called on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:290
---@param jbeamData table Not used.
function powertrain_turbocharger.reset(jbeamData) end

--- Does nothing (empty function), called on sound reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:504
---@param jbeamData table Not used.
function powertrain_turbocharger.resetSounds(jbeamData) end

--- Sets the antilag level (spinning the turbo shaft back up during throttle lifts): antilag power = coef * maxAntilagPower. Also taken into account in the load computation for the BOV.
---Source: lua/vehicle/powertrain/turbocharger.lua:533
---@param coef number Coefficient 0..1.
function powertrain_turbocharger.setAntilagCoef(coef) end

--- Applies wear (odometer) and integrity of a part loaded from a save.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:121
---@param odometer number Part odometer.
---@param integrity number|table Integrity 0..1 or table {damageFrictionCoef, damageExhaustPowerCoef}.
---@param visual any Not used.
function powertrain_turbocharger.setPartCondition(odometer, integrity, visual) end

--- Shifts the wastegate pressure setpoint (boost control).
---Source: lua/vehicle/powertrain/turbocharger.lua:529
---@param offset number Offset in psi (added to the setpoint, can be negative).
function powertrain_turbocharger.setWastegateOffset(offset) end

--- Physics step: wastegate PID, shaft torque balance (exhaust + antilag, back pressure, friction), turbo speed, raw then smoothed pressure, and application to the engine's forcedInductionCoef. Replaces the initial nop after init. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Physics step (s).
function powertrain_turbocharger.updateFixedStep(dt) end

--- Graphics frame: turbo temperature and damage, BOV/flutter logic and its sounds, wastegate setpoint according to the gear, electrics values (turboRPM, turboSpin, turboRpmRatio, turboBoost) and 'forcedInductionInfo' stream to the UI. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Frame time step (s).
function powertrain_turbocharger.updateGFX(dt) end

--- Sets the volume/pitch of the pressure hiss and the rotation noise (whine) of the turbo. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Time step (s). Unused.
function powertrain_turbocharger.updateSounds(dt) end

return powertrain_turbocharger

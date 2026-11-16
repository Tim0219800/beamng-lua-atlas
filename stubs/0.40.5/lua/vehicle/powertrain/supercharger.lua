---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/supercharger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mechanical supercharger subsystem attached to an engine: the supercharger is driven by the crankshaft (ratio gearRatio, with a progressive clutch between clutchEngageRPM and clutchDisengageRPM). Three types: 'roots', 'screws', 'centrifugal', each with its own efficiency curve and pulsation level. Computes the boost pressure (psi/1000 RPM, boostController curve according to throttle opening, blow-off valve), applies it to engine.forcedInductionCoef and takes a torque loss proportional to engine speed (crankLossPer1kRPM). Also generates the supercharger whine.
--- Access: powertrain device type `supercharger` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_supercharger
---@field isExisting boolean Always true: tells the engine that a supercharger exists.
local powertrain_supercharger = {}

--- Reduces the delivered pressure (damagePressureCoef, down to -0.1) when a deform group is damaged, and reports 'inductionSystemDamaged'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:72
---@param damageAmount number Damage amount.
function powertrain_supercharger.applyDeformGroupDamage(damageAmount) end

--- Returns the supercharger integrity.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:91
---@return number  Integrity 0..1.
---@return table  {damagePressureCoef}.
function powertrain_supercharger.getPartCondition() end

--- Estimates the supercharger torque gain coefficient for each RPM of the engine torque curve (clutch and ratio taken into account).
---Source: lua/vehicle/powertrain/supercharger.lua:320
---@return table<integer, number>  Table keyed by rpm+1: coefficient (1 = no gain).
function powertrain_supercharger.getTorqueCoefs() end

--- Initializes the supercharger for an engine: reads the jbeam, generates the pressure curve and the boostController curve, computes the maximum supercharger speed and installs updateGFX/updateFixedStep. If jbeamData is nil, disables updateGFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:209
---@param device table Engine device.
---@param jbeamData table|nil 'supercharger' jbeam table.
function powertrain_supercharger.init(device, jbeamData) end

--- Creates the supercharger whine sound (soundObj) on the engine node and computes the volume and pitch coefficients.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:183
---@param jbeamData table 'supercharger' jbeam table.
function powertrain_supercharger.initSounds(jbeamData) end

--- Resets the pressure smoother and the damage and wear coefficients, and clears 'superchargerDamaged'.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:202
---@param jbeamData table Not used.
function powertrain_supercharger.reset(jbeamData) end

--- Does nothing (empty function).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:180
---@param jbeamData table Not used.
function powertrain_supercharger.resetSounds(jbeamData) end

--- Sets the pressure above which the blow-off valve limits the supercharger pressure.
---Source: lua/vehicle/powertrain/supercharger.lua:102
---@param pressurePSI number Blow-off pressure in psi.
function powertrain_supercharger.setBypassPressure(pressurePSI) end

--- Applies wear (odometer: pressure down to 50% at 1e9) and integrity of a part loaded from a save. See the bug noted on damagePressureCoef.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:77
---@param odometer number Part odometer.
---@param integrity number|table Integrity 0..1 or state table.
---@param visual any Not used.
function powertrain_supercharger.setPartCondition(odometer, integrity, visual) end

--- Physics step: multiplies assignedEngine.forcedInductionCoef by the supercharger torque gain (pressure) minus the crankshaft loss. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:dyn
---@param dt number Physics step (s). Unused.
function powertrain_supercharger.updateFixedStep(dt) end

--- Graphics frame: progressive clutch state, supercharger speed and RPM, pulsations, pressure with blow-off valve and smoothing, torque loss, electrics.superchargerBoost and 'forcedInductionInfo' stream. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:dyn
---@param dt number Frame time step (s).
function powertrain_supercharger.updateGFX(dt) end

--- Sets the whine volume and pitch according to the supercharger pressure and speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/supercharger.lua:106
---@param dt number Time step (s). Unused.
function powertrain_supercharger.updateSounds(dt) end

return powertrain_supercharger

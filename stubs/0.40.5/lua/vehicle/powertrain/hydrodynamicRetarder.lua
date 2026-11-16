---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydrodynamicRetarder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `hydrodynamicRetarder`: hydrodynamic retarder (truck/bus engine brake) mounted as a branch on the shaft. It has a virtual rotor (inertia `virtualInertia`) whose speed `outputAV1` it integrates itself; it returns `inputAV = outputAV1 * gearRatio` to its parent. When the requested coefficient is > 0, it applies a braking torque read from the `brakeTorque` curve (torque according to the rotor speed), smoothed by `strengthSmoothing`. The dissipated power can be returned to the engine coolant (`thermals.additionalCoolantEnergyPerStep`). Categories `retarder` and `torqueConsumer`, without an output port.
--- Access: powertrain device type `hydrodynamicRetarder` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_hydrodynamicRetarder
---@field deviceCategories table<string, boolean> {retarder=true, torqueConsumer=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_hydrodynamicRetarder = {}

--- Builds the retarder: reads and validates the brakeTorque curve, builds the per-RPM curve with the decay zone, sets the virtual inertia and the smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:154
---@param jbeamData table jbeam data of the component (brakeTorque required).
---@return table  The device (class `device`).
function powertrain_hydrodynamicRetarder.new(jbeamData) end

--- Object returned by new(jbeamData). velocityUpdate and torqueUpdate are set by selectUpdates.
---@class powertrain_hydrodynamicRetarder_device
local powertrain_hydrodynamicRetarder_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:75
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_hydrodynamicRetarder_device:applyDeformGroupDamage(damageAmount) end

--- cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio; computes invVirtualInertia.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:112
function powertrain_hydrodynamicRetarder_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:94
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_hydrodynamicRetarder_device:getPartCondition() end

--- Creates the retarder sound loop (disabled at start) and the speed smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:126
---@param jbeamData table jbeam data of the component (retarderWhineEvent, retarderWhinePitchCoefSmoothing).
function powertrain_hydrodynamicRetarder_device:initSounds(jbeamData) end

--- Marks the retarder as broken and switches to the torque version without braking.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:107
function powertrain_hydrodynamicRetarder_device:onBreak() end

--- Resets speeds, torque, requested coefficient, smoother, wear/damage coefficients; rereads friction and dynamicFriction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:136
---@param jbeamData table jbeam data of the component.
function powertrain_hydrodynamicRetarder_device:reset(jbeamData) end

--- Resets the sound speed smoother.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:122
function powertrain_hydrodynamicRetarder_device:resetSounds() end

--- Applies wear (odometer, coefficient from 1 to 2) and damage (integrity number 0..1 or table {damageFrictionCoef, isBroken}); calls onBreak if isBroken.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:79
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or state table.
---@param visual any Not used.
function powertrain_hydrodynamicRetarder_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Sets the requested braking force (0 = none, 1 = maximum of the curve). The actual torque follows via a smoother. To be called from a controller (retarder lever).
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:17
---@param coef number|nil Coefficient 0..1 (clamped; nil = 0).
function powertrain_hydrodynamicRetarder_device:setRetarderCoef(coef) end

--- Called at each physics step: integrates the rotor speed with the parent torque (minus friction) plus the braking torque, and adds the dissipated power to the energy of the cooling circuit. "Broken or no curve" version: without braking.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:dyn
---@param dt number Time step in seconds.
function powertrain_hydrodynamicRetarder_device:torqueUpdate(dt) end

--- Per-frame update: does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:66
---@param dt number Frame duration in seconds (unused).
function powertrain_hydrodynamicRetarder_device:updateGFX(dt) end

--- Sets the volume, pitch and color of the retarder whine sound from the smoothed speed and the requested coefficient.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:21
---@param dt number Frame duration in seconds.
function powertrain_hydrodynamicRetarder_device:updateSounds(dt) end

--- Called after the powertrain is built; returns false if the brakeTorque curve is missing or invalid.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:103
---@return boolean  true if a valid braking curve exists.
function powertrain_hydrodynamicRetarder_device:validate() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio, written into the parent's speed field.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/hydrodynamicRetarder.lua:31
---@param dt number Time step in seconds (unused).
function powertrain_hydrodynamicRetarder_device:velocityUpdate(dt) end

return powertrain_hydrodynamicRetarder

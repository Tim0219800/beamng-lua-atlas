---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/linearActuator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `linearActuator`: screw jack (mechanical linear actuator) driven by a shaft. It converts the input torque into axial force on beams (obj:screwBeam) identified by the `beamTags` tags and measures the extension speed, which it returns to its parent as a rotation speed (speed / screw lead). Category `torqueConsumer`, without an output port. Useful for dump bed, platform or electric cylinder. It tracks the extension (`currentExtend`, `currentExtendPercent`).
--- Access: powertrain device type `linearActuator` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_linearActuator
---@field deviceCategories table<string, boolean> {torqueConsumer=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_linearActuator = {}

--- Builds the screw jack: screw geometry (diameter, lead, helix angle), extension limits, speed limit and the list of driving beams from the beamTags tags.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:128
---@param jbeamData table jbeam data of the component (leadMillimeterPerRevolution required).
---@return table  The device (class `device`).
function powertrain_linearActuator.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_linearActuator_device
local powertrain_linearActuator_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:52
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_linearActuator_device:applyDeformGroupDamage(damageAmount) end

--- Purely virtual inertia: cumulativeInertia = virtualInertia / gearRatio²; cumulative ratios = gearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:90
function powertrain_linearActuator_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:71
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_linearActuator_device:getPartCondition() end

--- Marks the actuator as broken (isBroken = true) and reselects the updates (no real effect).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:84
function powertrain_linearActuator_device:onBreak() end

--- Resets speeds, extension, wear/damage coefficients and isBroken; rereads gearRatio and friction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:103
---@param jbeamData table jbeam data of the component.
---@return table  The device.
function powertrain_linearActuator_device:reset(jbeamData) end

--- Applies wear (coefficient from 1 to 1.5) and damage according to the odometer and the integrity; calls onBreak if isBroken.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:56
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_linearActuator_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: computes the screw force from the parent torque (minus friction), applies it to each beam via obj:screwBeam with minExtend/maxExtend/speedLimit, then updates velocity, currentExtend and currentExtendPercent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:21
function powertrain_linearActuator_device:torqueUpdate() end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:80
---@return boolean  true.
function powertrain_linearActuator_device:validate() end

--- Called at each physics step: inputAV = velocity * invLeadRadian * gearRatio, written to the parent; outputAV1 = 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/linearActuator.lua:14
---@param dt number Time step in seconds (unused).
function powertrain_linearActuator_device:velocityUpdate(dt) end

return powertrain_linearActuator

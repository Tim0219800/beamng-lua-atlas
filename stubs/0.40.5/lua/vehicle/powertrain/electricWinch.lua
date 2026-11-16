---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricWinch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `electricWinch`: very basic electric winch, of category `winch` and `torqueConsumer`, without an output port. Its code is a prototype: at each physics step it pulls on the beam tagged `ropeTest` with a fixed force of 500000 N multiplied by the ignition level, with no jbeam tuning parameter. A modder does not use it in practice; see hydraulicWinch (empty) and linearActuator for real actuators.
--- Access: powertrain device type `electricWinch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_electricWinch
---@field deviceCategories table<string, boolean> {winch=true, torqueConsumer=true}.
---@field outputPorts table Empty table: no output port.
local powertrain_electricWinch = {}

--- Builds the winch device with the standard fields (gearRatio, friction, wear/damage coefficients, inertia) and the update functions. It does not call selectUpdates: velocityUpdate and torqueUpdate are set directly.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:77
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_electricWinch.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_electricWinch_device
local powertrain_electricWinch_device = {}

--- Increases the damage friction coefficient (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:24
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_electricWinch_device:applyDeformGroupDamage(damageAmount) end

--- Sets cumulativeInertia = 0 (zero output inertia) and the cumulative ratios (maxCumulativeGearRatio stays nil, see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:52
function powertrain_electricWinch_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and the table {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:43
---@return number  Integrity 0..1.
---@return table  Saveable state.
function powertrain_electricWinch_device:getPartCondition() end

--- Resets speeds, torque, cumulative inertia, wear/damage coefficients and isBroken; rereads friction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:61
---@param jbeamData table jbeam data of the component.
function powertrain_electricWinch_device:reset(jbeamData) end

--- Applies wear and damage according to the odometer and the integrity; calls onBreak if the state indicates isBroken, but this device does not define onBreak.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:28
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_electricWinch_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Called at each physics step: sets outputTorque1 to 0 and actuates the first beam tagged 'ropeTest' with a force of -ignitionLevel * 500000 N, speed limit 10 and stroke 0 to 100.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:15
function powertrain_electricWinch_device:torqueUpdate() end

--- Called at each physics step: inputAV = outputAV1 * gearRatio, written to the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/electricWinch.lua:10
---@param dt number Time step in seconds (unused).
function powertrain_electricWinch_device:velocityUpdate(dt) end

return powertrain_electricWinch

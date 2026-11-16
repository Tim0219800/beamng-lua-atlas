---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/shaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `shaft`: a drive shaft with a fixed reduction ratio, friction losses and cumulative inertia. It can also be linked directly to a wheel (jbeam key `connectedWheel`), in which case it applies the propulsion torque and the friction torque to the wheel. It can be disconnected (mode `disconnected`) or broken; it then accelerates a virtual mass instead of the downstream drivetrain. A modder uses it via the `powertrain` jbeam; the module only exposes `new`.
--- Access: powertrain device type `shaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_shaft
---@field deviceCategories table<string, boolean> Categories of the component: {shaft=true}. Used by searches such as 'walk up to the parent differential'.
---@field outputPorts table<integer, boolean> Default output ports: {[1]=true}. Copied into each device (replaced if outputPortOverride).
local powertrain_shaft = {}

--- Builds a shaft device from a jbeam entry. Reads gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect and breakTriggerBeam, chooses the output field names and selects the update functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:277
---@param jbeamData table jbeam data of the component (name, type, gearRatio, friction, connectedWheel…).
---@return table  The device (class `device`).
function powertrain_shaft.new(jbeamData) end

--- Object returned by new(jbeamData). The methods are set on the instance; velocityUpdate/torqueUpdate are assigned dynamically.
---@class powertrain_shaft_device
local powertrain_shaft_device = {}

--- Increases damageFrictionCoef proportionally to the damage received (0.01 of damage = +0.1).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:88
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_shaft_device:applyDeformGroupDamage(damageAmount) end

--- Computes cumulativeInertia, invCumulativeInertia, cumulativeGearRatio and maxCumulativeGearRatio. Takes the inertia of the first child, or the inertia of the wheel nodes around the axis (sum of mass * distance²), or virtualInertia. Divided by gearRatio². Called by the powertrain during init.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:219
function powertrain_shaft_device:calculateInertia() end

--- Returns the state of the part for saving: integrity 0..1 (0 if broken) and table {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:107
---@return number  Integrity 0..1.
---@return table  {damageFrictionCoef, isBroken}.
function powertrain_shaft_device:getPartCondition() end

--- Defined only if the shaft has several modes. Returns the stateData table containing the key '<name>Mode' = current mode.
---Source: lua/vehicle/powertrain/shaft.lua:197
---@return table  stateData.
function powertrain_shaft_device:getState() end

--- Marks the shaft as broken (isBroken = true) and switches to the disconnected update functions. Called by the broken beams system / setPartCondition.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:213
function powertrain_shaft_device:onBreak() end

--- Resets the dynamic state (inputAV, virtualMassAV, wear coefficients, isBroken, outputs to 0) and rereads gearRatio and friction from jbeamData. Called on vehicle reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:253
---@param jbeamData table jbeam data of the component.
---@return table  The device.
function powertrain_shaft_device:reset(jbeamData) end

--- Changes the mode ('connected' or 'disconnected') if it is in availableModes. Ignored otherwise. A physically disconnected shaft stays 'disconnected'. Reselects the update functions and updates the UI button.
---Source: lua/vehicle/powertrain/shaft.lua:178
---@param mode string 'connected' or 'disconnected' (available only if canDisconnect).
function powertrain_shaft_device:setMode(mode) end

--- Applies the wear/damage state of a part: wearFrictionCoef according to the odometer, damageFrictionCoef according to the integrity. If the integrity is a table with isBroken, calls onBreak.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:92
---@param subSystem any Subsystem (unused here).
---@param odometer number Distance traveled in meters (scale 30000 km to 1000000 km for a wear coefficient of 1 to 1.5).
---@param integrity number|table Number 0..1, or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_shaft_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Defined only if the shaft has several modes. Restores the mode from data['<name>Mode'] if it is a string different from the current mode.
---Source: lua/vehicle/powertrain/shaft.lua:202
---@param data table|nil State table produced by getState.
function powertrain_shaft_device:setState(data) end

--- Called at each physics step, from upstream to downstream. Computes the output torque = (parent torque - friction losses) * gearRatio; for a wheel, writes propulsionTorque and frictionTorque. Disconnected version: accelerates the virtual mass and sets outputTorque to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:58
---@param dt number Time step in seconds (used by the disconnected versions).
function powertrain_shaft_device:torqueUpdate(dt) end

--- If the shaft has several modes and uiSimpleModeControl, updates the simple UI button (extensions.ui_simplePowertrainControl.setButton) that calls powertrain.toggleDeviceMode(name).
---Source: lua/vehicle/powertrain/shaft.lua:157
function powertrain_shaft_device:updateSimpleControlButtons() end

--- Called by the powertrain after construction. Forces disconnected mode if isPhysicallyDisconnected. For a shaft with no child or wheel, takes the default virtualInertia of the ancestor differential. For a wheel shaft, finds the ancestor torsionReactor and declares its reaction nodes to the wheel (setEngineAxisCoupleNodes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:116
---@return boolean  Always true.
function powertrain_shaft_device:validate() end

--- Called at each physics step, from downstream to upstream. Computes inputAV = outputAV * gearRatio and writes it into the parent's speed field. Wheel version: reads wheel.angularVelocity * wheelDirection. Disconnected version: uses virtualMassAV instead.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/shaft.lua:52
---@param dt number Time step in seconds (unused except by convention).
function powertrain_shaft_device:velocityUpdate(dt) end

return powertrain_shaft

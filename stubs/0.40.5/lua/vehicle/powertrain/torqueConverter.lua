---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/torqueConverter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hydraulic torque converter of an automatic gearbox, with lockup clutch. It plugs in behind an engine (the parent must be a device of category engine) and transmits a torque that depends on the speed difference between pump (input) and turbine (output), with torque multiplication up to stallTorqueRatio at low turbine speed. Lockup is driven by the electrics value 'lockupClutchRatio' (0 open, 1 locked). A modder uses it through the powertrain jbeam (type torqueConverter) and reads device.outputTorque1 / inputAV / outputAV1.
--- Access: powertrain device type `torqueConverter` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_torqueConverter
---@field deviceCategories table<string, boolean> Categories: clutchlike, viscouscoupling.
---@field outputPorts table<integer, boolean> Output ports: {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> Outputs whose inertia is supplied externally: {1}.
local powertrain_torqueConverter = {}

--- Builds a torque converter from the component's jbeam definition.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/torqueConverter.lua:136
---@param jbeamData table Component jbeam data (name, type, inputName, inputIndex, keys listed in notes).
---@return table  Device object (see the device class).
function powertrain_torqueConverter.new(jbeamData) end

--- Object returned by new(jbeamData). Useful fields: inputAV (rad/s, pump speed = engine output speed), outputAV1 (rad/s, turbine speed, written by the child), outputTorque1 (N·m), torqueDiff (N·m, reaction torque on the input), lockupClutchAngle (rad), impellerClutchCoef, isBroken, mode.
---@class powertrain_torqueConverter_device
local powertrain_torqueConverter_device = {}

--- Reduces the lockup torque when a deform group is damaged (removes up to 0.05 per 0.01 of damage) then recomputes the inertia.
---Source: lua/vehicle/powertrain/torqueConverter.lua:52
---@param damageAmount number Damage amount.
function powertrain_torqueConverter_device:applyDeformGroupDamage(damageAmount) end

--- Computes cumulative inertia, cumulative ratios, lockup stiffness and damping (lockupClutchSpring/Damp) and the maximum lockup angle from the first child.
---Source: lua/vehicle/powertrain/torqueConverter.lua:97
function powertrain_torqueConverter_device:calculateInertia() end

--- Returns the part condition state.
---Source: lua/vehicle/powertrain/torqueConverter.lua:73
---@return number  Integrity 0..1.
---@return table  {damageLockupClutchTorqueCoef}.
function powertrain_torqueConverter_device:getPartCondition() end

--- Resets speeds, torque, break state, lockup angle, damage/wear coefficients.
---Source: lua/vehicle/powertrain/torqueConverter.lua:117
---@param jbeamData table jbeam data (unused here).
---@return table  The device itself.
function powertrain_torqueConverter_device:reset(jbeamData) end

--- Stores the mode and reinstalls the velocityUpdate/torqueUpdate functions (the mode has no other effect in this file).
---Source: lua/vehicle/powertrain/torqueConverter.lua:92
---@param mode any Requested mode (not interpreted here).
function powertrain_torqueConverter_device:setMode(mode) end

--- Applies a wear/integrity state (part save set): wear according to the odometer and damage coefficient according to the integrity.
---Source: lua/vehicle/powertrain/torqueConverter.lua:58
---@param subSystem any Subsystem (unused).
---@param odometer number Part odometer.
---@param integrity number|table Integrity 0..1, or table {damageLockupClutchTorqueCoef}.
---@param visual any Not used.
function powertrain_torqueConverter_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Physics step, torques stage: computes the hydraulic torque (smoothed K factor, limited to converterTorque), the torque multiplication (up to stallTorqueRatio) and the lockup torque (spring/damper limited to lockupClutchTorque), then outputTorque1 and torqueDiff.
---Source: lua/vehicle/powertrain/torqueConverter.lua:21
---@param dt number Physics step (s).
function powertrain_torqueConverter_device:torqueUpdate(dt) end

--- Checks that the parent is an engine (category engine) and sets the default converterTorque. Called at powertrain initialization.
---Source: lua/vehicle/powertrain/torqueConverter.lua:80
---@return boolean  false (with error logs) if the parent is not an engine.
function powertrain_torqueConverter_device:validate() end

--- Physics step, speeds stage: copies the output speed of the parent engine (parent.outputAV1) into inputAV. Chosen by selectUpdates (modifiable via setMode).
---Source: lua/vehicle/powertrain/torqueConverter.lua:17
---@param dt number Physics step (s).
function powertrain_torqueConverter_device:velocityUpdate(dt) end

return powertrain_torqueConverter

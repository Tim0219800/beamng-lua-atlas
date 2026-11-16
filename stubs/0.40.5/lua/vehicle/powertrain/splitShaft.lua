---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/splitShaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `splitShaft`: two-output splitter, typically a 4x4 transfer case or an axle coupler. One output is "primary" (receives all the input torque) and the other "secondary" (receives a coupling torque). Coupling types (`splitType`): `viscous` (torque proportional to the speed difference, with exponent) or `locked` (quadratic spring coupling, bounded by lockTorque). Can be disconnected (`disconnected` mode: the secondary output receives nothing). Categories `shaft` and `differential`.
--- Access: powertrain device type `splitShaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_splitShaft
---@field deviceCategories table<string, boolean> {shaft=true, differential=true}.
---@field outputPorts table<integer, boolean> {[1]=true, [2]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1, 2}: both outputs receive their inertia from their children.
local powertrain_splitShaft = {}

--- Builds the splitter: primary and secondary outputs, coupling type (viscous or locked), available modes and coupling parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:223
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_splitShaft.new(jbeamData) end

--- Object returned by new(jbeamData). torqueUpdate depends on splitType and mode.
---@class powertrain_splitShaft_device
local powertrain_splitShaft_device = {}

--- Increases the friction, lock torque and viscous torque damage coefficients according to the damage.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:60
---@param damageAmount number Amount of damage of the deformation group.
function powertrain_splitShaft_device:applyDeformGroupDamage(damageAmount) end

--- Takes the cumulative inertia and ratios of the primary output; computes lockSpring, lockDamp and maxShaftAngle from the inertia of the secondary output.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:156
function powertrain_splitShaft_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if broken) and the damage state table (see bug in notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:89
---@return number  Integrity 0..1.
---@return table  {damageFrictionCoef, damageLockTorqueCoef, damageViscousTorqueCoef, isBroken}.
function powertrain_splitShaft_device:getPartCondition() end

--- Defined only if there are several modes. Returns stateData with the key '<name>Mode' = current mode.
---Source: lua/vehicle/powertrain/splitShaft.lua:124
---@return table  stateData.
function powertrain_splitShaft_device:getState() end

--- Sets isBroken = true and switches to the disconnected torque functions (secondary without torque).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:149
function powertrain_splitShaft_device:onBreak() end

--- Resets speeds, torques, shaft angle, viscous smoother, wear/damage coefficients and mode; rereads gearRatio, friction, viscousCoef and defaultClutchRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:183
---@param jbeamData table jbeam data of the component.
function powertrain_splitShaft_device:reset(jbeamData) end

--- Changes the mode ('connected' or 'disconnected', must be in availableModes). A physically disconnected device stays 'disconnected'. Reselects torqueUpdate.
---Source: lua/vehicle/powertrain/splitShaft.lua:106
---@param mode string 'connected' or 'disconnected'.
function powertrain_splitShaft_device:setMode(mode) end

--- Applies wear (based on the odometer) and damage (integrity number 0..1 or table) to the friction, lock and viscosity coefficients; calls onBreak if isBroken.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:66
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, damageLockTorqueCoef, damageViscousTorqueCoef, isBroken}.
---@param visual any Not used.
function powertrain_splitShaft_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Defined only if there are several modes. Restores the mode from data['<name>Mode'].
---Source: lua/vehicle/powertrain/splitShaft.lua:129
---@param data table|nil State table produced by getState.
function powertrain_splitShaft_device:setState(data) end

--- Called at each physics step: computes the secondary torque (viscous: coef * |ΔAV|^exponent, or locked: quadratic spring on the shaft angle + damping) and the primary torque. Disconnected: secondary at 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:42
function powertrain_splitShaft_device:torqueUpdate() end

--- Called after the powertrain is built: forces the 'disconnected' mode if isPhysicallyDisconnected; returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:140
---@return boolean  true.
function powertrain_splitShaft_device:validate() end

--- Called at each physics step: inputAV = speed of the primary output * gearRatio, written to the parent.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/splitShaft.lua:15
---@param dt number Time step in seconds (unused).
function powertrain_splitShaft_device:velocityUpdate(dt) end

return powertrain_splitShaft

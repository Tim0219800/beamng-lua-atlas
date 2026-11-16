---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/differential.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `differential`: splits the input torque between two outputs (port 1 and port 2) and computes the input speed from the two outputs. Several types (`diffType` in the jbeam, changeable in game via setMode): `open`, `torqueVectoring`, `lsd`, `viscous`, `locked`, `dually`, `activeLock`. It also handles a bevel torque ratio (gearRatio), friction losses, a slip speed limit, wear and damage. A modder declares it in the `powertrain` jbeam and can change its mode or set the active locking (`activeLockCoef`).
--- Access: powertrain device type `differential` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_differential
---@field deviceCategories table<string, boolean> {differential=true}.
---@field outputPorts table<integer, boolean> {[1]=true, [2]=true}: two output ports.
---@field requiredExternalInertiaOutputs table<integer, integer> {1, 2}: both outputs receive their inertia from their children.
local powertrain_differential = {}

--- Builds the differential device: reads gearRatio, frictions, torque split, differential type(s), LSD, viscous, locked and active locking parameters, then selects the torque function according to the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:333
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_differential.new(jbeamData) end

--- Object returned by new(jbeamData). torqueUpdate is replaced according to the mode (selectUpdates).
---@class powertrain_differential_device
local powertrain_differential_device = {}

--- Computes cumulativeInertia (weighted sum of the inertias of the two children, divided by gearRatio²), the cumulative ratios (logs a debug message if the two outputs have different ratios), and the locking parameters lockSpring/lockTorque/lockDamp/maxDiffAngle.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:259
function powertrain_differential_device:calculateInertia() end

--- Returns the integrity 0..1 (0 if isBroken) and the table {damageFrictionCoef, isBroken}.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:163
---@return number  Integrity 0..1.
---@return table  {damageFrictionCoef, isBroken}.
function powertrain_differential_device:getPartCondition() end

--- Defined only if there are several modes. Returns stateData with the key '<name>Mode' = current mode.
---Source: lua/vehicle/powertrain/differential.lua:243
---@return table  stateData.
function powertrain_differential_device:getState() end

--- Resets speeds, torques, viscous smoothers, diffAngle, activeLockCoef and wear/damage coefficients; rereads gearRatio and friction from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:302
---@param jbeamData table jbeam data of the component.
function powertrain_differential_device:reset(jbeamData) end

--- Changes the differential mode if it is in availableModes (diffType list of the jbeam); ignored otherwise. Reselects torqueUpdate and updates the UI button. Possible modes: open, torqueVectoring, lsd, viscous, locked, dually, activeLock.
---Source: lua/vehicle/powertrain/differential.lua:228
---@param mode string Mode name.
function powertrain_differential_device:setMode(mode) end

--- Applies wear (wearFrictionCoef from 1 to 2 between 30000 km and 1000 km*1000) and damage (damageFrictionCoef from 1 to 10) according to the odometer and the integrity (number 0..1 or table).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:141
---@param subSystem any Not used.
---@param odometer number Distance traveled in meters.
---@param integrity number|table Number 0..1 or table {damageFrictionCoef, isBroken}.
---@param visual any Not used.
function powertrain_differential_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Defined only if there are several modes. Restores the mode from data['<name>Mode'] if it is a string different from the current mode.
---Source: lua/vehicle/powertrain/differential.lua:248
---@param data table|nil State table produced by getState.
function powertrain_differential_device:setState(data) end

--- Called at each physics step. Computes the input torque (parent torque minus friction, reduced by the slip limit, multiplied by gearRatio) then outputTorque1/outputTorque2 according to the active mode (open, lsd, viscous, locked, activeLock).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:102
---@param dt number Time step in seconds (used by lsd, locked, activeLock to integrate diffAngle).
function powertrain_differential_device:torqueUpdate(dt) end

--- If several modes are available and uiSimpleModeControl is true, updates the simple interface button with an icon according to the mode and the axle (inferred from the words front, rear, middle, center, transfer in the name).
---Source: lua/vehicle/powertrain/differential.lua:220
function powertrain_differential_device:updateSimpleControlButtons() end

--- Called at each physics step: inputAV = (outputAV1 * splitA + outputAV2 * splitB) * gearRatio, written into the parent's speed field.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/differential.lua:17
function powertrain_differential_device:velocityUpdate() end

return powertrain_differential

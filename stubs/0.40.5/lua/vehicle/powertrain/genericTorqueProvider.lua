---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/genericTorqueProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `genericTorqueProvider`: generic torque source, of category `engine`, whose torque is simply `desiredOutputTorque` (N·m) set from outside by a controller or a script (the motor has no curve, throttle or energy). It subtracts the friction and exposes the minimal interface of an engine (scaleFriction, scaleOutputTorque, disable, enable, lockUp, getTorqueData…) so that clutches, gearboxes and controllers can treat it as an engine. Useful for an engine driven by a custom controller.
--- Access: powertrain device type `genericTorqueProvider` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_genericTorqueProvider
---@field deviceCategories table<string, boolean> {engine=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
local powertrain_genericTorqueProvider = {}

--- Builds the torque provider with the engine interface stubs (nop for sound, ignition, starter) and the visual position inferred from the torque reaction nodes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:124
---@param jbeamData table jbeam data of the component.
---@return table  The device (class `device`).
function powertrain_genericTorqueProvider.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_genericTorqueProvider_device
local powertrain_genericTorqueProvider_device = {}

--- Takes the cumulative inertia and ratio of the first child as cumulativeInertia and cumulativeGearRatio.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:92
function powertrain_genericTorqueProvider_device:calculateInertia() end

--- Cuts the torque: outputTorqueState = 0 and isDisabled = true.
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:34
function powertrain_genericTorqueProvider_device:disable() end

--- Restores the torque: outputTorqueState = 1 and isDisabled = false.
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:39
function powertrain_genericTorqueProvider_device:enable() end

--- Returns an empty torque curve table: {maxRPM=0, curves={}, maxTorque=0, maxPower=0, maxTorqueRPM=0, maxPowerRPM=0, finalCurveName=1, deviceName, vehicleID}.
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:15
---@return table  Curve data (all zero).
function powertrain_genericTorqueProvider_device:getTorqueData() end

--- Same as disable: cuts the torque and sets isDisabled (no speed lock here).
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:44
function powertrain_genericTorqueProvider_device:lockUp() end

--- Resets speed, torque, desired torque, outputTorqueState and isDisabled; rereads friction, dynamicFriction and inertia from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:106
---@param jbeamData table jbeam data of the component.
function powertrain_genericTorqueProvider_device:reset(jbeamData) end

--- Multiplies the friction (friction) by the given factor.
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:26
---@param friction number Multiplicative factor.
function powertrain_genericTorqueProvider_device:scaleFriction(friction) end

--- Multiplies outputTorqueState by state (cumulative).
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:30
---@param state number Multiplicative factor.
function powertrain_genericTorqueProvider_device:scaleOutputTorque(state) end

--- Sends the GUI event 'TorqueCurveChanged' with the curve data (computed if not provided).
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:19
---@param data table|nil Result of getTorqueData; nil to recompute it.
function powertrain_genericTorqueProvider_device:sendTorqueData(data) end

--- Called at each physics step: outputTorque1 = desiredOutputTorque * outputTorqueState - friction torque (limited by speed * inertia * 2000 for stability).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:55
---@param dt number Time step in seconds (unused).
function powertrain_genericTorqueProvider_device:torqueUpdate(dt) end

--- Per-frame update: outputRPM = outputAV1 in RPM.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:49
---@param dt number Frame duration in seconds (unused).
function powertrain_genericTorqueProvider_device:updateGFX(dt) end

--- If the device has no child, sets clutchChild = {torqueDiff = 0}; registers the engine in powertrain.engineData; selects the update functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:77
---@return boolean  Always true.
function powertrain_genericTorqueProvider_device:validate() end

--- Always nop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/genericTorqueProvider.lua:dyn
function powertrain_genericTorqueProvider_device:velocityUpdate() end

return powertrain_genericTorqueProvider

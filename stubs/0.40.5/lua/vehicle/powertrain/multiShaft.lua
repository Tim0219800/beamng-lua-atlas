---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/multiShaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Powertrain component `multiShaft`: torque splitter with N outputs (N = jbeam key `numberOfOutputPorts`), for example for a multi-axle drive or a transfer case with more than two outputs. Categories `shaft` and `differential`. The input torque is split equally between the outputs, corrected by a viscous coupling that brings the output speeds closer to the average. The input speed is the average of the output speeds. It has no mode, no damage/wear handling and no saveable state.
--- Access: powertrain device type `multiShaft` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_multiShaft
---@field deviceCategories table<string, boolean> {shaft=true, differential=true}.
---@field outputPorts table<integer, boolean> Default value of the module {[1]=true}, replaced in each device by {[1..N]=true} according to numberOfOutputPorts.
local powertrain_multiShaft = {}

--- Builds the splitter: creates the N output ports, the names outputAV<i>/outputTorque<i>, the viscous coupling smoothers and the requiredExternalInertiaOutputs list.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:87
---@param jbeamData table jbeam data of the component (numberOfOutputPorts required).
---@return table  The device (class `device`).
function powertrain_multiShaft.new(jbeamData) end

--- Object returned by new(jbeamData).
---@class powertrain_multiShaft_device
local powertrain_multiShaft_device = {}

--- Sums the cumulative inertias of the N children (logs a warning if their cumulative ratios differ), then computes cumulativeInertia, viscousCoef (if not provided) and the cumulative ratios.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:41
function powertrain_multiShaft_device:calculateInertia() end

--- Resets speeds, torques, torqueDiff, smoothers, mode 'connected' and rereads gearRatio and friction.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:64
---@param jbeamData table jbeam data of the component.
function powertrain_multiShaft_device:reset(jbeamData) end

--- Called at each physics step: splits the input torque (* gearRatio) equally and subtracts the smoothed viscous torque from each output.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:20
---@param dt number Time step in seconds (unused).
function powertrain_multiShaft_device:torqueUpdate(dt) end

--- Called after the powertrain is built; always returns true.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:37
---@return boolean  true.
function powertrain_multiShaft_device:validate() end

--- Called at each physics step: inputAV = average of the output speeds * gearRatio, written into the parent's speed field.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/multiShaft.lua:10
---@param dt number Time step in seconds (unused).
function powertrain_multiShaft_device:velocityUpdate(dt) end

return powertrain_multiShaft

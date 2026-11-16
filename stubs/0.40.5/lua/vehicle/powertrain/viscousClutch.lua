---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/viscousClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Viscous coupler placed behind an engine: transmits a torque proportional to the angular speed difference between input and output (viscousCoef, in N·m per rad/s), capped at viscousTorque. Can be progressively "engaged" above an RPM cutInRPM (cutInRPM, stallRPM). Serves as a simple automatic clutch (e.g. small vehicles, gearboxes without a driven clutch). Categories clutchlike and viscouscoupling; one output port.
--- Access: powertrain device type `viscousClutch` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_viscousClutch
---@field deviceCategories table<string, boolean> {clutchlike=true, viscouscoupling=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_viscousClutch = {}

--- Builds the viscous coupler from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/viscousClutch.lua:89
---@param jbeamData table jbeam data of the component.
---@return table  Device object.
function powertrain_viscousClutch.new(jbeamData) end

--- Object returned by new(jbeamData). Fields: inputAV, outputAV1 (rad/s), outputTorque1 and torqueDiff (N·m), clutchRatio (0..1), viscousCoef, viscousTorque, cutInAV, stallAV (rad/s), isBroken, mode.
---@class powertrain_viscousClutch_device
local powertrain_viscousClutch_device = {}

--- Takes the cumulative inertia and ratios of the first child (the coupler adds no inertia).
---Source: lua/vehicle/powertrain/viscousClutch.lua:55
function powertrain_viscousClutch_device:calculateInertia() end

--- Resets speeds, torque, clutchRatio=1, rereads viscousCoef and reinitializes the smoother.
---Source: lua/vehicle/powertrain/viscousClutch.lua:71
---@param jbeamData table Jbeam data.
function powertrain_viscousClutch_device:reset(jbeamData) end

--- Stores the mode and reinstalls velocityUpdate/torqueUpdate (the mode has no other effect here).
---Source: lua/vehicle/powertrain/viscousClutch.lua:50
---@param mode any Mode (not interpreted).
function powertrain_viscousClutch_device:setMode(mode) end

--- Physics step: computes the viscous torque (speed difference), applies clutchRatio and the engagement at cutInRPM, smooths and places the result in torqueDiff and outputTorque1.
---Source: lua/vehicle/powertrain/viscousClutch.lua:20
---@param dt number Physics step (s). Unused.
function powertrain_viscousClutch_device:torqueUpdate(dt) end

--- Checks that the parent is an engine and sets the default viscousTorque.
---Source: lua/vehicle/powertrain/viscousClutch.lua:38
---@return boolean  false if the parent is not an engine.
function powertrain_viscousClutch_device:validate() end

--- Physics step: inputAV = output speed of the parent (engine).
---Source: lua/vehicle/powertrain/viscousClutch.lua:16
---@param dt number Physics step (s).
function powertrain_viscousClutch_device:velocityUpdate(dt) end

return powertrain_viscousClutch

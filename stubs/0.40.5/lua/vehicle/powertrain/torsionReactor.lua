---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/torsionReactor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Dummy shaft" device that serves as a torsion reactor: it transmits the torque of its parent to its children (multiplied by gearRatio) while keeping the torque reaction nodes (torqueReactionNodes_nodes) that allow applying the engine torque reaction to the body. The powertrain uses it as the anchor point for torque reactions. Category shaft, a single output port.
--- Access: powertrain device type `torsionReactor` (jbeam `powertrain`), reachable with `powertrain.getDevice("name")`
---@class powertrain_torsionReactor
---@field deviceCategories table<string, boolean> {shaft=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
local powertrain_torsionReactor = {}

--- Builds the device from the jbeam. Filters torqueReactionNodes_nodes to keep only the numeric values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/powertrain/torsionReactor.lua:67
---@param jbeamData table jbeam data of the component.
---@return table  Device object.
function powertrain_torsionReactor.new(jbeamData) end

--- Object returned by new(jbeamData). Fields: gearRatio, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), torqueReactionNodes (list of 3 nodes or nil), cumulativeInertia (kg·m²), cumulativeGearRatio, parent/children (set by the powertrain).
---@class powertrain_torsionReactor_device
local powertrain_torsionReactor_device = {}

--- Computes the cumulative inertia (that of the child divided by gearRatio²), its inverse and the cumulative ratios from the first child.
---Source: lua/vehicle/powertrain/torsionReactor.lua:37
function powertrain_torsionReactor_device:calculateInertia() end

--- Resets speeds, torque and inertias; rereads gearRatio from the jbeam.
---Source: lua/vehicle/powertrain/torsionReactor.lua:54
---@param jbeamData table Jbeam data.
function powertrain_torsionReactor_device:reset(jbeamData) end

--- Physics step: outputTorque1 = output torque of the parent * gearRatio.
---Source: lua/vehicle/powertrain/torsionReactor.lua:15
function powertrain_torsionReactor_device:torqueUpdate() end

--- Checks that the parent exists and that torqueReactionNodes contains 3 nodes (otherwise a warning and torqueUpdate disabled by name only).
---Source: lua/vehicle/powertrain/torsionReactor.lua:23
---@return boolean  Always true.
function powertrain_torsionReactor_device:validate() end

--- Physics step: inputAV = outputAV1 * gearRatio, then copied into the parent field designated by parentOutputAVName.
---Source: lua/vehicle/powertrain/torsionReactor.lua:10
---@param dt number Physics step (s).
function powertrain_torsionReactor_device:velocityUpdate(dt) end

return powertrain_torsionReactor

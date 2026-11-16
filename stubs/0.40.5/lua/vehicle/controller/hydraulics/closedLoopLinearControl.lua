---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Closed-loop regulator of a linear hydraulic cylinder (type "auxiliary"). A PID compares the average extension of the cylinders (powertrain hydraulic consumers) to a target and writes the valve command into electrics.values. A modder sets the target with setCylinderTargetExtendPercent.
--- Access: controller `hydraulics/closedLoopLinearControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_closedLoopLinearControl
---@field type string "auxiliary".
local controller_hydraulics_closedLoopLinearControl = {}

--- Creates the PID, finds the cylinders and reads the parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:47
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_closedLoopLinearControl.init(jbeamData) end

--- Resets the valve to 0, the target to the initial value and the PID to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:41
---@param jbeamData table Jbeam data.
function controller_hydraulics_closedLoopLinearControl.reset(jbeamData) end

--- Sets the target extension of the cylinders.
---Source: lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:20
---@param extendPercent number Extension 0..1, bounded by cylinderPositionMin/Max.
function controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent) end

--- Computes the valve command from the average extension of the cylinders and writes it into electrics.values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua:24
---@param dt number Time step (s).
function controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt) end

return controller_hydraulics_closedLoopLinearControl

---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/truckCabTiltControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for a truck's cab tilt: when at least one cab latch (group controller) is "attached", the tilt cylinders are in "float" valve mode; otherwise "closed" (adjustable modes).
--- Access: controller `hydraulics/truckCabTiltControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_truckCabTiltControl
---@field type string "auxiliary".
local controller_hydraulics_truckCabTiltControl = {}

--- Reads the latch controller names, the cylinder names and the valve modes.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:43
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_truckCabTiltControl.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:40
---@param jbeamData table Jbeam data.
function controller_hydraulics_truckCabTiltControl.reset(jbeamData) end

--- Every frame: sets the valve type of the cylinders according to the latch state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/truckCabTiltControl.lua:16
---@param dt number Time step (s).
function controller_hydraulics_truckCabTiltControl.updateGFX(dt) end

return controller_hydraulics_truckCabTiltControl

---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/hydraulics/orbitrolSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orbitrol-type hydraulic steering regulator (type "auxiliary"). A PID compares the average position of the steering cylinders (normalized -1..1) to the steering input (electrics.values.steering_input by default) and writes the valve command into electrics.values.
--- Access: controller `hydraulics/orbitrolSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_hydraulics_orbitrolSteering
---@field type string "auxiliary".
local controller_hydraulics_orbitrolSteering = {}

--- Creates the PID and finds the cylinders.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/orbitrolSteering.lua:40
---@param jbeamData table Controller jbeam data.
function controller_hydraulics_orbitrolSteering.init(jbeamData) end

--- Resets the valve and the PID to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/orbitrolSteering.lua:35
---@param jbeamData table Jbeam data.
function controller_hydraulics_orbitrolSteering.reset(jbeamData) end

--- Computes and writes the steering valve command.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/hydraulics/orbitrolSteering.lua:19
---@param dt number Time step (s).
function controller_hydraulics_orbitrolSteering.updateFixedStep(dt) end

return controller_hydraulics_orbitrolSteering

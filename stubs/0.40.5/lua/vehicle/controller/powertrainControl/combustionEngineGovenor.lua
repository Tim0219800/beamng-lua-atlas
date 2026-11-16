---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary "speed governor" controller of a combustion engine (the file name contains the typo "Govenor"). A PID computes a throttle command so that the engine speed follows a target that varies linearly from rpmTarget0 to rpmTarget1 according to the throttle input; the command is published in electrics.values.throttleGoverned (or jbeam name).
--- Access: controller `powertrainControl/combustionEngineGovenor` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_powertrainControl_combustionEngineGovenor
---@field type string "auxiliary".
---@field updateFixedStep function|nil PID loop, assigned in init if the engine is found.
local controller_powertrainControl_combustionEngineGovenor = {}

--- Gets the engine, creates the PID, computes the angular speed targets and the electrics names.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua:33
---@param jbeamData table Controller jbeam data.
function controller_powertrainControl_combustionEngineGovenor.init(jbeamData) end

--- Resets the PID if the engine exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/combustionEngineGovenor.lua:27
---@param jbeamData table Jbeam data.
function controller_powertrainControl_combustionEngineGovenor.reset(jbeamData) end

return controller_powertrainControl_combustionEngineGovenor

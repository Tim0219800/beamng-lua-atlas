---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powerSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary power steering controller. Sets hydros.wheelPowerSteeringCoef (assist coefficient applied by the steering engine): fixed value 1 + constantOffset, or, if the parameters allow it, a value that varies linearly with wheel speed between speedSlow and speedFast.
--- Access: controller `powerSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_powerSteering
---@field type string "auxiliary".
---@field updateGFX function|nil Assist update function according to speed; nil if the controller does not vary.
local controller_powerSteering = {}

--- Reads the jbeam keys, sets hydros.wheelPowerSteeringCoef = 1 + constantOffset and enables updateGFX if the assist varies with speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powerSteering.lua:34
---@param jbeamData table Controller jbeam data.
function controller_powerSteering.init(jbeamData) end

--- Resets hydros.wheelPowerSteeringCoef to 1 + constantOffset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powerSteering.lua:30
function controller_powerSteering.reset() end

return controller_powerSteering

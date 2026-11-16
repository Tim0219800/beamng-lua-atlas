---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/activeCenterDiff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controlled center differential controller. Every physics step, it combines several jbeam maps (throttle, slip between axles, brake, left-foot brake, steering, handbrake) to compute a desired locking rate 0..1 and writes it into centerDiff.activeLockCoef. Under acceleration the target mixes understeer/oversteer (biasOversteerVsTraction) and traction; under deceleration it depends on the brake and steering.
--- Access: controller `powertrainControl/activeCenterDiff` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_powertrainControl_activeCenterDiff
---@field type string "auxiliary".
local controller_powertrainControl_activeCenterDiff = {}

--- Loads the seven jbeam maps and gets the center differential and the two axle differentials.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:86
---@param jbeamData table Controller jbeam data.
function controller_powertrainControl_activeCenterDiff.init(jbeamData) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:80
---@param jbeamData table Jbeam data.
function controller_powertrainControl_activeCenterDiff.reset(jbeamData) end

--- Physics step: computes the desired locking and sets it on centerDiff.activeLockCoef.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:28
---@param dt number Physics step in seconds.
function controller_powertrainControl_activeCenterDiff.updateFixedStep(dt) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/powertrainControl/activeCenterDiff.lua:77
---@param dt number Time step in seconds.
function controller_powertrainControl_activeCenterDiff.updateGFX(dt) end

return controller_powertrainControl_activeCenterDiff

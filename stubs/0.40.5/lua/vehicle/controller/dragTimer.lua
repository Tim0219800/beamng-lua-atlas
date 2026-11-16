---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/dragTimer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary drag (acceleration) timing controller. State machine ready, countdown, measuring, done: when the transbrake is active and the throttle pressed, a 3 s countdown starts; at the end, it releases the transbrake (controller named "transbrake") and measures the times at 60 feet (18.288 m), 1/8 mile (201.168 m) and 1/4 mile (402.336 m) as well as the speeds at these last two marks, then displays the results in the console (in mph). Order tied to the `gearbox` device.
--- Access: controller `dragTimer` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_dragTimer
---@field relevantDevice string "gearbox": powertrain device used for the call order.
---@field type string "auxiliary".
local controller_dragTimer = {}

--- Puts the state machine back to ready and all times to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/dragTimer.lua:93
---@param jbeamData table Jbeam data (unused).
function controller_dragTimer.init(jbeamData) end

--- Physics step: advances the state machine (arming, countdown, measurement, results display).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/dragTimer.lua:28
---@param dt number Physics step in seconds.
function controller_dragTimer.update(dt) end

--- Empty (the work is done in update).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/dragTimer.lua:25
---@param dt number Time step in seconds.
function controller_dragTimer.updateGFX(dt) end

return controller_dragTimer

---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/brakedDifferentialSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary differential-braking steering controller (tracked machines or skid-steer): depending on the steering wheel input `steering_input`, it brakes the left wheel (wheel turned left) or the right wheel (wheel turned right) by adding braking torque to the wheel rotators' `desiredBrakingTorque`, without exceeding their `brakeTorque`.
--- Access: controller `braking/brakedDifferentialSteering` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_brakedDifferentialSteering
---@field type string "auxiliary".
local controller_braking_brakedDifferentialSteering = {}

--- Finds the left/right wheels, computes the maximum steering braking torques.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/brakedDifferentialSteering.lua:40
---@param jbeamData table Controller jbeam data.
function controller_braking_brakedDifferentialSteering.init(jbeamData) end

--- Resets the braking levels to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/brakedDifferentialSteering.lua:35
---@param jbeamData table Jbeam data.
function controller_braking_brakedDifferentialSteering.reset(jbeamData) end

--- Every frame: computes the left/right braking level from `steering_input` and speed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/brakedDifferentialSteering.lua:26
---@param dt number Time step in seconds.
function controller_braking_brakedDifferentialSteering.updateGFX(dt) end

--- Intermediate physics step: adds the steering braking torque (brake × max torque) to each wheel's requested torque, capped at its brakeTorque.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/brakedDifferentialSteering.lua:21
---@param dt number Time step in seconds (unused).
function controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt) end

return controller_braking_brakedDifferentialSteering

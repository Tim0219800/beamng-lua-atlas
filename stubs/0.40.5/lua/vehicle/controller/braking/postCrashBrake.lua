---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/postCrashBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for automatic braking after a crash. A state machine (idle, braking, holding, disabled) detects a strong acceleration (accelerometers `sensors.gx2`, `gy2`, `gz2`): it switches to full braking, cuts the throttle, turns on the hazard lights, then applies the parking brake at standstill (or in reverse) and releases when the driver accelerates again or the vehicle is moving faster than 5 m/s. Call order: `defaultOrder = 700`.
--- Access: controller `braking/postCrashBrake` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_postCrashBrake
---@field defaultOrder number 700: default call rank.
---@field type string "auxiliary".
local controller_braking_postCrashBrake = {}

--- Returns the current state and the crash counter for state synchronization.
---Source: lua/vehicle/controller/braking/postCrashBrake.lua:103
---@return table  Keys `<name>_state` and `<name>_crashCounter`.
function controller_braking_postCrashBrake.getState() end

--- Puts the state machine back to idle (turns off the hazard lights if they were commanded by this controller) and reads the jbeam thresholds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/postCrashBrake.lua:84
---@param jbeamData table Controller jbeam data.
function controller_braking_postCrashBrake.init(jbeamData) end

--- Restores the crash counter and applies a valid state (idle, braking, holding, disabled) if it differs.
---Source: lua/vehicle/controller/braking/postCrashBrake.lua:109
---@param data table|nil State table.
function controller_braking_postCrashBrake.setState(data) end

--- Every frame: detects the crash in idle, imposes braking in braking, holds the brake in holding and handles the exit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/postCrashBrake.lua:30
---@param dt number Time step in seconds (unused).
function controller_braking_postCrashBrake.updateGFX(dt) end

return controller_braking_postCrashBrake

---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/straightLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Very simple steering autopilot: a PID corrects the steering so that the vehicle drives toward a target point (or straight ahead, 20 m in front of its initial position). It sends the command via input.event("steering", value, 1) every frame. Controls neither throttle nor brake.
--- Access: extension `straightLine`: `extensions.load (vehicle VM)("straightLine")`, then the global `straightLine`
---@class straightLine
straightLine = {}

--- Hook called on vehicle initialization (extensions.hook('onInit')): clears the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/straightLine.lua:59
function straightLine.onInit() end

--- Hook called on vehicle reset; same function as onInit: clears the target.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/straightLine.lua:59
function straightLine.onReset() end

--- Enables driving toward a target. Without a target, aims at the point 20 m in front of the vehicle in the current direction (projected horizontally). Creates the steering PID according to the mode.
---Source: lua/vehicle/extensions/straightLine.lua:33
---@param target vec3|nil Target position; nil = 20 m straight ahead.
---@param mode string "offroad" for a more aggressive PID, any other value for the standard PID. Must not be nil.
function straightLine.setTargetDirection(target, mode) end

--- Stops the assist: sends input.event('steering', 0, 0) and clears the target.
---Source: lua/vehicle/extensions/straightLine.lua:53
function straightLine.stop() end

--- Called every graphics frame via extensions.hook('updateGFX'). If a target is defined, computes the angle error and sends the PID steering via input.event('steering', ...).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/straightLine.lua:15
---@param dt number Time step in seconds, passed to the PID.
function straightLine.updateGFX(dt) end


---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/perfectLaunch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Perfect' standing-start aid (launch control) for dragsters: full throttle, then PI control of driven-wheel slip and yaw by modulating the throttle, with trajectory holding via the straightLine extension. Sequence: prepare(target) (vehicle frozen, full throttle), go() (unfreeze, launch), stop() (reset).
--- Access: extension `perfectLaunch`: `extensions.load (vehicle VM)("perfectLaunch")`, then the global `perfectLaunch`
---@class perfectLaunch
---@field launchFailed boolean true if a spin-out (smoothed yaw > 0.5) was detected during the launch.
perfectLaunch = {}

--- Starts the launch: unfreezes the vehicle and switches to the 'go' state.
---Source: lua/vehicle/extensions/perfectLaunch.lua:35
function perfectLaunch.go() end

--- Initialization hook: 'idle' state, resets the controllers, gearbox mode 'arcade' and reloads straightLine.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/perfectLaunch.lua:18
function perfectLaunch.onInit() end

--- Same function as onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/perfectLaunch.lua:18
function perfectLaunch.onReset() end

--- Prepares the launch: freezes the vehicle, full throttle, gives the target direction to straightLine.
---Source: lua/vehicle/extensions/perfectLaunch.lua:40
---@param target vec3|table Target or direction passed to straightLine.setTargetDirection (inferred from code).
function perfectLaunch.prepare(target) end

--- Stops everything: releases parking brake, brake and throttle, unfreezes, stops straightLine and resets.
---Source: lua/vehicle/extensions/perfectLaunch.lua:50
function perfectLaunch.stop() end

--- Called every frame: runs the state machine and the throttle control, then straightLine.updateGFX.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/perfectLaunch.lua:59
---@param dt number Time step in seconds.
function perfectLaunch.updateGFX(dt) end


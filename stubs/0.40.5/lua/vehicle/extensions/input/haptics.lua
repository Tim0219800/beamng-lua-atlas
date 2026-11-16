---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/input/haptics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates gamepad vibrations (haptic feedback) from vehicle dynamics: acceleration jerks, wheel slip energy, locked wheels under braking (brake trigger) and spinning driven wheels (throttle trigger). The forces are sent to the device driver via hydros.getForceFeedbackFunction() on the supplied FFB ids. Called by the input system, not by a modder in general.
--- Access: extension `input_haptics`: `extensions.load (vehicle VM)("input_haptics")`, then the global `input_haptics`
---@class input_haptics
input_haptics = {}

--- Lists the driven wheels (powertrain.getPoweredWheelNames) and the wheel count. To be called after the vehicle has loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/input/haptics.lua:48
function input_haptics.initHaptics() end

--- Sets the ids of the force feedback outputs (-1 = disabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/input/haptics.lua:33
---@param _FFBID integer Main vibration output.
---@param _FFBID_accelerate integer Throttle trigger output.
---@param _FFBID_brake integer Brake trigger output.
function input_haptics.setFFBIDs(_FFBID, _FFBID_accelerate, _FFBID_brake) end

--- Sets the period between two sends to the driver (seconds) and schedules the next send.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/input/haptics.lua:39
---@param period number Period in seconds (default 1/30).
function input_haptics.setFFBPeriod(period) end

--- Multiplier of the vibration component due to jerks (debug).
---Source: lua/vehicle/extensions/input/haptics.lua:182
---@param multiplier number Default 1.
function input_haptics.setJerkForceMultiplier(multiplier) end

--- Intended to set the jerk threshold; no real effect (see notes).
---Source: lua/vehicle/extensions/input/haptics.lua:184
---@param min number Threshold (unused).
function input_haptics.setJerkMin(min) end

--- Multiplier of the vibration component due to wheel slip (debug).
---Source: lua/vehicle/extensions/input/haptics.lua:181
---@param multiplier number Default 1.
function input_haptics.setWheelSlipForceMultiplier(multiplier) end

--- Minimum slip energy threshold to trigger vibration (debug).
---Source: lua/vehicle/extensions/input/haptics.lua:183
---@param min number Default 15000.
function input_haptics.setWheelSlipMin(min) end

--- Computes and sends the vibration forces (main motor, throttle trigger, brake trigger) if the FFB period has elapsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/input/haptics.lua:60
---@param dt number Simulation time step in seconds.
function input_haptics.vibrationUpdate(dt) end


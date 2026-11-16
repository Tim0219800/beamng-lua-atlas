---@meta
-- tim19Atlas stub generated from lua/vehicle/scriptai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Script" AI: records the vehicle trajectory (front bumper position + time, optionally speed) then replays it by driving the vehicle with simulated inputs (steering, throttle, brake, parking brake) to follow the path on schedule. Used for scenarios, trajectory replays (crash replays) and scripted stunts. Can also assist the following with an "external force" (thrusters.applyAccel) and loop the course.
--- Access: global `scriptai`
---@class scriptai
---@field debugMode string What debugDraw draws: 'all' (default), 'target', 'path' or 'externalForce'.
---@field updateGFX function nop at rest; becomes updateGFXrecord during recording and updateGFXfollow during following. ⚠ nop is a game global.
scriptai = {}

--- Draws the target, the path and the external force according to debugMode (called by the vehicle's debug loop).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/scriptai.lua:814
function scriptai.debugDraw() end

--- Computes the respawn position and orientation of the vehicle to start a script (time offset taken into account) without starting the following.
---Source: lua/vehicle/scriptai.lua:126
---@param inScript table Script (list or {path, timeOffset, ...}).
---@param vehPosType any Not used in the code.
---@param _timeOffset number|nil Start offset in seconds (inScript.timeOffset by default).
---@return vec3|nil  Position of the ref node at the start (nil if the script is invalid).
---@return quat|nil  Initial rotation.
function scriptai.getInitialSpawnPositionOrientation(inScript, vehPosType, _timeOffset) end

--- Indicates whether the script AI is following a script.
---Source: lua/vehicle/scriptai.lua:846
---@return boolean  true while following.
function scriptai.isDriving() end

--- Returns the current state of the script AI (recording or following).
---Source: lua/vehicle/scriptai.lua:837
---@return table|nil  {status='recording', time} or {status='following', scriptTime, time, endScriptTime, posError, targetPos, startDelay}; nil at rest.
function scriptai.scriptState() end

--- Same function as stopFollowing (M.stopFollowing = M.scriptStop).
---Source: lua/vehicle/scriptai.lua:328
---@param centerWheel boolean|nil Reset the inputs to 0.
---@param engageParkingbrake boolean|nil Apply the parking brake.
function scriptai.scriptStop(centerWheel, engageParkingbrake) end

--- Enables or disables writing a debug CSV of the following (time, position, time gap, smoother rate). The file is written on stop.
---Source: lua/vehicle/scriptai.lua:38
---@param val boolean|string true or 'on': default name; other string (≠ 'off'): file name; otherwise disables.
function scriptai.setLogDataToCSV(val) end

--- Sets the decay rate of the speed-error smoother (fine tuning of the following responsiveness), capped at 1e30.
---Source: lua/vehicle/scriptai.lua:51
---@param outRate number|nil New rate (keeps the old one if nil).
function scriptai.setSpeedDiffSmootherOutRate(outRate) end

--- Starts following a script: prepares the script (time offset, start delay), places the vehicle back at the start of the path according to the loop type, sets the gearbox and ABS to arcade mode and activates the following loop. Does nothing if the script has fewer than 2 points.
---Source: lua/vehicle/scriptai.lua:660
---@param _inScript table Script: list of points, or table {path, timeOffset, startDelay, loopCount, loopTimeOffset, externalForce}.
---@param _timeOffset number|nil Start offset in the script in seconds (replaces inScript.timeOffset).
---@param _loopCounter integer|nil Number of laps remaining (inScript.loopCount by default, 1 otherwise). Also used by the auto-recall at the end of a lap.
---@param _loopType string|nil 'alwaysReset' (default), 'startReset' or other: when to place the vehicle back at the start point.
---@param _externalForce boolean|number|nil Following assistance by external acceleration (true = 1, number clamped to 1; replaces inScript.externalForce).
function scriptai.startFollowing(_inScript, _timeOffset, _loopCounter, _loopType, _externalForce) end

--- Starts recording the trajectory (front position of the vehicle at each frame) and stores the initial orientation. Resets the timer to 0.
---Source: lua/vehicle/scriptai.lua:636
---@param recordSpeed boolean|string|nil true/'on'/'yes' to also record the speed (v, m/s) at each point.
function scriptai.startRecording(recordSpeed) end

--- Stops following (alias of scriptStop). Resets the inputs to 0, restores the saved gearbox mode and empties the script. Writes the debug CSV if it was enabled.
---Source: lua/vehicle/scriptai.lua:328
---@param centerWheel boolean|nil Reset steering, throttle and brake to 0 (true by default if the argument is nil).
---@param engageParkingbrake boolean|nil Apply the parking brake (true by default if centerWheel is nil).
function scriptai.stopFollowing(centerWheel, engageParkingbrake) end

--- Stops the recording and returns the resulting script; the first point receives dir and up (initial orientation).
---Source: lua/vehicle/scriptai.lua:648
---@return table  {path = list of points {x, y, z, t [, v]}}.
function scriptai.stopRecording() end

--- Computes by how much the wheels will be above (positive: too low, must be raised) or below the ground for a given respawn position and orientation (static ray cast from the average position of the wheel nodes).
---Source: lua/vehicle/scriptai.lua:64
---@param pos vec3 Position of the vehicle's ref node.
---@param dir vec3 Front direction (normalized).
---@param up vec3 Up vector (normalized).
---@return number  Height (m) to add along up so that the wheels touch the ground: max wheel radius minus the measured distance to the ground.
function scriptai.wheelToGroundDist(pos, dir, up) end


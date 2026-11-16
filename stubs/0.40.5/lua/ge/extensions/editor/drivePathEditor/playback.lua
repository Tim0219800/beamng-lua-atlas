---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/playback.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Playback of Drive Path Editor paths (splines): associates each vehicle with its linked spline, moves it back to the start, then, once the spline's delay has elapsed, sends the vehicle a vLua command ai.driveUsingPath generated from the spline. Two modes: free (script of nodes x,y,z,r[,v|vl] after Catmull-Rom smoothing and RDP simplification, tolerance 1.0) or navigation graph (wpTargetList and wpSpeeds).
--- Access: extension `editor_drivePathEditor_playback`: `extensions.load("editor_drivePathEditor_playback")`, then the global `editor_drivePathEditor_playback`
---@class editor_drivePathEditor_playback
editor_drivePathEditor_playback = {}

--- Time elapsed since the start of playback.
---Source: lua/ge/extensions/editor/drivePathEditor/playback.lua:25
---@return number  seconds
function editor_drivePathEditor_playback.getPlaybackTime() end

--- To be called every frame: starts the AI of vehicles whose delayTime is reached (only once per vehicle) then advances the playback time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/playback.lua:77
function editor_drivePathEditor_playback.handlePlayback() end

--- Prepares playback: clears the table of ongoing playbacks, adds each vehicle with a linked and enabled spline, moves these vehicles back to their start pose (splineMgr.resetVehiclePose), then resets the time counters to zero.
---Source: lua/ge/extensions/editor/drivePathEditor/playback.lua:30
---@param splines table path splines (fields id, isVehicleLink, linkVehId, isEnabled, delayTime...)
---@param vehicles table scene vehicles (fields vid, veh, linkSplineId)
function editor_drivePathEditor_playback.startPlayback(splines, vehicles) end

--- Sends ai.setState({mode = "stop"}) to each vehicle being played back, moves them back to their start pose, then clears the table and resets the counters to zero.
---Source: lua/ge/extensions/editor/drivePathEditor/playback.lua:58
function editor_drivePathEditor_playback.stopPlayback() end


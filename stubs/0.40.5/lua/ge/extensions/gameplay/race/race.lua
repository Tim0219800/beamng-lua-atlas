---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/race.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ongoing race. Fields: path, vehIds, states (by vehicle id), recoveryStates (recovery snapshots by id), time (race time in s), lapCount, finishCount, started, suspended, checkpointTimes ('<lap>_<segment>' -> time), aiPath, aiDetailedPath, sortPlacements (ranking comparator: descending lap, then descending checkpoint index, then ascending distance to the next point).
---@class gameplay_race_race
local gameplay_race_race = {}

--- Aborts a vehicle's race (ignored if it has finished or is not active): raceAborted event, AI stopped.
---Source: lua/ge/extensions/gameplay/race/race.lua:615
---@param id integer Vehicle.
function gameplay_race_race:abortRace(id) end

--- Computes the AI path (aiPath, aiDetailedPath) from the race path.
---Source: lua/ge/extensions/gameplay/race/race.lua:47
function gameplay_race_race:calcAIPath() end

--- Replaces a race vehicle with another (transfers states and recoveries, recomputes the wheel corners).
---Source: lua/ge/extensions/gameplay/race/race.lua:361
---@param lastId integer Old vehicle.
---@param newId integer New vehicle.
function gameplay_race_race:changeRaceVehicle(lastId, newId) end

--- Clears a vehicle's event table.
---Source: lua/ge/extensions/gameplay/race/race.lua:1166
---@param id integer Vehicle.
function gameplay_race_race:clearEvents(id) end

--- Ends a vehicle's lap: records the lap times (lap, beginTime, endTime, lapTime, segmentTimes). If laps remain, restarts on the start segments (lapComplete event); otherwise marks the race finished (placement, raceComplete, AI at aggression 0.5) and optionally writes the history to raceRecord/ if logRaceInfo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:667
---@param id integer Vehicle.
---@param endTime number Lap end time (s).
function gameplay_race_race:completeLap(id, endTime) end

--- Records a snapshot of the vehicle's state with the race time and the associated recovery position.
---Source: lua/ge/extensions/gameplay/race/race.lua:628
---@param id integer Vehicle.
---@param recovery table Recovery startPosition.
function gameplay_race_race:createRecoveryPoint(id, recovery) end

--- Draws spheres for a vehicle's off-track data (off-track path, exit, return and maximum cut points).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:109
---@param data table Vehicle state containing offTrackData.
function gameplay_race_race:debugDraw(data) end

--- Detects a vehicle's track exits and returns, records its off-track trajectory and computes the cut depth and the distance driven off track (debug data). Its call is currently disabled in getTrackedData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:118
---@param data table Vehicle state.
---@param dt number Time delta (s).
function gameplay_race_race:detectOffTrack(data, dt) end

--- Waiting for a rolling start: tests whether the vehicle entered one of the start segments, then computes the exact (interpolated) start time and raises rollingStarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:822
---@param id integer Vehicle.
---@param dt number Time delta (s).
function gameplay_race_race:detectRollingStart(id, dt) end

--- Processes a vehicle's events: notifies Hotlapping and LapTimes (for the player vehicle), fills the event log, emits the hooks onRaceStarted, onRacePathnodeReached, onRaceComplete, onRaceAborted, records the recovery points and plays the checkpoint sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1028
---@param id integer Vehicle.
---@param dt number Time delta (s).
function gameplay_race_race:digestEvents(id, dt) end

--- Suspends or resumes the race (time and tracking stop) and notifies the Hotlapping and LapTimes apps.
---Source: lua/ge/extensions/gameplay/race/race.lua:330
---@param sus boolean true to suspend.
function gameplay_race_race:doSuspend(sus) end

--- Draws a vehicle's next pathnodes (red), the following ones (orange) and the remaining calls.
---Source: lua/ge/extensions/gameplay/race/race.lua:1175
---@param id integer Vehicle.
function gameplay_race_race:drawDebug(id) end

--- Recomputes for a vehicle the next visible pathnodes (nextPathnodes), the ones after (overNextPathnodes) and the shifted list without branching, with a type per pathnode: 'branch', 'final', 'lap', 'start', 'recovery' or 'default'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:734
---@param id integer Vehicle.
function gameplay_race_race:findNextPathnodes(id) end

--- Formats a signed time difference as +MM:SS.mmm; returns 'N/A' if nil. Expects seconds (see notes for the inconsistency with timeDifferenceToFirst).
---Source: lua/ge/extensions/gameplay/race/race.lua:1315
---@param timeDiff number|nil Difference in seconds.
---@return string  Formatted text.
function gameplay_race_race:formatTimeDifference(timeDiff) end

--- Computes, for an off-road portion, the distance that would have had to be driven along the navigation path and the distance cut as the crow flies.
---Source: lua/ge/extensions/gameplay/race/race.lua:67
---@param pointA vec3 Road exit point.
---@param pointB vec3 Point of return to the road.
---@param inNextAiPathIdx integer Index of the next AI path point at the exit.
---@param inPrevAiPathIdx integer Index of the previous point at the exit.
---@param outNextAiPathIdx integer Index of the next point at the return.
---@param outPrevAiPathIdx integer Index of the previous point at the return.
---@return number  Distance along the path (m).
---@return number  Distance cut between A and B (m).
function gameplay_race_race:getDistOnNav(pointA, pointB, inNextAiPathIdx, inPrevAiPathIdx, outNextAiPathIdx, outPrevAiPathIdx) end

--- For each vehicle with a timeDifferenceToFirst, returns the gap to the first one to have crossed the same point, its formatted text and the ranking.
---Source: lua/ge/extensions/gameplay/race/race.lua:1327
---@return table<integer, table>  id -> {timeDifference, timeDifferenceFormatted, placement}
function gameplay_race_race:getTimeDifferencesToFirst() end

--- Updates for each racing vehicle the front position, the index on the AI path, the isOnRoad state, then computes the ranking (placement), counting the vehicles that have already finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:182
---@param dt number Time delta (s).
function gameplay_race_race:getTrackedData(dt) end

--- Position of a vehicle: scene object, otherwise map.objects; returns vec3() with an error log if not found.
---Source: lua/ge/extensions/gameplay/race/race.lua:602
---@param id integer Vehicle.
---@return vec3  Position.
function gameplay_race_race:getVehiclePosition(id) end

--- Detects whether the vehicle crosses a not-yet-triggered call in its current segments; raises pacenoteReached and pacenoteIdReached (only one per frame).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1005
---@param id integer Vehicle.
function gameplay_race_race:handlePacenotes(id) end

--- Restores the state of the last snapshot, the race time if recoverAffectsTotalTime, and puts the vehicle back on the recovery position without repair (moveResetVehicleTo with repair false), then resets the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:650
---@param id integer Vehicle.
function gameplay_race_race:handleRecover(id) end

--- Indicates whether at least one recovery point exists for this vehicle.
---Source: lua/ge/extensions/gameplay/race/race.lua:636
---@param id integer Vehicle.
---@return boolean  true if one exists.
function gameplay_race_race:hasRecoveryPosition(id) end

--- Shows a vehicle's event log in ImGui (Time and Event columns).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1194
---@param id integer Vehicle.
---@param im table Module ui_imgui.
function gameplay_race_race:inDrawEventlog(id, im) end

--- Shows a lap and its segment times in ImGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1300
---@param lTimes table historicTimes entry.
---@param im table Module ui_imgui.
function gameplay_race_race:inDrawLapTimes(lTimes, im) end

--- Shows the list of segment times in ImGui (from most recent to oldest).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1280
---@param sTimes table[] Segment times.
---@param im table Module ui_imgui.
---@param mode string|nil 'index' (default), 'names' or 'id'.
---@param prefix string|nil Label prefix.
function gameplay_race_race:inDrawSegmentTimes(sTimes, im, mode, prefix) end

--- Shows a vehicle's times in ImGui (current lap, total, previous laps, segments if detail).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:1220
---@param id integer Vehicle.
---@param im table Module ui_imgui.
---@param detail boolean|nil true to show the segment times.
---@return boolean  true if the detail icon was clicked.
function gameplay_race_race:inDrawTimes(id, im, detail) end

--- Constructor: default values and ranking comparator.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:7
function gameplay_race_race:init() end

--- To be called every frame: for each vehicle, clears the events, handles the requested recoveries, updates the position on the course (updateVehicle), the debug drawing and digests the events; then updates the ranking, the LapTimes app and advances the race time. Does nothing until the race is started.
---Source: lua/ge/extensions/gameplay/race/race.lua:278
---@param dt number Simulated time delta (s).
function gameplay_race_race:onUpdate(dt) end

--- Formats a time in seconds as MM:SS.mmm.
---Source: lua/ge/extensions/gameplay/race/race.lua:1308
---@param time number Time in seconds.
---@return string  Formatted text.
function gameplay_race_race:raceTime(time) end

--- Requests the vehicle's recovery at the last recovery point; effective at the next update.
---Source: lua/ge/extensions/gameplay/race/race.lua:644
---@param id integer Vehicle.
---@return boolean  true only if a recovery state exists.
function gameplay_race_race:requestRecover(id) end

--- Sets the race path, runs autoConfig and computes the AI path.
---Source: lua/ge/extensions/gameplay/race/race.lua:51
---@param path table Path (gameplay/race/path).
function gameplay_race_race:setPath(path) end

--- Loads a race path from a JSON file (deserialized into a new path) then applies it with setPath. Logs an error if the file is not found.
---Source: lua/ge/extensions/gameplay/race/race.lua:35
---@param file string|nil Path of the .race.json / .path.json file.
function gameplay_race_race:setPathFile(file) end

--- Sets the list of participating vehicles and resets their states.
---Source: lua/ge/extensions/gameplay/race/race.lua:57
---@param ids integer[] Vehicle ids.
function gameplay_race_race:setVehicleIds(ids) end

--- Invalidates a vehicle's current lap (closed circuits only). Without keepLapProgress, also skips the progress: the next pathnode becomes the lap's finish line.
---Source: lua/ge/extensions/gameplay/race/race.lua:349
---@param id integer Vehicle.
---@param keepLapProgress boolean|nil true to keep the lap progress.
function gameplay_race_race:skipLap(id, keepLapProgress) end

--- Starts a vehicle's AI on the race path (ai.driveUsingPath): loops up to one more lap for a closed circuit, or the path extended by 250 m after the finish otherwise. Without a given aggression, estimates it from the vehicle's performance class (S 1, A 0.9, B 0.8, C 0.7, D 0.6, other 0.85).
---Source: lua/ge/extensions/gameplay/race/race.lua:395
---@param id integer Vehicle.
---@param aggression number|nil Aggression from 0 to 1.
function gameplay_race_race:startAiVehicle(id, aggression) end

--- Starts the race: loads core_hotlapping / core_lapTimes if needed, resets the time to 0, creates each vehicle's state (start segments, wheel corners, AI if autoAiMode) and computes the next pathnodes. The raceStarted event is raised for each vehicle.
---Source: lua/ge/extensions/gameplay/race/race.lua:469
function gameplay_race_race:startRace() end

--- Stops a vehicle's AI ('stop' mode).
---Source: lua/ge/extensions/gameplay/race/race.lua:461
---@param id integer Vehicle.
function gameplay_race_race:stopAiVehicle(id) end

--- Stops the race: notifies Hotlapping and LapTimes and stops the AI vehicles.
---Source: lua/ge/extensions/gameplay/race/race.lua:584
function gameplay_race_race:stopRace() end

--- Advances the vehicle's wheel corners, handles the rolling start, the calls, a possible invalidated lap, then tests whether a segment is finished or a next one reached. Records the segment time (interpolated with the crossing instant), applies the AI aggression of the custom fields (aiAggression, aiCoef tag), ends the lap if needed, updates the next pathnodes and signals a recovery point reached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/race.lua:852
---@param id integer Vehicle.
---@param dt number Time delta (s).
function gameplay_race_race:updateVehicle(id, dt) end


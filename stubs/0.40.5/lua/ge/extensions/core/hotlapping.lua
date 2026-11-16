---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/hotlapping.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_hotlapping`: freeroam "timed laps" mode (Hotlapping app). The player places checkpoints (waypoints with position, direction and radius) to define a circuit, the timer starts when passing through the first one, then laps and sections are timed with gaps relative to the best lap. The circuit can be saved/loaded (gameplay/hotlapping/<level>/*.race.json) and AI vehicles can drive it. The module also serves as a time display for race scenarios (old `onRace*` system) and for the new race system (`newRace*`).
--- Access: extension `core_hotlapping`: `extensions.load("core_hotlapping")`, then the global `core_hotlapping`
---@class core_hotlapping
core_hotlapping = {}

--- Adds a checkpoint to the circuit (edit mode only) and links it to the previous one with a segment. Without arguments, uses the player vehicle's position placed on the surface (or the camera), its direction if the vehicle is within 5 m, and the current radius (automatic or set by changeRadius).
---Source: lua/ge/extensions/core/hotlapping.lua:250
---@param cpPos vec3|nil World position of the center.
---@param cpDir vec3|nil Direction/normal; nil = no normal (passing in both directions).
---@param cpRadius number|nil Radius in meters.
function core_hotlapping.addCheckPoint(cpPos, cpDir, cpRadius) end

--- Changes the radius of all checkpoints: +1 m if sign > 0, -1 m if sign < 0 (clamped 1..15), back to the automatic radius if sign == 0 (the 1st change starts from 5).
---Source: lua/ge/extensions/core/hotlapping.lua:842
---@param sign number +1, -1 or 0.
function core_hotlapping.changeRadius(sign) end

--- Forgets the counter and the id of the last checkpoint and stops the AI. Does not clear the path itself.
---Source: lua/ge/extensions/core/hotlapping.lua:291
function core_hotlapping.clearAllCP() end

--- Formats milliseconds as 'MM:SS.mmm' (rounded to the integer); with addSign, prefixes '+' or '-'.
---Source: lua/ge/extensions/core/hotlapping.lua:714
---@param timeInMillis number|nil Time in ms.
---@param addSign boolean|nil true = adds the sign (gaps).
---@return string|nil  Text; nil if timeInMillis is nil.
function core_hotlapping.formatMillis(timeInMillis, addSign) end

--- CSS color of a gap: 'red' if > 0 (slower), 'green' if < 0, '' if zero.
---Source: lua/ge/extensions/core/hotlapping.lua:732
---@param val number Gap in ms.
---@return string  'red', 'green' or ''.
function core_hotlapping.getDiffColor(val) end

--- Time data formatted for the UI: {normal = summary per lap, detail = sections then lap}. The table is reused on every call.
---Source: lua/ge/extensions/core/hotlapping.lua:592
---@return table  {normal, detail}.
function core_hotlapping.getTimeInfo() end

--- Raw table of times per lap and section (see notes).
---Source: lua/ge/extensions/core/hotlapping.lua:584
---@return table  times (internal reference).
function core_hotlapping.getTimeInfoRaw() end

--- Loads a circuit from gameplay/hotlapping/<level>/<name>.race.json; failing that, looks for the old format in settings/hotlapping (files whose path contains the name). Then stops the timer, clears, restarts hotlapping mode and notifies the UI.
---Source: lua/ge/extensions/core/hotlapping.lua:748
---@param originalFilename string Circuit name without extension.
function core_hotlapping.load(originalFilename) end

--- New system hook: the current lap was skipped; marks it 'skipped' and resets the checkpoint to 1 if state.skippedLap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:932
---@param state table Vehicle state.
---@param info table Not used.
function core_hotlapping.newRaceLapSkipped(state, info) end

--- New system hook: player passes a pathnode. Ends the race if state.complete, otherwise advances lap/checkpoint (ignores recoveries) and updates the times.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:906
---@param state table Vehicle state in the race (complete, events).
---@param info table Passing info (lapped).
function core_hotlapping.newRacePathnodeReached(state, info) end

--- New race system hook: starts tracking (closed race, laps from 1, clock = race.time*1000) and detects branching circuits (comparisons disabled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:890
---@param race table Race object (time, path.pathnodes, path.config.branching).
function core_hotlapping.newRaceStart(race) end

--- New system hook: race stop (started = false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:961
function core_hotlapping.newRaceStop() end

--- Intended for passing a checkpoint (legacy freeroam mode): if index is the next expected one, advances the lap/checkpoint counter. No call in this file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:329
---@param index integer Index of the passed checkpoint (0 = start line).
function core_hotlapping.onCheckPointPassed(index) end

--- Level end hook: stops hotlapping mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:878
function core_hotlapping.onClientEndMission() end

--- Level start hook: stops hotlapping mode and resets the app (HotlappingResetApp).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:873
function core_hotlapping.onClientStartMission() end

--- Unload hook: stops hotlapping mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:882
function core_hotlapping.onExtensionUnloaded() end

--- Game state change hook: forces the next send to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:949
---@param ... any Not used.
function core_hotlapping.onGameStateUpdate(...) end

--- Menu open/close hook: forces the next send to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:953
---@param ... any Not used.
function core_hotlapping.onMenuToggled(...) end

--- Render hook: in edit mode, draws spheres, vertical columns (the first in orange) and direction arrows of the checkpoints; otherwise renders the race markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:362
---@param dt number Render time delta in seconds.
---@param dtSim number Simulation time delta.
function core_hotlapping.onPreRender(dt, dtSim) end

--- Old system hook: race end; stops the timer and stores the detailed times in scenario.detailedTimes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:1017
---@param final any Not used.
function core_hotlapping.onRaceResult(final) end

--- Old race scenario system hook: starts tracking with the scenario timer (scenario.timer in seconds), closed race, laps from 1; branching circuits if lapConfigBranches is defined.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:969
function core_hotlapping.onRaceStart() end

--- Old system hook: the player reached a waypoint. Handles race end, lap change (lapDiff == 1) or checkpoint change and updates the times. Ignores the other vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:986
---@param wpInfo table {vehicleId, next, lapDiff, …}.
function core_hotlapping.onRaceWaypointReached(wpInfo) end

--- Screen fade hook: forces the next send to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:957
---@param ... any Not used.
function core_hotlapping.onScreenFadeState(...) end

--- Per-frame hook: starts the race when the player enters the first checkpoint, handles pause, updates the race and the total time, then sends the state to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:389
---@param dt number Real-time delta in seconds.
---@param dtSim number Simulation time delta.
function core_hotlapping.onUpdate(dt, dtSim) end

--- Vehicle reset hook: if the player is reset near (less than 80 m) the start during a race, stops the AI and puts it back at its start point.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/hotlapping.lua:866
---@param id integer Vehicle id.
function core_hotlapping.onVehicleResetted(id) end

--- Sends the timer state (getTimeInfo plus stop, justLapped, delta, closed, running, justStarted) to the UI (HotlappingTimer) if a checkpoint was just passed, a lap was completed or a forced send is requested.
---Source: lua/ge/extensions/core/hotlapping.lua:459
function core_hotlapping.passTimeToGUI() end

--- Lists the available circuits (current level, plus older ones in settings/hotlapping) without extension.
---Source: lua/ge/extensions/core/hotlapping.lua:827
---@return string[]  Circuit names (alphanumeric characters, '-' and '_' before the first other character).
function core_hotlapping.refreshTracklist() end

--- Renames a circuit of the current level (<old>.race.json -> <new>.race.json).
---Source: lua/ge/extensions/core/hotlapping.lua:813
---@param oldName string Old name without extension.
---@param newName string New name without extension.
function core_hotlapping.rename(oldName, newName) end

--- Saves the circuit as JSON (gameplay/hotlapping/<level>/<date>.race.json by default), sends HotlappingSuccessfullySaved to the UI. Refuses if the path is invalid.
---Source: lua/ge/extensions/core/hotlapping.lua:797
---@param filePath string|nil Output path; default dated in the current level's folder.
function core_hotlapping.save(filePath) end

--- Freezes the section and lap times at totalTime at the end of the race and updates the gap and best lap.
---Source: lua/ge/extensions/core/hotlapping.lua:475
function core_hotlapping.setEndTime() end

--- Updates the current times: creates the lap and checkpoint record if needed, closes the previous one, computes durations, gaps relative to the best lap and updates the best lap (comparisons disabled for branching races).
---Source: lua/ge/extensions/core/hotlapping.lua:504
---@param ignoreNewLap any Not used in the code.
function core_hotlapping.setTime(ignoreNewLap) end

--- Shows or hides the race markers and mutes/unmutes the checkpoint sound.
---Source: lua/ge/extensions/core/hotlapping.lua:298
---@param value boolean true = visible.
function core_hotlapping.setVisible(value) end

--- Skips the current lap (marked 'skipped' in the times) via raceData:skipLap for the player vehicle.
---Source: lua/ge/extensions/core/hotlapping.lua:209
---@param keepLapProgress boolean|nil Passed to raceData:skipLap: whether or not to keep the progress within the lap (inferred from code).
function core_hotlapping.skipLap(keepLapProgress) end

--- Starts the timer (called automatically when the player passes through the first checkpoint). In edit mode, validates the path, creates the race object (1000 laps, hotlapping app, checkpoint audio), the visual markers and plays the UI_Checkpoint sound. Stops immediately if the path is invalid.
---Source: lua/ge/extensions/core/hotlapping.lua:168
function core_hotlapping.start() end

--- Makes all non-traffic/non-parked AI vehicles drive the circuit in a loop (1000 laps, vehicle avoidance enabled). If no race is started and we are in edit mode, starts the race first.
---Source: lua/ge/extensions/core/hotlapping.lua:104
function core_hotlapping.startAi() end

--- Enters circuit edit mode: resets the state, creates a path object (gameplay/race/path) and adds the first checkpoint at the vehicle's position. Disables the mode (warning) if there is no player vehicle.
---Source: lua/ge/extensions/core/hotlapping.lua:56
function core_hotlapping.startHotlapping() end

--- Stops the vehicles marked isHotlapping (ai.setMode('stop')) and, if respawn, puts them back at their saved position (recovery.loadHome).
---Source: lua/ge/extensions/core/hotlapping.lua:135
---@param respawn boolean|nil true = put the vehicles back to their 'home'.
function core_hotlapping.stopAi(respawn) end

--- Stops everything: stops the timer, leaves edit mode, destroys the path and removes the isHotlapping marking from the vehicles.
---Source: lua/ge/extensions/core/hotlapping.lua:88
function core_hotlapping.stopHotlapping() end

--- Stops the timer, clears the times, stops the race and the markers; goes back to edit mode if a race was running; stops the AI.
---Source: lua/ge/extensions/core/hotlapping.lua:216
function core_hotlapping.stopTimer() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/richPresence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the game's "rich presence": the status shown in Steam (rich presence and Steam timeline), the UDS activity (startActivityByID) and the Discord status. It infers the current activity (replay, photo mode, career and its sub-modes, garage, mission, scenario, drag, crawl, drift, level, main menu) and the status text (for example "Playing X on Level with Brand Model"), and it adds events to the Steam timeline (crash, rollover, attempt, race lap, result...). The set and setActivity functions are replaced by nop when the feature is disabled (development builds or richPresence setting false).
--- Access: extension `util_richPresence`: `extensions.load("util_richPresence")`, then the global `util_richPresence`
---@class util_richPresence
---@field onDeserialized function nop (do not remove, according to the code comment)
---@field richPresenceEnabled boolean true if the set/setActivity functions are active
---@field state table {levelName, vehicleName, levelIdentifier, vehicleJbeam?}: state used to compose the message
util_richPresence = {}

--- Hook called at the end of a level: sets the Steam timeline to loading screen mode (4).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:526
---@param levelpath string Level path
function util_richPresence.clientEndMission(levelpath) end

--- Hook called before a level starts: sets the Steam timeline to loading screen mode (4).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:526
---@param levelpath string Level path
function util_richPresence.clientPreStartMission(levelpath) end

--- Hook called when a mission changes: updates the message and the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:398
function util_richPresence.onAnyMissionChanged() end

--- Hook called on attempt success: "Completed" event in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:616
---@param attemptData table Attempt data (not used)
function util_richPresence.onAttemptCompleted(attemptData) end

--- Hook called on attempt failure: "Failed" event in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:606
---@param attemptData table Attempt data (not used)
function util_richPresence.onAttemptFailed(attemptData) end

--- Hook: recomputes the activity when the career becomes active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:230
function util_richPresence.onCareerActive() end

--- Hook called after a level starts: stores the level's identifier and readable name, updates the message and the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:357
---@param levelPath string Level path
function util_richPresence.onClientPostStartMission(levelPath) end

--- Hook: recomputes the activity at the end of a crawl course.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:242
function util_richPresence.onCrawlCleared() end

--- Hook: recomputes the activity at the start of a crawl course.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:241
function util_richPresence.onCrawlStarted() end

--- Hook: recomputes the activity at the start of delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:231
function util_richPresence.onDeliveryModeStarted() end

--- Hook: recomputes the activity at the end of delivery mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:232
function util_richPresence.onDeliveryModeStopped() end

--- Hook: recomputes the activity when drag data is cleared.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:239
function util_richPresence.onDragClear() end

--- Hook: recomputes the activity once the drag clearing is complete.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:240
function util_richPresence.onDragClearComplete() end

--- Hook: recomputes the activity when drag data is set.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:238
function util_richPresence.onDragDataSet() end

--- Hook: recomputes the activity on drag reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:237
function util_richPresence.onDragReset() end

--- Hook: recomputes the activity when the drift context changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:243
function util_richPresence.onDriftContextChanged() end

--- Hook called when the editor opens: message "Using World Editor" and Steam game mode 2.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:379
function util_richPresence.onEditorActivated() end

--- Hook called when the editor closes: updates the message and resets the Steam game mode to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:386
function util_richPresence.onEditorDeactivated() end

--- Called on load: initializes Steam and Discord rich presence according to the settings and registers the statistics callbacks for the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:440
function util_richPresence.onExtensionLoaded() end

--- Called on unload: clears the Steam status and the Discord activity and removes the statistics callbacks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:460
function util_richPresence.onExtensionUnloaded() end

--- Hook called when the game state changes: updates the message and the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:393
---@param state table New state (not used directly)
function util_richPresence.onGameStateUpdate(state) end

--- Hook called when a mission attempt is aggregated: "Mission <type>" event with the mission name in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:669
---@param attempt table Attempt (type field used)
---@param mission table Mission (name field used)
function util_richPresence.onMissionAttemptAggregated(attempt, mission) end

--- Hook called at the start of an attempt: "New attempt" event in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:596
---@param attemptData table Attempt data (not used)
function util_richPresence.onNewAttempt(attemptData) end

--- Hook: recomputes the activity when a part purchase is canceled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:236
function util_richPresence.onPartShoppingCancelled() end

--- Hook: recomputes the activity at the start of a part shopping session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:233
function util_richPresence.onPartShoppingStarted() end

--- Hook: recomputes the activity after a part shopping transaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:234
function util_richPresence.onPartShoppingTransactionComplete() end

--- Hook called when a race branch is chosen: "Race branch" event in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:647
---@param data table Branch data (not used)
function util_richPresence.onRaceBranchChosen(data) end

--- Hook called at the end of a lap: "Race lap N" event with the time formatted as mm:ss.mmm in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:636
---@param data table Contains lap (lap number) and time (seconds)
function util_richPresence.onRaceLap(data) end

--- Hook called on race result: "Race Result" event with the formatted final time in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:658
---@param data table Contains finalTime (seconds)
function util_richPresence.onRaceResult(data) end

--- Hook called when passing a race checkpoint: "Race waypoint" event in the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:626
---@param data table Checkpoint data (not used)
function util_richPresence.onRaceWaypointReached(data) end

--- Hook called on gameplay reset: adds a "reset" event to the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:586
function util_richPresence.onResetGameplay() end

--- Hook: recomputes the activity on scenario change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:235
function util_richPresence.onScenarioChange() end

--- Hook called when settings change: enables or disables rich presence (Steam, Discord, set/setActivity) according to richPresence and richPresenceDiscord.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:493
function util_richPresence.onSettingsChanged() end

--- Hook called when the UI state changes: updates the game mode and the state description of the Steam timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:562
---@param toState string New state (menu.*, loading, scenario-*, other)
---@param fromState string Old state
function util_richPresence.onUiChangedState(toState, fromState) end

--- Hook called when the UI is ready: infers the Steam game mode (menu, loading, setup, playing) from the current state and updates the activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:533
function util_richPresence.onUiReady() end

--- Hook called when the player vehicle changes: rereads the vehicle's name and brand (info.json) and updates the message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:339
---@param oldId integer Old vehicle id
---@param newId integer New vehicle id
---@param player integer Player index
function util_richPresence.onVehicleSwitched(oldId, newId, player) end

--- Hook: recomputes the activity when the world state changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/richPresence.lua:244
---@param levelpath string Level path (not used)
function util_richPresence.onWorldReadyState(levelpath) end

--- Sets the Steam rich presence text (key 'b'); returns success. Replaced by nop if rich presence is disabled. (dynamically assigned)
---Source: lua/ge/extensions/util/richPresence.lua:dyn
---@param v any Text to display (converted with tostring)
---@return boolean|nil  true on success (return value of OnlineServiceProvider.setRichPresence)
function util_richPresence.set(v) end

--- Starts a UDS activity by identifier if it differs from the last one sent. Replaced by nop if disabled. (dynamically assigned)
---Source: lua/ge/extensions/util/richPresence.lua:dyn
---@param activityId string Activity identifier (see the activities table in the file)
function util_richPresence.setActivity(activityId) end


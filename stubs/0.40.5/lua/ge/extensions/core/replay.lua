---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/replay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua interface of the replay system (.rpl files under replays/). It drives the C++ file stream (be:getFileStream): manual or mission recording, playback, pause, speed, seek, rename, delete. It receives the engine state through stateChanged, republishes it to the UI (guihooks replayStateChanged) and to extensions (hooks onReplayStateChanged and onReplayCoreEvent), and enables or disables the playback action maps. Also handles automatic mission replays (replays/missionReplays/ and replays/userSavedMissionReplays/).
--- Access: extension `core_replay`: `extensions.load("core_replay")`, then the global `core_replay`
---@class core_replay
core_replay = {}

--- Called by C++: returns the vehicle data (core_vehicle_manager.getVehicleData) encoded as JSON.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/replay.lua:1054
---@param id integer Vehicle id.
---@return string  JSON; must be a string.
function core_replay._getReplayVehicleData(id) end

--- Renames a replay (and its .rplMeta.json). A new name without '/' stays in the same folder; refused if the target exists. If the replay was loaded, it is reloaded under its new name.
---Source: lua/ge/extensions/core/replay.lua:909
---@param oldFilename string Old path under replays/.
---@param newFilename string New name or path.
---@return table  {success, filename, newFilename?, message?}.
function core_replay.acceptRename(oldFilename, newFilename) end

--- If a recording is in progress: stops it and deletes the file, then publishes the empty state.
---Source: lua/ge/extensions/core/replay.lua:689
function core_replay.cancelRecording() end

--- Displays a notification (toastrMsg) 'Replay <level>' and writes a log.
---Source: lua/ge/extensions/core/replay.lua:546
---@param level string Toastr category: error, info, warning...
---@param msg string Translation key or text.
---@param context table|nil Translation variables.
function core_replay.displayMsg(level, msg, context) end

--- Indicates whether the replay debug logs are active.
---Source: lua/ge/extensions/core/replay.lua:40
---@return boolean  Debug state.
function core_replay.getDebugEnabled() end

--- Name of the loaded replay file.
---Source: lua/ge/extensions/core/replay.lua:483
---@return string|nil  File path.
function core_replay.getLoadedFile() end

--- Lists the mission replays (automatic and user-saved for the current career/freeroam) matching a mission, sorted by meta.time.
---Source: lua/ge/extensions/core/replay.lua:971
---@param mission table Mission, with an id field.
---@param returnOnlyWithAttempt boolean|nil If true, keeps only those whose meta contains attempt.
---@return table[]  Entries {replayFile, replayFileName, meta, userSaved}.
function core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt) end

--- Returns the folder of automatic mission replays.
---Source: lua/ge/extensions/core/replay.lua:1104
---@return string  "replays/missionReplays/".
function core_replay.getMissionReplaysPath() end

--- Indicates whether a replay can be played and whether its level must be loaded first.
---Source: lua/ge/extensions/core/replay.lua:298
---@param filename string Replay file (under replays/).
---@return table  {success, filename, code, recordedLevel, currentLevel, levelKnown, requiresLevelLoad} or failure with code invalidFilename / fileNotFound.
function core_replay.getPlaybackContext(filename) end

--- Current playback position in seconds.
---Source: lua/ge/extensions/core/replay.lua:458
---@return number|nil  Position (nil before the first stateChanged).
function core_replay.getPositionSeconds() end

--- Lists the .rpl files of the replays/ folder (without subfolders). Each entry: filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. The level is guessed by scanning the start of the file (up to 1 MB); sort: current level first, then most recent.
---Source: lua/ge/extensions/core/replay.lua:261
---@return table[]  List of recordings.
function core_replay.getRecordings() end

--- State of the replay system.
---Source: lua/ge/extensions/core/replay.lua:466
---@return string|nil  'inactive', 'playback' or 'recording'.
function core_replay.getState() end

--- Total duration of the loaded replay in seconds.
---Source: lua/ge/extensions/core/replay.lua:462
---@return number|nil  Duration.
function core_replay.getTotalSeconds() end

--- Indicates whether gameplay is allowed during the replay. Currently always returns true (a TODO in the code plans an option).
---Source: lua/ge/extensions/core/replay.lua:470
---@return boolean  Always true.
function core_replay.isGameplayAllowed() end

--- Indicates whether playback is paused.
---Source: lua/ge/extensions/core/replay.lua:479
---@return boolean|nil  Pause state.
function core_replay.isPaused() end

--- Alias of jumpFrames (old name).
---Source: lua/ge/extensions/core/replay.lua:842
---@param offset integer Number of frames.
function core_replay.jump(offset) end

--- Moves forward or backward by a number of frames (stream:stepFrames) and displays a UI message.
---Source: lua/ge/extensions/core/replay.lua:842
---@param offset integer Number of frames (negative = backward).
function core_replay.jumpFrames(offset) end

--- Moves forward or backward by a duration (stream:stepTime) and displays a UI message.
---Source: lua/ge/extensions/core/replay.lua:849
---@param timeDiffInSeconds number Duration in seconds (negative = backward).
function core_replay.jumpTime(timeDiffInSeconds) end

--- Queues the loading of a replay (displays the waiting screen; playback starts in onUiWaitingState). Validates the file name.
---Source: lua/ge/extensions/core/replay.lua:631
---@param filename string Path under replays/ (.rpl extension).
---@param autoplay boolean|nil If true, playback starts immediately; otherwise it starts paused.
---@param options table|nil options.pauseWhenReady = true: pauses again at the start when the world is ready.
---@return table  {success, filename, code = 'queued'} or failure.
function core_replay.loadFile(filename, autoplay, options) end

--- Writes to the debug log (if active) an action coming from the UI, with the prefix 'ui.'.
---Source: lua/ge/extensions/core/replay.lua:36
---@param scope string Name of the action.
---@param data any Data to log.
function core_replay.logUiAction(scope, data) end

--- Hook called at the end of a level: if playback is in progress and the level change was not requested by startLevel, playback is stopped with a message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/replay.lua:863
---@param levelPath string Path of the level being left (inferred from code).
function core_replay.onClientEndMission(levelPath) end

--- Extension initialization hook: asks the file stream to send back its state (stream:requestState).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/replay.lua:254
function core_replay.onInit() end

--- Hook called when the UI waiting screen is displayed. It then starts playback of the file queued by loadFile (stream stop then play).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/replay.lua:608
---@param state boolean True when waiting is active; otherwise ignored.
function core_replay.onUiWaitingState(state) end

--- Opens the location of a replay file in the explorer; logs an error if it does not exist.
---Source: lua/ge/extensions/core/replay.lua:1044
---@param replayFileName string File path.
function core_replay.openMissionReplayFolder(replayFileName) end

--- Opens the replays/ folder in the file explorer (creates it if missing).
---Source: lua/ge/extensions/core/replay.lua:856
function core_replay.openReplayFolderInExplorer() end

--- Pauses or resumes playback. No effect outside 'playback'.
---Source: lua/ge/extensions/core/replay.lua:538
---@param v boolean true = pause.
function core_replay.pause(v) end

--- Reverse operation: moves a saved replay to replays/missionReplays/ (so that it is managed automatically again), then notifies the UI.
---Source: lua/ge/extensions/core/replay.lua:1028
---@param replayFileName string Path of the .rpl.
function core_replay.removeMissionSavedReplay(replayFileName) end

--- Deletes a replay and its .rplMeta.json file; stops it first if it is loaded; updates the catalog.
---Source: lua/ge/extensions/core/replay.lua:882
---@param filename string File under replays/.
---@return table  {success, filename, message?}.
function core_replay.removeRecording(filename) end

--- Moves an automatic mission replay to the user-saved replays folder (career/<slot>/ or freeroam/) with its .rplMeta.json, then notifies the UI (recordingFilesUpdated).
---Source: lua/ge/extensions/core/replay.lua:1011
---@param replayFileName string Path of the .rpl.
function core_replay.saveMissionReplay(replayFileName) end

--- Jumps to a normalized position of the replay. No effect outside playback.
---Source: lua/ge/extensions/core/replay.lua:834
---@param percent number Position between 0 and 1 (clamped).
function core_replay.seek(percent) end

--- Enables or disables the replay debug logs (tag core_replay.debug).
---Source: lua/ge/extensions/core/replay.lua:31
---@param enabled boolean True to enable.
function core_replay.setDebugEnabled(enabled) end

--- Sets the playback speed (1 = realtime, 0.5 = slow motion, 2 = fast motion), without smoothing. Does nothing if the speed is already this value.
---Source: lua/ge/extensions/core/replay.lua:487
---@param speed number Speed factor.
function core_replay.setSpeed(speed) end

--- Starts the given level in freeroam without spawning a vehicle (freeroam_freeroam.startFreeroamByName), marking requestedStartLevel so as not to stop playback.
---Source: lua/ge/extensions/core/replay.lua:873
---@param levelPath string Level path.
function core_replay.startLevel(levelPath) end

--- Starts a manual recording in replays/ (name 'YYYY-MM-DD_HH-MM-SS <level>.rpl'). Refused if already recording, playing back, or if a mission recording is active.
---Source: lua/ge/extensions/core/replay.lua:774
---@return table  {success, filename, code, ...}.
function core_replay.startRecording() end

--- Called by C++ on every change of the replay stream state. On entering 'playback', disables the VehicleCommon/VehicleSpecific action maps and pushes ReplayPlaybackActionMap; on leaving, the reverse. Updates M.state, triggers guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) and 'onReplayCoreEvent'({event, state, ...}) with event among playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/replay.lua:376
---@param loadedFile string Loaded file.
---@param positionSeconds number Playback position (s).
---@param totalSeconds number Total duration (s).
---@param speed number Playback speed.
---@param paused boolean Paused.
---@param fpsPlay number Frames per second in playback.
---@param fpsRec number Frames per second when recording.
---@param statestr string 'inactive', 'playback' or 'recording'.
---@param framePositionSeconds number Position of the current frame (s).
function core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds) end

--- Cancels a pending load and stops the stream (playback or recording).
---Source: lua/ge/extensions/core/replay.lua:662
function core_replay.stop() end

--- Stops playback and publishes an empty 'inactive' state. Refused during a recording (code recordingActive).
---Source: lua/ge/extensions/core/replay.lua:672
---@return table  Result {success, filename, message?, code}.
function core_replay.stopAndUnload() end

--- Stops the manual recording and updates the catalog (guihooks replayRecordingsUpdated).
---Source: lua/ge/extensions/core/replay.lua:790
---@param options table|nil options.autoplayAfterStopping = true: loads the replay on stop.
---@return table  {success, filename, code, playbackResult?}.
function core_replay.stopRecording(options) end

--- Shortcut for toggleRecording(false, true): toggles mission replay recording.
---Source: lua/ge/extensions/core/replay.lua:830
---@return string|nil  File name if a recording has just started.
function core_replay.toggleMissionRecording() end

--- Toggles play/pause of the loaded replay. If the state is 'inactive', reloads and starts the file; outside playback and inactive, logs an error.
---Source: lua/ge/extensions/core/replay.lua:552
function core_replay.togglePlay() end

--- Toggles recording: while recording, stops it; during playback, stops playback; otherwise starts a recording.
---Source: lua/ge/extensions/core/replay.lua:808
---@param autoplayAfterStopping boolean|nil Play the replay after stopping. If nil: true for a manual recording, false for a mission replay.
---@param isMissionReplay boolean|nil Automatic mission replay (replays/missionReplays/ folder).
---@return string|nil  File name if a recording has just started.
function core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay) end

--- Changes the speed. 'realtime' alternates between 1 and the last other speed (1/8 at start); 'slowmotion' sets 1/8; a positive or negative number goes up or down that many steps in the speed list. Informs simTimeAuthority.
---Source: lua/ge/extensions/core/replay.lua:496
---@param val string|integer 'realtime', 'slowmotion', or number of steps (+1, -1...).
function core_replay.toggleSpeed(val) end


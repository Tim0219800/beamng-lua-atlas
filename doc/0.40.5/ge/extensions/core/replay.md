# `core_replay`

*File: `lua/ge/extensions/core/replay.lua` · VM: Game Engine (GE) · 1109 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_replay`: `extensions.load("core_replay")`, then the global `core_replay`

Lua interface of the replay system (.rpl files under replays/). It drives the C++ file stream (be:getFileStream): manual or mission recording, playback, pause, speed, seek, rename, delete. It receives the engine state through stateChanged, republishes it to the UI (guihooks replayStateChanged) and to extensions (hooks onReplayStateChanged and onReplayCoreEvent), and enables or disables the playback action maps. Also handles automatic mission replays (replays/missionReplays/ and replays/userSavedMissionReplays/).

## Example

```lua
core_replay.startRecording()
-- later
core_replay.stopRecording({autoplayAfterStopping = true})
local list = core_replay.getRecordings()
core_replay.loadFile(list[1].filename, true)
```

## Notes

- M.state contains: loadedFile, positionSeconds, totalSeconds, speed (rounded to the thousandth), paused, fpsPlay, fpsRec, state ('inactive', 'playback' or 'recording'), framePositionSeconds.
- All file names are validated: relative to the game, under replays/, with the .rpl extension, without '..', without ':' or forbidden characters. Otherwise the functions return a failure result with code 'invalidFilename' or a message.
- Many functions return a result {success, filename, message?, code?, ...} (replayOperationResult). Codes seen: ok, queued, invalidFilename, fileNotFound, streamUnavailable, streamPlayFailed, recordStartFailed, recordingActive, notRecording, playbackActive.
- loadFile does not start playback right away: it queues the request and displays 'app:waiting'; playback starts in onUiWaitingState. A new call replaces the pending request.
- Speeds reachable by toggleSpeed: 1/1000, 1/500, 1/200, 1/100, 1/50, 1/32, 1/16, 1/8, 1/4, 1/2, 3/4, 1, 1.5, 2, 4, 8.
- The comment of setSpeed says '1=realtime, 0.5=slowmo, 2=fastmotion'. The change is instantaneous, without smoothing.
- A manual recording is refused while a mission recording is active (UI message replay.cantManualRecording).
- Probable BUG: getMissionReplayFiles calls career_saveSystem.getCurrentProfile() without testing that career_saveSystem exists (the career_career test comes after). Outside career, if career_saveSystem is not loaded, this raises an error.
- The functions saveMissionReplay and removeMissionSavedReplay copy then delete the .rpl and .rplMeta.json files, and assume the meta exists (meta.missionId).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_replay._getReplayVehicleData(id)` | Called by C++: returns the vehicle data (core_vehicle_manager.getVehicleData) encoded as JSON. *(internal)* | 1054 |
| `core_replay.acceptRename(oldFilename, newFilename)` | Renames a replay (and its .rplMeta.json). A new name without '/' stays in the same folder; refused if the target exists. If the replay was loaded, it is reloaded under its new name. | 909 |
| `core_replay.cancelRecording()` | If a recording is in progress: stops it and deletes the file, then publishes the empty state. | 689 |
| `core_replay.displayMsg(level, msg, context)` | Displays a notification (toastrMsg) 'Replay <level>' and writes a log. | 546 |
| `core_replay.getDebugEnabled()` | Indicates whether the replay debug logs are active. | 40 |
| `core_replay.getLoadedFile()` | Name of the loaded replay file. | 483 |
| `core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt)` | Lists the mission replays (automatic and user-saved for the current career/freeroam) matching a mission, sorted by meta.time. | 971 |
| `core_replay.getMissionReplaysPath()` | Returns the folder of automatic mission replays. | 1104 |
| `core_replay.getPlaybackContext(filename)` | Indicates whether a replay can be played and whether its level must be loaded first. | 298 |
| `core_replay.getPositionSeconds()` | Current playback position in seconds. | 458 |
| `core_replay.getRecordings()` | Lists the .rpl files of the replays/ folder (without subfolders). Each entry: filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. The level is guessed by scanning the start of the file (up to 1 MB); sort: current level first, then most recent. | 261 |
| `core_replay.getState()` | State of the replay system. | 466 |
| `core_replay.getTotalSeconds()` | Total duration of the loaded replay in seconds. | 462 |
| `core_replay.isGameplayAllowed()` | Indicates whether gameplay is allowed during the replay. Currently always returns true (a TODO in the code plans an option). | 470 |
| `core_replay.isPaused()` | Indicates whether playback is paused. | 479 |
| `core_replay.jump(offset)` | Alias of jumpFrames (old name). | 842 |
| `core_replay.jumpFrames(offset)` | Moves forward or backward by a number of frames (stream:stepFrames) and displays a UI message. | 842 |
| `core_replay.jumpTime(timeDiffInSeconds)` | Moves forward or backward by a duration (stream:stepTime) and displays a UI message. | 849 |
| `core_replay.loadFile(filename, autoplay, options)` | Queues the loading of a replay (displays the waiting screen; playback starts in onUiWaitingState). Validates the file name. | 631 |
| `core_replay.logUiAction(scope, data)` | Writes to the debug log (if active) an action coming from the UI, with the prefix 'ui.'. | 36 |
| `core_replay.onClientEndMission(levelPath)` | Hook called at the end of a level: if playback is in progress and the level change was not requested by startLevel, playback is stopped with a message. *(internal)* *(hook)* | 863 |
| `core_replay.onInit()` | Extension initialization hook: asks the file stream to send back its state (stream:requestState). *(internal)* *(hook)* | 254 |
| `core_replay.onUiWaitingState(state)` | Hook called when the UI waiting screen is displayed. It then starts playback of the file queued by loadFile (stream stop then play). *(internal)* *(hook)* | 608 |
| `core_replay.openMissionReplayFolder(replayFileName)` | Opens the location of a replay file in the explorer; logs an error if it does not exist. | 1044 |
| `core_replay.openReplayFolderInExplorer()` | Opens the replays/ folder in the file explorer (creates it if missing). | 856 |
| `core_replay.pause(v)` | Pauses or resumes playback. No effect outside 'playback'. | 538 |
| `core_replay.removeMissionSavedReplay(replayFileName)` | Reverse operation: moves a saved replay to replays/missionReplays/ (so that it is managed automatically again), then notifies the UI. | 1028 |
| `core_replay.removeRecording(filename)` | Deletes a replay and its .rplMeta.json file; stops it first if it is loaded; updates the catalog. | 882 |
| `core_replay.saveMissionReplay(replayFileName)` | Moves an automatic mission replay to the user-saved replays folder (career/<slot>/ or freeroam/) with its .rplMeta.json, then notifies the UI (recordingFilesUpdated). | 1011 |
| `core_replay.seek(percent)` | Jumps to a normalized position of the replay. No effect outside playback. | 834 |
| `core_replay.setDebugEnabled(enabled)` | Enables or disables the replay debug logs (tag core_replay.debug). | 31 |
| `core_replay.setSpeed(speed)` | Sets the playback speed (1 = realtime, 0.5 = slow motion, 2 = fast motion), without smoothing. Does nothing if the speed is already this value. | 487 |
| `core_replay.startLevel(levelPath)` | Starts the given level in freeroam without spawning a vehicle (freeroam_freeroam.startFreeroamByName), marking requestedStartLevel so as not to stop playback. | 873 |
| `core_replay.startRecording()` | Starts a manual recording in replays/ (name 'YYYY-MM-DD_HH-MM-SS <level>.rpl'). Refused if already recording, playing back, or if a mission recording is active. | 774 |
| `core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds)` | Called by C++ on every change of the replay stream state. On entering 'playback', disables the VehicleCommon/VehicleSpecific action maps and pushes ReplayPlaybackActionMap; on leaving, the reverse. Updates M.state, triggers guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) and 'onReplayCoreEvent'({event, state, ...}) with event among playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged. *(internal)* | 376 |
| `core_replay.stop()` | Cancels a pending load and stops the stream (playback or recording). | 662 |
| `core_replay.stopAndUnload()` | Stops playback and publishes an empty 'inactive' state. Refused during a recording (code recordingActive). | 672 |
| `core_replay.stopRecording(options)` | Stops the manual recording and updates the catalog (guihooks replayRecordingsUpdated). | 790 |
| `core_replay.toggleMissionRecording()` | Shortcut for toggleRecording(false, true): toggles mission replay recording. | 830 |
| `core_replay.togglePlay()` | Toggles play/pause of the loaded replay. If the state is 'inactive', reloads and starts the file; outside playback and inactive, logs an error. | 552 |
| `core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay)` | Toggles recording: while recording, stops it; during playback, stops playback; otherwise starts a recording. | 808 |
| `core_replay.toggleSpeed(val)` | Changes the speed. 'realtime' alternates between 1 and the last other speed (1/8 at start); 'slowmotion' sets 1/8; a positive or negative number goes up or down that many steps in the speed list. Informs simTimeAuthority. | 496 |

### Parameter details

#### `core_replay._getReplayVehicleData(id)`

Called by C++: returns the vehicle data (core_vehicle_manager.getVehicleData) encoded as JSON.

- `id` (*integer*) : Vehicle id.
- **returns**: string JSON; must be a string.

#### `core_replay.acceptRename(oldFilename, newFilename)`

Renames a replay (and its .rplMeta.json). A new name without '/' stays in the same folder; refused if the target exists. If the replay was loaded, it is reloaded under its new name.

- `oldFilename` (*string*) : Old path under replays/.
- `newFilename` (*string*) : New name or path.
- **returns**: table {success, filename, newFilename?, message?}.

#### `core_replay.displayMsg(level, msg, context)`

Displays a notification (toastrMsg) 'Replay <level>' and writes a log.

- `level` (*string*) : Toastr category: error, info, warning...
- `msg` (*string*) : Translation key or text.
- `context` (*table|nil*) : Translation variables.

#### `core_replay.getDebugEnabled()`

Indicates whether the replay debug logs are active.

- **returns**: boolean Debug state.

#### `core_replay.getLoadedFile()`

Name of the loaded replay file.

- **returns**: string|nil File path.

#### `core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt)`

Lists the mission replays (automatic and user-saved for the current career/freeroam) matching a mission, sorted by meta.time.

- `mission` (*table*) : Mission, with an id field.
- `returnOnlyWithAttempt` (*boolean|nil*) : If true, keeps only those whose meta contains attempt.
- **returns**: table[] Entries {replayFile, replayFileName, meta, userSaved}.

#### `core_replay.getMissionReplaysPath()`

Returns the folder of automatic mission replays.

- **returns**: string "replays/missionReplays/".

#### `core_replay.getPlaybackContext(filename)`

Indicates whether a replay can be played and whether its level must be loaded first.

- `filename` (*string*) : Replay file (under replays/).
- **returns**: table {success, filename, code, recordedLevel, currentLevel, levelKnown, requiresLevelLoad} or failure with code invalidFilename / fileNotFound.

#### `core_replay.getPositionSeconds()`

Current playback position in seconds.

- **returns**: number|nil Position (nil before the first stateChanged).

#### `core_replay.getRecordings()`

Lists the .rpl files of the replays/ folder (without subfolders). Each entry: filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. The level is guessed by scanning the start of the file (up to 1 MB); sort: current level first, then most recent.

- **returns**: table[] List of recordings.

#### `core_replay.getState()`

State of the replay system.

- **returns**: string|nil 'inactive', 'playback' or 'recording'.

#### `core_replay.getTotalSeconds()`

Total duration of the loaded replay in seconds.

- **returns**: number|nil Duration.

#### `core_replay.isGameplayAllowed()`

Indicates whether gameplay is allowed during the replay. Currently always returns true (a TODO in the code plans an option).

- **returns**: boolean Always true.

#### `core_replay.isPaused()`

Indicates whether playback is paused.

- **returns**: boolean|nil Pause state.

#### `core_replay.jump(offset)`

Alias of jumpFrames (old name).

- `offset` (*integer*) : Number of frames.

#### `core_replay.jumpFrames(offset)`

Moves forward or backward by a number of frames (stream:stepFrames) and displays a UI message.

- `offset` (*integer*) : Number of frames (negative = backward).

#### `core_replay.jumpTime(timeDiffInSeconds)`

Moves forward or backward by a duration (stream:stepTime) and displays a UI message.

- `timeDiffInSeconds` (*number*) : Duration in seconds (negative = backward).

#### `core_replay.loadFile(filename, autoplay, options)`

Queues the loading of a replay (displays the waiting screen; playback starts in onUiWaitingState). Validates the file name.

- `filename` (*string*) : Path under replays/ (.rpl extension).
- `autoplay` (*boolean|nil*) : If true, playback starts immediately; otherwise it starts paused.
- `options` (*table|nil*) : options.pauseWhenReady = true: pauses again at the start when the world is ready.
- **returns**: table {success, filename, code = 'queued'} or failure.

#### `core_replay.logUiAction(scope, data)`

Writes to the debug log (if active) an action coming from the UI, with the prefix 'ui.'.

- `scope` (*string*) : Name of the action.
- `data` (*any*) : Data to log.

#### `core_replay.onClientEndMission(levelPath)`

Hook called at the end of a level: if playback is in progress and the level change was not requested by startLevel, playback is stopped with a message.

- `levelPath` (*string*) : Path of the level being left (inferred from code).

#### `core_replay.onUiWaitingState(state)`

Hook called when the UI waiting screen is displayed. It then starts playback of the file queued by loadFile (stream stop then play).

- `state` (*boolean*) : True when waiting is active; otherwise ignored.

#### `core_replay.openMissionReplayFolder(replayFileName)`

Opens the location of a replay file in the explorer; logs an error if it does not exist.

- `replayFileName` (*string*) : File path.

#### `core_replay.pause(v)`

Pauses or resumes playback. No effect outside 'playback'.

- `v` (*boolean*) : true = pause.

#### `core_replay.removeMissionSavedReplay(replayFileName)`

Reverse operation: moves a saved replay to replays/missionReplays/ (so that it is managed automatically again), then notifies the UI.

- `replayFileName` (*string*) : Path of the .rpl.

#### `core_replay.removeRecording(filename)`

Deletes a replay and its .rplMeta.json file; stops it first if it is loaded; updates the catalog.

- `filename` (*string*) : File under replays/.
- **returns**: table {success, filename, message?}.

#### `core_replay.saveMissionReplay(replayFileName)`

Moves an automatic mission replay to the user-saved replays folder (career/<slot>/ or freeroam/) with its .rplMeta.json, then notifies the UI (recordingFilesUpdated).

- `replayFileName` (*string*) : Path of the .rpl.

#### `core_replay.seek(percent)`

Jumps to a normalized position of the replay. No effect outside playback.

- `percent` (*number*) : Position between 0 and 1 (clamped).

#### `core_replay.setDebugEnabled(enabled)`

Enables or disables the replay debug logs (tag core_replay.debug).

- `enabled` (*boolean*) : True to enable.

#### `core_replay.setSpeed(speed)`

Sets the playback speed (1 = realtime, 0.5 = slow motion, 2 = fast motion), without smoothing. Does nothing if the speed is already this value.

- `speed` (*number*) : Speed factor.

#### `core_replay.startLevel(levelPath)`

Starts the given level in freeroam without spawning a vehicle (freeroam_freeroam.startFreeroamByName), marking requestedStartLevel so as not to stop playback.

- `levelPath` (*string*) : Level path.

#### `core_replay.startRecording()`

Starts a manual recording in replays/ (name 'YYYY-MM-DD_HH-MM-SS <level>.rpl'). Refused if already recording, playing back, or if a mission recording is active.

- **returns**: table {success, filename, code, ...}.

#### `core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds)`

Called by C++ on every change of the replay stream state. On entering 'playback', disables the VehicleCommon/VehicleSpecific action maps and pushes ReplayPlaybackActionMap; on leaving, the reverse. Updates M.state, triggers guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) and 'onReplayCoreEvent'({event, state, ...}) with event among playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged.

- `loadedFile` (*string*) : Loaded file.
- `positionSeconds` (*number*) : Playback position (s).
- `totalSeconds` (*number*) : Total duration (s).
- `speed` (*number*) : Playback speed.
- `paused` (*boolean*) : Paused.
- `fpsPlay` (*number*) : Frames per second in playback.
- `fpsRec` (*number*) : Frames per second when recording.
- `statestr` (*string*) : 'inactive', 'playback' or 'recording'.
- `framePositionSeconds` (*number*) : Position of the current frame (s).

#### `core_replay.stopAndUnload()`

Stops playback and publishes an empty 'inactive' state. Refused during a recording (code recordingActive).

- **returns**: table Result {success, filename, message?, code}.

#### `core_replay.stopRecording(options)`

Stops the manual recording and updates the catalog (guihooks replayRecordingsUpdated).

- `options` (*table|nil*) : options.autoplayAfterStopping = true: loads the replay on stop.
- **returns**: table {success, filename, code, playbackResult?}.

#### `core_replay.toggleMissionRecording()`

Shortcut for toggleRecording(false, true): toggles mission replay recording.

- **returns**: string|nil File name if a recording has just started.

#### `core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay)`

Toggles recording: while recording, stops it; during playback, stops playback; otherwise starts a recording.

- `autoplayAfterStopping` (*boolean|nil*) : Play the replay after stopping. If nil: true for a manual recording, false for a mission replay.
- `isMissionReplay` (*boolean|nil*) : Automatic mission replay (replays/missionReplays/ folder).
- **returns**: string|nil File name if a recording has just started.

#### `core_replay.toggleSpeed(val)`

Changes the speed. 'realtime' alternates between 1 and the last other speed (1/8 at start); 'slowmotion' sets 1/8; a positive or negative number goes up or down that many steps in the speed list. Informs simTimeAuthority.

- `val` (*string|integer*) : 'realtime', 'slowmotion', or number of steps (+1, -1...).

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onReplayCoreEvent` — listened to by 1 module(s)
- `onReplayStateChanged` — listened to by 3 module(s)

**UI events (guihooks.trigger):** `Message`, `app:waiting`, `recordingFilesUpdated`, `replayStateChanged`, `toastrMsg`

## Calls into the engine (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `removeFile`, `renameFile`, `stat`
- `be:` `getEnterableObjectCount`, `getFileStream`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/replay.lua`.*

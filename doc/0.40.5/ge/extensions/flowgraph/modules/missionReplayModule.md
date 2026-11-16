# `flowgraph_modules_missionReplayModule`

*File: `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua` · VM: Game Engine (GE) · 196 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/missionReplayModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that automatically records mission replays (.rpl files). It applies the storage limits chosen in the settings (by count or by maximum size), creates a .rplMeta.json file with the mission id, time, career context and attempt, and manages the camera while a mission replay plays.

## Notes

- Settings read: enableMissionReplayCapModes ('maxSize' or 'count'), countReplayCapMode, maxSizeReplayCapMode (in MB).
- Hooks listened to: onReplayStateChanged, onReplayRecordingValueRequested, onMissionAutoReplayRecordingSettingChanged, onMissionAttemptAggregated.
- deleteByCount loops up to diff + 1: it therefore deletes one more file than the excess (to make room for the new recording); the index can exceed #files if diff + 1 > #files, which would call FS:removeFile(nil).
- The file tables are sorted by creation date (FS:stat(file).createtime), from oldest to newest.
- originalCamMode, originalPathId, originalPathLoop and lastFrameState are file-local variables.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey)` | Writes the <replay>.rplMeta.json file (missionId, missionName, time, humanTime, career context, and attempt if provided). Does nothing without currentReplayFile. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.deleteByCount()` | Deletes the oldest replays when their number exceeds the countReplayCapMode setting. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.deleteByMaxSize()` | Deletes the oldest replays while the total size (in MB) reaches maxSizeReplayCapMode. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.deleteOlderReplays()` | Applies the cleanup rule chosen in the enableMissionReplayCapModes setting ('maxSize' or 'count'). (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.deleteReplayFile(file)` | Deletes a replay file. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.executionStarted()` | Called when the project starts: reads the mission replays folder (core_replay.getMissionReplaysPath). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionReplayModule.executionStopped()` | Called when the project stops: stops the current recording and the AI replay (aiRecording module). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionReplayModule.getMissionReplayFiles()` | Lists the *.rpl files in the mission replays folder, from oldest to newest. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.init()` | Called when the module is created: replayRecording = false, currentReplayFile = nil. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_missionReplayModule.missionPlaybackEnded()` | At the end of playback: restores the original camera path or the original camera. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.missionPlaybackStarted()` | At the start of a mission replay playback: stores the camera (and the path if camera is 'path'), switches to orbit camera, then restarts the simulation after 0.1 s. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey)` | Hook called when a mission attempt is aggregated: writes the metadata with the attempt then forgets the current file. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue)` | Hook called when the automatic recording setting changes. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onReplayRecordingValueRequested()` | Hook called when the UI requests the automatic recording state: replies with guihooks.trigger('onReplayRecordingValueRequested', replayRecording). (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onReplayStateChanged(state)` | Hook called on every replay state change. Detects the start and end of playback of a replay belonging to the current mission and calls missionPlaybackStarted / missionPlaybackEnded. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.saveMetaInfoWithoutAttempt()` | Writes the metadata without an attempt then forgets the current file. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.startNewRec()` | Stops any recording, cleans up old replays, then starts a new recording if the replayRecording setting is active and the replay is inactive. Stores the file in currentReplayFile. (dynamically assigned) | dyn |
| `flowgraph_modules_missionReplayModule.stopIfRec()` | Stops the replay recording if it is in progress (core_replay.toggleMissionRecording). (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey)`

Writes the <replay>.rplMeta.json file (missionId, missionName, time, humanTime, career context, and attempt if provided). Does nothing without currentReplayFile. (dynamically assigned)

- `attempt` (*table|nil*) : attempt (field attemptNumber)
- `mission` (*table|nil*) : mission (unused in the code)
- `progressKey` (*string|nil*) : progress key

#### `flowgraph_modules_missionReplayModule.deleteReplayFile(file)`

Deletes a replay file. (dynamically assigned)

- `file` (*string*) : file path

#### `flowgraph_modules_missionReplayModule.getMissionReplayFiles()`

Lists the *.rpl files in the mission replays folder, from oldest to newest. (dynamically assigned)

- **returns**: string[] file paths

#### `flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey)`

Hook called when a mission attempt is aggregated: writes the metadata with the attempt then forgets the current file. (dynamically assigned)

- `attempt` (*table*) : attempt
- `mission` (*table*) : mission
- `progressKey` (*string*) : progress key

#### `flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue)`

Hook called when the automatic recording setting changes. (dynamically assigned)

- `newValue` (*boolean*) : new value

#### `flowgraph_modules_missionReplayModule.onReplayStateChanged(state)`

Hook called on every replay state change. Detects the start and end of playback of a replay belonging to the current mission and calls missionPlaybackStarted / missionPlaybackEnded. (dynamically assigned)

- `state` (*table*) : fields state ('playback', 'inactive'...) and loadedFile

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:buildMetaInfo(attempt, mission, progressKey)` |  | 102 |
| `C:deleteByCount()` |  | 52 |
| `C:deleteByMaxSize()` |  | 62 |
| `C:deleteOlderReplays()` |  | 76 |
| `C:deleteReplayFile(file)` |  | 48 |
| `C:executionStarted()` |  | 31 |
| `C:executionStopped()` |  | 23 |
| `C:getMissionReplayFiles()` |  | 35 |
| `C:init()` |  | 18 |
| `C:missionPlaybackEnded()` |  | 168 |
| `C:missionPlaybackStarted()` |  | 153 |
| `C:onMissionAttemptAggregated(attempt, mission, progressKey)` |  | 136 |
| `C:onMissionAutoReplayRecordingSettingChanged(newValue)` |  | 145 |
| `C:onReplayRecordingValueRequested()` |  | 141 |
| `C:onReplayStateChanged(state)` |  | 179 |
| `C:saveMetaInfoWithoutAttempt()` |  | 131 |
| `C:startNewRec()` |  | 91 |
| `C:stopIfRec()` |  | 84 |

**UI events (guihooks.trigger):** `onReplayRecordingValueRequested`

## Calls into the engine (C++)

- `FS:` `findFiles`, `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua`.*

---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/missionReplayModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that automatically records mission replays (.rpl files). It applies the storage limits chosen in the settings (by count or by maximum size), creates a .rplMeta.json file with the mission id, time, career context and attempt, and manages the camera while a mission replay plays.
--- Access: `require("extensions/flowgraph/modules/missionReplayModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_missionReplayModule
flowgraph_modules_missionReplayModule = {}

--- Writes the <replay>.rplMeta.json file (missionId, missionName, time, humanTime, career context, and attempt if provided). Does nothing without currentReplayFile. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param attempt table|nil attempt (field attemptNumber)
---@param mission table|nil mission (unused in the code)
---@param progressKey string|nil progress key
function flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey) end

--- Deletes the oldest replays when their number exceeds the countReplayCapMode setting. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteByCount() end

--- Deletes the oldest replays while the total size (in MB) reaches maxSizeReplayCapMode. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteByMaxSize() end

--- Applies the cleanup rule chosen in the enableMissionReplayCapModes setting ('maxSize' or 'count'). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteOlderReplays() end

--- Deletes a replay file. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param file string file path
function flowgraph_modules_missionReplayModule.deleteReplayFile(file) end

--- Called when the project starts: reads the mission replays folder (core_replay.getMissionReplaysPath). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.executionStarted() end

--- Called when the project stops: stops the current recording and the AI replay (aiRecording module). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.executionStopped() end

--- Lists the *.rpl files in the mission replays folder, from oldest to newest. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@return string[]  file paths
function flowgraph_modules_missionReplayModule.getMissionReplayFiles() end

--- Called when the module is created: replayRecording = false, currentReplayFile = nil. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.init() end

--- At the end of playback: restores the original camera path or the original camera. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.missionPlaybackEnded() end

--- At the start of a mission replay playback: stores the camera (and the path if camera is 'path'), switches to orbit camera, then restarts the simulation after 0.1 s. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.missionPlaybackStarted() end

--- Hook called when a mission attempt is aggregated: writes the metadata with the attempt then forgets the current file. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param attempt table attempt
---@param mission table mission
---@param progressKey string progress key
function flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey) end

--- Hook called when the automatic recording setting changes. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param newValue boolean new value
function flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue) end

--- Hook called when the UI requests the automatic recording state: replies with guihooks.trigger('onReplayRecordingValueRequested', replayRecording). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.onReplayRecordingValueRequested() end

--- Hook called on every replay state change. Detects the start and end of playback of a replay belonging to the current mission and calls missionPlaybackStarted / missionPlaybackEnded. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param state table fields state ('playback', 'inactive'...) and loadedFile
function flowgraph_modules_missionReplayModule.onReplayStateChanged(state) end

--- Writes the metadata without an attempt then forgets the current file. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.saveMetaInfoWithoutAttempt() end

--- Stops any recording, cleans up old replays, then starts a new recording if the replayRecording setting is active and the replay is inactive. Stores the file in currentReplayFile. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.startNewRec() end

--- Stops the replay recording if it is in progress (core_replay.toggleMissionRecording). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.stopIfRec() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/missionReplayModule.lua
---@class flowgraph_modules_missionReplayModule_C
local flowgraph_modules_missionReplayModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:102
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:buildMetaInfo(attempt, mission, progressKey) end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:52
function flowgraph_modules_missionReplayModule_C:deleteByCount() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:62
function flowgraph_modules_missionReplayModule_C:deleteByMaxSize() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:76
function flowgraph_modules_missionReplayModule_C:deleteOlderReplays() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:48
---@param file any
function flowgraph_modules_missionReplayModule_C:deleteReplayFile(file) end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:31
function flowgraph_modules_missionReplayModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:23
function flowgraph_modules_missionReplayModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:35
function flowgraph_modules_missionReplayModule_C:getMissionReplayFiles() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:18
function flowgraph_modules_missionReplayModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:168
function flowgraph_modules_missionReplayModule_C:missionPlaybackEnded() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:153
function flowgraph_modules_missionReplayModule_C:missionPlaybackStarted() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:136
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:onMissionAttemptAggregated(attempt, mission, progressKey) end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:145
---@param newValue any
function flowgraph_modules_missionReplayModule_C:onMissionAutoReplayRecordingSettingChanged(newValue) end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:141
function flowgraph_modules_missionReplayModule_C:onReplayRecordingValueRequested() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:179
---@param state any
function flowgraph_modules_missionReplayModule_C:onReplayStateChanged(state) end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:131
function flowgraph_modules_missionReplayModule_C:saveMetaInfoWithoutAttempt() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:91
function flowgraph_modules_missionReplayModule_C:startNewRec() end

---Source: lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:84
function flowgraph_modules_missionReplayModule_C:stopIfRec() end


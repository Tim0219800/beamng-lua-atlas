---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/missionReplayModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/missionReplayModule.lua
---@class flowgraph_modules_missionReplayModule_C
local flowgraph_modules_missionReplayModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:102
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:buildMetaInfo(attempt, mission, progressKey) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:52
function flowgraph_modules_missionReplayModule_C:deleteByCount() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:62
function flowgraph_modules_missionReplayModule_C:deleteByMaxSize() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:76
function flowgraph_modules_missionReplayModule_C:deleteOlderReplays() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:48
---@param file any
function flowgraph_modules_missionReplayModule_C:deleteReplayFile(file) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:31
function flowgraph_modules_missionReplayModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:23
function flowgraph_modules_missionReplayModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:35
function flowgraph_modules_missionReplayModule_C:getMissionReplayFiles() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:18
function flowgraph_modules_missionReplayModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:168
function flowgraph_modules_missionReplayModule_C:missionPlaybackEnded() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:153
function flowgraph_modules_missionReplayModule_C:missionPlaybackStarted() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:136
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:onMissionAttemptAggregated(attempt, mission, progressKey) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:145
---@param newValue any
function flowgraph_modules_missionReplayModule_C:onMissionAutoReplayRecordingSettingChanged(newValue) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:141
function flowgraph_modules_missionReplayModule_C:onReplayRecordingValueRequested() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:179
---@param state any
function flowgraph_modules_missionReplayModule_C:onReplayStateChanged(state) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:131
function flowgraph_modules_missionReplayModule_C:saveMetaInfoWithoutAttempt() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:91
function flowgraph_modules_missionReplayModule_C:startNewRec() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:84
function flowgraph_modules_missionReplayModule_C:stopIfRec() end


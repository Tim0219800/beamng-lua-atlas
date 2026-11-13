---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua
---@class flowgraph_modules_aiRecordingModule_C
local flowgraph_modules_aiRecordingModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:18
function flowgraph_modules_aiRecordingModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:14
function flowgraph_modules_aiRecordingModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:117
function flowgraph_modules_aiRecordingModule_C:getVehicleStates() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:11
function flowgraph_modules_aiRecordingModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:113
function flowgraph_modules_aiRecordingModule_C:isRecordingScriptAi() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:57
---@param vehId any
---@param aiPath any
function flowgraph_modules_aiRecordingModule_C:onVehicleSubmitRecordingForMission(vehId, aiPath) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:109
---@param newEnabled any
function flowgraph_modules_aiRecordingModule_C:setenabled(newEnabled) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:87
function flowgraph_modules_aiRecordingModule_C:startAiRecording() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:97
function flowgraph_modules_aiRecordingModule_C:startAiReplay() end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:30
---@param attempt any
---@param totalChange any
function flowgraph_modules_aiRecordingModule_C:stopAiRecording(attempt, totalChange) end

---Source : lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:45
function flowgraph_modules_aiRecordingModule_C:stopAiReplay() end


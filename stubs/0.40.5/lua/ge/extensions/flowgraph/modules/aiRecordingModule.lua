---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 1, after missionReplayModule) that records or replays the player vehicle's AI route (AI script) for missions. It is active only if the command-line argument enableAiRecordingForMissions is true, or if the mission has startingOptions.aiPath. When recording stops, the vehicle sends its trace back via the onVehicleSubmitRecordingForMission hook and the module writes a recording_<date>.missionTestData.json file in <mission folder>/tests/.
--- Access: `require("extensions/flowgraph/modules/aiRecordingModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_aiRecordingModule
flowgraph_modules_aiRecordingModule = {}

--- Called when the project starts: enables the module if parseArgs.args.enableAiRecordingForMissions is true or if the mission has startingOptions.aiPath. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.executionStarted() end

--- Called when the project stops: calls stopAiRecording() without arguments. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.executionStopped() end

--- Returns the table of states by vehicle id (value 'recording' or nil). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@return table<integer, string>  vehicle states
function flowgraph_modules_aiRecordingModule.getVehicleStates() end

--- Called when the module is created (empty). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.init() end

--- Returns whether the module is active. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@return boolean  value of the enabled flag
function flowgraph_modules_aiRecordingModule.isRecordingScriptAi() end

--- Hook called via extensions.hook from the vehicle when the AI recording is finished. Writes the missionTestData.json file in the mission's tests folder. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param vehId integer vehicle id
---@param aiPath table AI trace (field path = list of points with t)
function flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath) end

--- Forces the module on or off. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param newEnabled boolean new state
function flowgraph_modules_aiRecordingModule.setenabled(newEnabled) end

--- If active, marks the player vehicle as 'recording' and sends it ai.startRecording(). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.startAiRecording() end

--- If active and the mission has startingOptions.aiPath, starts ai.startFollowing with this trace ('noReset' mode) on the player vehicle. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.startAiReplay() end

--- Stores attempt and totalChange then, if the module is active and the player vehicle is in the 'recording' state, asks the vehicle to stop recording (ai.stopRecording()) and to send the result back via the onVehicleSubmitRecordingForMission hook. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
---@param attempt table|nil mission attempt (fields data, unlockedStars) (inferred from code)
---@param totalChange table|nil total progression changes (field unlockedStarsAttempt) (inferred from code)
function flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange) end

--- If active and the mission has an aiPath, sends 'ai:scriptStop(false, false)' to the player vehicle. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:dyn
function flowgraph_modules_aiRecordingModule.stopAiReplay() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua
---@class flowgraph_modules_aiRecordingModule_C
local flowgraph_modules_aiRecordingModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:18
function flowgraph_modules_aiRecordingModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:14
function flowgraph_modules_aiRecordingModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:117
function flowgraph_modules_aiRecordingModule_C:getVehicleStates() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:11
function flowgraph_modules_aiRecordingModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:113
function flowgraph_modules_aiRecordingModule_C:isRecordingScriptAi() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:57
---@param vehId any
---@param aiPath any
function flowgraph_modules_aiRecordingModule_C:onVehicleSubmitRecordingForMission(vehId, aiPath) end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:109
---@param newEnabled any
function flowgraph_modules_aiRecordingModule_C:setenabled(newEnabled) end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:87
function flowgraph_modules_aiRecordingModule_C:startAiRecording() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:97
function flowgraph_modules_aiRecordingModule_C:startAiReplay() end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:30
---@param attempt any
---@param totalChange any
function flowgraph_modules_aiRecordingModule_C:stopAiRecording(attempt, totalChange) end

---Source: lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua:45
function flowgraph_modules_aiRecordingModule_C:stopAiReplay() end


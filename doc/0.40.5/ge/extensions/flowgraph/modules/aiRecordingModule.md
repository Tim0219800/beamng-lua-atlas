# `flowgraph_modules_aiRecordingModule`

*File: `lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua` · VM: Game Engine (GE) · 122 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/aiRecordingModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 1, after missionReplayModule) that records or replays the player vehicle's AI route (AI script) for missions. It is active only if the command-line argument enableAiRecordingForMissions is true, or if the mission has startingOptions.aiPath. When recording stops, the vehicle sends its trace back via the onVehicleSubmitRecordingForMission hook and the module writes a recording_<date>.missionTestData.json file in <mission folder>/tests/.

## Notes

- The 'enabled' flag and the state tables are file-local variables (shared among all instances of the module).
- The test file contains aiPath, userSettings, vehicle (model, config, isConfigFile, licensePlate), attemptData, attemptStars and aiDuration.
- Inconsistency: the key attemptStars is defined twice in the testData table (the second, lastAttempt.unlockedStars, overwrites the first, lastTotalChange.unlockedStarsAttempt).
- onVehicleSubmitRecordingForMission assumes that lastAttempt and lastTotalChange are not nil (error if stopAiRecording was called without arguments, which executionStopped does).
- startAiReplay also sets vehicleStates[...] = 'recording': the replay is itself re-recorded.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_aiRecordingModule.executionStarted()` | Called when the project starts: enables the module if parseArgs.args.enableAiRecordingForMissions is true or if the mission has startingOptions.aiPath. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_aiRecordingModule.executionStopped()` | Called when the project stops: calls stopAiRecording() without arguments. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_aiRecordingModule.getVehicleStates()` | Returns the table of states by vehicle id (value 'recording' or nil). (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.init()` | Called when the module is created (empty). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_aiRecordingModule.isRecordingScriptAi()` | Returns whether the module is active. (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath)` | Hook called via extensions.hook from the vehicle when the AI recording is finished. Writes the missionTestData.json file in the mission's tests folder. (dynamically assigned) *(hook)* | dyn |
| `flowgraph_modules_aiRecordingModule.setenabled(newEnabled)` | Forces the module on or off. (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.startAiRecording()` | If active, marks the player vehicle as 'recording' and sends it ai.startRecording(). (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.startAiReplay()` | If active and the mission has startingOptions.aiPath, starts ai.startFollowing with this trace ('noReset' mode) on the player vehicle. (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange)` | Stores attempt and totalChange then, if the module is active and the player vehicle is in the 'recording' state, asks the vehicle to stop recording (ai.stopRecording()) and to send the result back via the onVehicleSubmitRecordingForMission hook. (dynamically assigned) | dyn |
| `flowgraph_modules_aiRecordingModule.stopAiReplay()` | If active and the mission has an aiPath, sends 'ai:scriptStop(false, false)' to the player vehicle. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_aiRecordingModule.getVehicleStates()`

Returns the table of states by vehicle id (value 'recording' or nil). (dynamically assigned)

- **returns**: table<integer, string> vehicle states

#### `flowgraph_modules_aiRecordingModule.isRecordingScriptAi()`

Returns whether the module is active. (dynamically assigned)

- **returns**: boolean value of the enabled flag

#### `flowgraph_modules_aiRecordingModule.onVehicleSubmitRecordingForMission(vehId, aiPath)`

Hook called via extensions.hook from the vehicle when the AI recording is finished. Writes the missionTestData.json file in the mission's tests folder. (dynamically assigned)

- `vehId` (*integer*) : vehicle id
- `aiPath` (*table*) : AI trace (field path = list of points with t)

#### `flowgraph_modules_aiRecordingModule.setenabled(newEnabled)`

Forces the module on or off. (dynamically assigned)

- `newEnabled` (*boolean*) : new state

#### `flowgraph_modules_aiRecordingModule.stopAiRecording(attempt, totalChange)`

Stores attempt and totalChange then, if the module is active and the player vehicle is in the 'recording' state, asks the vehicle to stop recording (ai.stopRecording()) and to send the result back via the onVehicleSubmitRecordingForMission hook. (dynamically assigned)

- `attempt` (*table|nil*) : mission attempt (fields data, unlockedStars) (inferred from code)
- `totalChange` (*table|nil*) : total progression changes (field unlockedStarsAttempt) (inferred from code)

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:executionStarted()` |  | 18 |
| `C:executionStopped()` |  | 14 |
| `C:getVehicleStates()` |  | 117 |
| `C:init()` |  | 11 |
| `C:isRecordingScriptAi()` |  | 113 |
| `C:onVehicleSubmitRecordingForMission(vehId, aiPath)` |  | 57 |
| `C:setenabled(newEnabled)` |  | 109 |
| `C:startAiRecording()` |  | 87 |
| `C:startAiReplay()` |  | 97 |
| `C:stopAiRecording(attempt, totalChange)` |  | 30 |
| `C:stopAiReplay()` |  | 45 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/aiRecordingModule.lua`.*

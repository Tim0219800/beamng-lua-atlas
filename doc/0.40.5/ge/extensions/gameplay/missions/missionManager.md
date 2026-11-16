# `gameplay_missions_missionManager`

*File: `lua/ge/extensions/gameplay/missions/missionManager.lua` · VM: Game Engine (GE) · 1544 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_missionManager`: `extensions.load("gameplay_missions_missionManager")`, then the global `gameplay_missions_missionManager`

Orchestrator of mission start and stop. Each start or stop is a sequence of steps (taskData.steps) executed frame by frame in onUpdate: screen fade, removal/stashing of vehicles, creation of the mission vehicle, traffic, environment configuration (time, clouds, wind, fog), then mission:onStart(). Stopping restores the vehicles, traffic and environment. Only one "foreground" mission can run at a time. A modder calls it to start or stop a mission from code.

## Example

```lua
local m = gameplay_missions_missions.getMissionById('gridmap_v2/timeTrial/myCircuit')
gameplay_missions_missionManager.startWithFade(m, {}, {})
-- later
gameplay_missions_missionManager.stop(m, {})
```

## Notes

- The start and stop functions return true on error (mission nil, already running, not running) and nil if a task is already active (simple warning in the log); a new start or stop is refused as long as taskData.active is true (see isCurrentlyProcessingStep).
- Each step has a timeout (120 s by default, 10 s for the start fade, 5 s for the end fade); after this delay it is marked finished with an error in the log.
- In taskStartMissionStep, if mission:onStart() returns a truthy value, _isOngoing is set back to false and an error is logged, but execution continues: foregroundMissionId is still set (unless mission.background) and the onAnyMissionChanged("started") hook is emitted.
- Hook onAnyMissionChanged: ("started", mission, userSettings, startedFrom) on start; ("stopped", mission) on stop. onAnyMissionWillChange: ("stopped", mission, abandoned) just before the actual stop.
- The environment is only modified if mission.setupModules.environment.enabled; the original values (time, clouds, cloud wind, fog) are saved in setupModules.environment._original* to be restored. The wind applied to vehicles is _windVec = (sin(windDirAngle), cos(windDirAngle), 0) * windSpeed.
- Stashed vehicles can be removed then recreated from their spawn data (despawnStashedVehiclesForMission=true); in career, a vehicle that is too damaged is put in the inventory and is not respawned ("vehStoredMission" toast).
- startInstant has no nil mission check, no "already running" guard, and no "active task" guard, unlike startWithFade / startAsScenario.
- allowMissionInteraction is a WIP: returns false if core_gamestate.state.state is not "freeroam", true otherwise (the call in onUpdate is commented out).
- This module's onUpdate hook calls mission:onUpdate for all _isOngoing missions, only when a foreground mission exists, iterating over gameplay_missions_missions.getAllMissions().

**Dependencies (loaded first):** `gameplay_traffic`, `gameplay_police`, `gameplay_parking`, `ui_fadeScreen`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_missions_missionManager.allowMissionInteraction()` | WIP: indicates whether interaction with missions is allowed (true only if the game state is "freeroam"). | 1425 |
| `gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed)` | Requests the abandonment of a mission. Emits onGameplayActivityAborted (if abandonButtonPressed) then onMissionAbandoned(mission, abandonButtonPressed). If the mission handles abandonment itself (mission:attemptAbandonMission() true, e.g. a flowgraph with onRequestAbandon), stops there; otherwise launches the stop sequence with fade. | 1301 |
| `gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil()` | Returns the type of the current task ("start" or "stop"), "start" also if a start from within a mission is deferred, nil if no task. | 1529 |
| `gameplay_missions_missionManager.getForegroundMissionId()` | Id of the current foreground mission (exclusive: only one at a time), or nil. | 1541 |
| `gameplay_missions_missionManager.isCurrentlyProcessingStep()` | Returns whether a start/stop sequence of steps is currently being processed. | 1542 |
| `gameplay_missions_missionManager.onCareerActive()` | Hook called on career activation: immediately stops the foreground mission (alias of stopForegroundMissionInstantly). *(internal)* *(hook)* | 1513 |
| `gameplay_missions_missionManager.onClientEndMission()` | Hook called at the end of the current level (level change): immediately stops the foreground mission without cleanup (alias of stopForegroundMissionInstantly). Unrelated to the end of a gameplay mission. *(internal)* *(hook)* | 1513 |
| `gameplay_missions_missionManager.onParkingVehiclesActivated()` | Hook called when parked vehicles appear without traffic: same effect as onTrafficStarted. *(internal)* *(hook)* | 1060 |
| `gameplay_missions_missionManager.onScreenFadeState(state)` | ui_fadeScreen hook called at each phase of the fade. Unblocks the step waiting for the fade (fadeState<state> = true) and triggers the stop of the current mission for a deferred start. *(internal)* *(hook)* | 1071 |
| `gameplay_missions_missionManager.onTrafficStarted()` | Hook called when traffic starts: validates the step waiting for traffic (waitForTraffic). *(internal)* *(hook)* | 1060 |
| `gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame. Advances the steps of the active task (timeouts included), launches the deferred start of startFromWithinMission when the stop is finished, and calls mission:onUpdate of the running missions. Contains an imgui debug window (disabled by default). *(internal)* *(hook)* | 1434 |
| `gameplay_missions_missionManager.start(mission, userSettings, startingOptions)` | Alias of startWithFade: starts a mission with a screen fade. | 1088 |
| `gameplay_missions_missionManager.startAsScenario(mission, userSettings)` | Starts a mission without fade or vehicle removal: pre-mission, vehicle stashing, vehicle, traffic, onStart (used when the mission is launched as a scenario). | 1153 |
| `gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant)` | Stops the foreground mission then starts another (or the same, reconfigured): with a fade (default) or instantly. The actual start is deferred until the stop finishes (handled in onUpdate). Emits onMissionReconfigured if it is the same mission. | 1193 |
| `gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions)` | Starts a mission immediately with only the pre-mission and onStart steps (without touching vehicles). Emits the hook startFromWithinMissionInstant(mission, userSettings, startingOptions). | 1222 |
| `gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions)` | Starts a mission with the full sequence of steps: fade, vehicle removal, preparation (pre-mission), starting repair, snapshot of part condition (except skipPartConditionSnapshot), vehicle stashing, mission vehicle, traffic, then onStart. Emits the hook onMissionStartWithFade(mission, userSettings). | 1088 |
| `gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom)` | First loads the level (the mission's by default), stops any foreground mission, then runs pre-mission, vehicle stashing, vehicle, traffic and onStart. | 1248 |
| `gameplay_missions_missionManager.stop(mission, data)` | Stops a running mission: the mission's onStop, restoration of stashed vehicles, post-processing, vehicle removal, respawn of the player's vehicle and traffic, then fade (unless data.ignoreFade). Emits the hook onMissionStopped(mission). | 1371 |
| `gameplay_missions_missionManager.stopForegroundMissionInstantly()` | Immediately stops the foreground mission (taskStopMissionStep with stopInstant) without restoring vehicles or environment. Also called at the end of a level load and on career activation. | 1513 |

### Parameter details

#### `gameplay_missions_missionManager.allowMissionInteraction()`

WIP: indicates whether interaction with missions is allowed (true only if the game state is "freeroam").

- **returns**: boolean true if allowed.

#### `gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed)`

Requests the abandonment of a mission. Emits onGameplayActivityAborted (if abandonButtonPressed) then onMissionAbandoned(mission, abandonButtonPressed). If the mission handles abandonment itself (mission:attemptAbandonMission() true, e.g. a flowgraph with onRequestAbandon), stops there; otherwise launches the stop sequence with fade.

- `mission` (*table*) : Running mission.
- `force` (*boolean|nil*) : Not used in the code.
- `abandonButtonPressed` (*boolean|nil*) : true if the player pressed the abandon button (data.abandoned = true).
- **returns**: boolean|nil true on error or if the mission handles abandonment itself.

#### `gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil()`

Returns the type of the current task ("start" or "stop"), "start" also if a start from within a mission is deferred, nil if no task.

- **returns**: string|nil "start", "stop" or nil.

#### `gameplay_missions_missionManager.getForegroundMissionId()`

Id of the current foreground mission (exclusive: only one at a time), or nil.

- **returns**: string|nil Mission id.

#### `gameplay_missions_missionManager.isCurrentlyProcessingStep()`

Returns whether a start/stop sequence of steps is currently being processed.

- **returns**: boolean true if taskData.active.

#### `gameplay_missions_missionManager.onScreenFadeState(state)`

ui_fadeScreen hook called at each phase of the fade. Unblocks the step waiting for the fade (fadeState<state> = true) and triggers the stop of the current mission for a deferred start.

- `state` (*integer*) : Fade phase number (1, 2, 3).

#### `gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame. Advances the steps of the active task (timeouts included), launches the deferred start of startFromWithinMission when the stop is finished, and calls mission:onUpdate of the running missions. Contains an imgui debug window (disabled by default).

- `dtReal` (*number*) : Real time (s).
- `dtSim` (*number*) : Simulation time (s).
- `dtRaw` (*number*) : Raw time (s).

#### `gameplay_missions_missionManager.start(mission, userSettings, startingOptions)`

Alias of startWithFade: starts a mission with a screen fade.

- `mission` (*table*) : Built mission (gameplay_missions_missions.getMissionById).
- `userSettings` (*table|nil*) : Chosen user settings ({} by default).
- `startingOptions` (*table|nil*) : Options: startedFrom, skipPartConditionSnapshot, etc.
- **returns**: boolean|nil true on error.

#### `gameplay_missions_missionManager.startAsScenario(mission, userSettings)`

Starts a mission without fade or vehicle removal: pre-mission, vehicle stashing, vehicle, traffic, onStart (used when the mission is launched as a scenario).

- `mission` (*table*) : Built mission.
- `userSettings` (*table|nil*) : User settings.
- **returns**: boolean|nil true on error, nil if a task is active.

#### `gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant)`

Stops the foreground mission then starts another (or the same, reconfigured): with a fade (default) or instantly. The actual start is deferred until the stop finishes (handled in onUpdate). Emits onMissionReconfigured if it is the same mission.

- `mission` (*table*) : Mission to start.
- `userSettings` (*table|nil*) : User settings.
- `instant` (*boolean|nil*) : true to skip the fade.

#### `gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions)`

Starts a mission immediately with only the pre-mission and onStart steps (without touching vehicles). Emits the hook startFromWithinMissionInstant(mission, userSettings, startingOptions).

- `mission` (*table*) : Built mission.
- `userSettings` (*table|nil*) : User settings.
- `startingOptions` (*table|nil*) : Start options.

#### `gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions)`

Starts a mission with the full sequence of steps: fade, vehicle removal, preparation (pre-mission), starting repair, snapshot of part condition (except skipPartConditionSnapshot), vehicle stashing, mission vehicle, traffic, then onStart. Emits the hook onMissionStartWithFade(mission, userSettings).

- `mission` (*table*) : Built mission.
- `userSettings` (*table|nil*) : User settings.
- `startingOptions` (*table|nil*) : Start options.
- **returns**: boolean|nil true on error (mission nil or already running), nil if a task is already active.

#### `gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom)`

First loads the level (the mission's by default), stops any foreground mission, then runs pre-mission, vehicle stashing, vehicle, traffic and onStart.

- `mission` (*table*) : Built mission.
- `userSettings` (*table|nil*) : User settings.
- `level` (*string|nil*) : Level to load; mission.startTrigger.level by default.
- `startedFrom` (*string|nil*) : Origin of the start (passed to the hooks).
- **returns**: boolean|nil true on error.

#### `gameplay_missions_missionManager.stop(mission, data)`

Stops a running mission: the mission's onStop, restoration of stashed vehicles, post-processing, vehicle removal, respawn of the player's vehicle and traffic, then fade (unless data.ignoreFade). Emits the hook onMissionStopped(mission).

- `mission` (*table*) : Running mission.
- `data` (*table|nil*) : Stop data: ignoreFade, abandoned, attempt, stopInstant...
- **returns**: boolean|nil true on error (mission nil or not running), nil if a task is active.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded beforehand: gameplay_traffic, gameplay_police, gameplay_parking, ui_fadeScreen. |
| `fadeDuration` | number | Duration (s) of the screen fade, 0.75 by default; used for the start fade in startFromWithinMission. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAnyMissionChanged` — listened to by 19 module(s)
- `onAnyMissionWillChange` — listened to by 2 module(s)
- `onClientStartMission` — listened to by 40 module(s)
- `onGameplayActivityAborted`
- `onMissionAbandoned` — listened to by 1 module(s)
- `onMissionReconfigured` — listened to by 1 module(s)
- `onMissionStartWithFade`
- `onMissionStopped`
- `startFromWithinMissionInstant`

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `resetTireMarks`
- `core_environment.` `getCloudCover`, `getFogDensity`, `getSolarTimeOfDayValue`, `getTimeOfDay`, `getTimeOfDayValueForNormalizedTime`, `getWindSpeed`, `setCloudCover`, `setFogDensity`, `setTimeOfDay`, `setWindSpeed`
- `obj:` `delete`, `getActive`, `getDirectionVector`, `getDirectionVectorUp`, `getDynDataFieldbyName`, `getField`, `getId`, `getMetallicPaintData`, `getPosition`, `setActive`
- `scenetree.` `findClassObjects`, `findObject`

**Loads extensions:** `gameplay_vehiclePerformance`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/missionManager.lua`.*

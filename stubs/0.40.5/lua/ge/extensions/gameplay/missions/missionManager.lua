---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrator of mission start and stop. Each start or stop is a sequence of steps (taskData.steps) executed frame by frame in onUpdate: screen fade, removal/stashing of vehicles, creation of the mission vehicle, traffic, environment configuration (time, clouds, wind, fog), then mission:onStart(). Stopping restores the vehicles, traffic and environment. Only one "foreground" mission can run at a time. A modder calls it to start or stop a mission from code.
--- Access: extension `gameplay_missions_missionManager`: `extensions.load("gameplay_missions_missionManager")`, then the global `gameplay_missions_missionManager`
---@class gameplay_missions_missionManager
---@field dependencies string[] Extensions loaded beforehand: gameplay_traffic, gameplay_police, gameplay_parking, ui_fadeScreen.
---@field fadeDuration number Duration (s) of the screen fade, 0.75 by default; used for the start fade in startFromWithinMission.
gameplay_missions_missionManager = {}

--- WIP: indicates whether interaction with missions is allowed (true only if the game state is "freeroam").
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1425
---@return boolean  true if allowed.
function gameplay_missions_missionManager.allowMissionInteraction() end

--- Requests the abandonment of a mission. Emits onGameplayActivityAborted (if abandonButtonPressed) then onMissionAbandoned(mission, abandonButtonPressed). If the mission handles abandonment itself (mission:attemptAbandonMission() true, e.g. a flowgraph with onRequestAbandon), stops there; otherwise launches the stop sequence with fade.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1301
---@param mission table Running mission.
---@param force boolean|nil Not used in the code.
---@param abandonButtonPressed boolean|nil true if the player pressed the abandon button (data.abandoned = true).
---@return boolean|nil  true on error or if the mission handles abandonment itself.
function gameplay_missions_missionManager.attemptAbandonMissionWithFade(mission, force, abandonButtonPressed) end

--- Returns the type of the current task ("start" or "stop"), "start" also if a start from within a mission is deferred, nil if no task.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1529
---@return string|nil  "start", "stop" or nil.
function gameplay_missions_missionManager.getCurrentTaskdataTypeOrNil() end

--- Id of the current foreground mission (exclusive: only one at a time), or nil.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1541
---@return string|nil  Mission id.
function gameplay_missions_missionManager.getForegroundMissionId() end

--- Returns whether a start/stop sequence of steps is currently being processed.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1542
---@return boolean  true if taskData.active.
function gameplay_missions_missionManager.isCurrentlyProcessingStep() end

--- Hook called on career activation: immediately stops the foreground mission (alias of stopForegroundMissionInstantly).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onCareerActive() end

--- Hook called at the end of the current level (level change): immediately stops the foreground mission without cleanup (alias of stopForegroundMissionInstantly). Unrelated to the end of a gameplay mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.onClientEndMission() end

--- Hook called when parked vehicles appear without traffic: same effect as onTrafficStarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onParkingVehiclesActivated() end

--- ui_fadeScreen hook called at each phase of the fade. Unblocks the step waiting for the fade (fadeState<state> = true) and triggers the stop of the current mission for a deferred start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1071
---@param state integer Fade phase number (1, 2, 3).
function gameplay_missions_missionManager.onScreenFadeState(state) end

--- Hook called when traffic starts: validates the step waiting for traffic (waitForTraffic).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1060
function gameplay_missions_missionManager.onTrafficStarted() end

--- Called every frame. Advances the steps of the active task (timeouts included), launches the deferred start of startFromWithinMission when the stop is finished, and calls mission:onUpdate of the running missions. Contains an imgui debug window (disabled by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1434
---@param dtReal number Real time (s).
---@param dtSim number Simulation time (s).
---@param dtRaw number Raw time (s).
function gameplay_missions_missionManager.onUpdate(dtReal, dtSim, dtRaw) end

--- Alias of startWithFade: starts a mission with a screen fade.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission table Built mission (gameplay_missions_missions.getMissionById).
---@param userSettings table|nil Chosen user settings ({} by default).
---@param startingOptions table|nil Options: startedFrom, skipPartConditionSnapshot, etc.
---@return boolean|nil  true on error.
function gameplay_missions_missionManager.start(mission, userSettings, startingOptions) end

--- Starts a mission without fade or vehicle removal: pre-mission, vehicle stashing, vehicle, traffic, onStart (used when the mission is launched as a scenario).
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1153
---@param mission table Built mission.
---@param userSettings table|nil User settings.
---@return boolean|nil  true on error, nil if a task is active.
function gameplay_missions_missionManager.startAsScenario(mission, userSettings) end

--- Stops the foreground mission then starts another (or the same, reconfigured): with a fade (default) or instantly. The actual start is deferred until the stop finishes (handled in onUpdate). Emits onMissionReconfigured if it is the same mission.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1193
---@param mission table Mission to start.
---@param userSettings table|nil User settings.
---@param instant boolean|nil true to skip the fade.
function gameplay_missions_missionManager.startFromWithinMission(mission, userSettings, instant) end

--- Starts a mission immediately with only the pre-mission and onStart steps (without touching vehicles). Emits the hook startFromWithinMissionInstant(mission, userSettings, startingOptions).
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1222
---@param mission table Built mission.
---@param userSettings table|nil User settings.
---@param startingOptions table|nil Start options.
function gameplay_missions_missionManager.startInstant(mission, userSettings, startingOptions) end

--- Starts a mission with the full sequence of steps: fade, vehicle removal, preparation (pre-mission), starting repair, snapshot of part condition (except skipPartConditionSnapshot), vehicle stashing, mission vehicle, traffic, then onStart. Emits the hook onMissionStartWithFade(mission, userSettings).
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1088
---@param mission table Built mission.
---@param userSettings table|nil User settings.
---@param startingOptions table|nil Start options.
---@return boolean|nil  true on error (mission nil or already running), nil if a task is already active.
function gameplay_missions_missionManager.startWithFade(mission, userSettings, startingOptions) end

--- First loads the level (the mission's by default), stops any foreground mission, then runs pre-mission, vehicle stashing, vehicle, traffic and onStart.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1248
---@param mission table Built mission.
---@param userSettings table|nil User settings.
---@param level string|nil Level to load; mission.startTrigger.level by default.
---@param startedFrom string|nil Origin of the start (passed to the hooks).
---@return boolean|nil  true on error.
function gameplay_missions_missionManager.startWithLoadingLevel(mission, userSettings, level, startedFrom) end

--- Stops a running mission: the mission's onStop, restoration of stashed vehicles, post-processing, vehicle removal, respawn of the player's vehicle and traffic, then fade (unless data.ignoreFade). Emits the hook onMissionStopped(mission).
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1371
---@param mission table Running mission.
---@param data table|nil Stop data: ignoreFade, abandoned, attempt, stopInstant...
---@return boolean|nil  true on error (mission nil or not running), nil if a task is active.
function gameplay_missions_missionManager.stop(mission, data) end

--- Immediately stops the foreground mission (taskStopMissionStep with stopInstant) without restoring vehicles or environment. Also called at the end of a level load and on career activation.
---Source: lua/ge/extensions/gameplay/missions/missionManager.lua:1513
function gameplay_missions_missionManager.stopForegroundMissionInstantly() end


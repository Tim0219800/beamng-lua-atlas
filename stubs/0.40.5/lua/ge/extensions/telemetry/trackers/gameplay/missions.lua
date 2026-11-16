---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mission telemetry tracker: follows the funnel (which missions start, how they are configured, how they end). The "missionRunning" activity carries the duration; one-off events report the click on Start, the opening of the start/end screens, each finished attempt, restarts, reconfigurations and abandonments.
--- Access: extension `telemetry_trackers_gameplay_missions`: `extensions.load("telemetry_trackers_gameplay_missions")`, then the global `telemetry_trackers_gameplay_missions`
---@class telemetry_trackers_gameplay_missions
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_missions = {}

--- Hook called when the mission actually runs, for all start paths (including those that load a level first). Starts the missionRunning activity. startedFrom: missionScreen (in level), gameplaySelector, discover, withinMission (new attempt, next mission or reconfiguration from the end screen); starts from career tutorials, activity flows, multiplayer or scenarios give "other".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:24
---@param state string State; only "started" is taken into account.
---@param mission table Mission (must have _isOngoing).
---@param userSettings table Player settings for the mission.
---@param startedFrom string|nil Origin of the start.
function telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom) end

--- Hook called before any mission stop, including the instant stop on a level change, a return to the menu or a career start (which skips onMissionStopped). Ends the activity with the outcome "stopped".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:163
---@param state string Only "stopped" is taken into account.
---@param mission table Mission concerned.
function telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission) end

--- Hook called when the end screen opens: emits missionEndScreenOpened (without a result).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:67
function telemetry_trackers_gameplay_missions.onEndScreenUIOpened() end

--- Hook called on load: manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:169
function telemetry_trackers_gameplay_missions.onExtensionLoaded() end

--- Hook called on unload (game close, Lua reload, tracker disabled): ends the activity with the outcome trackerUnloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:176
function telemetry_trackers_gameplay_missions.onExtensionUnloaded() end

--- Hook called when the mission is closed prematurely: emits missionAbandoned (byPlayer, attemptsCompleted, which is 0 if no attempt was finished) and ends the activity with the outcome "abandoned". byPlayer is false when the game itself closes the mission, for example after a vehicle spawn failure.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:149
---@param mission table Mission.
---@param byPlayer boolean true if the player abandoned.
function telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer) end

--- Hook called when an attempt is recorded (the only moment the full result exists as one table): emits missionAttemptCompleted (outcome, number, stars, time, penalty, points, vehicle model and config). The filled fields depend on the mission type.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:87
---@param attempt table Attempt (type, attemptNumber, unlockedStars, data).
---@param mission table Mission.
---@param progressKey string Progress key.
function telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey) end

--- Hook called when a mission's settings change: emits missionReconfigured with only the modified settings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:130
---@param data table {mission, oldUserSettings, newUserSettings}
function telemetry_trackers_gameplay_missions.onMissionReconfigured(data) end

--- Hook called on click of a recovery message button: if id is restartMission, emits missionRestarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:121
---@param id string Button identifier.
function telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id) end

--- Hook called when the start screen is built: emits missionStartScreenOpened only once per mission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:110
function telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding() end

--- Hook called on click of the Start button: emits missionStartButtonClicked (only during a mission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:56
function telemetry_trackers_gameplay_missions.onUIStartButtonClicked() end


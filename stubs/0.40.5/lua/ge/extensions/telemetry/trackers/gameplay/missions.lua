---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_gameplay_missions` : `extensions.load("telemetry_trackers_gameplay_missions")`, puis la globale `telemetry_trackers_gameplay_missions`
---@class telemetry_trackers_gameplay_missions
---@field dependencies table
telemetry_trackers_gameplay_missions = {}

--- Fires once the mission is actually running, for every start path including the ones that
---  load a level first. startedFrom is missionScreen (in level), gameplaySelector, discover or
---  withinMission (retry, next mission or reconfigure from the end screen). Starts from career
---  tutorials, activity flows, multiplayer or scenarios report other.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:24
---@param state any
---@param mission any
---@param userSettings any
---@param startedFrom any
function telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom) end

--- Every stop passes through here, including the instant one on a level change, a return to
---  the main menu or a career start, which skips onMissionStopped
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:163
---@param state any
---@param mission any
function telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission) end

--- Counterpart of missionStartScreenOpened. Carries no result: the screen is told what to
---  show from elsewhere, and a mission built on the endScreenWhole node never fires this at
---  all. The results come from onMissionAttemptAggregated below.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:67
function telemetry_trackers_gameplay_missions.onEndScreenUIOpened() end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:169
function telemetry_trackers_gameplay_missions.onExtensionLoaded() end

--- game exit, a lua reload and disabling the tracker all unload it, the core unloads the
---  trackers before their onExit would run
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:176
function telemetry_trackers_gameplay_missions.onExtensionUnloaded() end

--- Fires when the mission is closed early, before it would stop on its own. attemptsCompleted
---  is 0 when the player left without finishing a single attempt. byPlayer is false when the
---  game closed the mission itself, for example after a failed vehicle spawn.
---  Missions that handle the abandon themselves still stop afterwards, the activity is already
---  closed by then.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:149
---@param mission any
---@param byPlayer any
function telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer) end

--- Fires as the attempt is saved, the one point where the whole result exists as a single
---  table. Which of the data fields are filled depends on the mission type.
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:87
---@param attempt any
---@param mission any
---@param progressKey any
function telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:130
---@param data any
function telemetry_trackers_gameplay_missions.onMissionReconfigured(data) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:121
---@param id any
function telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id) end

---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:110
function telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding() end

--- The start and end screen nodes are also used outside missions, split screen gamemodes
---  for example, so both events are only counted while a mission runs
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:56
function telemetry_trackers_gameplay_missions.onUIStartButtonClicked() end


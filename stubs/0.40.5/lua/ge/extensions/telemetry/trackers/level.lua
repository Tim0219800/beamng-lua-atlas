---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/level.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Levels and scenarios telemetry tracker: which levels are played and for how long (activity "levelLoaded"), plus the scenario lifecycle (activity "scenarioRunning" with the result). The level load time (loadMs) is added at the end of the levelLoaded activity, because loading is only finished well after its opening. The per-frame tracking of collisions and damage that existed here was removed (too many events).
--- Access: extension `telemetry_trackers_level`: `extensions.load("telemetry_trackers_level")`, then the global `telemetry_trackers_level`
---@class telemetry_trackers_level
---@field dependencies string[] telemetry_core.
telemetry_trackers_level = {}

--- Hook called on leaving the level: ends any scenario and the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:84
---@param levelPath string Level path.
function telemetry_trackers_level.onClientEndMission(levelPath) end

--- Hook called at the very top of the loading chain (before datablocks, objects and physics), on every load including restarts: stores the load start time.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:57
---@param levelPath string Level path.
function telemetry_trackers_level.onClientPreStartMission(levelPath) end

--- Hook called when the level starts (loading screen still displayed): starts the levelLoaded activity.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:62
---@param levelPath string Level path.
function telemetry_trackers_level.onClientStartMission(levelPath) end

--- Hook called when the game closes: closes the open activities so as not to leave starts without ends in the session file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:114
function telemetry_trackers_level.onExit() end

--- Hook called on load: manual unload; if a level is already loaded, starts the activity immediately.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:103
function telemetry_trackers_level.onExtensionLoaded() end

--- Hook called on unload: a Lua reload destroys the trackers without onExit, so the activities are also closed here (same function as endLevel).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:39
function telemetry_trackers_level.onExtensionUnloaded() end

--- Hook called when a flowgraph scenario starts; same function as onScenarioLoaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario table Scenario.
function telemetry_trackers_level.onFlowgraphScenarioStarted(scenario) end

--- Hook called at the end of a scenario: ends the activity with "failed" or "success" according to pooledResults[1].failed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:93
---@param scenario table Finished scenario.
function telemetry_trackers_level.onScenarioFinished(scenario) end

--- Hook called when a scenario loads: starts the scenarioRunning activity (name and source file).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario table Scenario (name, sourceFile).
function telemetry_trackers_level.onScenarioLoaded(scenario) end

--- Hook called when a scenario restarts: ends the activity with "restarted" then starts a new one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:98
---@param scenario table Scenario.
function telemetry_trackers_level.onScenarioRestarted(scenario) end

--- Hook called on world readiness state changes. State 2 is the first moment the player can drive (camera with its control object, vehicle materials ready): computes loadMs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/telemetry/trackers/level.lua:77
---@param state integer Readiness state (only 2 is used).
function telemetry_trackers_level.onWorldReadyState(state) end


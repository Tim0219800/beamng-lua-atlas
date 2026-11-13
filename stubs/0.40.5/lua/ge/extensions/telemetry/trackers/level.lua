---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/level.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_trackers_level` : `extensions.load("telemetry_trackers_level")`, puis la globale `telemetry_trackers_level`
---@class telemetry_trackers_level
---@field dependencies table
telemetry_trackers_level = {}

---Source : lua/ge/extensions/telemetry/trackers/level.lua:84
---@param levelPath any
function telemetry_trackers_level.onClientEndMission(levelPath) end

--- The top of the load pipeline, before the datablocks, the objects and the physics. Fires on
---  every load, restarts included. Entering a level the game is already in skips it, and that
---  level is then reported without a load time rather than with the previous one.
---Source : lua/ge/extensions/telemetry/trackers/level.lua:57
---@param levelPath any
function telemetry_trackers_level.onClientPreStartMission(levelPath) end

---Source : lua/ge/extensions/telemetry/trackers/level.lua:62
---@param levelPath any
function telemetry_trackers_level.onClientStartMission(levelPath) end

--- close the open activities so the session file is not left with dangling starts
---Source : lua/ge/extensions/telemetry/trackers/level.lua:114
function telemetry_trackers_level.onExit() end

---Source : lua/ge/extensions/telemetry/trackers/level.lua:103
function telemetry_trackers_level.onExtensionLoaded() end

--- a lua reload tears the trackers down without an onExit, so close the activities here too
---Source : lua/ge/extensions/telemetry/trackers/level.lua:39
function telemetry_trackers_level.onExtensionUnloaded() end

--- flowgraph scenarios never reach scenario_scenarios, so onScenarioLoaded does not fire
---  for them. They carry no finish signal either, so endLevel closes them as aborted.
---Source : lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario any
function telemetry_trackers_level.onFlowgraphScenarioStarted(scenario) end

---Source : lua/ge/extensions/telemetry/trackers/level.lua:93
---@param scenario any
function telemetry_trackers_level.onScenarioFinished(scenario) end

---Source : lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario any
function telemetry_trackers_level.onScenarioLoaded(scenario) end

---Source : lua/ge/extensions/telemetry/trackers/level.lua:98
---@param scenario any
function telemetry_trackers_level.onScenarioRestarted(scenario) end

--- State 2 is the first moment the player can drive: the camera has its control object and the
---   player vehicle reports its render materials ready. That is later than onClientStartMission,
---   which still runs with the loading screen up.
---
---   Two things to know about the number. The material wait inside state 2 gives up after five
---   seconds, so a very slow load reports the point it gave up rather than the point it finished.
---   And a level with no player vehicle reaches state 2 immediately, so it looks quick.
---Source : lua/ge/extensions/telemetry/trackers/level.lua:77
---@param state any
function telemetry_trackers_level.onWorldReadyState(state) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenariosLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loads and normalizes scenario files (.json in levels/<level>/scenarios/), lists them for the UI and starts them. processScenarioData completes the table read from the JSON with default values (vehicles, extensions, prefabs, previews, player count, lapConfig, allowed/forbidden action lists, attempts). start() unloads the current level if needed, loads the scenario extensions (scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals) and calls scenario_scenarios.executeScenario, or launches a flowgraph. A modder uses it to list (getList) or start (startByPath, load) a scenario.
--- Access: extension `scenario_scenariosLoader`: `extensions.load("scenario_scenariosLoader")`, then the global `scenario_scenariosLoader`
---@class scenario_scenariosLoader
---@field dependencies table<integer, string> {'core_levels'}
---@field prefabCache table Cache [levelPath][folder][lowercaseName] = prefab path, filled by buildPrefabCache.
---@field processedScenarioCache table Empty table, never used in this file.
---@field scenarioModules table<integer, string> Extensions loaded by start(): scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals.
scenario_scenariosLoader = {}

--- Lists the levels containing a scenario subfolder (bus route case) with, for each bus line (*.buslines.json), a copy of the level's first scenario adapted to the route (name, preview, vehicle, start point, busdriver.routeID, variance, strictStop=true, traffic=false).
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:552
---@param subdirectory string subfolder in scenarios/ (e.g. 'busdriver')
---@param levelList table<integer, string>|nil levels to walk through (all by default)
---@return table<integer, table>  levels {levelName, levelInfo, official, previews, scenarios}
function scenario_scenariosLoader.getLevels(subdirectory, levelList) end

--- Lists all available scenarios: level .json files, isScenario flowgraphs, and missions available as scenarios. Used by the UI and techCore.
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:326
---@param subdirectory string|nil subfolder of scenarios/ to restrict to
---@param includeAll boolean|nil also include campaign-restricted scenarios and all missions
---@param skipMissions boolean|nil do not add the missions
---@return table<integer, table>  scenarios
function scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions) end

--- Turns a mission (gameplay_missions) into a scenario usable by the UI (flowgraph loadMissionAsScenario.flow.json, variables level and missionId, previews, author, difficulty, mod info).
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:283
---@param m table mission
---@return table  normalized scenario
function scenario_scenariosLoader.getScenarioDataForMission(m) end

--- Searches getList() for the scenarios whose name == name and starts each one (no break).
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:515
---@param name string scenario name
function scenario_scenariosLoader.load(name) end

--- Reads a scenario file (JSON, 1-element array) and passes it to processScenarioData. Logs an error if the file is not found.
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:261
---@param scenarioPath string file path
---@param key any scenario key (optional)
---@return table|nil  normalized scenario
function scenario_scenariosLoader.loadScenario(scenarioPath, key) end

--- Hook (emitted by main.lua for each modified file): supposed to reload the scenario if its source file changes (inoperative, see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:506
---@param filename string modified file
---@param type string type of change
function scenario_scenariosLoader.onFileChanged(filename, type) end

--- Completes and normalizes a scenario table (see notes): deduces levelName, scenarioName, directory, mission, previews, prefabs, mod metadata, applies the default values and returns the same table.
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:39
---@param scenarioKey any key stored in scenarioData.scenarioKey (nil possible)
---@param scenarioData table raw scenario (modified in place)
---@param scenarioFilename string|nil path of the .json; nil for a scenario created from a mission
---@return table  normalized scenario
function scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename) end

--- Called when the user chooses a scenario in the UI: stops the campaign, unloads the current level if needed, then starts the scenario (classic or flowgraph).
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:426
---@param sc table normalized scenario
---@return boolean|nil  true if the flowgraph is not found
function scenario_scenariosLoader.start(sc) end

--- Loads then starts the scenario of a file (adds .json if absent).
---Source: lua/ge/extensions/scenario/scenariosLoader.lua:470
---@param path string scenario path
---@return boolean  false if the file does not exist, otherwise true
function scenario_scenariosLoader.startByPath(path) end


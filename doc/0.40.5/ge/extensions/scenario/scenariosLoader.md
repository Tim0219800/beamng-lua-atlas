# `scenario_scenariosLoader`

*File: `lua/ge/extensions/scenario/scenariosLoader.lua` · VM: Game Engine (GE) · 640 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_scenariosLoader`: `extensions.load("scenario_scenariosLoader")`, then the global `scenario_scenariosLoader`

Loads and normalizes scenario files (.json in levels/<level>/scenarios/), lists them for the UI and starts them. processScenarioData completes the table read from the JSON with default values (vehicles, extensions, prefabs, previews, player count, lapConfig, allowed/forbidden action lists, attempts). start() unloads the current level if needed, loads the scenario extensions (scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals) and calls scenario_scenarios.executeScenario, or launches a flowgraph. A modder uses it to list (getList) or start (startByPath, load) a scenario.

## Example

```lua
-- start a scenario by its path (.json extension added if absent)
scenario_scenariosLoader.startByPath('/levels/gridmap_v2/scenarios/monscenario.json')
-- list
for _, sc in ipairs(scenario_scenariosLoader.getList()) do print(sc.name, sc.levelName) end
```

## Notes

- Depends on core_levels (M.dependencies). Loaded at game startup (startupExtensions list of main.lua).
- File format: a scenario's JSON is an array with a single element; loadScenario ignores files whose array does not have exactly 1 element.
- Default values set by processScenarioData: vehicles = {scenario_player0 = {playerUsable=true, startFocus=true}, ['*'] = {playerUsable=false}}; difficulty 'easy'; introType 'htmlOnly'; extensions += {name = scenarioName, optional = true}; playersCountRange {min>=1, max>=min}; lapCount 1; radiusMultiplierAI 1; extraTime 0; whiteListActions += 'default_whitelist_scenario'; blackListActions += 'default_blacklist_scenario'; BranchLapConfig = lapConfig; lapConfig = only the strings of BranchLapConfig; initialLapConfig = copy; attemptsInfo completed (allowedAttempts 0, delayPerAttempt 1, attemptNumber 0...).
- Deductions made from the path: levelName (folder before /scenarios/), scenarioName (file name), directory, mission (the level's main file, otherwise .mis, otherwise the level folder), startHTML (<scenarioName>.html if it exists), previews (<scenarioName>*.jpg of the folder), prefabs (prefabs of the scenario or level folder whose name contains scenarioName or is listed in prefabs), map (title from levels/<level>/info.json).
- The restrictScenarios setting (true by default) keeps the action blacklists; if false, whiteListActions is emptied and blackListActions only blocks vehicleTeleporting. Forced to true in shipping builds if a campaign is active.
- getList: walks the scenarios/ folders of all levels and flowgraphEditor/scenarios/, then the *.flow.json flowgraphs with isScenario, then the missions marked isAvailableAsScenario (except skipMissions). In shipping builds the restrictToCampaign scenarios are hidden unless includeAll. Reads files with systemYield: to be called from a job.
- start(sc): if a level is loaded (scenetree.MissionGroup exists), it calls endActiveGameMode then restarts itself after a delay of 3 frames. For a flowgraph scenario (sc.flowgraph): loads the manager, applies sc.variables, unloadAutoExtensions + loadPresetExtensions, emits onFlowgraphScenarioStarted(sc) and launches the manager (which stops at the end of the level). For a classic scenario: unloadAutoExtensions, loadPresetExtensions, loads M.scenarioModules then scenario_scenarios.executeScenario(sc). Returns true only in the case of a missing-flowgraph error.
- BUG/inconsistency: reloadScenarioSourcefile (automatic reload when the source file changes) tests "scenarios and ..." where scenarios is a nonexistent global (nil) at that point (the local variable of the same name is declared further down): the function returns immediately and onFileChanged therefore never reloads the scenario. Moreover it always logs the error "Unable to reload scenario" even after a successful start (no return).
- BUG/inconsistency: processScenarioData reads scenarioData.levelName for info.json even if scenarioFilename is nil; fine for getScenarioDataForMission which provides levelName, but not for a flowgraph without a level name (tmp = '/levels/nil/info.json').
- Undocumented exported fields: M.dependencies, M.scenarioModules (list of extensions loaded by start), M.prefabCache (per-level cache of found prefabs), M.processedScenarioCache (table never filled in this file).

**Dependencies (loaded first):** `core_levels`

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_scenariosLoader.getLevels(subdirectory, levelList)` | Lists the levels containing a scenario subfolder (bus route case) with, for each bus line (*.buslines.json), a copy of the level's first scenario adapted to the route (name, preview, vehicle, start point, busdriver.routeID, variance, strictStop=true, traffic=false). | 552 |
| `scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions)` | Lists all available scenarios: level .json files, isScenario flowgraphs, and missions available as scenarios. Used by the UI and techCore. | 326 |
| `scenario_scenariosLoader.getScenarioDataForMission(m)` | Turns a mission (gameplay_missions) into a scenario usable by the UI (flowgraph loadMissionAsScenario.flow.json, variables level and missionId, previews, author, difficulty, mod info). | 283 |
| `scenario_scenariosLoader.load(name)` | Searches getList() for the scenarios whose name == name and starts each one (no break). | 515 |
| `scenario_scenariosLoader.loadScenario(scenarioPath, key)` | Reads a scenario file (JSON, 1-element array) and passes it to processScenarioData. Logs an error if the file is not found. | 261 |
| `scenario_scenariosLoader.onFileChanged(filename, type)` | Hook (emitted by main.lua for each modified file): supposed to reload the scenario if its source file changes (inoperative, see notes). *(internal)* *(hook)* | 506 |
| `scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename)` | Completes and normalizes a scenario table (see notes): deduces levelName, scenarioName, directory, mission, previews, prefabs, mod metadata, applies the default values and returns the same table. | 39 |
| `scenario_scenariosLoader.start(sc)` | Called when the user chooses a scenario in the UI: stops the campaign, unloads the current level if needed, then starts the scenario (classic or flowgraph). | 426 |
| `scenario_scenariosLoader.startByPath(path)` | Loads then starts the scenario of a file (adds .json if absent). | 470 |

### Parameter details

#### `scenario_scenariosLoader.getLevels(subdirectory, levelList)`

Lists the levels containing a scenario subfolder (bus route case) with, for each bus line (*.buslines.json), a copy of the level's first scenario adapted to the route (name, preview, vehicle, start point, busdriver.routeID, variance, strictStop=true, traffic=false).

- `subdirectory` (*string*) : subfolder in scenarios/ (e.g. 'busdriver')
- `levelList` (*table<integer, string>|nil*) : levels to walk through (all by default)
- **returns**: table<integer, table> levels {levelName, levelInfo, official, previews, scenarios}

#### `scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions)`

Lists all available scenarios: level .json files, isScenario flowgraphs, and missions available as scenarios. Used by the UI and techCore.

- `subdirectory` (*string|nil*) : subfolder of scenarios/ to restrict to
- `includeAll` (*boolean|nil*) : also include campaign-restricted scenarios and all missions
- `skipMissions` (*boolean|nil*) : do not add the missions
- **returns**: table<integer, table> scenarios

#### `scenario_scenariosLoader.getScenarioDataForMission(m)`

Turns a mission (gameplay_missions) into a scenario usable by the UI (flowgraph loadMissionAsScenario.flow.json, variables level and missionId, previews, author, difficulty, mod info).

- `m` (*table*) : mission
- **returns**: table normalized scenario

#### `scenario_scenariosLoader.load(name)`

Searches getList() for the scenarios whose name == name and starts each one (no break).

- `name` (*string*) : scenario name

#### `scenario_scenariosLoader.loadScenario(scenarioPath, key)`

Reads a scenario file (JSON, 1-element array) and passes it to processScenarioData. Logs an error if the file is not found.

- `scenarioPath` (*string*) : file path
- `key` (*any*) : scenario key (optional)
- **returns**: table|nil normalized scenario

#### `scenario_scenariosLoader.onFileChanged(filename, type)`

Hook (emitted by main.lua for each modified file): supposed to reload the scenario if its source file changes (inoperative, see notes).

- `filename` (*string*) : modified file
- `type` (*string*) : type of change

#### `scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename)`

Completes and normalizes a scenario table (see notes): deduces levelName, scenarioName, directory, mission, previews, prefabs, mod metadata, applies the default values and returns the same table.

- `scenarioKey` (*any*) : key stored in scenarioData.scenarioKey (nil possible)
- `scenarioData` (*table*) : raw scenario (modified in place)
- `scenarioFilename` (*string|nil*) : path of the .json; nil for a scenario created from a mission
- **returns**: table normalized scenario

#### `scenario_scenariosLoader.start(sc)`

Called when the user chooses a scenario in the UI: stops the campaign, unloads the current level if needed, then starts the scenario (classic or flowgraph).

- `sc` (*table*) : normalized scenario
- **returns**: boolean|nil true if the flowgraph is not found

#### `scenario_scenariosLoader.startByPath(path)`

Loads then starts the scenario of a file (adds .json if absent).

- `path` (*string*) : scenario path
- **returns**: boolean false if the file does not exist, otherwise true

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'core_levels'} |
| `prefabCache` | table | Cache [levelPath][folder][lowercaseName] = prefab path, filled by buildPrefabCache. |
| `processedScenarioCache` | table | Empty table, never used in this file. |
| `scenarioModules` | table<integer, string> | Extensions loaded by start(): scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onFlowgraphScenarioStarted` — listened to by 1 module(s)

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/scenariosLoader.lua`.*

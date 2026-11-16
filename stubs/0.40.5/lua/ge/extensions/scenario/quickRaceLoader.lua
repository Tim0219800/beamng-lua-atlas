---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/quickRaceLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Quick race (quickrace) loader. It walks the levels (levels/<level>/quickrace/*.json, including .race.json files) and the Track Editor tracks (trackEditor/ folder of the user documents), builds the list of levels and tracks shown by the selection screen, then turns a choice (track, vehicle, race type) into a scenario via scenario_scenariosLoader.processScenarioData and launches it. A quickrace track modder uses it indirectly: their files are read by getTracks.
--- Access: extension `scenario_quickRaceLoader`: `extensions.load("scenario_quickRaceLoader")`, then the global `scenario_quickRaceLoader`
---@class scenario_quickRaceLoader
---@field quickRaceModules string[] Extensions loaded when a quickrace starts: scenario_scenarios, statistics_statistics, scenario_waypoints, scenario_quickRace, core_hotlapping.
scenario_quickRaceLoader = {}

--- Determines the preview images of a level: levelInfo.previews prefixed with the level folder, otherwise the files <level>_preview*.png then .jpg at the level root. Writes levelInfo.directory and levelInfo.previews.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:189
---@param levelInfo table Level entry being built (must have levelInfo.levelInfo).
---@param levelName string Level folder name.
---@return string[]  List of image paths (warning in the log if empty).
function scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName) end

--- Finds a level in the quickrace list by its folder name or title.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:162
---@param levelName string Folder name or title (levelInfo.title).
---@return table|nil  Level entry, or nil.
function scenario_quickRaceLoader.getLevel(levelName) end

--- Returns the list of level names (levels/ folders containing info.json).
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:17
---@return string[]  Level names; empty list if the levels/ folder does not exist.
function scenario_quickRaceLoader.getLevelList() end

--- Finds a track of a level by its name.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:175
---@param levelName string Level name or title.
---@param trackName string Track name field.
---@return table|nil  The track, or nil.
function scenario_quickRaceLoader.getLevelTrack(levelName, trackName) end

--- Builds the list of levels that contain quickraces (JSON files in levels/<level>/quickrace/ or Track Editor tracks). Each entry describes a pseudo-scenario for the UI: levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 player), playersCountRange, etc.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:49
---@param levelList string[]|nil Levels to examine; default getLevelList().
---@return table[]  List of level entries with at least one track.
function scenario_quickRaceLoader.getQuickraceList(levelList) end

--- Reads the user's trackEditor/*.json files and creates a quickrace track for each (name, author, difficulty 37 by default, lapCount depending on connected/defaultLaps, jpg/png preview, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup).
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:233
---@return table<string, table[]>  Tracks grouped by level name.
function scenario_quickRaceLoader.getTrackEditorTracks() end

--- Parses the quickrace files of a level and returns the list of completed tracks with default values (see notes), sorted by name.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:339
---@param quickraceFiles string[] Paths of the quickrace JSON files.
---@param levelName string Level folder name.
---@param lvlName string Level name, used to detect 'driver_training' (procedural tracks).
---@return table[]  Tracks, with trackName, directory, previews, spawnSpheres, official, etc.
function scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName) end

--- Turns a chosen track and vehicle into a full scenario: fills scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) then calls scenario_scenariosLoader.processScenarioData.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:451
---@param scenarioKey string|nil Scenario key (nil from startQuickrace).
---@param scenarioFile table Level entry from getQuickraceList, modified in place.
---@param trackFile table Chosen track; track.reverse, track.rollingStart and track.tod are read.
---@param vehicleFile table Chosen vehicle (model, config, file...).
---@param raceType string Race type, stored in quickraceType (inferred from code).
---@return table  Processed scenario.
function scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType) end

--- Reads a Track Editor track JSON: trackEditor/<name>.json.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:320
---@param originalFilename string Track name without folder or extension.
---@return table|nil  JSON content, or nil (file missing or unreadable, info message in the log).
function scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename) end

--- Starts a quickrace. If a level is already loaded, delays the start until it is unloaded. Otherwise loads the quickRaceModules extensions, the track's luaFile (and util/trackBuilder/splineTrack for a Track Editor track), builds the scenario with loadQuickrace and calls scenario_scenarios.executeScenario.
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:551
---@param scenarioFile table Level entry.
---@param trackFile table Chosen track.
---@param vehicleFile table Chosen vehicle.
---@param raceType string Race type.
function scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType) end

--- Called by the UI (hotlapping app): loads core_hotlapping on demand if no scenario is running, then calls core_hotlapping.startHotlapping().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:581
function scenario_quickRaceLoader.uiEventStartHotlapping() end

--- Called by the UI when the hotlapping app is destroyed: unloads core_hotlapping if no scenario is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/scenario/quickRaceLoader.lua:593
function scenario_quickRaceLoader.uiHotlappingAppDestroyed() end


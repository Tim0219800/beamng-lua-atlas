---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- File system of the crawl mode. It reads and writes the four types of JSON files of a level, in /levels/<level>/crawls/: *.trail.json (trail), *.boundary.json (boundary zone, gameplay/sites/zone object), *.path.json (path nodes) and *.startingPosition.json (starting position). Each object is loaded on demand then cached, with _filePath, _fileName, _dir and _ext added; an object's id is its file path. It also manages the player's scores per trail (best time, best penalty points, attempts), stored in settings/cloud/crawlTrails/ in freeroam or in the career profile (/career/crawlTrails/).
--- Access: extension `gameplay_crawl_saveSystem`: `extensions.load("gameplay_crawl_saveSystem")`, then the global `gameplay_crawl_saveSystem`
---@class gameplay_crawl_saveSystem
gameplay_crawl_saveSystem = {}

--- Records an attempt: updates the best time (if > 0 and better), the best penalty points (if >= 0 and lower) and increments the attempt count, then saves.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:774
---@param trailId string Trail id.
---@param time number|nil Time in seconds.
---@param penaltyPoints number|nil Penalty points.
---@return table|nil  {isNewBestTime, isNewBestPenaltyPoints, bestTime, bestPenaltyPoints}; nil if the trail is unknown (mission trail).
function gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints) end

--- Empties all caches.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:840
function gameplay_crawl_saveSystem.cleanup() end

--- Empties the cache of one type ('trails', 'boundaries', 'paths' or 'startingPositions') or of all.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:67
---@param type string|nil Cache key; all caches if nil.
function gameplay_crawl_saveSystem.clearCache(type) end

--- Creates the freeroam save folder settings/cloud/crawlTrails/ if it does not exist.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:687
function gameplay_crawl_saveSystem.ensurePlayerSaveDirectories() end

--- Loads all the boundary zones of the current level.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:646
---@return table[]  Zones.
function gameplay_crawl_saveSystem.getAllBoundaries() end

--- Lists the *.boundary.json files.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:621
---@param levelPath string|nil Folder; current level if nil.
---@return string[]  File paths.
function gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath) end

--- Lists the *.path.json files.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:625
---@param levelPath string|nil Folder; current level if nil.
---@return string[]  File paths.
function gameplay_crawl_saveSystem.getAllPathFiles(levelPath) end

--- Loads all the paths of the current level.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:658
---@return table[]  Paths.
function gameplay_crawl_saveSystem.getAllPaths() end

--- Lists the *.startingPosition.json files.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:629
---@param levelPath string|nil Folder; current level if nil.
---@return string[]  File paths.
function gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath) end

--- Loads all the starting positions of the current level.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:670
---@return table[]  Start positions.
function gameplay_crawl_saveSystem.getAllStartingPositions() end

--- Lists the paths of the *.trail.json files in a folder (non-recursive).
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:617
---@param levelPath string|nil Folder; crawl folder of the current level if nil.
---@return string[]  File paths.
function gameplay_crawl_saveSystem.getAllTrailFiles(levelPath) end

--- Loads all the trails of a folder.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:634
---@param levelPath string|nil Folder; current level if nil.
---@return table[]  Trails.
function gameplay_crawl_saveSystem.getAllTrails(levelPath) end

--- Loads (with cache) a boundary zone, created as a zone object then deserialized.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:569
---@param boundaryId string Path of the .boundary.json file.
---@return table|nil  Zone.
function gameplay_crawl_saveSystem.getBoundaryById(boundaryId) end

--- Returns the folder of the crawl files of the current level.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:20
---@return string|nil  '/levels/<level>/crawls/', or nil if no level is loaded.
function gameplay_crawl_saveSystem.getCurrentLevelCrawlPath() end

--- Loads (with cache) a path; the nodes have pos (vec3), rotation (quat), radius, flags, name.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:578
---@param pathId string Path of the .path.json file.
---@return table|nil  Path {name, description, nodes, id}.
function gameplay_crawl_saveSystem.getPathById(pathId) end

--- Returns the score data of a trail.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:723
---@param trailId string Id (file path) of the trail.
---@return table|nil  {id, trail, saveData}.
function gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId) end

--- Loads (once) the player's scores for all trails of the current level, from the freeroam folder or the career profile.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:727
---@return table<string, table>  Dictionary id -> {id, trail, saveData{bestTime, bestPenaltyPoints, bestTimeDate, bestPenaltyPointsDate, attempts}}.
function gameplay_crawl_saveSystem.getPlayerCrawlTrailsById() end

--- Returns the player's statistics on a trail.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:827
---@param trailId string Trail id.
---@return table|nil  {bestTime, bestPenaltyPoints, attempts}; nil if unknown.
function gameplay_crawl_saveSystem.getPlayerTrailStats(trailId) end

--- Loads (with cache) a starting position. Returns nil for a trail from a mission or an empty id.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:587
---@param startingPositionId string|nil Path of the .startingPosition.json file.
---@param trail table|nil Trail; ignored if isFromMission.
---@return table|nil  Starting position {transform, iconPosition, ...}.
function gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail) end

--- Loads (with cache) a trail from its file path.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:560
---@param trailId string Path of the .trail.json file.
---@return table|nil  Trail, with _filePath, _fileName, _dir, _ext.
function gameplay_crawl_saveSystem.getTrailById(trailId) end

--- Indicates whether a trail comes from a mission (isFromMission).
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:857
---@param trail table|nil Trails.
---@return boolean  true if isFromMission is true.
function gameplay_crawl_saveSystem.isTrailFromMission(trail) end

--- Loads a crawl data file (name, description, icon, metadata, list of trail ids) and resolves each trail via getTrailById.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:428
---@param filename string JSON file to read.
---@return table|nil  {name, description, icon ('rockCrawling01' by default), metadata, trails}.
function gameplay_crawl_saveSystem.loadCrawlData(filename) end

--- Hook called when career changes state: forgets the loaded scores so they are re-read from the right folder.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:695
function gameplay_crawl_saveSystem.onCareerActive() end

--- Hook called when saving the career profile: writes the modified trail scores (_dirty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:705
---@param currentSavePath string Current profile folder.
function gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath) end

--- Resets (math.huge, dates 0, attempts 0) a trail's scores and saves them.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:815
---@param trailId string Trail id.
function gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId) end

--- Writes a boundary zone as JSON (via boundary:onSerialize()) and caches it.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:322
---@param boundary table Zone (gameplay/sites/zone object).
---@param filePath string Path of the .boundary.json file.
---@return boolean  true if written.
function gameplay_crawl_saveSystem.saveBoundary(boundary, filePath) end

--- Writes a crawl data file: metadata and trail ids (see notes on the id field).
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:469
---@param saveData table {name, description, icon, metadata, trails}.
---@param filepath string Output file.
---@return boolean  true if written.
function gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath) end

--- Writes a path (list of nodes: name, position, rotation, radius 4.0 by default, flags) as JSON and caches it.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:357
---@param path table Path {name, description, nodes}.
---@param filePath string Path of the .path.json file.
---@return boolean  true if written.
function gameplay_crawl_saveSystem.savePath(path, filePath) end

--- Marks the trail's scores as modified; outside career, writes them immediately to settings/cloud/crawlTrails/.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:713
---@param trailId string Trail id.
function gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId) end

--- Writes a starting position (transform position/rotation/radius 10.0 by default, iconPosition, metadata) as JSON and caches it.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:392
---@param startingPosition table Start position.
---@param filePath string Path of the .startingPosition.json file.
---@return boolean  true if written.
function gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath) end

--- Serializes a trail and writes it as JSON (creating the folder if needed), then caches it.
---Source: lua/ge/extensions/gameplay/crawl/saveSystem.lua:287
---@param trail table Trail (name, description, pathId, boundaryId, startingPositionId, rules, prefabs...).
---@param filePath string Path of the .trail.json file.
---@return boolean  true if written.
function gameplay_crawl_saveSystem.saveTrail(trail, filePath) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_saveSystem` : `extensions.load("gameplay_crawl_saveSystem")`, puis la globale `gameplay_crawl_saveSystem`
---@class gameplay_crawl_saveSystem
gameplay_crawl_saveSystem = {}

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:774
---@param trailId any
---@param time any
---@param penaltyPoints any
function gameplay_crawl_saveSystem.addNewPlayerScore(trailId, time, penaltyPoints) end

--- Cleanup function
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:840
function gameplay_crawl_saveSystem.cleanup() end

--- Clear cache for a specific type or all
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:67
---@param type any
function gameplay_crawl_saveSystem.clearCache(type) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:687
function gameplay_crawl_saveSystem.ensurePlayerSaveDirectories() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:646
function gameplay_crawl_saveSystem.getAllBoundaries() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:621
---@param levelPath any
function gameplay_crawl_saveSystem.getAllBoundaryFiles(levelPath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:625
---@param levelPath any
function gameplay_crawl_saveSystem.getAllPathFiles(levelPath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:658
function gameplay_crawl_saveSystem.getAllPaths() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:629
---@param levelPath any
function gameplay_crawl_saveSystem.getAllStartingPositionFiles(levelPath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:670
function gameplay_crawl_saveSystem.getAllStartingPositions() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:617
---@param levelPath any
function gameplay_crawl_saveSystem.getAllTrailFiles(levelPath) end

--- Getter functions for all objects
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:634
---@param levelPath any
function gameplay_crawl_saveSystem.getAllTrails(levelPath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:569
---@param boundaryId any
function gameplay_crawl_saveSystem.getBoundaryById(boundaryId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:20
function gameplay_crawl_saveSystem.getCurrentLevelCrawlPath() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:578
---@param pathId any
function gameplay_crawl_saveSystem.getPathById(pathId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:723
---@param trailId any
function gameplay_crawl_saveSystem.getPlayerCrawlTrailById(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:727
function gameplay_crawl_saveSystem.getPlayerCrawlTrailsById() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:827
---@param trailId any
function gameplay_crawl_saveSystem.getPlayerTrailStats(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:587
---@param startingPositionId any
---@param trail any
function gameplay_crawl_saveSystem.getStartingPositionById(startingPositionId, trail) end

--- Getter functions with lazy loading
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:560
---@param trailId any
function gameplay_crawl_saveSystem.getTrailById(trailId) end

--- Mission detection functions
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:857
---@param trail any
function gameplay_crawl_saveSystem.isTrailFromMission(trail) end

--- Load crawl data (main entry point)
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:428
---@param filename any
function gameplay_crawl_saveSystem.loadCrawlData(filename) end

--- Player save system exports
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:695
function gameplay_crawl_saveSystem.onCareerActive() end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:705
---@param currentSavePath any
function gameplay_crawl_saveSystem.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:815
---@param trailId any
function gameplay_crawl_saveSystem.resetPlayerTrailScores(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:322
---@param boundary any
---@param filePath any
function gameplay_crawl_saveSystem.saveBoundary(boundary, filePath) end

--- Save crawl data (main entry point)
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:469
---@param saveData any
---@param filepath any
function gameplay_crawl_saveSystem.saveCrawlData(saveData, filepath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:357
---@param path any
---@param filePath any
function gameplay_crawl_saveSystem.savePath(path, filePath) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:713
---@param trailId any
function gameplay_crawl_saveSystem.savePlayerCrawlTrailScoresForTrailById(trailId) end

---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:392
---@param startingPosition any
---@param filePath any
function gameplay_crawl_saveSystem.saveStartingPosition(startingPosition, filePath) end

--- Save functions for individual items
---Source : lua/ge/extensions/gameplay/crawl/saveSystem.lua:287
---@param trail any
---@param filePath any
function gameplay_crawl_saveSystem.saveTrail(trail, filePath) end


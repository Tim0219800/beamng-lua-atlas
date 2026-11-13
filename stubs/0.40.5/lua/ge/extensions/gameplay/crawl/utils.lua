---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_utils` : `extensions.load("gameplay_crawl_utils")`, puis la globale `gameplay_crawl_utils`
---@class gameplay_crawl_utils
---@field drivingBackwardsSettings table
---@field infractionCooldowns table
---@field infractionPoints table
gameplay_crawl_utils = {}

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:540
function gameplay_crawl_utils.activateCrawlMarkers() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:231
---@param crawlerId any
---@param penaltyType any
---@param points any
function gameplay_crawl_utils.applyPenalty(crawlerId, penaltyType, points) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1741
---@param pathId any
---@param pathReversed any
function gameplay_crawl_utils.calculatePathStats(pathId, pathReversed) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:397
---@param force any
function gameplay_crawl_utils.clear(force) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:372
---@param crawlerId any
function gameplay_crawl_utils.clearCrawler(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:359
function gameplay_crawl_utils.clearMarkers() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1623
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_crawl_utils.drawMarkers(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1902
function gameplay_crawl_utils.getActiveCrawlerId() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1898
function gameplay_crawl_utils.getAllCrawlStates() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1862
---@param crawlerId any
function gameplay_crawl_utils.getCrawlState(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1874
---@param crawlerId any
function gameplay_crawl_utils.getCrawlerDirection(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1866
---@param crawlerId any
function gameplay_crawl_utils.getCrawlerPosition(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1915
function gameplay_crawl_utils.getDottedPath() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:288
---@param prefabId any
---@param dynamicName any
function gameplay_crawl_utils.getDynamicObjectsFromPrefab(prefabId, dynamicName) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1919
---@param crawlerId any
function gameplay_crawl_utils.getLastRecoveryCheckpoint(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1932
---@param crawlerId any
function gameplay_crawl_utils.getLastRecoveryCheckpointIndex(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:225
---@param crawlerId any
function gameplay_crawl_utils.hasPenalties(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1737
function gameplay_crawl_utils.isDebugDrawEnabled() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1911
function gameplay_crawl_utils.isPreviewMode() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:313
---@param prefabFileList any
function gameplay_crawl_utils.loadPrefabs(prefabFileList) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1550
---@param crawlerId any
function gameplay_crawl_utils.onBoundaryViolation(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1660
---@param td any
function gameplay_crawl_utils.onDrawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:2063
function gameplay_crawl_utils.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1713
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_crawl_utils.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1830
---@param objId any
function gameplay_crawl_utils.onSpawnCCallback(objId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1672
---@param enabled any
---@param _playerCount any
---@param _layoutId any
---@param layoutMode any
function gameplay_crawl_utils.onSplitScreenChanged(enabled, _playerCount, _layoutId, layoutMode) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1431
---@param crawlerId any
function gameplay_crawl_utils.onVehicleFlippedUpright(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1440
---@param crawlerId any
---@param isGateRecovery any
function gameplay_crawl_utils.onVehicleReset(crawlerId, isGateRecovery) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1495
---@param crawlerId any
function gameplay_crawl_utils.recoverToLastGate(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1151
---@param crawlerId any
---@param force any
function gameplay_crawl_utils.resetCrawlData(crawlerId, force) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1806
---@param crawlerId any
function gameplay_crawl_utils.resumeCrawlTimer(crawlerId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1890
---@param crawlerId any
---@param state any
function gameplay_crawl_utils.setCrawlState(crawlerId, state) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1727
---@param enabled any
function gameplay_crawl_utils.setDebugDraw(enabled) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1945
---@param crawlerId any
---@param checkpoint any
function gameplay_crawl_utils.setRecoveryCheckpoint(crawlerId, checkpoint) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:490
---@param path any
function gameplay_crawl_utils.setupCrawlMarkers(path) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1279
---@param veh any
function gameplay_crawl_utils.setupCrawlerData(veh) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1074
---@param crawlerId any
---@param trail any
---@param crawlerData any
---@param isFromMission any
function gameplay_crawl_utils.startCrawl(crawlerId, trail, crawlerData, isFromMission) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1029
---@param force any
function gameplay_crawl_utils.stopCrawl(force) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1732
function gameplay_crawl_utils.toggleDebugDraw() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:2010
---@param vehId any
function gameplay_crawl_utils.trackVehReset(vehId) end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:267
function gameplay_crawl_utils.unloadPrefabs() end

---Source : lua/ge/extensions/gameplay/crawl/utils.lua:1567
---@param dtSim any
function gameplay_crawl_utils.updateCrawl(dtSim) end


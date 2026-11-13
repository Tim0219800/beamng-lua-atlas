---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_crawl_general` : `extensions.load("gameplay_crawl_general")`, puis la globale `gameplay_crawl_general`
---@class gameplay_crawl_general
---@field activeTrail any
---@field crawlersData table
---@field dependencies table
gameplay_crawl_general = {}

---Source : lua/ge/extensions/gameplay/crawl/general.lua:38
---@param force any
function gameplay_crawl_general.clear(force) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:302
---@param elemData any
---@param activityData any
function gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:385
---@param data any
function gameplay_crawl_general.onActivityIndexVisible(data) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:464
---@param status any
---@param id any
function gameplay_crawl_general.onAnyMissionChanged(status, id) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:470
function gameplay_crawl_general.onCrawlCleared() end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:480
---@param eventData any
function gameplay_crawl_general.onCrawlResultsShown(eventData) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:424
---@param td any
function gameplay_crawl_general.onDrawOnMinimap(td) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:433
function gameplay_crawl_general.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:229
---@param levelIdentifier any
---@param elements any
function gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:492
---@param old any
---@param new any
function gameplay_crawl_general.onMPSessionChanged(old, new) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:438
function gameplay_crawl_general.onSerialize() end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:209
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:453
---@param vehId any
function gameplay_crawl_general.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:442
---@param oldId any
---@param newId any
---@param player any
function gameplay_crawl_general.onVehicleSwitched(oldId, newId, player) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:49
---@param trail any
---@param veh any
---@param isFromMission any
function gameplay_crawl_general.setupCrawl(trail, veh, isFromMission) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:169
---@param trail any
---@param veh any
function gameplay_crawl_general.startCrawlFlowgraph(trail, veh) end

---Source : lua/ge/extensions/gameplay/crawl/general.lua:131
---@param trail any
---@param veh any
function gameplay_crawl_general.startCrawlFreeroam(trail, veh) end


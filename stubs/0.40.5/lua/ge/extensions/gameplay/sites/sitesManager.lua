---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sitesManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_sites_sitesManager` : `extensions.load("gameplay_sites_sitesManager")`, puis la globale `gameplay_sites_sitesManager`
---@class gameplay_sites_sitesManager
gameplay_sites_sitesManager = {}

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:13
function gameplay_sites_sitesManager.getAllLevelSites() end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:121
---@param vehId any
---@param parkingSpots any
function gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots) end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:112
---@param name any
function gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name) end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:108
---@param name any
function gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name) end

--- UTIL functions
---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:104
function gameplay_sites_sitesManager.getSitesFilesByLevel() end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:30
---@param filepath any
---@param force any
---@param ignoreCache any
function gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache) end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:62
function gameplay_sites_sitesManager.onClientEndMission() end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:58
function gameplay_sites_sitesManager.onClientStartMission() end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:89
---@param data any
function gameplay_sites_sitesManager.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:54
function gameplay_sites_sitesManager.onModManagerReady() end

---Source : lua/ge/extensions/gameplay/sites/sitesManager.lua:73
function gameplay_sites_sitesManager.onSerialize() end


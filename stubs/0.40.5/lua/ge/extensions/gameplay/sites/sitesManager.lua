---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/sitesManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension that lists the *.sites.json files of each level, loads them into "sites" objects (locations, zones, parking spots) and caches them. Scenarios, missions and traffic go through it to get a map's sites. Keeps a cache per file path, cleared at the end of the mission.
--- Access: extension `gameplay_sites_sitesManager`: `extensions.load("gameplay_sites_sitesManager")`, then the global `gameplay_sites_sitesManager`
---@class gameplay_sites_sitesManager
gameplay_sites_sitesManager = {}

--- Walks the levels (core_levels.getList) and rebuilds the table of *.sites.json files per level (key = lowercase level name). Logs the number of files found.
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:13
function gameplay_sites_sitesManager.getAllLevelSites() end

--- Returns the first spot where the vehicle fits (vehicleFits) and that is not occupied by any vehicle (hasAnyVehicles), otherwise the last one in the list.
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:121
---@param vehId integer|nil Vehicle; default the player 0 vehicle.
---@param parkingSpots table[] List of parkingSpot objects.
---@return table  Chosen spot.
function gameplay_sites_sitesManager.getBestParkingSpotForVehicleFromList(vehId, parkingSpots) end

--- Finds the current level's sites file whose name (without ".sites.json") matches.
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:112
---@param name string File name without extension.
---@return string|nil  Full path or nil.
function gameplay_sites_sitesManager.getCurrentLevelSitesFileByName(name) end

--- List of the current level's sites files (getCurrentLevelIdentifier).
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:108
---@param name any Unused.
---@return string[]  Paths, empty table if none.
function gameplay_sites_sitesManager.getCurrentLevelSitesFiles(name) end

--- Returns the level -> list of sites files table (builds it if needed).
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:104
---@return table<string, string[]>  Files per level.
function gameplay_sites_sitesManager.getSitesFilesByLevel() end

--- Loads a .sites.json file and returns the sites object (deserialized and finalized). Uses the cache if present, unless force. Adds site.dir and site.filename.
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:30
---@param filepath string Path of the .sites.json file.
---@param force boolean|nil Reload even if cached.
---@param ignoreCache boolean|nil Do not store the result in the cache.
---@return table|nil  Sites object, or nil if the file is unreadable (error logged).
function gameplay_sites_sitesManager.loadSites(filepath, force, ignoreCache) end

--- Hook called at the end of the mission: clears the sites cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:62
function gameplay_sites_sitesManager.onClientEndMission() end

--- Hook called at the start of a mission/level: stores the current level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:58
function gameplay_sites_sitesManager.onClientStartMission() end

--- Restores the state after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:89
---@param data table|nil Data from onSerialize.
function gameplay_sites_sitesManager.onDeserialized(data) end

--- Hook called when the mod manager is ready: builds the list of sites files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:54
function gameplay_sites_sitesManager.onModManagerReady() end

--- Serializes the file list, the current level and the cache for the Lua reload. Returns nil if nothing is cached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/sitesManager.lua:73
function gameplay_sites_sitesManager.onSerialize() end


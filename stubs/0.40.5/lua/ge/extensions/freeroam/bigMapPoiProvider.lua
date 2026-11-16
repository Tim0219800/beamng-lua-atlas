---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapPoiProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data provider for the big map: turns the raw POIs (missions, garages, gas stations, dealerships, spawn points, drift, drag, crawl, player vehicles, delivery...) into a UI-ready structure (poiData), groups (groupData: rating_, type_, distance_, difficulty_, branch_, missionType_...) and predefined filters (freeroam or career). Also manages each group's visibility state and sends everything to the UI through the BigmapMissionData UI hook. A modder who adds POIs sees them appear via gameplay_rawPois; this module decides which group they fall into.
--- Access: extension `freeroam_bigMapPoiProvider`: `extensions.load("freeroam_bigMapPoiProvider")`, then the global `freeroam_bigMapPoiProvider`
---@class freeroam_bigMapPoiProvider
---@field dependencies string[] gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_playmodeMarkers.
freeroam_bigMapPoiProvider = {}

--- Clears the mission markers from the minimap (NavigationStaticMarkers UI hook with the 'missions' key and an empty list) if a level is loaded.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:158
function freeroam_bigMapPoiProvider.clearMissionsFromMinimap() end

--- Sets the sendToMinimap flag to true: the next onPreRender will call sendMissionLocationsToMinimap again. Also serves as onClientStartMission and requestMissionLocationsForMinimap.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.forceSend() end

--- Converts a mission into a table for the UI: id, icon, name, description, thumbnail, previews, difficulty, fast travel available/unlocked, progress, rating, rating key, etc.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:199
---@param elemData table Mission POI data (uses missionId and idInCluster).
---@return table|nil  Formatted table, nil if the mission does not exist.
function freeroam_bigMapPoiProvider.formatMissionForBigmap(elemData) end

--- Converts a non-mission POI into a table for the UI (id, icon from bigmapMarker.cardIcon or from the type, name, description, thumbnail, previews, fast travel, canSetRoute, aggregates). Fast travel is only available outside career or during the career tutorial.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:177
---@param poi table Raw POI from gameplay_rawPois with markerInfo.bigmapMarker.
---@return table  Table formatted for the big map.
function freeroam_bigMapPoiProvider.formatPoiForBigmap(poi) end

--- Keys of the groups currently visible (according to the stored state).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:77
---@return string[]  Visible group keys.
function freeroam_bigMapPoiProvider.getActiveGroupIds() end

--- Ids of the POIs belonging to the visible groups of the cached filters (rebuilt if needed). A POI present in several groups appears several times.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:96
---@return string[]  POI ids.
function freeroam_bigMapPoiProvider.getAllActiveGroupPoiIds() end

--- Keys of all known groups (visible or not).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:88
---@return string[]  Group keys.
function freeroam_bigMapPoiProvider.getAllGroupIds() end

--- Big map filters (freeroam or career), rebuilt if the cache is invalid.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:143
---@return table[]  List of filters {key, icon, title, groups}.
function freeroam_bigMapPoiProvider.getCachedFilters() end

--- Groups keyed by key (label, icon, elements, visible, groupKey), rebuilt if the cache is invalid.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:127
---@return table<string, table>  Group data.
function freeroam_bigMapPoiProvider.getCachedGroupData() end

--- Formatted POI data keyed by id, each with filterData (groupTags, sortingValues).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:135
---@return table<string, table>  Formatted POIs.
function freeroam_bigMapPoiProvider.getCachedPoiData() end

--- Tells whether a group is visible (true by default if unknown).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:63
---@param groupKey string Group key, e.g. 'type_garage'.
---@return boolean  true if visible.
function freeroam_bigMapPoiProvider.getGroupVisibility(groupKey) end

--- Clears the group, POI and filter cache; it will be rebuilt on the next request.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:45
function freeroam_bigMapPoiProvider.invalidateCache() end

--- Hook called when a level starts: equivalent to forceSend().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.onClientStartMission() end

--- Hook called every frame: if the game state has game mode markers and a level is loaded and sendToMinimap is true, calls sendMissionLocationsToMinimap (which sets the flag back to false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:702
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
function freeroam_bigMapPoiProvider.onPreRender(dtReal, dtSim) end

--- Requests a new send of the mission positions to the minimap (equivalent to forceSend).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:10
function freeroam_bigMapPoiProvider.requestMissionLocationsForMinimap() end

--- Sets all known groups back to visible.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:120
function freeroam_bigMapPoiProvider.resetAllGroupsToVisible() end

--- Rebuilds everything (groups, POIs, filters), determines gameMode and rules (canSetRoute), calls freeroam_bigMapMode.setOnlyIdsVisible with the POIs of the visible groups, then sends everything to the UI via guihooks.trigger('BigmapMissionData', data).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:643
function freeroam_bigMapPoiProvider.sendCurrentLevelMissionsToBigmap() end

--- Sets the internal sendToMinimap flag back to false; actually sends nothing (body reduced to this flag).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:153
function freeroam_bigMapPoiProvider.sendMissionLocationsToMinimap() end

--- Sets a group's visibility; the effect only appears after a new send to the big map.
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:58
---@param groupKey string Group key.
---@param isVisible boolean true to show.
function freeroam_bigMapPoiProvider.setGroupVisibility(groupKey, isVisible) end

--- Toggles a group's visibility (the big map update is commented out in the code).
---Source: lua/ge/extensions/freeroam/bigMapPoiProvider.lua:68
---@param groupKey string Group key.
function freeroam_bigMapPoiProvider.toggleGroupVisibility(groupKey) end


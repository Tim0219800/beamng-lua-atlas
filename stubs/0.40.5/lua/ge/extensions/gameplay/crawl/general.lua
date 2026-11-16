---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crawl/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the crawl mode (slow trail traversal) on the freeroam/career side: keeps the active trail (activeTrail: trail, zone, copied path, start, prefabs) and the list of crawler data, prepares a trail (setupCrawl, with optional path reversal), starts the crawl in freeroam or from a flowgraph, and calls gameplay_crawl_utils.updateCrawl every frame. It also provides the points of interest (start markers, map), the activity windows, the drawing of the zone on the minimap, and records the scores at the end. It handles the local multiplayer case (multiseat).
--- Access: extension `gameplay_crawl_general`: `extensions.load("gameplay_crawl_general")`, then the global `gameplay_crawl_general`
---@class gameplay_crawl_general
---@field activeTrail table|nil Active trail: {trail, boundary, path, startingPosition, prefabs, isFromMission}; nil if none.
---@field crawlersData table<integer, table> List of crawler data (created by gameplay_crawl_utils.setupCrawlerData) of the active trail.
---@field dependencies table<integer, string> Extensions loaded beforehand: gameplay_crawl_saveSystem, utils, boundary, display.
gameplay_crawl_general = {}

--- Unloads the prefabs of the active trail, forgets the trail, cleans up gameplay_crawl_utils and empties crawlersData.
---Source: lua/ge/extensions/gameplay/crawl/general.lua:38
---@param force boolean|nil Passed to gameplay_crawl_utils.clear.
function gameplay_crawl_general.clear(force) end

--- Activity window hook: for a 'crawl' POI, adds a card (distance, positive/negative elevation change, best points, best time, attempts) and a "Play" button that runs startCrawlFreeroam on the player's vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:302
---@param elemData table Data of the selected items.
---@param activityData table List of cards to complete.
function gameplay_crawl_general.onActivityAcceptGatherData(elemData, activityData) end

--- Hook called when an activity is shown/hidden in the index: prepares the trail and its path markers for a crawl POI, or cleans up if data is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:385
---@param data table|nil POI data (type, trailId); nil when the index closes.
function gameplay_crawl_general.onActivityIndexVisible(data) end

--- Hook called when a mission's state changes: cleans everything up if it goes to 'stopped'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:464
---@param status string Mission state.
---@param id any Mission concerned.
function gameplay_crawl_general.onAnyMissionChanged(status, id) end

--- Hook emitted by utils.clear() at the end of each crawl: empties crawlersData and clears the raw POIs to show the start marker again.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:470
function gameplay_crawl_general.onCrawlCleared() end

--- Hook called when the results are shown: records the player's time and points for the active trail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:480
---@param eventData table {time, points}.
function gameplay_crawl_general.onCrawlResultsShown(eventData) end

--- Hook called to draw on the minimap: draws the zone of the active trail.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:424
---@param td table Minimap drawing object.
function gameplay_crawl_general.onDrawOnMinimap(td) end

--- Hook called on load: cleans up the state and creates the player's save folders.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:433
function gameplay_crawl_general.onExtensionLoaded() end

--- Hook collecting the points of interest of a level: for each trail (folder /levels/<level>/crawls/) adds a 'crawl' type POI with an invisible trigger, a start marker and a map marker (name, thumbnail, best points) as long as no trail is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:229
---@param levelIdentifier string Level name.
---@param elements table POI list to complete.
function gameplay_crawl_general.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook called on multiplayer session change: loads gameplay_crawl_freeroamMultiplayer at session start and unloads it at the end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:492
---@param old any Old session (nil/false if none).
---@param new any New session.
function gameplay_crawl_general.onMPSessionChanged(old, new) end

--- Hook called before extensions reload: cleans up the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:438
function gameplay_crawl_general.onSerialize() end

--- Hook called every frame: advances the active crawl (gameplay_crawl_utils.updateCrawl).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:209
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation time delta (s).
---@param dtRaw number Raw time delta (s).
function gameplay_crawl_general.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle is destroyed: removes its crawler (non-mission trail).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:453
---@param vehId integer Vehicle id.
function gameplay_crawl_general.onVehicleDestroyed(vehId) end

--- Hook called when the controlled vehicle changes: removes the crawler from the old vehicle (non-mission trail) and cleans up if none remain.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crawl/general.lua:442
---@param oldId integer Id of the old vehicle.
---@param newId integer Id of the new vehicle.
---@param player integer Player index.
function gameplay_crawl_general.onVehicleSwitched(oldId, newId, player) end

--- Prepares a trail: stops the previous crawl, resolves zone, path and start from saveSystem, handles reversal, creates the crawler data, loads the prefabs and, if isFromMission, teleports the vehicle to the starting position.
---Source: lua/ge/extensions/gameplay/crawl/general.lua:49
---@param trail table Trail (boundaryId, pathId, startingPositionId, pathReversed, prefabs, name).
---@param veh userdata Vehicle object.
---@param isFromMission boolean|nil True if started by a mission/flowgraph.
---@return boolean  false if zone or path are missing or if trail/veh is nil.
function gameplay_crawl_general.setupCrawl(trail, veh, isFromMission) end

--- Starts a crawl from a flowgraph. If the same trail (same name) is already prepared, reuses it; otherwise calls setupCrawl(trail, veh, true). Emits onCrawlStarted.
---Source: lua/ge/extensions/gameplay/crawl/general.lua:169
---@param trail table Trail to start.
---@param veh userdata Vehicle object.
---@return boolean  true if the crawl started.
function gameplay_crawl_general.startCrawlFlowgraph(trail, veh) end

--- Starts a crawl in freeroam. In multiseat with the same trail already active, simply adds the vehicle to the crawl; otherwise prepares the trail then calls gameplay_crawl_utils.startCrawl, emits onCrawlStarted and clears the raw POIs.
---Source: lua/ge/extensions/gameplay/crawl/general.lua:131
---@param trail table Trail to start.
---@param veh userdata Vehicle object.
function gameplay_crawl_general.startCrawlFreeroam(trail, veh) end


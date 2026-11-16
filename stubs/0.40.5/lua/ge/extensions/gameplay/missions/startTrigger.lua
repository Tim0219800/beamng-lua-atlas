---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/startTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforms a mission's `startTrigger` field into a list of "locations" (start zones) and groups nearby zones into clusters for the map. Only the "coordinates" type (level + position + radius) actually produces a location; "league" and "none" produce none (nop). Used by gameplay_missions_missions (getLocations) and by the mission markers.
--- Access: extension `gameplay_missions_startTrigger`: `extensions.load("gameplay_missions_startTrigger")`, then the global `gameplay_missions_startTrigger`
---@class gameplay_missions_startTrigger
gameplay_missions_startTrigger = {}

--- Tests whether the player is in the start zone: same level, position and radius defined, and distance to the center <= radius.
---Source: lua/ge/extensions/gameplay/missions/startTrigger.lua:16
---@param location table Location {level, pos, radius}.
---@param level string Current level identifier (lowercase).
---@param playerPosition vec3 Player position.
---@param mission table Mission concerned (not used).
---@return boolean  true if the player is in the zone.
function gameplay_missions_startTrigger.defaultLocationCheck(location, level, playerPosition, mission) end

--- Draws a start zone marker with debugDrawer: a ground cylinder of radius `radius` and a 5 m pole. Red outside the zone, green inside.
---Source: lua/ge/extensions/gameplay/missions/startTrigger.lua:21
---@param location table Location {pos, radius}.
---@param playerPosition vec3 Player position.
function gameplay_missions_startTrigger.defaultLocationDisplayMarker(location, playerPosition) end

--- Groups all "coordinates" locations of all missions into clusters, level by level, using a quadtree. Two zones are grouped if their disks overlap (fixed merge radius if mergeRadius is given).
---Source: lua/ge/extensions/gameplay/missions/startTrigger.lua:127
---@param mergeRadius number|nil Radius (m) used in place of each location's own radius; nil = the missions' radii.
---@return table  List of clusters {type, level, pos, rot, radius, check, displayMarker, missionIds, clusterId}.
function gameplay_missions_startTrigger.getMissionClusters(mergeRadius) end

--- Hook emitted by missionManager when a mission changes state: clears the clusters cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/startTrigger.lua:187
function gameplay_missions_startTrigger.onAnyMissionChanged() end

--- Creates a mission's list of locations from mission.startTrigger. Checks the type and the required fields.
---Source: lua/ge/extensions/gameplay/missions/startTrigger.lua:62
---@param mission table Mission whose startTrigger field exists (assumed checked by the caller).
---@return table  List of locations (empty on error or for league/none types).
---@return string|nil  Error message (invalid type or missing fields), nil if all is well.
function gameplay_missions_startTrigger.parseMission(mission) end


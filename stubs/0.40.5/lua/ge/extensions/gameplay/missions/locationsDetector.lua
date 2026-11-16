---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/locationsDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Detects the missions whose marker cluster contains the player's given position. getNearbyLocations iterates over the gameplay_missions_clustering clusters (with the big map's merge radius if it is active) and returns, for each mission found, its type, the mission object, the cluster and the id. The "background missions" part is commented out in the file.
--- Access: extension `gameplay_missions_locationsDetector`: `extensions.load("gameplay_missions_locationsDetector")`, then the global `gameplay_missions_locationsDetector`
---@class gameplay_missions_locationsDetector
---@field isEnabled nil Always nil: reference to an undefined local variable.
---@field onPoiTriggered nil Always nil: reference to an undefined local variable.
gameplay_missions_locationsDetector = {}

--- Returns the missions for which a cluster contains the player's position.
---Source: lua/ge/extensions/gameplay/missions/locationsDetector.lua:43
---@param level string Level identifier (passed to the test function, unused).
---@param playerPosition vec3 Player position.
---@return table  {missions = {{type, mission, location, id}, ...}, missionsChanged = false}.
function gameplay_missions_locationsDetector.getNearbyLocations(level, playerPosition) end


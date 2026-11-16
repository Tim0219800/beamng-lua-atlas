---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/driftLineMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Start line marker for freeroam drift challenges. It displays nothing itself: it makes the named scene objects (markerObjects) visible at setup, hides them at cleanup, and, when the player's vehicle enters the line's radius, calls gameplay_drift_freeroam_driftSpots.detectStart(lineId). The module returns {create, cluster}.
--- Access: extension `gameplay_markers_driftLineMarker`: `extensions.load("gameplay_markers_driftLineMarker")`, then the global `gameplay_markers_driftLineMarker`
---@class gameplay_markers_driftLineMarker
gameplay_markers_driftLineMarker = {}

--- Turns each driftLineMarker POI into a distinct cluster and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:109
---@param pois table[] POIs with markerInfo.driftLineMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_driftLineMarker.cluster(pois, allClusters) end

--- Builds a drift line marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:100
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_driftLineMarker.create(...) end

--- Drift start line marker.
---@class gameplay_markers_driftLineMarker_C
local gameplay_markers_driftLineMarker_C = {}

--- Hides (setHidden(true)) the scene objects listed in cluster.markerObjects.
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:18
function gameplay_markers_driftLineMarker_C:clearObjects() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:14
function gameplay_markers_driftLineMarker_C:createObjects() end

--- Draws on the minimap a line between the ends (or a circle if startDir is nil) in blue (72,125,249).
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:90
---@param td table Drawing data (unused).
function gameplay_markers_driftLineMarker_C:drawOnMinimap(td) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:28
function gameplay_markers_driftLineMarker_C:hide() end

--- Assigns an incremental id to the instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:9
function gameplay_markers_driftLineMarker_C:init() end

--- Called every frame: if the player is in a vehicle within the radius, triggers gameplay_drift_freeroam_driftSpots.detectStart(lineId).
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:75
---@param interactData table Frame data: isWalking, vehPos.
function gameplay_markers_driftLineMarker_C:interactWhileMoving(interactData) end

--- Stores cluster, pos, radius, lineId and startDir, computes the left and right ends of the line (at 0.7 times the radius) and makes the markerObjects visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:54
---@param cluster table Cluster from cluster().
function gameplay_markers_driftLineMarker_C:setup(cluster) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:31
function gameplay_markers_driftLineMarker_C:show() end

--- Does nothing (the debug drawing is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/driftLineMarker.lua:35
function gameplay_markers_driftLineMarker_C:update() end


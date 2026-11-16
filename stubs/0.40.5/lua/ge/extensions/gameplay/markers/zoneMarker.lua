---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/zoneMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone marker without visual: makes a POI interactive when the player's vehicle (the four ground corners of its bounding box) is entirely inside one of the given zone polygons. No icon or decal is drawn. The module returns {create, cluster}; each zoneMarker POI forms its own cluster.
--- Access: extension `gameplay_markers_zoneMarker`: `extensions.load("gameplay_markers_zoneMarker")`, then the global `gameplay_markers_zoneMarker`
---@class gameplay_markers_zoneMarker
gameplay_markers_zoneMarker = {}

--- Turns each zoneMarker POI into a distinct cluster (no merging) and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:57
---@param pois table[] POIs with markerInfo.zoneMarker {zones, pos, radius}.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_zoneMarker.cluster(pois, allClusters) end

--- Builds a zone marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:48
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_zoneMarker.create(...) end

--- Zone marker without rendering.
---@class gameplay_markers_zoneMarker_C
local gameplay_markers_zoneMarker_C = {}

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:24
function gameplay_markers_zoneMarker_C:clearObjects() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:20
function gameplay_markers_zoneMarker_C:createObjects() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:21
function gameplay_markers_zoneMarker_C:hide() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:7
function gameplay_markers_zoneMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:23
---@param visible boolean Ignored.
function gameplay_markers_zoneMarker_C:instantFade(visible) end

--- Adds the cluster's data (elemData) to the interactive elements if the vehicle is entirely in a zone and canInteract is true; no effect on foot.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:27
---@param interactData table Frame data: isWalking, vehPos2d, bbPoints, canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_zoneMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:19
---@param value boolean Ignored.
function gameplay_markers_zoneMarker_C:setHidden(value) end

--- Stores zones, cluster, 2D center (visibilityPos with z = 0) and radius (visibilityRadius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:12
---@param cluster table Cluster from cluster().
function gameplay_markers_zoneMarker_C:setup(cluster) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:22
function gameplay_markers_zoneMarker_C:show() end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/zoneMarker.lua:9
---@param data table Ignored.
function gameplay_markers_zoneMarker_C:update(data) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/bigmapMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marker type used by the big map (bigmap): for each POI cluster, displays an icon and a column (icon renderer icons) that fade in when the big map is active and that grow on hover or selection. The module returns a table {createMarker, merge}: createMarker creates the marker object (class C), merge merges several nearby POIs into a single cluster with a numbered icon.
--- Access: extension `gameplay_markers_bigmapMarker`: `extensions.load("gameplay_markers_bigmapMarker")`, then the global `gameplay_markers_bigmapMarker`
---@class gameplay_markers_bigmapMarker
---@field containsAnyDelivery boolean
---@field containsAnyMission boolean
gameplay_markers_bigmapMarker = {}

--- Builds a big map marker object (instance of class C) and calls its init.
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:235
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_bigmapMarker.createMarker(...) end

--- Merges a list of POIs into a single big map cluster (average position, contained ids, numbered icon if several).
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:242
---@param pois table[] POIs to merge (with markerInfo.bigmapMarker and data).
---@param idPrefix string Prefix of the cluster id.
---@return table  Cluster {id, containedIds, containedIdsLookup, pos, icon}.
function gameplay_markers_bigmapMarker.merge(pois, idPrefix) end

--- Big map marker: an icon plus a column, whose opacity follows the big map state.
---@class gameplay_markers_bigmapMarker_C
local gameplay_markers_bigmapMarker_C = {}

--- Removes the icons from the icon renderer and resets the internal references.
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:214
function gameplay_markers_bigmapMarker_C:clearObjects() end

--- Marks the marker invisible (the opacity fades out).
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:199
function gameplay_markers_bigmapMarker_C:hide() end

--- Initializes the id, the opacity smoother and visible = true, without creating an object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:29
function gameplay_markers_bigmapMarker_C:init() end

--- Does nothing (common marker interface).
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:208
---@param visible boolean Ignored.
function gameplay_markers_bigmapMarker_C:instantFade(visible) end

--- Sets the smoother's opacity to 1 immediately.
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:191
function gameplay_markers_bigmapMarker_C:setFullAlphaInstant() end

--- Does nothing (common marker interface).
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:196
---@param value boolean Ignored.
function gameplay_markers_bigmapMarker_C:setHidden(value) end

--- Associates the marker with a cluster: stores pos and cluster, adds the icon (cluster.icon) and the column in the gameplay_playmodeMarkers icon renderer, and resets the opacity to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:156
---@param cluster table Cluster from merge.
function gameplay_markers_bigmapMarker_C:setup(cluster) end

--- Marks the marker visible.
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:203
function gameplay_markers_bigmapMarker_C:show() end

--- Called every frame: smooths the opacity (fade in over 0.2 s when the big map is active and without transition), places the icon and column in front of the camera (or in orthographic projection), enlarges the icon to 1.5 if the cluster is hovered or selected.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/bigmapMarker.lua:77
---@param data table Frame data: dt, camPos, bigmapTransitionActive...
function gameplay_markers_bigmapMarker_C:update(data) end


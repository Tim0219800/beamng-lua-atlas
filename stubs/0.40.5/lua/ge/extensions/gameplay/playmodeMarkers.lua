---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/playmodeMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages game markers in freeroam/career (missions, parkings, zones, gas stations, etc.). It groups the raw POIs of gameplay_rawPois into clusters by marker type (factories in gameplay/markers/<type>.lua), creates a cluster's marker object on demand, and provides the two icon renderers (BeamNGWorldIconsRenderer) for the world and the big map. A 2D kd-tree is used to find the visible clusters around a position.
--- Access: extension `gameplay_playmodeMarkers`: `extensions.load("gameplay_playmodeMarkers")`, then the global `gameplay_playmodeMarkers`
---@class gameplay_playmodeMarkers
---@field dependencies string[] {'gameplay_rawPois'}, extension loaded beforehand.
---@field validPlaymodeMarkersStates table<string, boolean> Game states where markers are active: freeroam and career. Modifiable to add more.
gameplay_playmodeMarkers = {}

--- Clears the clusters, the kd-tree and deletes the created marker objects.
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:49
function gameplay_playmodeMarkers.clear() end

--- Id of the big map icon renderer 'bigmapIconRenderer' (created if needed).
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:102
---@return integer  Object id.
function gameplay_playmodeMarkers.getBigmapRendererId() end

--- Big map icon renderer object (created if needed).
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:106
---@return userdata|nil  Scene object.
function gameplay_playmodeMarkers.getBigmapRendererObj() end

--- Id of the BeamNGWorldIconsRenderer object 'markerIconRenderer' (created if needed).
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:94
---@return integer  Object id.
function gameplay_playmodeMarkers.getIconRendererId() end

--- World icon renderer object (created if needed).
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:98
---@return userdata|nil  Scene object.
function gameplay_playmodeMarkers.getIconRendererObj() end

--- Returns the cluster's marker object; creates it on the first call (cluster.create(), createObjects, setup).
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:178
---@param cluster table Cluster from getPlaymodeClusters.
---@return table  Marker object.
function gameplay_playmodeMarkers.getMarkerForCluster(cluster) end

--- List, sorted by id, of the marker clusters of the current level (computed then cached). Each cluster must have id, visibilityPos and visibilityRadius, otherwise an error is logged.
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:153
---@return table[]  Clusters.
function gameplay_playmodeMarkers.getPlaymodeClusters() end

--- 2D kd-tree (kdtreebox2d) of the clusters, indexed by a box enclosing visibilityPos ± visibilityRadius.
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:164
---@return table  Built kd-tree object.
function gameplay_playmodeMarkers.getPlaymodeClustersAsQuadtree() end

--- Indicates whether the current game state is in validPlaymodeMarkersStates.
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:196
---@return boolean  true if markers are allowed.
function gameplay_playmodeMarkers.isStateWithPlaymodeMarkers() end

--- Level end hook: clears clusters and markers, deletes the icon renderers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:205
function gameplay_playmodeMarkers.onClientEndMission() end

--- Level start hook: creates the two icon renderers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:79
function gameplay_playmodeMarkers.onClientStartMission() end

--- Hook before Lua reload: same cleanups as onClientEndMission.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/playmodeMarkers.lua:211
function gameplay_playmodeMarkers.onSerialize() end


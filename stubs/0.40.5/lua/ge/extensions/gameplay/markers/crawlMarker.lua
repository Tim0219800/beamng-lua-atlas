---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/crawlMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crawling zone marker (rock crawling) in play mode: a floating icon above a spherical zone. The player's vehicle entering the sphere (center of its bounding box within radius, 2 m by default) raises the icon and makes it interactive (list of activities to accept). The module returns {create, cluster}: cluster groups the crawlMarker POIs, create builds the marker object (class C).
--- Access: extension `gameplay_markers_crawlMarker`: `extensions.load("gameplay_markers_crawlMarker")`, then the global `gameplay_markers_crawlMarker`
---@class gameplay_markers_crawlMarker
gameplay_markers_crawlMarker = {}

--- Groups identical crawlMarker POIs (same pos and iconPos) into clusters and adds them to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:245
---@param pois table[] POIs with markerInfo.crawlMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_crawlMarker.cluster(pois, allClusters) end

--- Builds a crawling marker object (instance of C) and calls init.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:236
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_crawlMarker.create(...) end

--- Crawling zone marker with animated icon.
---@class gameplay_markers_crawlMarker_C
local gameplay_markers_crawlMarker_C = {}

--- Removes the icon from the icon renderer and clears triggerArea.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:145
function gameplay_markers_crawlMarker_C:clearObjects() end

--- Cleans up existing objects (does not create new ones).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:123
function gameplay_markers_crawlMarker_C:createObjects() end

--- Draws an axis-aligned box (semi-transparent edges and faces) via debugDrawer; debug utility.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:170
---@param corner vec3 Starting corner.
---@param x vec3 X edge vector.
---@param y vec3 Y edge vector.
---@param z vec3 Z edge vector.
---@param clr ColorI|nil Face color (default 128,64,64,32).
function gameplay_markers_crawlMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Draws a circle at the icon's position on the minimap (ui_apps_minimap_utils.simpleCircle).
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:228
---@param td table Minimap drawing data (unused).
function gameplay_markers_crawlMarker_C:drawOnMinimap(td) end

--- Becomes invisible and sets the icon opacity to 0.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:127
function gameplay_markers_crawlMarker_C:hide() end

--- Initializes visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:22
function gameplay_markers_crawlMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:166
---@param visible boolean Ignored.
function gameplay_markers_crawlMarker_C:instantFade(visible) end

--- If canInteract and the player is in the zone, adds the cluster's data (elemData) to the list of interactive elements.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:156
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_crawlMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Reads pos, rot, scl from the cluster and creates the icon (id <cluster.id>-gsIcon) with its smoothers; icon offset 0.5 m, lift 1.0 m.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:26
---@param cluster table Cluster from cluster().
function gameplay_markers_crawlMarker_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:140
function gameplay_markers_crawlMarker_C:show() end

--- Every frame: tests entry into the sphere, animates the icon's height and opacity, draws a line when the icon is raised, updates isInAreaChanged, anyOverlap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/crawlMarker.lua:65
---@param data table Frame data: veh, bbCenter, camPos, dt, bigMapActive.
function gameplay_markers_crawlMarker_C:update(data) end


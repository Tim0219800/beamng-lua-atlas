---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/missionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mission marker in play mode: an icon (exclamation mark by default) floating above a point, linked to the ground by a line, plus two ground decals (a dot and a ring). When the player approaches, the icon fades in; when their vehicle touches the marker's sphere (fixed radius 1.2 m), the ring lights up and the marker becomes interactive (list of the cluster's missions). Several nearby missions (less than 3 m) are merged into a single cluster with a numbered icon. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_missionMarker`: `extensions.load("gameplay_markers_missionMarker")`, then the global `gameplay_markers_missionMarker`
---@class gameplay_markers_missionMarker
gameplay_markers_missionMarker = {}

--- Groups overlapping missionMarker POIs (quadtree, radius 1.5 m) and adds one merged cluster per group to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:488
---@param pois table[] POIs with markerInfo.missionMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_missionMarker.cluster(pois, allClusters) end

--- Builds a mission marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:436
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_missionMarker.create(...) end

--- Mission marker with icon, line and decals.
---@class gameplay_markers_missionMarker_C
local gameplay_markers_missionMarker_C = {}

--- Frees the icon (Skia or icon renderer), removes the mesh if any and clears the references.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:387
function gameplay_markers_missionMarker_C:clearObjects() end

--- Creates and registers a TSStatic object with instance color; utility not used by default.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:318
---@param shapeName string Mesh path.
---@param objectName string Registration name of the object.
---@return userdata  Created TSStatic object.
function gameplay_markers_missionMarker_C:createObject(shapeName, objectName) end

--- Cleans up existing objects (the mesh creation is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:333
function gameplay_markers_missionMarker_C:createObjects() end

--- Draws a blue triangle marker on the minimap (GAMEPLAY_MARKERS layer).
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:428
---@param td table Minimap drawing object (triangleMarker).
---@param dpi number DPI factor.
function gameplay_markers_missionMarker_C:drawOnMinimap(td, dpi) end

--- Becomes invisible, resets the smoothers and makes the icon transparent immediately.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:345
function gameplay_markers_missionMarker_C:hide() end

--- Assigns an id, default radius 1.2 m and creates the smoothers; visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:61
function gameplay_markers_missionMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:380
---@param visible boolean Ignored.
function gameplay_markers_missionMarker_C:instantFade(visible) end

--- If canInteract and the vehicle touches the sphere, adds the data (elemData) of the cluster's missions to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:414
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_missionMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Tests whether the oriented bounding box of the player's vehicle overlaps the marker's sphere (overlapsOBB_Sphere).
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:86
---@param data table Frame data: veh, bbCenter, bbHalfAxis0..2.
---@return boolean  true if overlapping; false if no vehicle.
function gameplay_markers_missionMarker_C:playerIsInArea(data) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:383
---@param vis boolean Ignored.
---@param instant boolean Ignored.
function gameplay_markers_missionMarker_C:setVisibilityInBigmap(vis, instant) end

--- Stores pos and cluster, creates the icon (cluster.icon or poi_exclamationmark; or Skia icon), initializes the smoothers and creates groundDecalData (dot_128 dot and outline_512 ring).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:250
---@param cluster table Cluster from merge.
function gameplay_markers_missionMarker_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:375
function gameplay_markers_missionMarker_C:show() end

--- Every frame: computes distances, hides the icon behind geometry (ray), animates the icon's opacity and height, draws the line to the ground, drives the opacity of the ground dot and ring and updates isInAreaChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/missionMarker.lua:100
---@param data table Frame data: camPos, playerPosition, bigMapActive, globalAlpha, cruisingSpeedFactor, highestBBPointZ, isWalking, dt...
function gameplay_markers_missionMarker_C:update(data) end


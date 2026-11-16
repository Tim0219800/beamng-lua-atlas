---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/parkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parking spot marker in play mode (for example to deliver or drop off a vehicle): a striped decal on the ground, a 3D outline (park_outline_marker.dae) whose height and opacity depend on speed, and a floating icon (poi_parking_rect by default). The player's vehicle is "parked" when its bounding box overlaps (overlap mode) or is contained in (contained mode) the spot, within 15 m and below about 20 km/h; the marker then becomes interactive. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_parkingMarker`: `extensions.load("gameplay_markers_parkingMarker")`, then the global `gameplay_markers_parkingMarker`
---@class gameplay_markers_parkingMarker
gameplay_markers_parkingMarker = {}

--- Groups the parkingMarker POIs by identical path and adds one cluster per group to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:497
---@param pois table[] POIs with markerInfo.parkingMarker {path, pos, rot, scl, mode, icon, focus}.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_parkingMarker.cluster(pois, allClusters) end

--- Builds a parking spot marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:487
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_parkingMarker.create(...) end

--- Parking spot marker.
---@class gameplay_markers_parkingMarker_C
local gameplay_markers_parkingMarker_C = {}

--- Computes the player/camera distance to the spot and determines overlap (and parked) according to the mode, within 15 m and below the cruising speed; sets the distance to 0 if parked.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:257
---@param data table Frame data (see update).
function gameplay_markers_parkingMarker_C:checkParking(data) end

--- Removes the outline (notifies the editor if present) and the floating icon.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:329
function gameplay_markers_parkingMarker_C:clearObjects() end

--- Creates and registers a TSStatic with instance color (used for the outline).
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:288
---@param shapeName string Mesh path.
---@param objectName string Registration name.
---@return userdata  Created object.
function gameplay_markers_parkingMarker_C:createObject(shapeName, objectName) end

--- Cleans up existing objects (does not create new ones; the outline is created in setup).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:302
function gameplay_markers_parkingMarker_C:createObjects() end

--- Draws a debug box (edges and faces) via debugDrawer; not used here.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:430
---@param corner vec3 Starting corner.
---@param x vec3 X edge vector.
---@param y vec3 Y edge vector.
---@param z vec3 Z edge vector.
---@param clr any Face color (default color(128,64,64,32)).
function gameplay_markers_parkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Draws a blue circle at the spot's position on the minimap.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:368
---@param td table Drawing data (unused).
function gameplay_markers_parkingMarker_C:drawOnMinimap(td) end

--- Becomes invisible, makes the outline and the icon transparent.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:306
function gameplay_markers_parkingMarker_C:hide() end

--- Assigns a numId and creates the smoothers (icon position, cruising, opacity, distance, overlap); visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:26
function gameplay_markers_parkingMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:360
---@param visible boolean Ignored.
function gameplay_markers_parkingMarker_C:instantFade(visible) end

--- If canInteract and the vehicle is parked, adds the cluster's data (elemData) to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:352
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_parkingMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Reads pos, rot, scl, mode from the cluster, computes the half-axes of the test box, creates the outline object (TSStatic) positioned and scaled on the spot, the icon and the ground decal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:41
---@param cluster table Cluster from cluster().
function gameplay_markers_parkingMarker_C:setup(cluster) end

--- Becomes visible again and forces the outline update.
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:323
function gameplay_markers_parkingMarker_C:show() end

--- Every frame: calls checkParking, animates the icon's height and opacity, draws the line to the ground, adjusts the outline's height and opacity, updates isInAreaChanged and the decal's fade distance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/parkingMarker.lua:135
---@param data table Frame data: veh, bbCenter, bbHalfAxis0..2, camPos, camRot, playerPosition, isFreeCam, cruisingSpeedFactor, bigMapActive, highestBBPointZ, dt.
function gameplay_markers_parkingMarker_C:update(data) end


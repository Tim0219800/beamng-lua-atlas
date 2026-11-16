---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/walkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Doors" marker for the player on foot (building entrances, for example). Same principle as vehicleTrigger: each door is a pair of scene objects (zone, icon); the icon rises when the character enters the zone, an optional 3D screen is displayed for 5 s, and the marker becomes interactive. Unlike vehicleTrigger, the overlap is only tested if the player is walking (data.isWalking) and below the cruising speed. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_walkingMarker`: `extensions.load("gameplay_markers_walkingMarker")`, then the global `gameplay_markers_walkingMarker`
---@class gameplay_markers_walkingMarker
gameplay_markers_walkingMarker = {}

--- Groups the walkingMarker POIs with the same door names and adds one cluster per group to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:278
---@param pois table[] POIs with markerInfo.walkingMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_walkingMarker.cluster(pois, allClusters) end

--- Builds a doors marker for pedestrians (instance of C).
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:269
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_walkingMarker.create(...) end

--- Doors marker for the player on foot.
---@class gameplay_markers_walkingMarker_C
local gameplay_markers_walkingMarker_C = {}

--- Removes the icons, hides the screens and clears the door list.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:174
function gameplay_markers_walkingMarker_C:clearObjects() end

--- Cleans up existing objects (does not create any).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:147
function gameplay_markers_walkingMarker_C:createObjects() end

--- Draws a debug box (edges and faces) via debugDrawer; not used here.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:204
---@param corner vec3 Starting corner.
---@param x vec3 X edge vector.
---@param y vec3 Y edge vector.
---@param z vec3 Z edge vector.
---@param clr ColorI|nil Face color (default 128,64,64,32).
function gameplay_markers_walkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Draws a circle on the minimap at the position of each door icon.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:262
---@param td table Drawing data (unused).
function gameplay_markers_walkingMarker_C:drawOnMinimap(td) end

--- Becomes invisible, makes the icons transparent and hides the screens.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:151
function gameplay_markers_walkingMarker_C:hide() end

--- Initializes visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:21
function gameplay_markers_walkingMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:200
---@param visible boolean Ignored.
function gameplay_markers_walkingMarker_C:instantFade(visible) end

--- If canInteract and the player is in a door, adds the cluster's data (elemData) to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:190
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_walkingMarker_C:interactInPlayMode(interactData, interactableElements) end

--- For each door, finds the zone object and the icon object, computes the zone's box, hides the associated screen and creates the icon.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:25
---@param cluster table Cluster from cluster().
function gameplay_markers_walkingMarker_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:169
function gameplay_markers_walkingMarker_C:show() end

--- Every frame: tests, per door, the OBB/OBB overlap (only if the player is walking and below the cruising speed), handles screens, sound, icons and debug line, then updates isInAreaChanged and anyOverlap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/walkingMarker.lua:83
---@param data table Frame data: isWalking, cruisingSpeedFactor, bbCenter, bbHalfAxis0..2, camPos, bigMapActive, dt.
function gameplay_markers_walkingMarker_C:update(data) end


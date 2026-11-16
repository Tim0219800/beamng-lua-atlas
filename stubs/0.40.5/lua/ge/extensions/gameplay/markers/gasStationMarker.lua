---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/gasStationMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gas station marker (fuel or electric charging) in play mode. For each pump (pair of scene object names: zone, icon), it creates an icon (poi_fuel_round, or poi_charge_round for an electric station) that appears when the player's vehicle, driving slowly, overlaps the pump's zone (OBB/OBB test), and makes the station interactive. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_gasStationMarker`: `extensions.load("gameplay_markers_gasStationMarker")`, then the global `gameplay_markers_gasStationMarker`
---@class gameplay_markers_gasStationMarker
gameplay_markers_gasStationMarker = {}

--- Turns each gasStationMarker POI into a distinct cluster (no merging) and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:233
---@param pois table[] POIs with markerInfo.gasStationMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_gasStationMarker.cluster(pois, allClusters) end

--- Builds a gas station marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:224
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_gasStationMarker.create(...) end

--- Gas station marker with one icon per pump.
---@class gameplay_markers_gasStationMarker_C
local gameplay_markers_gasStationMarker_C = {}

--- Removes the icons from the icon renderer and clears the pump list.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:135
function gameplay_markers_gasStationMarker_C:clearObjects() end

--- Cleans up existing objects (does not create any).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:113
function gameplay_markers_gasStationMarker_C:createObjects() end

--- Draws a debug box (edges and faces) via debugDrawer.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:159
---@param corner vec3 Starting corner.
---@param x vec3 X edge vector.
---@param y vec3 Y edge vector.
---@param z vec3 Z edge vector.
---@param clr any Face color (default color(128,64,64,32)).
function gameplay_markers_gasStationMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Draws a circle on the minimap for each pump.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:218
---@param td table Drawing data (unused).
function gameplay_markers_gasStationMarker_C:drawOnMinimap(td) end

--- Becomes invisible and sets the opacity of all icons to 0.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:117
function gameplay_markers_gasStationMarker_C:hide() end

--- Initializes visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:19
function gameplay_markers_gasStationMarker_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:155
---@param visible boolean Ignored.
function gameplay_markers_gasStationMarker_C:instantFade(visible) end

--- If canInteract and the vehicle is on a pump, adds the cluster's data (elemData) to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:145
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_gasStationMarker_C:interactInPlayMode(interactData, interactableElements) end

--- For each pump, finds the scene objects (zone and icon), computes the zone's box (position, scaled axes) and creates the icon with initial opacity 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:23
---@param cluster table Cluster from cluster().
function gameplay_markers_gasStationMarker_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:130
function gameplay_markers_gasStationMarker_C:show() end

--- Every frame: tests the OBB/OBB overlap between the vehicle and each pump, raises the icon by 0.25 m and adjusts its opacity (visible if no obstacle), updates isInAreaChanged and anyOverlap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/gasStationMarker.lua:79
---@param data table Frame data: veh, bbCenter, bbHalfAxis0..2, camPos, dt, cruisingSpeedFactor.
function gameplay_markers_gasStationMarker_C:update(data) end


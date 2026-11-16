---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Inspect a vehicle" marker in play mode (for example a vehicle to examine at a dealer): a floating icon (poi_parking_rect by default) linked to the ground by a line, which rises above the player's vehicle when it is within the radius. In the zone, the marker makes its POI interactive (the POI's data). A "focus" version stays visible from afar with a small bounce. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_inspectVehicleMarker`: `extensions.load("gameplay_markers_inspectVehicleMarker")`, then the global `gameplay_markers_inspectVehicleMarker`
---@class gameplay_markers_inspectVehicleMarker
gameplay_markers_inspectVehicleMarker = {}

--- Turns each inspectVehicleMarker POI into a distinct cluster and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:248
---@param pois table[] POIs with markerInfo.inspectVehicleMarker.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters) end

--- Builds a vehicle inspection marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:239
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_inspectVehicleMarker.create(...) end

--- Vehicle inspection marker with animated icon.
---@class gameplay_markers_inspectVehicleMarker_C
local gameplay_markers_inspectVehicleMarker_C = {}

--- Removes the icon from the icon renderer.
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:42
function gameplay_markers_inspectVehicleMarker_C:clearObjects() end

--- Cleans up existing objects (does not create any).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:38
function gameplay_markers_inspectVehicleMarker_C:createObjects() end

--- Becomes invisible and sets the icon opacity to 0.
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:52
function gameplay_markers_inspectVehicleMarker_C:hide() end

--- Assigns an id and creates the smoothers (position, cruising, opacity, distance); visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:26
function gameplay_markers_inspectVehicleMarker_C:init() end

--- If canInteract and the player is in the zone, adds cluster.data to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:231
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_inspectVehicleMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Stores cluster, pos, radius, focus, resets the smoothers and creates the icon with initial opacity 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:202
---@param cluster table Cluster from cluster().
function gameplay_markers_inspectVehicleMarker_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:63
function gameplay_markers_inspectVehicleMarker_C:show() end

--- Every frame: computes the distance, animates the icon's height (above the player's vehicle if it is inside), handles perspective in focus mode, adjusts size and opacity, draws the line to the ground (debugDrawer) and updates _inside and isInAreaChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:86
---@param data table Frame data: isFreeCam, camPos, camRot, playerPosition, highestBBPointZ, cruisingSpeedFactor, bigMapActive, dt.
function gameplay_markers_inspectVehicleMarker_C:update(data) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/vehicleTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Doors" marker for vehicles (for example the entrance of a garage or workshop) in play mode. Each door is a pair of scene objects (zone, icon): when the bounding box of the player's vehicle overlaps a zone, the icon rises slightly, an optional 3D screen is displayed for 5 s with a career computer sound, and the marker becomes interactive. The module returns {create, cluster}.
--- Access: extension `gameplay_markers_vehicleTrigger`: `extensions.load("gameplay_markers_vehicleTrigger")`, then the global `gameplay_markers_vehicleTrigger`
---@class gameplay_markers_vehicleTrigger
gameplay_markers_vehicleTrigger = {}

--- Turns each vehicleTrigger POI into a distinct cluster and adds it to allClusters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:216
---@param pois table[] POIs with markerInfo.vehicleTrigger.
---@param allClusters table[] List of clusters completed in place.
function gameplay_markers_vehicleTrigger.cluster(pois, allClusters) end

--- Builds a doors marker (instance of C).
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:208
---@param ... any Arguments passed to C:init (unused).
---@return table  Marker instance.
function gameplay_markers_vehicleTrigger.create(...) end

--- Doors marker for vehicles.
---@class gameplay_markers_vehicleTrigger_C
local gameplay_markers_vehicleTrigger_C = {}

--- Removes the icons, hides the screens and clears the door list.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:171
function gameplay_markers_vehicleTrigger_C:clearObjects() end

--- Cleans up existing objects (does not create any).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:144
function gameplay_markers_vehicleTrigger_C:createObjects() end

--- Draws a circle on the minimap at the position of each door icon.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:202
---@param td table Drawing data (unused).
function gameplay_markers_vehicleTrigger_C:drawOnMinimap(td) end

--- Becomes invisible, makes the icons transparent and hides the screens.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:148
function gameplay_markers_vehicleTrigger_C:hide() end

--- Initializes visible = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:19
function gameplay_markers_vehicleTrigger_C:init() end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:195
---@param visible boolean Ignored.
function gameplay_markers_vehicleTrigger_C:instantFade(visible) end

--- If canInteract and a door overlaps the vehicle, adds the cluster's data (elemData) to the interactive elements.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:187
---@param interactData table Frame data with canInteract.
---@param interactableElements table[] List completed in place.
function gameplay_markers_vehicleTrigger_C:interactInPlayMode(interactData, interactableElements) end

--- Does nothing.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:198
---@param value boolean Ignored.
function gameplay_markers_vehicleTrigger_C:setHidden(value) end

--- For each door, finds the zone object and the icon object in the scene, computes the zone's box, hides the associated screen and creates the icon (id <cluster.id>-vtIcon-<idx>).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:23
---@param cluster table Cluster from cluster().
function gameplay_markers_vehicleTrigger_C:setup(cluster) end

--- Becomes visible again.
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:166
function gameplay_markers_vehicleTrigger_C:show() end

--- Every frame: tests the OBB/OBB overlap with the vehicle, handles the timer and the display of screens, animates the icons' height and opacity, draws a line, updates isInAreaChanged and anyOverlap.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markers/vehicleTrigger.lua:79
---@param data table Frame data: veh, bbCenter, bbHalfAxis0..2, camPos, bigMapActive, dt.
function gameplay_markers_vehicleTrigger_C:update(data) end


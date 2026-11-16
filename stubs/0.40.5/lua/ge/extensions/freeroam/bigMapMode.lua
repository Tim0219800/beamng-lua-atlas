---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The game's "big map" mode: opens and closes the top-down level map with a camera transition, switches to the 'bigMap' camera, pauses the game (pushPauseRequest 'bigMap'), temporarily changes fog, clouds, time of day, view distance and depth of field, displays the POI markers (via freeroam_bigMapMarkers), handles POI selection/hover, route computation and preview (core_groundMarkers), quick teleport to a POI and keyboard/gamepad controls. The big map's Vue UI calls it for selection (selectPoi, poiHovered...). A modder uses it to open the map (enterBigMap, enterBigMapWithCustomPOIs), pick a POI or set a destination (setNavFocus).
--- Access: extension `freeroam_bigMapMode`: `extensions.load("freeroam_bigMapMode")`, then the global `freeroam_bigMapMode`
---@class freeroam_bigMapMode
---@field clusterMergeRadius number Grouping radius of the POI markers in meters (10 initially; recomputed by updateMergeRadius).
---@field dependencies string[] gameplay_rawPois, core_groundMarkers, core_camera, core_terrain, freeroam_bigMapMarkers, ui_pause_camera.
---@field hoveredListItem string|nil Id of the POI hovered in the UI list (set by poiHovered).
---@field hoveredPoiId string|nil Id of the POI hovered on the map (updated during onUpdate).
---@field selectedPoiId string|nil Id of the selected POI (selectPoi/deselect).
freeroam_bigMapMode = {}

--- Tells whether the big map is open.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1223
---@return boolean  true if open.
function freeroam_bigMapMode.bigMapActive() end

--- Moves the map camera with a gamepad stick (value squared with the sign kept). A movement > 0.01 gives focus back to the map and sends BigmapCameraMove to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1648
---@param upDown boolean true = forward/backward, false = left/right.
---@param value number Axis value (-1 to 1).
function freeroam_bigMapMode.camMoveController(upDown, value) end

--- Moves the map camera with the directional keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1668
---@param value number Key value (1 pressed, 0 released).
---@param direction integer 1 forward, 2 backward, 3 left, any other value = right.
function freeroam_bigMapMode.camMoveKey(value, direction) end

--- Removes the route preview drawn on the map.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1437
function freeroam_bigMapMode.clearRoutePreview() end

--- Gamepad zoom: passes the value directly to core_camera.cameraZoom (the zoomIn parameter is ignored).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1293
---@param value number Zoom value.
---@param zoomIn boolean Not used.
function freeroam_bigMapMode.controllerZoom(value, zoomIn) end

--- Deselects the current POI: sends an empty onReducedPoiList to the UI, emits onPoiSelectedFromBigmap(nil), clears the route preview and calls the selection callback with nil.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1492
function freeroam_bigMapMode.deselect() end

--- Enables or disables the map controls: pushes/removes the "BigMap" action map and blocks/unblocks the game actions of the blockedInputActions list as well as the UI actions.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:889
---@param enable boolean true to enable the map controls.
function freeroam_bigMapMode.enableBigMapControls(enable) end

--- Opens the big map. Does nothing if a mission task is starting/stopping, if the map is already open or opening, or if no level is loaded. See the notes for the options.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1102
---@param options table|nil Options: instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode, suppressUI (used by enterBigMapWithCustomPOIs).
function freeroam_bigMapMode.enterBigMap(options) end

--- Opens the big map showing only the given POIs; the callback is called with the selected POI's id (or nil on deselection). With options.suppressUI, the callback is replaced by nop (no selection UI).
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1854
---@param poiIds string[] POI ids to display.
---@param callback function|nil Called with the selected id or nil.
---@param options table|nil Same options as enterBigMap, plus suppressUI.
function freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options) end

--- Closes the big map, with a camera transition except in instant mode, with the ortho camera, in VR or if the free camera was active. Restores the environment and the camera, stops the ambient sound and clears the icons.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1172
---@param instant boolean|nil true to close without a transition.
---@param closeEscMenu boolean|nil true to navigate to the UI route 'play'.
---@param forceGameCam boolean|nil true to go back to the orbit camera if the player was in free camera.
function freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam) end

--- Frames the map camera on the active route (pan + zoom so the trip fits on screen outside the sidebar and info bar). Does nothing with the ortho camera, if the map is closed, with no route, or during an automatic POI selection.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:812
---@param sidebarFraction number Fraction of the screen taken up by the sidebar (0 to 1).
---@param infobarFraction number Fraction of the screen taken up by the info bar (0 to 1).
function freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction) end

--- Returns then clears the id requested by enterBigMap({autoSelectPoiId = ...}) so that the Vue UI selects it once mounted (avoids a race on mounting).
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1589
---@return string|nil  Pending POI id, nil if none.
function freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId() end

--- Window height in pixels, read when the map opens (1080 by default).
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1803
---@return integer  Vertical resolution.
function freeroam_bigMapMode.getVerticalResolution() end

--- Tells whether an opening or closing transition is in progress.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1227
---@return boolean  true during the transition (internally 1 = to the map, 2 = from the map).
function freeroam_bigMapMode.isTransitionActive() end

--- Tells whether the orthographic camera is used (constant, false in this version).
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1863
---@return boolean  false.
function freeroam_bigMapMode.isUsingOrthoCamera() end

--- Sets the navigation destination to the given POI (searches first in the playmodeMarkers clusters, then in the raw POIs with bigmapMarker, possibly via customNavigationFunction) and emits onNavigateToMission. If nothing is found or with nil, clears the navigation. Does nothing during a career test drive.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1509
---@param poiId string|nil Target POI id; nil to cancel the navigation.
---@return table|nil  Marker found in the playmodeMarkers clusters, otherwise nil (see notes).
function freeroam_bigMapMode.navigateToMission(poiId) end

--- Hook called before the camera renders: positions the gamepad reticle and navigation marker icons according to the map camera. Does nothing if the map is closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1301
---@param camData table Camera data (camData.res.pos, rot, fov).
function freeroam_bigMapMode.onCameraPreRender(camData) end

--- Hook called by the filter change input action: with hysteresis (triggers above 0.65, rearms below 0.35) sends onChangeBigmapFilterIndex with {change = dir} to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1842
---@param value number Analog input value.
---@param dir integer Change direction (e.g. -1 or 1, inferred from code).
function freeroam_bigMapMode.onChangeUiFilter(value, dir) end

--- Hook called at the end of the level: clears the border cylinder cache, deselects and removes the ambient sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1824
---@param levelPath string Path of the level being left (unused).
function freeroam_bigMapMode.onClientEndMission(levelPath) end

--- Hook called when the level starts: disables map mode and creates the ambient sound source (event:>UI>Bigmap>Ambience).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1807
---@param levelPath string Level path (unused).
function freeroam_bigMapMode.onClientStartMission(levelPath) end

--- Hook called when the player presses "select" on the gamepad: simulates a click on the map if the mouse has not moved and the UI does not have focus.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1742
function freeroam_bigMapMode.onControllerSelect() end

--- Hook called after an extension reload: reopens the map (if it was open) and restores the navigation destination (outside career), after a 0.1 s delay in a job.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1778
---@param v table onSerialize data: bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData.
function freeroam_bigMapMode.onDeserialized(v) end

--- Hook called on unload: removes the ambient sound source.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1830
function freeroam_bigMapMode.onExtensionUnloaded() end

--- Hook called when the player navigates the menus: gives focus back to the UI (setUiNavigationActive(true)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1583
function freeroam_bigMapMode.onMenuItemNavigation() end

--- Hook called on mouse clicks on the map: on release without a drag, handles a click (POI selection, destination, deselection) then forwards the event to the map camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1731
---@param buttonDown boolean true on press, false on release.
function freeroam_bigMapMode.onMouseButton(buttonDown) end

--- Hook called when the navigation graph is reloaded: closes and reopens the map instantly if it is open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1834
function freeroam_bigMapMode.onNavgraphReloaded() end

--- Hook called when the vehicle reaches the destination: clears the navigation (setNavFocus(nil)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:413
function freeroam_bigMapMode.onReachedTargetPos() end

--- Hook called before an extension reload: closes the map if open (instantly), empties the cylinder cache and returns the state to restore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1762
---@return table  {bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData}
function freeroam_bigMapMode.onSerialize() end

--- Smoothly moves the camera to center a POI, without changing the selection or the navigation. Applies the autoSelectZoomFactor zoom only once if it was requested at opening.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1543
---@param poiId string POI id; empty values, 'null' and 'undefined' are ignored.
function freeroam_bigMapMode.panToPoi(poiId) end

--- Called by the UI when a POI in the list is hovered: shows the mission's route preview (if it is a mission) or restores the one for the selected POI.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1478
---@param poiIdInCluster string POI id.
---@param hovered boolean true on hover, false on exit.
function freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered) end

--- Recomputes the displayed simplified path from core_groundMarkers (or hides the navigation marker if there is no target anymore) and restarts the route animation.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:384
function freeroam_bigMapMode.resetRoute() end

--- Called by the UI: selects a POI (mission route preview, onPoiSelectedFromBigmap hook, selection callback). An empty value, 'null' or 'undefined' is equivalent to deselect().
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1596
---@param poiIdInCluster string|nil POI id.
function freeroam_bigMapMode.selectPoi(poiIdInCluster) end

--- Empty function, reserved for UI tests.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1868
---@param windowSize any Not used.
---@param mapSize any Not used.
function freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize) end

--- Sets (or clears with nil) the map's navigation destination via core_groundMarkers.setPath, with the path cleared on arrival. First emits the onSetBigmapNavFocus(pos) hook. Without a player vehicle, the position is ignored.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:396
---@param pos vec3|nil Destination in the world; nil to cancel.
---@param options table|nil options.async = true computes the path asynchronously (resetRoute at the end).
function freeroam_bigMapMode.setNavFocus(pos, options) end

--- Restricts the display to the POIs in the list: stores the list, recomputes the merge radius with factor 1 and reconfigures the freeroam_bigMapMarkers filter.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:357
---@param list string[]|nil Visible POI ids (empty list if nil).
function freeroam_bigMapMode.setOnlyIdsVisible(list) end

--- Shows a route preview on the map from an unsimplified path (list of points with .pos); nil clears it.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1439
---@param unsimplifiedRoute table|nil Path from a route planner.
function freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute) end

--- Computes a route in the world between two positions (gameplay/route/route) and shows it as a preview.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1447
---@param from vec3 Start.
---@param to vec3 End.
function freeroam_bigMapMode.setRoutePreviewSimple(from, to) end

--- Gives or removes focus from the UI (blocks or unblocks the UI actions). Does nothing if the map is closed.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1574
---@param active boolean true if the UI should have focus.
function freeroam_bigMapMode.setUiNavigationActive(active) end

--- Teleports the player's vehicle to a POI (via the quickTravelPosRotFunction of its bigmapMarker), closes the map (exitBigMap(false, true, true)), recenters the camera and emits teleportedFromBigmap. Also marks the cluster as the target (onNavigateToMission hook). In career, the teleport is "safe" without resetBrokenFlexMesh.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1625
---@param poiId string Target POI id.
function freeroam_bigMapMode.teleportToPoi(poiId) end

--- Opens or closes the map (map key input action): ends a transition in progress, refuses to open from a UI route other than play/pause, during a mission step or during a protected UI navigation. With taxi or delivery active, opens the corresponding dialog instead of the map.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1233
function freeroam_bigMapMode.toggleBigMap() end

--- Recomputes the markers' merge radius between a minimum and a maximum proportional to the camera height and the field of view, then reconfigures the marker filter.
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1749
---@param factor number Interpolation factor from 0 (minimum radius) to 1 (maximum).
function freeroam_bigMapMode.updateMergeRadius(factor) end

--- Map camera zoom (calls camMode:zoom).
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1275
---@param value number Zoom value.
function freeroam_bigMapMode.zoom(value) end

--- Zoom by keys: stores the zoom-in (negative) and zoom-out values separately, then sends their sum to core_camera.cameraZoom.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/bigMapMode.lua:1284
---@param value number Key value.
---@param zoomIn boolean true for zoom in, false for zoom out.
function freeroam_bigMapMode.zoomInOut(value, zoomIn) end


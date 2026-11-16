# `freeroam_bigMapMode`

*File: `lua/ge/extensions/freeroam/bigMapMode.lua` · VM: Game Engine (GE) · 1915 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `freeroam_bigMapMode`: `extensions.load("freeroam_bigMapMode")`, then the global `freeroam_bigMapMode`

The game's "big map" mode: opens and closes the top-down level map with a camera transition, switches to the 'bigMap' camera, pauses the game (pushPauseRequest 'bigMap'), temporarily changes fog, clouds, time of day, view distance and depth of field, displays the POI markers (via freeroam_bigMapMarkers), handles POI selection/hover, route computation and preview (core_groundMarkers), quick teleport to a POI and keyboard/gamepad controls. The big map's Vue UI calls it for selection (selectPoi, poiHovered...). A modder uses it to open the map (enterBigMap, enterBigMapWithCustomPOIs), pick a POI or set a destination (setNavFocus).

## Example

```lua
-- open the big map with only two POIs, and receive the player's choice
freeroam_bigMapMode.enterBigMapWithCustomPOIs({'poiA', 'poiB'}, function(poiId)
  log('I', 'mod', 'POI chosen: ' .. tostring(poiId))
end, {instant = true})
-- close
freeroam_bigMapMode.exitBigMap(true, true)
```

## Notes

- Internal constants: useVueBigMap = true, useOrthoCamera = false ('bigMap' camera and not 'bigMapOrtho'), minimum zoom 20000 (factor), route simplification 200, framing padding 1.35.
- M.onUpdate only exists while the big map is active (setActive adds/removes it then calls extensions.hookUpdate('onUpdate')): onUpdate is therefore not called when the map is closed.
- During opening, the previous values (fog, clouds, time of day, view distance, UI, depth of field, camera, free camera) are stored then restored by deactivateBigMapCallback.
- The input actions in the blockedInputActions list (gameCam, freeCam, pause, photoMode, aiControls, resetPhysics, miniMap...) are blocked while the map is open.
- Hook order on opening: onBeforeBigMapActivated, (transition: onBigmapStartTransition), onActivateBigMapCallback + UI bigmapTransitionFinished, onBigMapActivated. On closing: onDeactivateBigMapCallback.
- enterBigMap options: instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode. An already defined route or the ortho/VR camera forces instant.
- The markers' merge radii (clusterMergeRadius) are recomputed by updateMergeRadius according to the camera height and the field of view.
- Bug: in enterBigMap, `options.instant = true` is executed before `options = options or {}`; if the pause camera was active and options is nil, Lua error.
- Bug: navigateToMission returns `marker` in the loop over the raw POIs while this variable is not defined in that scope (it is nil; undeclared global).
- setBigmapScreenBounds is an empty function ("testing for UI"). getAndClearPendingAutoSelectPoiId exists to avoid a race with the UI mounting.
- navigateToMission(nil) clears the navigation (triggers onNavigateToMission with nil); used by clickOnMap to remove the route.

**Dependencies (loaded first):** `gameplay_rawPois`, `core_groundMarkers`, `core_camera`, `core_terrain`, `freeroam_bigMapMarkers`, `ui_pause_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `freeroam_bigMapMode.bigMapActive()` | Tells whether the big map is open. | 1223 |
| `freeroam_bigMapMode.camMoveController(upDown, value)` | Moves the map camera with a gamepad stick (value squared with the sign kept). A movement > 0.01 gives focus back to the map and sends BigmapCameraMove to the UI. *(internal)* | 1648 |
| `freeroam_bigMapMode.camMoveKey(value, direction)` | Moves the map camera with the directional keys. *(internal)* | 1668 |
| `freeroam_bigMapMode.clearRoutePreview()` | Removes the route preview drawn on the map. | 1437 |
| `freeroam_bigMapMode.controllerZoom(value, zoomIn)` | Gamepad zoom: passes the value directly to core_camera.cameraZoom (the zoomIn parameter is ignored). *(internal)* | 1293 |
| `freeroam_bigMapMode.deselect()` | Deselects the current POI: sends an empty onReducedPoiList to the UI, emits onPoiSelectedFromBigmap(nil), clears the route preview and calls the selection callback with nil. | 1492 |
| `freeroam_bigMapMode.enableBigMapControls(enable)` | Enables or disables the map controls: pushes/removes the "BigMap" action map and blocks/unblocks the game actions of the blockedInputActions list as well as the UI actions. | 889 |
| `freeroam_bigMapMode.enterBigMap(options)` | Opens the big map. Does nothing if a mission task is starting/stopping, if the map is already open or opening, or if no level is loaded. See the notes for the options. | 1102 |
| `freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options)` | Opens the big map showing only the given POIs; the callback is called with the selected POI's id (or nil on deselection). With options.suppressUI, the callback is replaced by nop (no selection UI). | 1854 |
| `freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam)` | Closes the big map, with a camera transition except in instant mode, with the ortho camera, in VR or if the free camera was active. Restores the environment and the camera, stops the ambient sound and clears the icons. | 1172 |
| `freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction)` | Frames the map camera on the active route (pan + zoom so the trip fits on screen outside the sidebar and info bar). Does nothing with the ortho camera, if the map is closed, with no route, or during an automatic POI selection. | 812 |
| `freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId()` | Returns then clears the id requested by enterBigMap({autoSelectPoiId = ...}) so that the Vue UI selects it once mounted (avoids a race on mounting). | 1589 |
| `freeroam_bigMapMode.getVerticalResolution()` | Window height in pixels, read when the map opens (1080 by default). | 1803 |
| `freeroam_bigMapMode.isTransitionActive()` | Tells whether an opening or closing transition is in progress. | 1227 |
| `freeroam_bigMapMode.isUsingOrthoCamera()` | Tells whether the orthographic camera is used (constant, false in this version). | 1863 |
| `freeroam_bigMapMode.navigateToMission(poiId)` | Sets the navigation destination to the given POI (searches first in the playmodeMarkers clusters, then in the raw POIs with bigmapMarker, possibly via customNavigationFunction) and emits onNavigateToMission. If nothing is found or with nil, clears the navigation. Does nothing during a career test drive. | 1509 |
| `freeroam_bigMapMode.onCameraPreRender(camData)` | Hook called before the camera renders: positions the gamepad reticle and navigation marker icons according to the map camera. Does nothing if the map is closed. *(internal)* *(hook)* | 1301 |
| `freeroam_bigMapMode.onChangeUiFilter(value, dir)` | Hook called by the filter change input action: with hysteresis (triggers above 0.65, rearms below 0.35) sends onChangeBigmapFilterIndex with {change = dir} to the UI. *(internal)* *(hook)* | 1842 |
| `freeroam_bigMapMode.onClientEndMission(levelPath)` | Hook called at the end of the level: clears the border cylinder cache, deselects and removes the ambient sound. *(internal)* *(hook)* | 1824 |
| `freeroam_bigMapMode.onClientStartMission(levelPath)` | Hook called when the level starts: disables map mode and creates the ambient sound source (event:>UI>Bigmap>Ambience). *(internal)* *(hook)* | 1807 |
| `freeroam_bigMapMode.onControllerSelect()` | Hook called when the player presses "select" on the gamepad: simulates a click on the map if the mouse has not moved and the UI does not have focus. *(internal)* *(hook)* | 1742 |
| `freeroam_bigMapMode.onDeserialized(v)` | Hook called after an extension reload: reopens the map (if it was open) and restores the navigation destination (outside career), after a 0.1 s delay in a job. *(internal)* *(hook)* | 1778 |
| `freeroam_bigMapMode.onExtensionUnloaded()` | Hook called on unload: removes the ambient sound source. *(internal)* *(hook)* | 1830 |
| `freeroam_bigMapMode.onMenuItemNavigation()` | Hook called when the player navigates the menus: gives focus back to the UI (setUiNavigationActive(true)). *(internal)* *(hook)* | 1583 |
| `freeroam_bigMapMode.onMouseButton(buttonDown)` | Hook called on mouse clicks on the map: on release without a drag, handles a click (POI selection, destination, deselection) then forwards the event to the map camera. *(internal)* *(hook)* | 1731 |
| `freeroam_bigMapMode.onNavgraphReloaded()` | Hook called when the navigation graph is reloaded: closes and reopens the map instantly if it is open. *(internal)* *(hook)* | 1834 |
| `freeroam_bigMapMode.onReachedTargetPos()` | Hook called when the vehicle reaches the destination: clears the navigation (setNavFocus(nil)). *(internal)* *(hook)* | 413 |
| `freeroam_bigMapMode.onSerialize()` | Hook called before an extension reload: closes the map if open (instantly), empties the cylinder cache and returns the state to restore. *(internal)* *(hook)* | 1762 |
| `freeroam_bigMapMode.panToPoi(poiId)` | Smoothly moves the camera to center a POI, without changing the selection or the navigation. Applies the autoSelectZoomFactor zoom only once if it was requested at opening. | 1543 |
| `freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered)` | Called by the UI when a POI in the list is hovered: shows the mission's route preview (if it is a mission) or restores the one for the selected POI. | 1478 |
| `freeroam_bigMapMode.resetRoute()` | Recomputes the displayed simplified path from core_groundMarkers (or hides the navigation marker if there is no target anymore) and restarts the route animation. | 384 |
| `freeroam_bigMapMode.selectPoi(poiIdInCluster)` | Called by the UI: selects a POI (mission route preview, onPoiSelectedFromBigmap hook, selection callback). An empty value, 'null' or 'undefined' is equivalent to deselect(). | 1596 |
| `freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize)` | Empty function, reserved for UI tests. *(internal)* | 1868 |
| `freeroam_bigMapMode.setNavFocus(pos, options)` | Sets (or clears with nil) the map's navigation destination via core_groundMarkers.setPath, with the path cleared on arrival. First emits the onSetBigmapNavFocus(pos) hook. Without a player vehicle, the position is ignored. | 396 |
| `freeroam_bigMapMode.setOnlyIdsVisible(list)` | Restricts the display to the POIs in the list: stores the list, recomputes the merge radius with factor 1 and reconfigures the freeroam_bigMapMarkers filter. | 357 |
| `freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute)` | Shows a route preview on the map from an unsimplified path (list of points with .pos); nil clears it. | 1439 |
| `freeroam_bigMapMode.setRoutePreviewSimple(from, to)` | Computes a route in the world between two positions (gameplay/route/route) and shows it as a preview. | 1447 |
| `freeroam_bigMapMode.setUiNavigationActive(active)` | Gives or removes focus from the UI (blocks or unblocks the UI actions). Does nothing if the map is closed. | 1574 |
| `freeroam_bigMapMode.teleportToPoi(poiId)` | Teleports the player's vehicle to a POI (via the quickTravelPosRotFunction of its bigmapMarker), closes the map (exitBigMap(false, true, true)), recenters the camera and emits teleportedFromBigmap. Also marks the cluster as the target (onNavigateToMission hook). In career, the teleport is "safe" without resetBrokenFlexMesh. | 1625 |
| `freeroam_bigMapMode.toggleBigMap()` | Opens or closes the map (map key input action): ends a transition in progress, refuses to open from a UI route other than play/pause, during a mission step or during a protected UI navigation. With taxi or delivery active, opens the corresponding dialog instead of the map. | 1233 |
| `freeroam_bigMapMode.updateMergeRadius(factor)` | Recomputes the markers' merge radius between a minimum and a maximum proportional to the camera height and the field of view, then reconfigures the marker filter. | 1749 |
| `freeroam_bigMapMode.zoom(value)` | Map camera zoom (calls camMode:zoom). | 1275 |
| `freeroam_bigMapMode.zoomInOut(value, zoomIn)` | Zoom by keys: stores the zoom-in (negative) and zoom-out values separately, then sends their sum to core_camera.cameraZoom. *(internal)* | 1284 |

### Parameter details

#### `freeroam_bigMapMode.bigMapActive()`

Tells whether the big map is open.

- **returns**: boolean true if open.

#### `freeroam_bigMapMode.camMoveController(upDown, value)`

Moves the map camera with a gamepad stick (value squared with the sign kept). A movement > 0.01 gives focus back to the map and sends BigmapCameraMove to the UI.

- `upDown` (*boolean*) : true = forward/backward, false = left/right.
- `value` (*number*) : Axis value (-1 to 1).

#### `freeroam_bigMapMode.camMoveKey(value, direction)`

Moves the map camera with the directional keys.

- `value` (*number*) : Key value (1 pressed, 0 released).
- `direction` (*integer*) : 1 forward, 2 backward, 3 left, any other value = right.

#### `freeroam_bigMapMode.controllerZoom(value, zoomIn)`

Gamepad zoom: passes the value directly to core_camera.cameraZoom (the zoomIn parameter is ignored).

- `value` (*number*) : Zoom value.
- `zoomIn` (*boolean*) : Not used.

#### `freeroam_bigMapMode.enableBigMapControls(enable)`

Enables or disables the map controls: pushes/removes the "BigMap" action map and blocks/unblocks the game actions of the blockedInputActions list as well as the UI actions.

- `enable` (*boolean*) : true to enable the map controls.

#### `freeroam_bigMapMode.enterBigMap(options)`

Opens the big map. Does nothing if a mission task is starting/stopping, if the map is already open or opening, or if no level is loaded. See the notes for the options.

- `options` (*table|nil*) : Options: instant, missionId, autoSelectPoiId, autoSelectZoomFactor, cameraAdditionalHeightFactor, horizontalOffsetFactor, verticalOffsetFactor, navigationBoundariesFactor, uiOwnsFocus, ignoreUiStateChange, ignoreActionMaps, routeTarget, routeParams, mode, suppressUI (used by enterBigMapWithCustomPOIs).

#### `freeroam_bigMapMode.enterBigMapWithCustomPOIs(poiIds, callback, options)`

Opens the big map showing only the given POIs; the callback is called with the selected POI's id (or nil on deselection). With options.suppressUI, the callback is replaced by nop (no selection UI).

- `poiIds` (*string[]*) : POI ids to display.
- `callback` (*function|nil*) : Called with the selected id or nil.
- `options` (*table|nil*) : Same options as enterBigMap, plus suppressUI.

#### `freeroam_bigMapMode.exitBigMap(instant, closeEscMenu, forceGameCam)`

Closes the big map, with a camera transition except in instant mode, with the ortho camera, in VR or if the free camera was active. Restores the environment and the camera, stops the ambient sound and clears the icons.

- `instant` (*boolean|nil*) : true to close without a transition.
- `closeEscMenu` (*boolean|nil*) : true to navigate to the UI route 'play'.
- `forceGameCam` (*boolean|nil*) : true to go back to the orbit camera if the player was in free camera.

#### `freeroam_bigMapMode.frameActiveRoute(sidebarFraction, infobarFraction)`

Frames the map camera on the active route (pan + zoom so the trip fits on screen outside the sidebar and info bar). Does nothing with the ortho camera, if the map is closed, with no route, or during an automatic POI selection.

- `sidebarFraction` (*number*) : Fraction of the screen taken up by the sidebar (0 to 1).
- `infobarFraction` (*number*) : Fraction of the screen taken up by the info bar (0 to 1).

#### `freeroam_bigMapMode.getAndClearPendingAutoSelectPoiId()`

Returns then clears the id requested by enterBigMap({autoSelectPoiId = ...}) so that the Vue UI selects it once mounted (avoids a race on mounting).

- **returns**: string|nil Pending POI id, nil if none.

#### `freeroam_bigMapMode.getVerticalResolution()`

Window height in pixels, read when the map opens (1080 by default).

- **returns**: integer Vertical resolution.

#### `freeroam_bigMapMode.isTransitionActive()`

Tells whether an opening or closing transition is in progress.

- **returns**: boolean true during the transition (internally 1 = to the map, 2 = from the map).

#### `freeroam_bigMapMode.isUsingOrthoCamera()`

Tells whether the orthographic camera is used (constant, false in this version).

- **returns**: boolean false.

#### `freeroam_bigMapMode.navigateToMission(poiId)`

Sets the navigation destination to the given POI (searches first in the playmodeMarkers clusters, then in the raw POIs with bigmapMarker, possibly via customNavigationFunction) and emits onNavigateToMission. If nothing is found or with nil, clears the navigation. Does nothing during a career test drive.

- `poiId` (*string|nil*) : Target POI id; nil to cancel the navigation.
- **returns**: table|nil Marker found in the playmodeMarkers clusters, otherwise nil (see notes).

#### `freeroam_bigMapMode.onCameraPreRender(camData)`

Hook called before the camera renders: positions the gamepad reticle and navigation marker icons according to the map camera. Does nothing if the map is closed.

- `camData` (*table*) : Camera data (camData.res.pos, rot, fov).

#### `freeroam_bigMapMode.onChangeUiFilter(value, dir)`

Hook called by the filter change input action: with hysteresis (triggers above 0.65, rearms below 0.35) sends onChangeBigmapFilterIndex with {change = dir} to the UI.

- `value` (*number*) : Analog input value.
- `dir` (*integer*) : Change direction (e.g. -1 or 1, inferred from code).

#### `freeroam_bigMapMode.onClientEndMission(levelPath)`

Hook called at the end of the level: clears the border cylinder cache, deselects and removes the ambient sound.

- `levelPath` (*string*) : Path of the level being left (unused).

#### `freeroam_bigMapMode.onClientStartMission(levelPath)`

Hook called when the level starts: disables map mode and creates the ambient sound source (event:>UI>Bigmap>Ambience).

- `levelPath` (*string*) : Level path (unused).

#### `freeroam_bigMapMode.onDeserialized(v)`

Hook called after an extension reload: reopens the map (if it was open) and restores the navigation destination (outside career), after a 0.1 s delay in a job.

- `v` (*table*) : onSerialize data: bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData.

#### `freeroam_bigMapMode.onMouseButton(buttonDown)`

Hook called on mouse clicks on the map: on release without a drag, handles a click (POI selection, destination, deselection) then forwards the event to the map camera.

- `buttonDown` (*boolean*) : true on press, false on release.

#### `freeroam_bigMapMode.onSerialize()`

Hook called before an extension reload: closes the map if open (instantly), empties the cylinder cache and returns the state to restore.

- **returns**: table {bigMap, navDestinationForLuaReloads, showNavigationMarker, previousCamMode, previousFreeCamData}

#### `freeroam_bigMapMode.panToPoi(poiId)`

Smoothly moves the camera to center a POI, without changing the selection or the navigation. Applies the autoSelectZoomFactor zoom only once if it was requested at opening.

- `poiId` (*string*) : POI id; empty values, 'null' and 'undefined' are ignored.

#### `freeroam_bigMapMode.poiHovered(poiIdInCluster, hovered)`

Called by the UI when a POI in the list is hovered: shows the mission's route preview (if it is a mission) or restores the one for the selected POI.

- `poiIdInCluster` (*string*) : POI id.
- `hovered` (*boolean*) : true on hover, false on exit.

#### `freeroam_bigMapMode.selectPoi(poiIdInCluster)`

Called by the UI: selects a POI (mission route preview, onPoiSelectedFromBigmap hook, selection callback). An empty value, 'null' or 'undefined' is equivalent to deselect().

- `poiIdInCluster` (*string|nil*) : POI id.

#### `freeroam_bigMapMode.setBigmapScreenBounds(windowSize, mapSize)`

Empty function, reserved for UI tests.

- `windowSize` (*any*) : Not used.
- `mapSize` (*any*) : Not used.

#### `freeroam_bigMapMode.setNavFocus(pos, options)`

Sets (or clears with nil) the map's navigation destination via core_groundMarkers.setPath, with the path cleared on arrival. First emits the onSetBigmapNavFocus(pos) hook. Without a player vehicle, the position is ignored.

- `pos` (*vec3|nil*) : Destination in the world; nil to cancel.
- `options` (*table|nil*) : options.async = true computes the path asynchronously (resetRoute at the end).

#### `freeroam_bigMapMode.setOnlyIdsVisible(list)`

Restricts the display to the POIs in the list: stores the list, recomputes the merge radius with factor 1 and reconfigures the freeroam_bigMapMarkers filter.

- `list` (*string[]|nil*) : Visible POI ids (empty list if nil).

#### `freeroam_bigMapMode.setRoutePreview(unsimplifiedRoute)`

Shows a route preview on the map from an unsimplified path (list of points with .pos); nil clears it.

- `unsimplifiedRoute` (*table|nil*) : Path from a route planner.

#### `freeroam_bigMapMode.setRoutePreviewSimple(from, to)`

Computes a route in the world between two positions (gameplay/route/route) and shows it as a preview.

- `from` (*vec3*) : Start.
- `to` (*vec3*) : End.

#### `freeroam_bigMapMode.setUiNavigationActive(active)`

Gives or removes focus from the UI (blocks or unblocks the UI actions). Does nothing if the map is closed.

- `active` (*boolean*) : true if the UI should have focus.

#### `freeroam_bigMapMode.teleportToPoi(poiId)`

Teleports the player's vehicle to a POI (via the quickTravelPosRotFunction of its bigmapMarker), closes the map (exitBigMap(false, true, true)), recenters the camera and emits teleportedFromBigmap. Also marks the cluster as the target (onNavigateToMission hook). In career, the teleport is "safe" without resetBrokenFlexMesh.

- `poiId` (*string*) : Target POI id.

#### `freeroam_bigMapMode.updateMergeRadius(factor)`

Recomputes the markers' merge radius between a minimum and a maximum proportional to the camera height and the field of view, then reconfigures the marker filter.

- `factor` (*number*) : Interpolation factor from 0 (minimum radius) to 1 (maximum).

#### `freeroam_bigMapMode.zoom(value)`

Map camera zoom (calls camMode:zoom).

- `value` (*number*) : Zoom value.

#### `freeroam_bigMapMode.zoomInOut(value, zoomIn)`

Zoom by keys: stores the zoom-in (negative) and zoom-out values separately, then sends their sum to core_camera.cameraZoom.

- `value` (*number*) : Key value.
- `zoomIn` (*boolean*) : true for zoom in, false for zoom out.

## Fields

| Field | Type | Description |
|---|---|---|
| `clusterMergeRadius` | number | Grouping radius of the POI markers in meters (10 initially; recomputed by updateMergeRadius). |
| `dependencies` | string[] | gameplay_rawPois, core_groundMarkers, core_camera, core_terrain, freeroam_bigMapMarkers, ui_pause_camera. |
| `hoveredListItem` | string|nil | Id of the POI hovered in the UI list (set by poiHovered). |
| `hoveredPoiId` | string|nil | Id of the POI hovered on the map (updated during onUpdate). |
| `selectedPoiId` | string|nil | Id of the selected POI (selectPoi/deselect). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onActivateBigMapCallback` — listened to by 1 module(s)
- `onBeforeBigMapActivated` — listened to by 2 module(s)
- `onBigMapActivated` — listened to by 2 module(s)
- `onBigmapHoveredPoiIdChanged` — listened to by 1 module(s)
- `onBigmapStartTransition`
- `onDeactivateBigMapCallback` — listened to by 3 module(s)
- `onNavigateToMission` — listened to by 1 module(s)
- `onPoiSelectedFromBigmap` — listened to by 2 module(s)
- `onSetBigmapNavFocus` — listened to by 4 module(s)
- `onUpdate` — listened to by 186 module(s)
- `teleportedFromBigmap`

**UI events (guihooks.trigger):** `BigmapCameraMove`, `BigmapHoveredPoiChanged`, `BigmapMouseOverMap`, `MenuOpenModule`, `bigmapTransitionFinished`, `onChangeBigmapFilterIndex`, `onReducedPoiList`

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `core_environment.` `getCloudCover`, `getFogDensity`, `getTimeOfDay`, `setCloudCover`, `setFogDensity`, `setTimeOfDay`
- `debugDrawer:` `drawCylinder`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/freeroam/bigMapMode.lua`.*

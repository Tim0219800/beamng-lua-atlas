# `gameplay_markerInteraction`

*File: `lua/ge/extensions/gameplay/markerInteraction.lua` · VM: Game Engine (GE) · 718 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_markerInteraction`: `extensions.load("gameplay_markerInteraction")`, then the global `gameplay_markerInteraction`

Manages every frame (onPreRender) the display and interaction of mission/activity markers in freeroam and career: selects the clusters of nearby markers (radius 100 m) via the gameplay_playmodeMarkers quadtree, displays them, updates their ground decals, and opens the activity acceptance window when the player is stopped (less than 1 km/h, with hysteresis up to 3 km/h) or on foot in a zone. Also handles clearing the guidance on arrival (less than 7 m), single-screen multiplayer mode (multiseat) and mission formatting for the UI. The old mission launch functions are deprecated.

## Notes

- Deprecated: startMissionById, stopMissionById and changeUserSettings only log an error and a stack trace; use gameplay_missions_missionManager.
- Inconsistency: M.restartCurrent, M.abandonCurrent and M.getClusterMarker are assigned to local variables that are never defined: these fields are nil.
- Probable bug: formatMission reads "mission.missionType" while the variable is m (the global mission is nil in this file); if m.missionTypeLabel is nil, the evaluation causes an error.
- Probable bug: formatDataForUi calls M.isStateWithPlaymodeMarkers, which is not defined in this module (it exists in gameplay_playmodeMarkers); the call would fail.
- Threshold speeds: stop < 1/3.6 then > 3/3.6 m/s; cruising 20 to 30 km/h (in m/s, 20/3.6 and 30/3.6).
- Markers are only shown if the camera is not in photo mode, the editor is not active and the showMissionMarkers setting (or career, tutorial, first drive) allows it, except for a cluster taken in focus (navigation).
- Emits the hooks onActivityAcceptGatherData(elemData, activityData), onMissionAvailabilityChanged({missionCount}) and onReachedTargetPos.

**Dependencies (loaded first):** `gameplay_missions_missions`, `gameplay_missions_missionManager`, `freeroam_bigMapMode`, `gameplay_playmodeMarkers`, `freeroam_bigMapPoiProvider`, `ui_missionInfo`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_markerInteraction.changeUserSettings(id, settings)` | Deprecated: logs an error and a stack trace. | 138 |
| `gameplay_markerInteraction.clearCache()` | Forces the acceptance window to be re-evaluated on the next pass. | 651 |
| `gameplay_markerInteraction.closeViewDetailPrompt(force)` | If force is true, closes the acceptance window, sends onMissionAvailabilityChanged with missionCount = 0 to the UI and the extensions. | 211 |
| `gameplay_markerInteraction.formatDataForUi()` | Formats the missions of the current interactive elements for the UI, sorted by gameplay_missions_unlocks.depthIdSort. | 114 |
| `gameplay_markerInteraction.formatMission(m)` | Builds a mission's data table for the UI (name, description, preview, settings, attributes, progress, unlocks, context buttons). | 66 |
| `gameplay_markerInteraction.getCurrentInteractableElements()` | Returns the list of currently interactive elements (those of the open acceptance window). | 61 |
| `gameplay_markerInteraction.getGameContext(fromMissionMenu)` | Returns the mission screen data via gameplay_missions_missionScreen.getMissionScreenData(). | 149 |
| `gameplay_markerInteraction.onAnyMissionChanged(state)` | Hook: on any mission state change, forces the POIs to be sent again; at start (state == "started"), deselects the big map, removes the focuses and closes the acceptance window if open. *(internal)* *(hook)* | 666 |
| `gameplay_markerInteraction.onClientEndMission(levelPath)` | Level end hook: forgets the navigation POI. *(internal)* *(hook)* | 685 |
| `gameplay_markerInteraction.onNavigateToMission(poiId)` | Hook: resets the marker focuses then stores the POI being navigated to. *(internal)* *(hook)* | 678 |
| `gameplay_markerInteraction.onPreRender(dtReal, dtSim)` | Pre-render hook, every frame: if the game state has play mode markers, handles arrival at the target, guidance and calls the display of the current level's mission markers; otherwise clears gameplay_playmodeMarkers. *(internal)* *(hook)* | 603 |
| `gameplay_markerInteraction.onSelectDetailPromptClicked(idx)` | Called by the UI when the player chooses an entry of the acceptance window: closes the dialog, clears ActivityAcceptUpdate and executes the chosen entry's buttonFun. *(hook)* | 199 |
| `gameplay_markerInteraction.onSettingsChanged()` | Settings change hook: re-reads the resolution (GFXDevice.getVideoMode) and the aspect ratio. *(internal)* *(hook)* | 221 |
| `gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay)` | Hook: on entering play mode (enteredPlay true), forces the acceptance window to be re-evaluated. *(internal)* *(hook)* | 713 |
| `gameplay_markerInteraction.setForceReevaluateOpenPrompt()` | Forces the acceptance window to be re-evaluated on the next frame. | 709 |
| `gameplay_markerInteraction.setMarkersVisibleTemporary(visible)` | Temporarily shows or hides all markers (except the focused cluster). | 689 |
| `gameplay_markerInteraction.setPreselectedMissionId(mId)` | Stores a preselected mission ID (the variable is not read anywhere in this file). | 144 |
| `gameplay_markerInteraction.showMissionMarkersToggled(active)` | To be called when the marker display setting changes: clears the raw POIs (gameplay_rawPois.clear) and forces the big map POIs to be sent again. | 660 |
| `gameplay_markerInteraction.skipNextIconFading()` | Enables a local flag skipIconFading reset to false at the end of the next frame (no read in this file). | 656 |
| `gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions)` | Deprecated: logs an error and a stack trace, starts nothing. | 128 |
| `gameplay_markerInteraction.stopMissionById(id, force)` | Deprecated: logs an error and a stack trace. | 133 |

### Parameter details

#### `gameplay_markerInteraction.changeUserSettings(id, settings)`

Deprecated: logs an error and a stack trace.

- `id` (*string*) : Mission ID (ignored).
- `settings` (*table*) : Ignored.

#### `gameplay_markerInteraction.closeViewDetailPrompt(force)`

If force is true, closes the acceptance window, sends onMissionAvailabilityChanged with missionCount = 0 to the UI and the extensions.

- `force` (*boolean|nil*) : Without true, does nothing.

#### `gameplay_markerInteraction.formatDataForUi()`

Formats the missions of the current interactive elements for the UI, sorted by gameplay_missions_unlocks.depthIdSort.

- **returns**: table[]|nil List of formatted missions, or nil.

#### `gameplay_markerInteraction.formatMission(m)`

Builds a mission's data table for the UI (name, description, preview, settings, attributes, progress, unlocks, context buttons).

- `m` (*table*) : Mission object.
- **returns**: table Mission information formatted for the interface.

#### `gameplay_markerInteraction.getCurrentInteractableElements()`

Returns the list of currently interactive elements (those of the open acceptance window).

- **returns**: table[] Marker interaction elements.

#### `gameplay_markerInteraction.getGameContext(fromMissionMenu)`

Returns the mission screen data via gameplay_missions_missionScreen.getMissionScreenData().

- `fromMissionMenu` (*boolean|nil*) : Not used.
- **returns**: table Mission screen data.

#### `gameplay_markerInteraction.onAnyMissionChanged(state)`

Hook: on any mission state change, forces the POIs to be sent again; at start (state == "started"), deselects the big map, removes the focuses and closes the acceptance window if open.

- `state` (*string*) : Mission state (for example "started").

#### `gameplay_markerInteraction.onClientEndMission(levelPath)`

Level end hook: forgets the navigation POI.

- `levelPath` (*string*) : Level path.

#### `gameplay_markerInteraction.onNavigateToMission(poiId)`

Hook: resets the marker focuses then stores the POI being navigated to.

- `poiId` (*string*) : ID of the target POI.

#### `gameplay_markerInteraction.onPreRender(dtReal, dtSim)`

Pre-render hook, every frame: if the game state has play mode markers, handles arrival at the target, guidance and calls the display of the current level's mission markers; otherwise clears gameplay_playmodeMarkers.

- `dtReal` (*number*) : Real-time delta in seconds.
- `dtSim` (*number*) : Simulation time delta in seconds.

#### `gameplay_markerInteraction.onSelectDetailPromptClicked(idx)`

Called by the UI when the player chooses an entry of the acceptance window: closes the dialog, clears ActivityAcceptUpdate and executes the chosen entry's buttonFun.

- `idx` (*integer*) : Index of the entry (1-based) in promptData.

#### `gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay)`

Hook: on entering play mode (enteredPlay true), forces the acceptance window to be re-evaluated.

- `enteredPlay` (*boolean*) : true if the UI switches to play mode.

#### `gameplay_markerInteraction.setMarkersVisibleTemporary(visible)`

Temporarily shows or hides all markers (except the focused cluster).

- `visible` (*boolean*) : true to show.

#### `gameplay_markerInteraction.setPreselectedMissionId(mId)`

Stores a preselected mission ID (the variable is not read anywhere in this file).

- `mId` (*string|nil*) : Mission ID.

#### `gameplay_markerInteraction.showMissionMarkersToggled(active)`

To be called when the marker display setting changes: clears the raw POIs (gameplay_rawPois.clear) and forces the big map POIs to be sent again.

- `active` (*boolean*) : New state (unused).

#### `gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions)`

Deprecated: logs an error and a stack trace, starts nothing.

- `id` (*string*) : Mission ID (ignored).
- `userSettings` (*table|nil*) : Ignored.
- `startingOptions` (*table|nil*) : Ignored.

#### `gameplay_markerInteraction.stopMissionById(id, force)`

Deprecated: logs an error and a stack trace.

- `id` (*string*) : Mission ID (ignored).
- `force` (*boolean|nil*) : Ignored.

## Fields

| Field | Type | Description |
|---|---|---|
| `abandonCurrent` | nil | Always nil: reference to an undefined local variable. ⚠ reference `abandonCurrent` not defined in the file (probably nil) |
| `dependencies` | string[] | gameplay_missions_missions, gameplay_missions_missionManager, freeroam_bigMapMode, gameplay_playmodeMarkers, freeroam_bigMapPoiProvider, ui_missionInfo. |
| `getClusterMarker` | nil | Always nil: reference to an undefined local variable. ⚠ reference `getClusterMarker` not defined in the file (probably nil) |
| `restartCurrent` | nil | Always nil: reference to an undefined local variable. ⚠ reference `restartCurrent` not defined in the file (probably nil) |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onActivityAcceptGatherData` — listened to by 7 module(s)
- `onMissionAvailabilityChanged` — listened to by 1 module(s)
- `onReachedTargetPos` — listened to by 2 module(s)

**UI events (guihooks.trigger):** `ActivityAcceptUpdate`, `onMissionAvailabilityChanged`

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectVelocityXYZ`
- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/markerInteraction.lua`.*

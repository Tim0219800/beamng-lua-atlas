# `ui_pause_providers_routeData_home`

*File: `lua/ge/extensions/ui/pause/providers/routeData/home.lua` · VM: Game Engine (GE) · 278 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_home`: `extensions.load("ui_pause_providers_routeData_home")`, then the global `ui_pause_providers_routeData_home`

Provides the data of the pause menu home screen (route "pause"). Depending on the game mode (career, mission, multiplayer, freeroam, freeroamTutorial, scenario) and the first drive state, it composes the content of the main panel and the side panels (Vue components by name), adds the career buttons and the button rail from ui_pause_features_homeRail. Also provides the detail data of the selected vehicle.

## Notes

- Each panel element is a table {id, type = "component", componentName, props}.
- Priority in getHomeData: the driving assists summary (if enabled), then the guided first drive, then normal mode; in multiplayer mode, the response is that of ui_pause_providers_routeData_multiplayer.getMultiplayerData.
- In freeroam with multiseat active, the PauseMultiseatVehiclesDigest component replaces PauseNearbyVehicles and PauseNearbyActivitiesTab.
- Minor BUG: getHomeData returns a field panels = panels, but panels is a global variable that is never defined; the field is therefore nil (absent from the table).
- An empty if block (career delivery) remains in getHomeData with no effect.

**Dependencies (loaded first):** `career_career`, `career_saveSystem`, `ui_pause_providers_nearbyActivities`, `ui_pause_providers_missionObjectives`, `ui_pause_providers_routeData_multiplayer`, `ui_pause_providers_vehicleTabInteractions`, `ui_pause_features_homeRail`, `ui_vehicleSelector_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_home.getHomeData(context)` | Builds the pause home route data: mode, mainPanelContent, sidePanelContents, rail, and depending on the case heading, mainCardClass, nearbyActivities and missionObjectives. In career, adds buttons (loading map, cancel certification, cancel trial); in mission, the task list and the objectives. | 117 |
| `ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context)` | Data of the selected spawned vehicle's details route: title (label), PauseVehicleSpawnedSelected component and spawnedVehicleSelected. | 262 |
| `ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled()` | Returns whether the driving assists summary is active (false by default). | 94 |
| `ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled)` | Enables or disables the display of the driving assists summary (DrivingAssistsDigest component) in place of the normal home. | 90 |

### Parameter details

#### `ui_pause_providers_routeData_home.getHomeData(context)`

Builds the pause home route data: mode, mainPanelContent, sidePanelContents, rail, and depending on the case heading, mainCardClass, nearbyActivities and missionObjectives. In career, adds buttons (loading map, cancel certification, cancel trial); in mission, the task list and the objectives.

- `context` (*table*) : Pause context: mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isCareerActive...
- **returns**: table Home route data.

#### `ui_pause_providers_routeData_home.getHomeVehicleDetailsData(context)`

Data of the selected spawned vehicle's details route: title (label), PauseVehicleSpawnedSelected component and spawnedVehicleSelected.

- `context` (*table*) : Pause context, passed to vehicleTabInteractions.
- **returns**: table {heading, mainPanelContent, spawnedVehicleSelected}.

#### `ui_pause_providers_routeData_home.isDrivingAssistsDigestEnabled()`

Returns whether the driving assists summary is active (false by default).

- **returns**: boolean true if active.

#### `ui_pause_providers_routeData_home.setDrivingAssistsDigestEnabled(enabled)`

Enables or disables the display of the driving assists summary (DrivingAssistsDigest component) in place of the normal home.

- `enabled` (*boolean*) : true to enable (any other value disables).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career, career_saveSystem, ui_pause_providers_nearbyActivities, ui_pause_providers_missionObjectives, ui_pause_providers_routeData_multiplayer, ui_pause_providers_vehicleTabInteractions, ui_pause_features_homeRail, ui_vehicleSelector_general. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/home.lua`.*

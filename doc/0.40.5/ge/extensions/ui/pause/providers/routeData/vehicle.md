# `ui_pause_providers_routeData_vehicle`

*File: `lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua` · VM: Game Engine (GE) · 498 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_vehicle`: `extensions.load("ui_pause_providers_routeData_vehicle")`, then the global `ui_pause_providers_routeData_vehicle`

Provides the data for the pause menu "vehicle" routes (pause.vehicle and sub-routes: combined configuration, packs, tuning, paint, save, configuration list, spawned vehicles, debug). Each function returns a table describing the Vue components to display (mainPanelContent, sidePanelContents, rail, mainCardClass, heading). getVehicleData also computes the permissions of each action based on the game mode, the first drive and the presence of a vehicle.

## Notes

- Panel items are tables {id, type = "component"|"title", componentName, props}.
- Vehicle editing is allowed only in freeroam, multiplayer, garage and freeroamTutorial; recovery (repair, last road, flip upright) in freeroam, multiplayer and freeroamTutorial; the vehicle selector in freeroam, multiplayer, garage and freeroamTutorial.
- When multiseat is active, getVehicleData returns only the PauseMultiseatVehiclesDigest component, with no rail or actions.
- Without a player vehicle (getPlayerVehicle(0) is nil), the configurationCombined and recovery actions are disabled with the reason ui.radialmenu2.noVehicle.
- During a first-drive session (gameplay_discover_firstDrive_capabilities), permissions are adjusted via applyUiPermission (partsAndTuning, vehicleManagement, radialMenu, advancedSandbox).
- Only the configurationCombined and vehicleSelector buttons and the three recovery buttons are actually built in the rail; partpacks, tuning, colorSkin and seatAdjust are commented out in the code (but remain in the actions table).
- The recovery buttons emit onPauseMenuRightRailButtonPressed with "repairHere", "recoverToRoad" or "flipUpright".
- getVehicleSpawnedData returns only a light content (shell); the Vue screen then requests the full data after mounting.

**Dependencies (loaded first):** `ui_pause_providers_vehicleTabInteractions`, `ui_vehicleSelector_general`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData()` | Data for the configuration list management route: PauseVehicleConfigListManage component. | 454 |
| `ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData()` | Data for the combined configuration screen (parts, PauseVehicleConfigurationCombined component), with customConfigurationsEnabled depending on the first-drive capabilities. | 403 |
| `ui_pause_providers_routeData_vehicle.getVehicleData(context)` | Data for the main "vehicle" route: editable flag, rail (groups vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), PauseVehicleSpawned component, PauseVehicleTab side panel and actions table with visible, enabled and disabledReason for each action. | 282 |
| `ui_pause_providers_routeData_vehicle.getVehicleDebugData()` | Data for the vehicle debug route: PauseVehicleDebug component. | 484 |
| `ui_pause_providers_routeData_vehicle.getVehiclePacksData()` | Data for the part packs route: PauseVehiclePacks component. | 391 |
| `ui_pause_providers_routeData_vehicle.getVehiclePaintData()` | Data for the paint route: PauseVehicleSkin component. | 432 |
| `ui_pause_providers_routeData_vehicle.getVehicleSaveData()` | Data for the configuration save route: title "Save configuration - <make model>" of the current vehicle. | 444 |
| `ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle()` | Returns the save route title: the text ui.pause.route.saveConfig, followed by "- make model" if the player vehicle is known. | 450 |
| `ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context)` | Data for the spawned vehicles route: PauseVehicleSpawned component and lightweight data (shell) from ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData. | 467 |
| `ui_pause_providers_routeData_vehicle.getVehicleTuningData()` | Data for the tuning route: PauseVehicleTuning component. | 420 |

### Parameter details

#### `ui_pause_providers_routeData_vehicle.getVehicleConfigListManageData()`

Data for the configuration list management route: PauseVehicleConfigListManage component.

- **returns**: table {mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleConfigurationCombinedData()`

Data for the combined configuration screen (parts, PauseVehicleConfigurationCombined component), with customConfigurationsEnabled depending on the first-drive capabilities.

- **returns**: table {heading, mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleData(context)`

Data for the main "vehicle" route: editable flag, rail (groups vehicleButtons, vehicleSelectorButtons, vehicleRecoveryButtons), PauseVehicleSpawned component, PauseVehicleTab side panel and actions table with visible, enabled and disabledReason for each action.

- `context` (*table*) : Pause context: mode, isMultiseatActive, isFirstDriveActive.
- **returns**: table {editable, rail, mainCardClass, mainPanelContent, spawnedVehicles, sidePanelContents, actions}.

#### `ui_pause_providers_routeData_vehicle.getVehicleDebugData()`

Data for the vehicle debug route: PauseVehicleDebug component.

- **returns**: table {mainCardClass, mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehiclePacksData()`

Data for the part packs route: PauseVehiclePacks component.

- **returns**: table {mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehiclePaintData()`

Data for the paint route: PauseVehicleSkin component.

- **returns**: table {mainPanelContent}.

#### `ui_pause_providers_routeData_vehicle.getVehicleSaveData()`

Data for the configuration save route: title "Save configuration - <make model>" of the current vehicle.

- **returns**: table {heading}.

#### `ui_pause_providers_routeData_vehicle.getVehicleSaveRouteTitle()`

Returns the save route title: the text ui.pause.route.saveConfig, followed by "- make model" if the player vehicle is known.

- **returns**: string Title.

#### `ui_pause_providers_routeData_vehicle.getVehicleSpawnedData(context)`

Data for the spawned vehicles route: PauseVehicleSpawned component and lightweight data (shell) from ui_pause_providers_vehicleTabInteractions.getSpawnedVehiclesShellData.

- `context` (*table*) : Pause context.
- **returns**: table {mainCardClass, mainPanelContent, spawnedVehicles}.

#### `ui_pause_providers_routeData_vehicle.getVehicleTuningData()`

Data for the tuning route: PauseVehicleTuning component.

- **returns**: table {mainPanelContent}.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded beforehand: ui_pause_providers_vehicleTabInteractions, ui_vehicleSelector_general. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPauseMenuRightRailButtonPressed`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/vehicle.lua`.*

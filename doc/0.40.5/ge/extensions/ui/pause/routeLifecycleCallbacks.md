# `ui_pause_routeLifecycleCallbacks`

*File: `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua` · VM: Game Engine (GE) · 705 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_routeLifecycleCallbacks`: `extensions.load("ui_pause_routeLifecycleCallbacks")`, then the global `ui_pause_routeLifecycleCallbacks`

Lifecycle callbacks of the "pause.*" routes of the new pause menu (Vue UI router). The router calls these hooks when the user enters, mounts, or leaves a pause, vehicle configuration, big map or photo mode route. The module builds the layout data (top tabs, title, breadcrumb, main/side content/panels, rail) by delegating to the ui_pause_providers_routeData_* providers, handles the simulation pause request, the pause camera (ui_pause_camera) and photo mode sessions.

## Notes

- No function is meant to be called by hand: all are hooks called by the router with (context, toRoute, fromRoute, data), where data is the table the hook fills (data.layoutMenu, data.pause, data.photomode).
- In onPauseEnter, the route content is not computed (includeRouteContent = false); it is in onPauseMount (true).
- The simulation is paused (simTimeAuthority.pushPauseRequest, id "ui_pause_home_tab") for pause, pause.system, pause.manageVehicles and pause.options; it is not paused for combined configuration (except unlisted routes), tuning, debug, paint, weather, simulation, replay and photomode.
- The top tabs depend on the mode: career (Progression if available, History), otherwise Vehicle and Environment (filtered by gameplay_discover_firstDrive_capabilities during the first drive), Multiplayer if MP exists in freeroam, then mod tabs via ui_pause_actions.getVisibleModTabs().
- onPauseEnter calls dump("not a pause route") for non-pause routes (leftover debug left in the code).
- attachPhotomodeRouteData contains a TODO: workaround to provide fresh photo mode data on enter, because onMount can arrive late.

**Dependencies (loaded first):** `ui_pause_actions`, `ui_pause_providers_routeData_system`, `ui_pause_providers_routeData_home`, `ui_pause_providers_routeData_career`, `ui_pause_providers_routeData_vehicle`, `ui_pause_providers_routeData_environment`, `ui_pause_providers_routeData_multiplayer`, `ui_pause_providers_routeData_gamemodes`, `ui_pause_providers_routeData_photomode`, `ui_pause_providers_trafficControls`, `ui_pause_providers_vehicleTabInteractions`, `ui_pause_photomode`, `ui_pause_vehicleConfigurationOccupants`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data)` | Exit of the big map route: closes the map (freeroam_vueBigMap.exitBigMap, otherwise freeroam_bigMapMode.exitBigMap(true)) then calls onPauseLeave. *(internal)* *(hook)* | 655 |
| `ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data)` | Entry hook for a pause.* route. Ignores non-pause routes. Notifies vehicleTabInteractions, fills data.layoutMenu and data.pause without route content, updates the simulation pause request, and starts ui_pause_camera on the root "pause" route. *(internal)* *(hook)* | 573 |
| `ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data)` | Exit hook of a pause route. Notifies vehicleTabInteractions, adjusts the pause request according to the target route, stops ui_pause_camera if leaving "pause", and ends the camera session (endPauseSession) if leaving the pause routes entirely. *(internal)* *(hook)* | 606 |
| `ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data)` | Hook called when the route component is mounted. Fills data.layoutMenu with the full route content, updates the simulation pause and calls ui_pause_camera.beginPauseSession(). *(internal)* *(hook)* | 595 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)` | Entry into a pause.photomode route: calls onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), attaches the photo mode data (data.photomode) then ui_pause_photomode.onPhotomodeRouteEnter(routeName). *(internal)* *(hook)* | 665 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)` | Exit of a photo mode route. If the target is still a pause.photomode.* route, only calls onPauseLeave. Otherwise notifies ui_pause_photomode.onPhotomodeRouteLeave, ends the session (endPhotomodeSession) then calls onPauseLeave. *(internal)* *(hook)* | 689 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)` | Mounting of a photo mode route: calls onPauseMount then copies the photomode data to data.photomode. *(internal)* *(hook)* | 681 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason)` | Hook emitted when the configuration target changes. Does something only if the target disappears (current nil) with the reason "vehicleDestroyed": closes the solo view and, if the current route is a configuration route, returns to the return route (previous.returnRoute or "pause.vehicle"). *(internal)* *(hook)* | 641 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data)` | Exit of a vehicle configuration route: calls onPauseLeave; if the target route is not itself a configuration route, ends the ui_pause_vehicleConfigurationOccupants session, the render_splitScreen solo view and clears core_vehicle_configTarget (reason "routeLeave"). *(internal)* *(hook)* | 626 |

### Parameter details

#### `ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data)`

Exit of the big map route: closes the map (freeroam_vueBigMap.exitBigMap, otherwise freeroam_bigMapMode.exitBigMap(true)) then calls onPauseLeave.

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Target route
- `fromRoute` (*table*) : Route being left
- `data` (*table*) : Navigation data

#### `ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data)`

Entry hook for a pause.* route. Ignores non-pause routes. Notifies vehicleTabInteractions, fills data.layoutMenu and data.pause without route content, updates the simulation pause request, and starts ui_pause_camera on the root "pause" route.

- `context` (*table*) : Pause context (mode, isFirstDriveActive, isMultiseatActive...)
- `toRoute` (*table*) : Target route (name, params)
- `fromRoute` (*table|nil*) : Route being left
- `data` (*table*) : Data table to fill for the UI

#### `ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data)`

Exit hook of a pause route. Notifies vehicleTabInteractions, adjusts the pause request according to the target route, stops ui_pause_camera if leaving "pause", and ends the camera session (endPauseSession) if leaving the pause routes entirely.

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Target route
- `fromRoute` (*table*) : Route being left
- `data` (*table*) : Navigation data

#### `ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data)`

Hook called when the route component is mounted. Fills data.layoutMenu with the full route content, updates the simulation pause and calls ui_pause_camera.beginPauseSession().

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Mounted route
- `fromRoute` (*table|nil*) : Previous route
- `data` (*table*) : Data table to fill

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)`

Entry into a pause.photomode route: calls onPauseEnter, ui_pause_photomode.beginPhotomodeSession(), attaches the photo mode data (data.photomode) then ui_pause_photomode.onPhotomodeRouteEnter(routeName).

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Target route
- `fromRoute` (*table|nil*) : Previous route
- `data` (*table*) : Data to fill

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)`

Exit of a photo mode route. If the target is still a pause.photomode.* route, only calls onPauseLeave. Otherwise notifies ui_pause_photomode.onPhotomodeRouteLeave, ends the session (endPhotomodeSession) then calls onPauseLeave.

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Target route
- `fromRoute` (*table*) : Route being left
- `data` (*table*) : Navigation data

#### `ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)`

Mounting of a photo mode route: calls onPauseMount then copies the photomode data to data.photomode.

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Mounted route
- `fromRoute` (*table|nil*) : Previous route
- `data` (*table*) : Data to fill

#### `ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason)`

Hook emitted when the configuration target changes. Does something only if the target disappears (current nil) with the reason "vehicleDestroyed": closes the solo view and, if the current route is a configuration route, returns to the return route (previous.returnRoute or "pause.vehicle").

- `current` (*table|nil*) : New target
- `previous` (*table|nil*) : Previous target (returnRoute)
- `reason` (*string*) : Reason for the change, for example vehicleDestroyed

#### `ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data)`

Exit of a vehicle configuration route: calls onPauseLeave; if the target route is not itself a configuration route, ends the ui_pause_vehicleConfigurationOccupants session, the render_splitScreen solo view and clears core_vehicle_configTarget (reason "routeLeave").

- `context` (*table*) : Pause context
- `toRoute` (*table*) : Target route
- `fromRoute` (*table*) : Route being left
- `data` (*table*) : Navigation data

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this module: ui_pause_actions, routeData providers (system, home, career, vehicle, environment, multiplayer, gamemodes, photomode), ui_pause_providers_trafficControls, ui_pause_providers_vehicleTabInteractions, ui_pause_photomode, ui_pause_vehicleConfigurationOccupants. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua`.*

# `ui_router_routeHandlers_missionExitHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers_missionExitHandlers`: `extensions.load("ui_router_routeHandlers_missionExitHandlers")`, then the global `ui_router_routeHandlers_missionExitHandlers`

Exit/back handlers of the mission and pause screens. When a mission start/end screen is active, they send back to the "mission.control" route with the matching mode; otherwise to the gameplay route (ui_menuManager.getGameplayRoute(), "play" by default).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler()` | Leaves the mission details: if a mission is active and a start/end screen is displayed, navigates to mission.control with {mode = screen mode}; otherwise to the gameplay route. | 11 |
| `ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler()` | Back from the mission vehicle selector: same logic as pauseExitHandler. | 35 |
| `ui_router_routeHandlers_missionExitHandlers.pauseExitHandler()` | Leaves the pause: navigates to mission.control {mode} if a mission start/end screen is active, otherwise to the gameplay route. | 24 |

### Parameter details

#### `ui_router_routeHandlers_missionExitHandlers.missionDetailsExitHandler()`

Leaves the mission details: if a mission is active and a start/end screen is displayed, navigates to mission.control with {mode = screen mode}; otherwise to the gameplay route.

- **returns**: table|nil Result of navigate in the mission.control case; nil otherwise (navigation is started without returning its result).

#### `ui_router_routeHandlers_missionExitHandlers.missionVehicleSelectorBackHandler()`

Back from the mission vehicle selector: same logic as pauseExitHandler.

- **returns**: table Result of ui_router.navigate.

#### `ui_router_routeHandlers_missionExitHandlers.pauseExitHandler()`

Leaves the pause: navigates to mission.control {mode} if a mission start/end screen is active, otherwise to the gameplay route.

- **returns**: table Result of ui_router.navigate.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers/missionExitHandlers.lua`.*

# `ui_menuManager`

*File: `lua/ge/extensions/ui/menuManager.lua` · VM: Game Engine (GE) · 344 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_menuManager`: `extensions.load("ui_menuManager")`, then the global `ui_menuManager`

Decides which UI route (ui_router) to display when the player opens, closes or toggles the menu: main menu, pause menu v2, garage, mission or scenario screens, or return to the game. It emits the hooks onBeforeMenuOpened and onMenuToggled. A modder uses it to open/close the menu by script or to set the active game route (setGameplayRoute) or pause route (setPauseRoute).

## Notes

- Most functions return a table {handled = true, targetRoute, navigation} or {handled = false, reason = "no_current_route"} when no route is active.
- Without a loaded level (getMissionFilename empty), the only valid "menu" destination is "menu" (main menu); pause and play are level routes.
- Default game route: "play". Pause routes: "pause" (pause v2, or "pause.replay:pause-replay-player" if a replay is loaded), or "menu.careerPause" in career if pause v2 is disabled.
- pauseV2Enabled is a local variable set to true; no function modifies it, so isPauseV2Enabled always returns true.
- When a back navigation is blocked by a route guard (guard_blocked_exit), the exit is only forced to the menu on the 6th consecutive block (BLOCK_FORCE_THRESHOLD).
- In garage mode, toggleMenu opens "garage" from "menu", does nothing if already on "garage", otherwise goes back.
- During a scenario in the pre-running state, toggleMenu opens "scenario.start"; in the finished/post state, the end screen (scenario.end, scenario.quickrace.end or scenario.chapter.end).
- Route aliases exist for MenuOpenModule: vehicleselect -> menu.vehicles, vehicleconfig -> menu.vehicleconfig.parts, vehicledebug -> menu.vehicleconfig.debug, appedit -> pause.hudApps.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_menuManager.MenuOpenModule(data)` | Navigates to a route: either a string (route name, alias, or "options" which becomes "pause.options" in a level), or a table {state, params}. Returns nothing. | 318 |
| `ui_menuManager.closeMenu()` | Returns to the active game route (emits onMenuToggled(false)), unless already on a game route or on "garage" or there is no current route. | 309 |
| `ui_menuManager.closeToMenu()` | Navigates directly to the "menu" route (main menu), without emitting onMenuToggled. | 305 |
| `ui_menuManager.getGameplayRoute()` | Returns the active game route. | 21 |
| `ui_menuManager.isPauseV2Enabled()` | Returns whether pause menu v2 is active (always true in this version, see notes). | 339 |
| `ui_menuManager.menuHide(showMenu)` | Displays the menu (menu/pause route) if showMenu is true, otherwise the game route. | 327 |
| `ui_menuManager.openMenu()` | Opens the menu (pause route or main menu) unless already there. Emits onBeforeMenuOpened then onMenuToggled(true). | 296 |
| `ui_menuManager.setGameplayRoute(route)` | Sets the route considered as "game" ("play" if nil). | 13 |
| `ui_menuManager.setPauseRoute(route)` | Sets a specific pause route, taking priority over "pause" when a level is loaded (nil to return to the default behavior). | 17 |
| `ui_menuManager.toggleMenu()` | Toggles between the game and the menu (Escape key). Handles the cases of no level, garage, mission screens (mission.control), scenarios, game to menu, menu to game, otherwise navigates back. | 201 |

### Parameter details

#### `ui_menuManager.MenuOpenModule(data)`

Navigates to a route: either a string (route name, alias, or "options" which becomes "pause.options" in a level), or a table {state, params}. Returns nothing.

- `data` (*string|table*) : Route name or {state = route, params = table}.

#### `ui_menuManager.closeMenu()`

Returns to the active game route (emits onMenuToggled(false)), unless already on a game route or on "garage" or there is no current route.

- **returns**: table {handled = true, ...}.

#### `ui_menuManager.closeToMenu()`

Navigates directly to the "menu" route (main menu), without emitting onMenuToggled.

- **returns**: table {handled = true, targetRoute = "menu", navigation}.

#### `ui_menuManager.getGameplayRoute()`

Returns the active game route.

- **returns**: string "play" by default.

#### `ui_menuManager.isPauseV2Enabled()`

Returns whether pause menu v2 is active (always true in this version, see notes).

- **returns**: boolean true.

#### `ui_menuManager.menuHide(showMenu)`

Displays the menu (menu/pause route) if showMenu is true, otherwise the game route.

- `showMenu` (*boolean*) : true to display the menu.
- **returns**: table {handled = true, targetRoute, navigation}.

#### `ui_menuManager.openMenu()`

Opens the menu (pause route or main menu) unless already there. Emits onBeforeMenuOpened then onMenuToggled(true).

- **returns**: table {handled = true, ...}.

#### `ui_menuManager.setGameplayRoute(route)`

Sets the route considered as "game" ("play" if nil).

- `route` (*string|nil*) : Road name.

#### `ui_menuManager.setPauseRoute(route)`

Sets a specific pause route, taking priority over "pause" when a level is loaded (nil to return to the default behavior).

- `route` (*string|nil*) : Road name.

#### `ui_menuManager.toggleMenu()`

Toggles between the game and the menu (Escape key). Handles the cases of no level, garage, mission screens (mission.control), scenarios, game to menu, menu to game, otherwise navigates back.

- **returns**: table {handled = boolean, ...} with targetRoute and navigation depending on the case.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onBeforeMenuOpened` — listened to by 1 module(s)
- `onMenuToggled` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/menuManager.lua`.*

# `ui_router_routeHandlers_mainMenuExitHandlers`

*File: `lua/ge/extensions/ui/router/routeHandlers/mainMenuExitHandlers.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeHandlers_mainMenuExitHandlers`: `extensions.load("ui_router_routeHandlers_mainMenuExitHandlers")`, then the global `ui_router_routeHandlers_mainMenuExitHandlers`

Main menu exit handler.

## Notes

- The handler calls dump(...) on every execution: a debug trace left in the game (writes the game context to the log).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeHandlers_mainMenuExitHandlers.mainmenuExitHandler()` | Leaves the main menu: navigates to "garage" if garage mode is active (gameplay_garageMode.isActive), otherwise to "play" if the game state is "freeroam"; does nothing in other cases. | 6 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeHandlers/mainMenuExitHandlers.lua`.*

# `ui_pause_providers_routeData_system`

*File: `lua/ge/extensions/ui/pause/providers/routeData/system.lua` · VM: Game Engine (GE) · 228 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_system`: `extensions.load("ui_pause_providers_routeData_system")`, then the global `ui_pause_providers_routeData_system`

Pause menu data provider for the System page. It builds the button rail in three groups: topSystemButtons (Options, Mods, HUD, Statistics), firstDriveButtons (restart, reset progress, switch to freeroam, only during the First Drive experience) and exitSystemButtons (multiplayer disconnect, quit to main menu, quit the game with confirmation).

## Notes

- The HUD button is omitted in split screen (render_splitScreen.getCurrentConfiguration()).
- Mods and HUD are disabled during the First Drive tutorial (context.isFirstDriveActive).
- The local pushRoute considers any return other than false a success, unlike other modules that read result.result.

**Dependencies (loaded first):** `ui_pause_actions`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_system.getSystemData(context)` | Returns {heading = ui.pause.system, sidePanelContents = nil, rail = button groups}. Each button is registered via ui_pause_actions.registerButton (so it can be executed afterwards with executeAction). | 219 |

### Parameter details

#### `ui_pause_providers_routeData_system.getSystemData(context)`

Returns {heading = ui.pause.system, sidePanelContents = nil, rail = button groups}. Each button is registered via ui_pause_actions.registerButton (so it can be executed afterwards with executeAction).

- `context` (*table*) : Pause context (fields read: mode, isMultiplayerActive, isFirstDriveActive, isFirstDriveGuided).
- **returns**: table System page data.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_actions"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/system.lua`.*

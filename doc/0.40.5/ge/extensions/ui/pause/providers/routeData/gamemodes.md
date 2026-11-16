# `ui_pause_providers_routeData_gamemodes`

*File: `lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_gamemodes`: `extensions.load("ui_pause_providers_routeData_gamemodes")`, then the global `ui_pause_providers_routeData_gamemodes`

Pause menu data provider for multiplayer game modes: list of modes (GamemodesTab component), configuration of a mode (GamemodeSetupView) and settings of the current mode (GamemodeSettingsView). If multiplayer is active, it adds the player list as a side panel via routeData_multiplayer.

**Dependencies (loaded first):** `ui_pause_providers_routeData_multiplayer`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context)` | Returns the settings view of the current mode (GamemodeSettingsView). | 42 |
| `ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params)` | Returns the configuration view of a mode (GamemodeSetupView, prop gamemodeName). | 25 |
| `ui_pause_providers_routeData_gamemodes.getGamemodesData(context)` | Returns the GamemodesTab main panel and, if context.isMultiplayerActive, the player list side panel. | 16 |

### Parameter details

#### `ui_pause_providers_routeData_gamemodes.getGamemodeSettingsData(context)`

Returns the settings view of the current mode (GamemodeSettingsView).

- `context` (*table*) : Pause context.
- **returns**: table {mainCardClass, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_gamemodes.getGamemodeSetupData(context, params)`

Returns the configuration view of a mode (GamemodeSetupView, prop gamemodeName).

- `context` (*table*) : Pause context.
- `params` (*table|nil*) : Field read: gamemodeName.
- **returns**: table {mainCardClass, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_gamemodes.getGamemodesData(context)`

Returns the GamemodesTab main panel and, if context.isMultiplayerActive, the player list side panel.

- `context` (*table*) : Pause context (field read: isMultiplayerActive).
- **returns**: table {mainPanelContent, sidePanelContents}

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_pause_providers_routeData_multiplayer"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/gamemodes.lua`.*

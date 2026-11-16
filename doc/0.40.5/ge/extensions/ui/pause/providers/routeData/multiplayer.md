# `ui_pause_providers_routeData_multiplayer`

*File: `lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua` · VM: Game Engine (GE) · 124 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_routeData_multiplayer`: `extensions.load("ui_pause_providers_routeData_multiplayer")`, then the global `ui_pause_providers_routeData_multiplayer`

Pause menu data provider for multiplayer: multiplayer home page (Session Settings / Game Modes / Manage Players buttons), session settings (PauseMultiplayerSessionTab) and player list (PauseMultiplayerPlayerList). Actions are read-only in freeroamTutorial mode.

## Notes

- Several labels are hardcoded in English, not translated: "Session Settings", "Create Session...", "Manage Players", "Players", "Read-only in this mode".
- getMultiplayerData accesses multiplayer_gamemodeManager.getCurrentGamemodeExt(): the Game Modes button leads to pause.gamemodeSettings if a mode is running, otherwise to pause.gamemodes.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_routeData_multiplayer.getMultiplayerData(context)` | Returns the multiplayer home page with three navigation buttons (routes pause.multiplayer.settings, pause.gamemodes or pause.gamemodeSettings, pause.multiplayer.playerList). The last two are only enabled if a multiplayer session is active. | 30 |
| `ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData()` | Returns the player management page (PauseMultiplayerPlayerList component with interactive = true). | 103 |
| `ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData()` | Returns the session settings page (PauseMultiplayerSessionTab component) with the player list as a side panel. | 88 |
| `ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents()` | Returns the content of the "Players" side panel (title ui.multiplayer.players and PauseMultiplayerPlayerList component). Also used by routeData_gamemodes. | 13 |

### Parameter details

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerData(context)`

Returns the multiplayer home page with three navigation buttons (routes pause.multiplayer.settings, pause.gamemodes or pause.gamemodeSettings, pause.multiplayer.playerList). The last two are only enabled if a multiplayer session is active.

- `context` (*table*) : Pause context (fields read: isMultiplayerActive, mode).
- **returns**: table {active, disabledReason, mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerPlayerListData()`

Returns the player management page (PauseMultiplayerPlayerList component with interactive = true).

- **returns**: table {mainPanelContent}

#### `ui_pause_providers_routeData_multiplayer.getMultiplayerSettingsData()`

Returns the session settings page (PauseMultiplayerSessionTab component) with the player list as a side panel.

- **returns**: table {mainPanelContent, sidePanelContents}

#### `ui_pause_providers_routeData_multiplayer.getPlayerListSidePanelContents()`

Returns the content of the "Players" side panel (title ui.multiplayer.players and PauseMultiplayerPlayerList component). Also used by routeData_gamemodes.

- **returns**: table List of side panels.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/routeData/multiplayer.lua`.*

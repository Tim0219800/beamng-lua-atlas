# `core_gameContext`

*File: `lua/ge/extensions/core/gameContext.lua` · VM: Game Engine (GE) · 48 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_gameContext`: `extensions.load("core_gameContext")`, then the global `core_gameContext`

GE extension `core_gameContext`: small relay to `gameplay_markerInteraction` (current game context) and to the UI (foreground mission change). Also provides the "experimental" warning label displayed for the career and rally missions.

## Notes

- getGameContext loads gameplay_markerInteraction on demand and returns its context; returns {} if the extension is not available. The content of the context is defined in gameplay_markerInteraction.
- toggleMenues is an empty function (empty body): probably leftover code.
- getWIPWarningLabel assumes gameplay_missions_missionManager, gameplay_missions_missions and career_career are loaded (otherwise Lua error).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_gameContext.getGameContext(...)` | Returns the game context provided by gameplay_markerInteraction.getGameContext(...), loading the extension if needed. | 7 |
| `core_gameContext.getWIPWarningLabel()` | Translation key of the "experimental" banner: 'ui.rally.experimentalWarning' if the foreground mission is of type rallyStage, rallyLoop or rallyLoop2 and the rallyHideExperimentalBanner setting is false; 'ui.career.experimentalWarning' if career is active; otherwise nil. | 25 |
| `core_gameContext.onAnyMissionChanged(state, mission)` | Hook called when a mission's state changes: forwards the guihooks event 'onAnyMissionChanged' (state, mission id) to the UI. *(internal)* *(hook)* | 21 |
| `core_gameContext.toggleMenues()` | Does nothing (empty function). | 17 |

### Parameter details

#### `core_gameContext.getGameContext(...)`

Returns the game context provided by gameplay_markerInteraction.getGameContext(...), loading the extension if needed.

- `...` (*any*) : Arguments passed as is to gameplay_markerInteraction.getGameContext.
- **returns**: table Game context, or {} if the extension is unavailable.

#### `core_gameContext.getWIPWarningLabel()`

Translation key of the "experimental" banner: 'ui.rally.experimentalWarning' if the foreground mission is of type rallyStage, rallyLoop or rallyLoop2 and the rallyHideExperimentalBanner setting is false; 'ui.career.experimentalWarning' if career is active; otherwise nil.

- **returns**: string|nil Translation key or nil.

#### `core_gameContext.onAnyMissionChanged(state, mission)`

Hook called when a mission's state changes: forwards the guihooks event 'onAnyMissionChanged' (state, mission id) to the UI.

- `state` (*string*) : New state of the mission (value defined by the mission manager).
- `mission` (*table|nil*) : Mission concerned; only mission.id is sent.

**UI events (guihooks.trigger):** `onAnyMissionChanged`

**Loads extensions:** `gameplay_markerInteraction`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/gameContext.lua`.*

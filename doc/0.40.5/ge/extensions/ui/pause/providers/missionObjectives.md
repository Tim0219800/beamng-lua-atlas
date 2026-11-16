# `ui_pause_providers_missionObjectives`

*File: `lua/ge/extensions/ui/pause/providers/missionObjectives.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_pause_providers_missionObjectives`: `extensions.load("ui_pause_providers_missionObjectives")`, then the global `ui_pause_providers_missionObjectives`

Pause menu data provider for the current mission's objectives. It simply returns the result of gameplay_missions_missionScreen.getPauseMissionObjectivesData().

**Dependencies (loaded first):** `gameplay_missions_missionScreen`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_pause_providers_missionObjectives.getData(context)` | Returns the mission objectives data for the pause menu (provided by gameplay_missions_missionScreen). The context is ignored. | 11 |

### Parameter details

#### `ui_pause_providers_missionObjectives.getData(context)`

Returns the mission objectives data for the pause menu (provided by gameplay_missions_missionScreen). The context is ignored.

- `context` (*table*) : Pause menu context (unused).
- **returns**: any Data returned by getPauseMissionObjectivesData.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"gameplay_missions_missionScreen"} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/pause/providers/missionObjectives.lua`.*

# `ui_lightRunnerSelector_general`

*File: `lua/ge/extensions/ui/lightRunnerSelector/general.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_lightRunnerSelector_general`: `extensions.load("ui_lightRunnerSelector_general")`, then the global `ui_lightRunnerSelector_general`

Grid selector backend for the LightRunner Vue wizard. It reuses the same levels/tracks as the quick race (scenario_quickRaceLoader): only the vehicle selection is restricted (powerglow-compatible car/truck), elsewhere in the vehicle selector's filters. The module simply copies into M all the functions of the backend created by `oneshotRaceSelector/core` with the descriptor `quickRaceTrackDescriptor.build("lightRunnerSelector")`.

## Notes

- The exported functions are those built by createBackend (not listed in the auto page); this file defines nothing else except `dependencies`.

**Dependencies (loaded first):** `scenario_quickRaceLoader`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"scenario_quickRaceLoader"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/lightRunnerSelector/general.lua`.*

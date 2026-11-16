# `ui_quickraceSelector_general`

*File: `lua/ge/extensions/ui/quickraceSelector/general.lua` · VM: Game Engine (GE) · 21 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_quickraceSelector_general`: `extensions.load("ui_quickraceSelector_general")`, then the global `ui_quickraceSelector_general`

Backend of the grid selector of the "Quickrace" Vue wizard: exposes the list of levels and, for each level, its list of tracks. The module contains no logic of its own: it creates a backend with ui/oneshotRaceSelector/core from the shared descriptor quickRaceTrackDescriptor (identifier "quickraceSelector") then copies all its functions into M.

## Notes

- Depends on scenario_quickRaceLoader, loaded beforehand.
- The functions actually exposed are those of createBackend (defined in ui/oneshotRaceSelector/core.lua); they are not visible in this file.

**Dependencies (loaded first):** `scenario_quickRaceLoader`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions to load beforehand: {"scenario_quickRaceLoader"}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/quickraceSelector/general.lua`.*

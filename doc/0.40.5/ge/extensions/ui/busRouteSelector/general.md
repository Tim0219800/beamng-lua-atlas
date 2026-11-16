# `ui_busRouteSelector_general`

*File: `lua/ge/extensions/ui/busRouteSelector/general.lua` · VM: Game Engine (GE) · 114 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_busRouteSelector_general`: `extensions.load("ui_busRouteSelector_general")`, then the global `ui_busRouteSelector_general`

Grid selector backend of the "BusRoute" Vue wizard. Describes via a descriptor the levels that have bus routes (scenario_scenariosLoader.getLevels('bus')) and, per level, the list of its routes, then delegates to ui/oneshotRaceSelector/core.createBackend(descriptor). All the public functions of the generated backend are copied into M.

## Notes

- Routes have no id field: the route's displayed name (route.name) serves as the key, like the old Angular service BusRouteService for highscores and navigation.
- The file exports no locally written function: the real API (functions copied from the backend) is defined in oneshotRaceSelector/core.
- The descriptor provides level tiles (key levelName, number of routes), route tiles and details panels (level size, number of stops, difficulty, creation date).

**Dependencies (loaded first):** `scenario_scenariosLoader`

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"scenario_scenariosLoader"}: extension loaded before this one. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/busRouteSelector/general.lua`.*

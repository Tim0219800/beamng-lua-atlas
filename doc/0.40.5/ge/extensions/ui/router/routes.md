# `ui_router_routes`

*File: `lua/ge/extensions/ui/router/routes.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes`: `extensions.load("ui_router_routes")`, then the global `ui_router_routes`

Root registry of the UI router routes: the single explicit entry point for registering top-level route families. Each `{ include = "name" }` entry mounts the routes/name.lua module (Root + Children). There is no automatic filesystem discovery: a module is registered only if it is listed here (or added at runtime via routeManager.addVueRoutes / registerModRoutes). Read by routeManager.

## Notes

- Global.include designates the module of single-segment global routes (play, /mainmenu...), here "global".
- The list contains "livery" although no routes/livery.lua file is present in 0.40.5; only "liveries" exists. This entry is ignored with a warning.

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table[] | List of `{ include = "module" }` entries: bigmap, campaign, career, debug, default, firstDrive, freeroamLevels, freeroamWizard, garage, legal, livery, liveries, menu, mission, mods, multiseat, multiplayer, options, pause, radial, scenario, taxi, trackBuilder. |
| `Global` | table | `{ include = "global" }`: module of flat global routes (play, /mainmenu, etc.). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes.lua`.*

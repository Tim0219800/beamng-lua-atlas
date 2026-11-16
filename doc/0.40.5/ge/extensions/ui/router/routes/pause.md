# `ui_router_routes_pause`

*File: `lua/ge/extensions/ui/router/routes/pause.lua` · VM: Game Engine (GE) · 1498 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routes_pause`: `extensions.load("ui_router_routes_pause")`, then the global `ui_router_routes_pause`

Pause menu routes (Vue), the largest module: root pause screen (back via pauseExitHandler) with left/right/bottom rails, then system, hudApps (layout editor), career (branches, missions, history, logbook), milestones, vehicleDetails, multiseat (settings, game modes, vehicle selector), vehicleSelector, stats, vehicle (combined configuration, save, mirrors, selector, details), manageVehicles, photomode (overlay > edit > adjust), freeroamselector, environment, replay, plus included subtrees (mods, bigmap, options, multiplayer, freeroamLevels). Almost all children use the hooks ui_pause_routeLifecycleCallbacks.onPauseEnter/onPauseMount/onPauseLeave.

## Notes

- Route configuration module: it exports no function. routeManager reads it (via the ui_router_routes_<name> extension) when routes.lua includes it with `{ include = "<name>" }`.
- The keys of `Children` form the segments of the dotted name: "<module>.<child>". `children` (lowercase) in a node designates its sub-routes; `include` mounts another module there.
- `ui` is inherited by child routes (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause): a child redefines it only for what changes.
- Code comment: without onLeave, the physics pause request of ui_pause_home_tab stays stuck; this is why the mods children receive the pause lifecycle.
- Some children keep screenIds from other families (career.milestones, bigmap.bigmapMenu, freeroamselector).

## Fields

| Field | Type | Description |
|---|---|---|
| `Children` | table<string, table> | See the module summary. Includes: mods (with backTarget pause.system and modsPauseLifecycle on each child), bigmap (onLeave onPauseBigmapLeave), options, multiplayer, freeroamLevels. |
| `ModuleName` | string | Name of the routes module (first segment of the dotted name). |
| `Root` | table | {screenId = "pause", title = "ui.environment.pause", back = handler pauseExitHandler, hooks onPauseEnter/Mount/Leave, targetScope "pause-left-rails", scopeTree pause-root > (pause-left-rails, pause-right-rails, pause-bottom-rails, menu-content-card-1), ui = Vue only, topBar hidden} |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routes/pause.lua`.*

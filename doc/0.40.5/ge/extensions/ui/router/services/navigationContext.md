# `ui_router_services_navigationContext`

*File: `lua/ge/extensions/ui/router/services/navigationContext.lua` · VM: Game Engine (GE) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_services_navigationContext`: `extensions.load("ui_router_services_navigationContext")`, then the global `ui_router_services_navigationContext`

Builds the UI router navigation context: a snapshot of the game state (career, garage, mission, scenario, multiplayer, multiseat, first drive, freeroam tutorial, big map allowed or not) and the current mode. Each read is protected by pcall, so a missing game module simply gives false/nil. Used for route decisions (screens, context decorators).

## Notes

- Priority of the `mode` field: multiplayer, mission, scenario, garage, career, freeroamTutorial, multiseatGamemode, otherwise freeroam.
- isMultiseatActive is true if multiseat, freeroam multiseat or several players are active.
- The action tested for the big map is "toggleBigMap" (core_input_actionFilter).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras)` | Extends getContext() with the navigation kind, extras and {name, params, meta} summaries of the destination and source routes. | 77 |
| `ui_router_services_navigationContext.getContext()` | Returns the context table: isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode. | 31 |

### Parameter details

#### `ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras)`

Extends getContext() with the navigation kind, extras and {name, params, meta} summaries of the destination and source routes.

- `toRoute` (*table|nil*) : Destination route.
- `fromRoute` (*table|nil*) : Origin route.
- `kind` (*string*) : Kind of navigation (inferred from code: passed through as is in context.kind).
- `extras` (*table|nil*) : Extra data (default {}).
- **returns**: table Context with kind, extras, toRoute, fromRoute.

#### `ui_router_services_navigationContext.getContext()`

Returns the context table: isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode.

- **returns**: table Current context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/services/navigationContext.lua`.*

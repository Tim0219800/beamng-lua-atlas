# `ui_router_managers_frameworkManager`

*File: `lua/ge/extensions/ui/router/managers/frameworkManager.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_managers_frameworkManager`: `extensions.load("ui_router_managers_frameworkManager")`, then the global `ui_router_managers_frameworkManager`

Outgoing bridge from the Lua router to the UI frameworks (Vue, Angular) via guihooks. It emits the route change events (start, end, cancellation) and keeps no state: transition state, progress, timeouts and acknowledgment validation are in transitionManager.lua and router.lua.

## Notes

- When a transitionId is provided, a shallow copy of the payload is emitted with transitionId added: the original navigation entry is never modified. Existing fields (request, resolved, origin, toRoute, fromRoute, routeNode) are kept.
- Emitted GUI events: ui_router_routeChange, ui_router_afterRouteChange (Constants.RouterHooks.AFTER_ROUTE_CHANGE), ui_router_routeChangeCancelled (ROUTE_CHANGE_CANCELLED).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_managers_frameworkManager.sendRouteChange(data, transitionId)` | Emits the GUI event ui_router_routeChange to ask the framework to display the route. | 31 |
| `ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras)` | Emits the GUI event ui_router_routeChangeCancelled. If extras contains transitionId or reason, a copy of the route is emitted with these fields so that the UI clears only the matching handoff. | 57 |
| `ui_router_managers_frameworkManager.sendRouteChangeComplete(data)` | Emits the GUI event ui_router_afterRouteChange with the committed navigation entry. | 43 |

### Parameter details

#### `ui_router_managers_frameworkManager.sendRouteChange(data, transitionId)`

Emits the GUI event ui_router_routeChange to ask the framework to display the route.

- `data` (*table*) : Navigation entry (treated as immutable).
- `transitionId` (*string|nil*) : Transition identifier to attach to the payload (copy).

#### `ui_router_managers_frameworkManager.sendRouteChangeCancelled(data, extras)`

Emits the GUI event ui_router_routeChangeCancelled. If extras contains transitionId or reason, a copy of the route is emitted with these fields so that the UI clears only the matching handoff.

- `data` (*table|nil*) : Cancelled route (toRoute), treated as immutable.
- `extras` (*table|nil*) : {transitionId?, reason?}.

#### `ui_router_managers_frameworkManager.sendRouteChangeComplete(data)`

Emits the GUI event ui_router_afterRouteChange with the committed navigation entry.

- `data` (*table*) : Current committed entry.

**UI events (guihooks.trigger):** `ui_router_`, `ui_router_routeChange`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/managers/frameworkManager.lua`.*

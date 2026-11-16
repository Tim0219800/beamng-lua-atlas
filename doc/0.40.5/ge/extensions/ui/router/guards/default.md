# `ui_router_guards_default`

*File: `lua/ge/extensions/ui/router/guards/default.lua` · VM: Game Engine (GE) · 55 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_guards_default`: `extensions.load("ui_router_guards_default")`, then the global `ui_router_guards_default`

Three "default" navigation guards of the router: navigation logging, blocking if the transition timeout is reached, blocking if a transition is already in progress (unless context.settings.force). Each receives (lifecycleName, context) and returns {result=boolean, context=...}.

## Notes

- This module does not export an M.guards table: GuardManager.reloadGuards therefore does not register them, and GuardManager.executeGuards calls the guards with (route, params, context), a different signature from this one (lifecycleName, context). These functions seem to be an unconnected leftover in the current router (inferred from code).
- handleTimeoutGuard calls TransitionManager.isTimeoutReached; the context receives reason="timeout_reached" or "transition_in_progress" when blocking.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_guards_default.handleTimeoutGuard(lifecycleName, context)` | Blocks the navigation if TransitionManager.isTimeoutReached() is true (context.reason = "timeout_reached"). | 16 |
| `ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context)` | Allows if no transition is in progress or if context.settings.force is true; otherwise blocks with context.reason = "transition_in_progress". | 34 |
| `ui_router_guards_default.logNavigationGuard(lifecycleName, context)` | Logs (debug level) "Navigation: <context.to.name>" and always allows. | 8 |

### Parameter details

#### `ui_router_guards_default.handleTimeoutGuard(lifecycleName, context)`

Blocks the navigation if TransitionManager.isTimeoutReached() is true (context.reason = "timeout_reached").

- `lifecycleName` (*string*) : Step name (unused).
- `context` (*table*) : Navigation context, modified (reason).
- **returns**: table {result=false|true, context=context}.

#### `ui_router_guards_default.handleTransitionStateGuard(lifecycleName, context)`

Allows if no transition is in progress or if context.settings.force is true; otherwise blocks with context.reason = "transition_in_progress".

- `lifecycleName` (*string*) : Step name (unused).
- `context` (*table*) : Context with context.settings.force.
- **returns**: table {result=boolean, context=context}.

#### `ui_router_guards_default.logNavigationGuard(lifecycleName, context)`

Logs (debug level) "Navigation: <context.to.name>" and always allows.

- `lifecycleName` (*string*) : Name of the lifecycle step (unused).
- `context` (*table*) : Navigation context with context.to.name.
- **returns**: table {result=true, context=context}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/guards/default.lua`.*

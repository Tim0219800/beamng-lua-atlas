# `ui_router_lifecycleExecutor`

*File: `lua/ge/extensions/ui/router/lifecycleExecutor.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_lifecycleExecutor`: `extensions.load("ui_router_lifecycleExecutor")`, then the global `ui_router_lifecycleExecutor`

Runs the lifecycle hooks of a route (onEnter, onMount, onLeave...) for the router. It resolves the function reference declared on the route node (via ui/router/utils), calls the hook under pcall with (context, toRoute, fromRoute, data) and logs errors without interrupting the router.

## Notes

- runLifecycleHook returns (ok, error, isHardError). A missing hook counts as a success. A reference resolution error can be "hard" (isHard, defined by Utils.resolveFunctionReference): the router then aborts the navigation (lifecycle_hook_error); an exception thrown in the hook is never hard.
- Empty error messages are replaced by "unknown_error".

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_lifecycleExecutor.resolveHook(route, hookName)` | Resolves the hook function hookName on the route node (via Utils.resolveFunctionReference, with a label "Lifecycle hook X on route Y"). Returns nil, nil, nil if the route or the hook is absent. | 15 |
| `ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data)` | Runs the hook under pcall with (context, toRoute, fromRoute, data); logs errors at level E. | 30 |
| `ui_router_lifecycleExecutor.sanitizeError(err)` | Returns the error if it is a non-empty string, otherwise "unknown_error". | 8 |

### Parameter details

#### `ui_router_lifecycleExecutor.resolveHook(route, hookName)`

Resolves the hook function hookName on the route node (via Utils.resolveFunctionReference, with a label "Lifecycle hook X on route Y"). Returns nil, nil, nil if the route or the hook is absent.

- `route` (*table|nil*) : Route node carrying the hooks.
- `hookName` (*string*) : Hook name: onEnter, onMount, onLeave...
- **returns**: function|nil The resolved function.
- **returns**: string|nil Resolution error message.
- **returns**: boolean|nil true if the resolution error is hard.

#### `ui_router_lifecycleExecutor.runLifecycleHook(route, hookName, context, toRoute, fromRoute, data)`

Runs the hook under pcall with (context, toRoute, fromRoute, data); logs errors at level E.

- `route` (*table|nil*) : Route node carrying the hook.
- `hookName` (*string*) : Hook name.
- `context` (*table*) : Navigation context.
- `toRoute` (*table|nil*) : Destination route.
- `fromRoute` (*table|nil*) : Origin route.
- `data` (*table*) : Route data shared between hooks.
- **returns**: boolean true if the hook is absent or succeeded.
- **returns**: string|nil Error message.
- **returns**: boolean true if the error is hard (invalid resolution).

#### `ui_router_lifecycleExecutor.sanitizeError(err)`

Returns the error if it is a non-empty string, otherwise "unknown_error".

- `err` (*any*) : Raw error.
- **returns**: string Usable error message.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/lifecycleExecutor.lua`.*

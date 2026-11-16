# `ui_gridSelectorRouteLifecycleCallbacks`

*File: `lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua` · VM: Game Engine (GE) · 178 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorRouteLifecycleCallbacks`: `extensions.load("ui_gridSelectorRouteLifecycleCallbacks")`, then the global `ui_gridSelectorRouteLifecycleCallbacks`

Lifecycle callbacks of the UI routes for grid selector screens. On route entry or mount, it computes a snapshot (ui_gridSelector.getSelectorSnapshot) from the route's `meta.gridSelector` config and adds it to `data.gridSelector` (and `data.vehicleSelector` for the vehicleSelector backend). It also relays the onPauseEnter/onPauseMount/onPauseLeave hooks to `ui_pause_routeLifecycleCallbacks` when the route is a pause route.

## Notes

- Per-route config: `route.meta.gridSelector = { backendName, routePath, defaultPath }`. Built-in default only for `pause.vehicleSelector` (backend vehicleSelector, routePath /vehicle-selector-pause, path { keys = { "allModels" } }).
- The path comes from `toRoute.params` (path, keys or pathMatch as a table or an "a/b/c" string), otherwise from the default path.
- Without a valid config, a warning is logged and no snapshot is attached.
- A route is a pause route if its name is `pause`, starts with `pause.` or with `menu.pause`.
- onRouteLeave does not attach a snapshot: it only relays onPauseLeave.

**Dependencies (loaded first):** `ui_gridSelector`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data)` | Called by the UI router when entering a route. Relays onPauseEnter if it is a pause route, then attaches the selector snapshot to `data`. *(internal)* *(hook)* | 163 |
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data)` | Called by the UI router when leaving a route. Only relays onPauseLeave for pause routes. *(internal)* *(hook)* | 173 |
| `ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data)` | Called by the UI router when the route is mounted. Relays onPauseMount if it is a pause route, then attaches the selector snapshot to `data`. *(internal)* *(hook)* | 168 |

### Parameter details

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteEnter(context, toRoute, fromRoute, data)`

Called by the UI router when entering a route. Relays onPauseEnter if it is a pause route, then attaches the selector snapshot to `data`.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Target route (name, params, meta).
- `fromRoute` (*table|nil*) : Route being left.
- `data` (*table*) : Route data table, enriched with gridSelector.

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteLeave(context, toRoute, fromRoute, data)`

Called by the UI router when leaving a route. Only relays onPauseLeave for pause routes.

- `context` (*any*) : Router context.
- `toRoute` (*table|nil*) : Target route.
- `fromRoute` (*table*) : Route being left.
- `data` (*table|nil*) : Route data.

#### `ui_gridSelectorRouteLifecycleCallbacks.onRouteMount(context, toRoute, fromRoute, data)`

Called by the UI router when the route is mounted. Relays onPauseMount if it is a pause route, then attaches the selector snapshot to `data`.

- `context` (*any*) : Router context.
- `toRoute` (*table*) : Target route.
- `fromRoute` (*table|nil*) : Route being left.
- `data` (*table*) : Route data.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Loads ui_gridSelector before this module. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorRouteLifecycleCallbacks.lua`.*

# `ui_garage_routeLifecycleCallbacks`

*File: `lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua` · VM: Game Engine (GE) · 70 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_garage_routeLifecycleCallbacks`: `extensions.load("ui_garage_routeLifecycleCallbacks")`, then the global `ui_garage_routeLifecycleCallbacks`

Lifecycle callbacks for the garage photo mode UI routes. For the "garage.photomode" routes (and "garage.photomode.*"), opens a photomode session with the "garage" profile on entry, attaches the route data provided by ui_pause_providers_routeData_photomode, and closes the session on exit. Other routes are ignored.

## Notes

- Depends on ui_pause_providers_routeData_photomode and ui_pause_photomode (declared in M.dependencies).
- All three hooks call dump(...) to log the route name (debug traces left in the code).
- onPhotomodeLeave has no route name filter: it calls onPhotomodeRouteLeave and endPhotomodeSession for any exit notified to it.

**Dependencies (loaded first):** `ui_pause_providers_routeData_photomode`, `ui_pause_photomode`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)` | Hook called when the UI enters a photomode route. If the route is garage.photomode[.*]: starts the photomode session ("garage" profile), adds data.photomode and notifies onPhotomodeRouteEnter. *(internal)* *(hook)* | 35 |
| `ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)` | Hook called when leaving the route: notifies onPhotomodeRouteLeave then ends the photomode session (endPhotomodeSession). *(internal)* *(hook)* | 57 |
| `ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)` | Hook called when the route is mounted: adds data.photomode if the route is garage.photomode[.*]. *(internal)* *(hook)* | 52 |

### Parameter details

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)`

Hook called when the UI enters a photomode route. If the route is garage.photomode[.*]: starts the photomode session ("garage" profile), adds data.photomode and notifies onPhotomodeRouteEnter.

- `context` (*table*) : Route change context (unused).
- `toRoute` (*table*) : Target route; only the name field is read.
- `fromRoute` (*table|nil*) : Previous route (unused).
- `data` (*table*) : Route data, enriched with photomode.

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)`

Hook called when leaving the route: notifies onPhotomodeRouteLeave then ends the photomode session (endPhotomodeSession).

- `context` (*table*) : Route change context (unused).
- `toRoute` (*table|nil*) : Destination route; name passed to onPhotomodeRouteLeave.
- `fromRoute` (*table|nil*) : Route being left (used for the log).
- `data` (*table*) : Route data (not used).

#### `ui_garage_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)`

Hook called when the route is mounted: adds data.photomode if the route is garage.photomode[.*].

- `context` (*table*) : Route change context (unused).
- `toRoute` (*table*) : Target route; only name is read.
- `fromRoute` (*table|nil*) : Previous route (unused).
- `data` (*table*) : Route data, enriched with photomode.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before: ui_pause_providers_routeData_photomode, ui_pause_photomode. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/garage/routeLifecycleCallbacks.lua`.*

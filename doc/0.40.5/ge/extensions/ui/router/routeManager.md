# `ui_router_routeManager`

*File: `lua/ge/extensions/ui/router/routeManager.lua` · VM: Game Engine (GE) · 748 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeManager`: `extensions.load("ui_router_routeManager")`, then the global `ui_router_routeManager`

UI router route manager. It builds the route tree from the root registry (routes.lua), the modules in the routes/ folder (via `include`), then overlays the runtime routes (synchronized Vue routes or routes registered by mods). It resolves a route by its dotted name (e.g. "menu.options"), applies `ui` configuration inheritance, computes the back target (`backTarget`) and reconciles the active route when routes change. A modder mainly uses it through registerModRoutes / unregisterModRoutes.

## Example

```lua
local res = extensions.ui_router_routeManager.registerModRoutes("monMod", {
  { name = "monMod", meta = { uiTypes = {"vue"} } }
})
if not res.success then dump(res.errors) end
-- later
extensions.ui_router_routeManager.unregisterModRoutes("monMod")
```

## Notes

- Route names are dotted: the first segment designates the module (file in routes/), the following ones the children. A single-segment name is first looked up in the "global" module (flat routes).
- registerModRoutes/unregisterModRoutes are transactional: if parsing fails, the previous state is kept and `result.success` is false with `result.errors`.
- For the same route name, the source registered last wins, with no composition (see runtimeRouteRegistry).
- After a change, the active route is reloaded (`ui_router.reload`) if its config changed, or the router switches to `fallbackRoute`/"pause" (if a mission is loaded)/"menu" if it disappeared.
- Relative references (resolveRouteName) use '.' and '..' separated by '/', e.g. "./child", "../sibling".
- addModule (internal): addRuntimeModule calls dump() for each synthesized module, which pollutes the console.
- routes.lua declares `include = "livery"` but no routes/livery.lua file exists: the entry is ignored with a warning "Included route module ... not found or cyclic".
- Minor bug: if the routes/<module>.lua file exists but the matching extension fails to load, findModule indexes `mod.Children` on nil (error).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeManager.addVueRoutes(routesObject)` | Vue synchronization (dev/HMR): registers the raw route array in the reserved source "__vueSync". No reconciliation of the active route. Errors are logged. | 588 |
| `ui_router_routeManager.getAllRoutes()` | Returns the list (without duplicates) of all known route names: registered trees (except modules marked ExcludeFromDiscovery), global routes and effective runtime routes. | 342 |
| `ui_router_routeManager.getModuleDecorator(routeName)` | Returns the `ContextDecorator` of the route's module, or by default { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }. | 597 |
| `ui_router_routeManager.getRoute(routeKey)` | Returns the full configuration of a route (copy): `ui` inheritance applied, `name`, computed `backTarget` (non-abstract parent route, or fallbackTarget) and `screenId` (defaults to the name). Returns nil if the route does not exist. | 539 |
| `ui_router_routeManager.getRouteNodes(routeName)` | Returns the list of nodes from the root down to the requested route, each with `key` and `routeName`. | 553 |
| `ui_router_routeManager.registerModRoutes(sourceId, routes, options)` | Registers (or replaces) the routes of a source, rebuilds the runtime state then reconciles the active route (reload or fallback). | 696 |
| `ui_router_routeManager.removeRuntimeRoutes()` | Removes only the "__vueSync" source; sources registered by mods remain. No reconciliation. | 611 |
| `ui_router_routeManager.resolveAllRoutes()` | Clears the cache and rebuilds all route modules: reads the global module declared in routes.lua (`Global.include`), the root modules and the runtime modules. *(internal)* | 722 |
| `ui_router_routeManager.resolveRouteName(reference, baseRouteName)` | Resolves a possibly relative reference against a base route. References that do not start with '.' are returned as is. | 452 |
| `ui_router_routeManager.unregisterModRoutes(sourceId, options)` | Removes a source from the registry, rebuilds the state and reconciles the active route. Removing an unknown source succeeds with existed=false. | 709 |

### Parameter details

#### `ui_router_routeManager.addVueRoutes(routesObject)`

Vue synchronization (dev/HMR): registers the raw route array in the reserved source "__vueSync". No reconciliation of the active route. Errors are logged.

- `routesObject` (*table*) : Raw Vue route array.

#### `ui_router_routeManager.getAllRoutes()`

Returns the list (without duplicates) of all known route names: registered trees (except modules marked ExcludeFromDiscovery), global routes and effective runtime routes.

- **returns**: string[] Dotted route names.

#### `ui_router_routeManager.getModuleDecorator(routeName)`

Returns the `ContextDecorator` of the route's module, or by default { mode = "dynamic", source = Config.ContextDecoratorDefaultSource }.

- `routeName` (*string*) : Dotted name of the route.
- **returns**: table Context decorator.

#### `ui_router_routeManager.getRoute(routeKey)`

Returns the full configuration of a route (copy): `ui` inheritance applied, `name`, computed `backTarget` (non-abstract parent route, or fallbackTarget) and `screenId` (defaults to the name). Returns nil if the route does not exist.

- `routeKey` (*string*) : Dotted name of the route.
- **returns**: table|nil Route config.

#### `ui_router_routeManager.getRouteNodes(routeName)`

Returns the list of nodes from the root down to the requested route, each with `key` and `routeName`.

- `routeName` (*string*) : Dotted name of the route.
- **returns**: table[]|nil Nodes, or nil if a segment is not found.

#### `ui_router_routeManager.registerModRoutes(sourceId, routes, options)`

Registers (or replaces) the routes of a source, rebuilds the runtime state then reconciles the active route (reload or fallback).

- `sourceId` (*string*) : Non-empty identifier of the source (e.g. mod name).
- `routes` (*table*) : Route array in Vue format (name, meta, children...).
- `options` (*table|nil*) : `fallbackRoute`: fallback route if the active route disappears.
- **returns**: table {success, sourceId, isNew, names, added, removed, changed, reconciliation} or {success=false, errors}. reconciliation = {performed, action = none|fallback|reload, routeName, success, reason}.

#### `ui_router_routeManager.resolveRouteName(reference, baseRouteName)`

Resolves a possibly relative reference against a base route. References that do not start with '.' are returned as is.

- `reference` (*string*) : Absolute or relative reference ("./x", "../x").
- `baseRouteName` (*string|nil*) : Base route (required for a relative reference).
- **returns**: string|nil Resolved name, or nil on failure.
- **returns**: string|nil Failure reason: "invalid_relative_route" or "relative_route_without_base".

#### `ui_router_routeManager.unregisterModRoutes(sourceId, options)`

Removes a source from the registry, rebuilds the state and reconciles the active route. Removing an unknown source succeeds with existed=false.

- `sourceId` (*string*) : Source identifier.
- `options` (*table|nil*) : `fallbackRoute`, as for registerModRoutes.
- **returns**: table Registry result + `reconciliation`.

## Fields

| Field | Type | Description |
|---|---|---|
| `RegisteredRoutes` | table<string, table> | Cache of the resolved route trees by module name. Cleared by invalidateCache and rebuilt by resolveAllRoutes. |
| `RuntimeRouteModules` | table<string, table> | Modules synthesized for route families that exist only at runtime (no file in routes/). |
| `RuntimeRoutes` | table<string, table> | Route name -> winning definition coming from the runtime registry; overlaid on the static tree. |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeManager.lua`.*

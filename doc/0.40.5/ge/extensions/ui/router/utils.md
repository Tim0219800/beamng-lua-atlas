# `ui_router_utils`

*File: `lua/ge/extensions/ui/router/utils.lua` · VM: Game Engine (GE) · 166 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_utils`: `extensions.load("ui_router_utils")`, then the global `ui_router_utils`

Small UI router utilities: detection and resolution of relative route names (Angular "^." and Vue "./", "../" styles), deep table merging and resolution of a "module.func" function reference into a callable Lua function. Used by the router and its services.

## Notes

- The code itself flags (TODO) that the relative resolution functions should be cleaned up or removed; routeManager.resolveRouteName is the newer version.
- resolveFunctionReference loads the extension on the fly: `extensions[moduleName]` triggers automatic loading.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_utils.deepMerge(target, source)` | Recursively merges `source` into `target` (modified in place): common tables are merged, other values are overwritten by those from source. If source is not a table, returns source (or target if source is nil). | 101 |
| `ui_router_utils.isRelativeRoute(route)` | Returns whether the route name is relative: starts with '^' (Angular) or '.' (Vue). | 5 |
| `ui_router_utils.resolveFunctionReference(reference, contextLabel)` | Resolves a "module.func" string (split at the last dot) into a function of the matching extension. | 123 |
| `ui_router_utils.resolveRelativeRoute(route, currentState)` | Converts a relative route into a dotted absolute name relative to the current state. "^^.x" or "../../x" go up n levels; "./x" stays at the same level (adds a child); '/' become '.'. An absolute route is returned as is. | 23 |

### Parameter details

#### `ui_router_utils.deepMerge(target, source)`

Recursively merges `source` into `target` (modified in place): common tables are merged, other values are overwritten by those from source. If source is not a table, returns source (or target if source is nil).

- `target` (*table*) : Table to modify.
- `source` (*table*) : Table to merge.
- **returns**: table The merged target table.

#### `ui_router_utils.isRelativeRoute(route)`

Returns whether the route name is relative: starts with '^' (Angular) or '.' (Vue).

- `route` (*string|any*) : Road name.
- **returns**: boolean true if relative; false for a non-string.

#### `ui_router_utils.resolveFunctionReference(reference, contextLabel)`

Resolves a "module.func" string (split at the last dot) into a function of the matching extension.

- `reference` (*string|nil*) : "module.func" reference; nil gives three nils.
- `contextLabel` (*string|nil*) : Label used in error messages (default "Function reference").
- **returns**: function|nil The function found.
- **returns**: string|nil Error message.
- **returns**: boolean|nil true on error.

#### `ui_router_utils.resolveRelativeRoute(route, currentState)`

Converts a relative route into a dotted absolute name relative to the current state. "^^.x" or "../../x" go up n levels; "./x" stays at the same level (adds a child); '/' become '.'. An absolute route is returned as is.

- `route` (*string*) : Relative or absolute route.
- `currentState` (*string*) : Dotted name of the current route.
- **returns**: string Resolved dotted name.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/utils.lua`.*

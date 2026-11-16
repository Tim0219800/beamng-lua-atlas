# `ui_router_runtimeRouteRegistry`

*File: `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua` · VM: Game Engine (GE) · 434 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_runtimeRouteRegistry`: `extensions.load("ui_router_runtimeRouteRegistry")`, then the global `ui_router_runtimeRouteRegistry`

Pure registry of runtime routes and parser of raw Vue routes, with no game-side effects. It turns a Vue route array into router configuration overrides and remembers which source owns each route name. routeManager consumes its "winners" to overlay them on the static Lua tree. Each instance (M.new()) keeps snapshots per sourceId, a stable registration order and per-name derivation (the most recent source wins, no composition).

## Notes

- Parsing is transactional: an invalid array is rejected as a whole and never replaces the source's previous snapshot.
- Meta fields carried over into the `ui` block: uiTypes, uiTypesFilter, infoBar, topBar, uiApps, triggerPause, uiNav. By default a runtime route has ui.uiTypes = {"vue"}, uiTypesFilter = only and runtime = true.
- meta.luaRoute can only override: screenId, title, abstract, scopeTree, backTarget, fallbackTarget, back, onEnter, onMount, onLeave, ui. Any other key is ignored with a warning.
- onEnter/onMount/onLeave must be "module.func" strings. backTarget and fallbackTarget cannot coexist.
- `name` can be a string or an array of strings (aliases); a node without a name serves only as a grouping but its `children` are traversed. A duplicate name within the same source is an error.
- A new sourceId takes the last priority rank; re-registering a source keeps its rank.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_runtimeRouteRegistry.isValidHookRef(ref)` | Checks that a hook reference is a "module.func" string (split at the last dot, two non-empty parts). | 44 |
| `ui_router_runtimeRouteRegistry.new()` | Creates an isolated registry instance (routeManager holds one; tests create as many as needed). Instance methods: register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} or {success=false, errors}; unregister(sourceId) -> {success, existed, added, removed, changed}; getEffectiveRoutes(); getEffectiveNames() (sorted); getRoute(name); getRouteSource(name); hasRoute(name); hasSource(sourceId); getSourceOrder(); clear(). | 389 |
| `ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes)` | Parses a raw Vue route array into an ordered list of names and a name -> configuration override table. Descends into the `children` of named or unnamed nodes. Any error rejects the whole. | 155 |

### Parameter details

#### `ui_router_runtimeRouteRegistry.isValidHookRef(ref)`

Checks that a hook reference is a "module.func" string (split at the last dot, two non-empty parts).

- `ref` (*string|any*) : Reference to test.
- **returns**: boolean true if valid.

#### `ui_router_runtimeRouteRegistry.new()`

Creates an isolated registry instance (routeManager holds one; tests create as many as needed). Instance methods: register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} or {success=false, errors}; unregister(sourceId) -> {success, existed, added, removed, changed}; getEffectiveRoutes(); getEffectiveNames() (sorted); getRoute(name); getRouteSource(name); hasRoute(name); hasSource(sourceId); getSourceOrder(); clear().

- **returns**: table Registry instance.

#### `ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes)`

Parses a raw Vue route array into an ordered list of names and a name -> configuration override table. Descends into the `children` of named or unnamed nodes. Any error rejects the whole.

- `rawRoutes` (*table*) : Vue route array (name, meta, children).
- **returns**: table { ok = boolean, errors = string[], names = string[], definitions = table<string, table> }

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua`.*

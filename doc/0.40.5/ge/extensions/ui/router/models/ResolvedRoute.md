# `ui_router_models_ResolvedRoute`

*File: `lua/ge/extensions/ui/router/models/ResolvedRoute.lua` · VM: Game Engine (GE) · 195 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_models_ResolvedRoute`: `extensions.load("ui_router_models_ResolvedRoute")`, then the global `ui_router_models_ResolvedRoute`

Builds the canonical navigation entry (NavigationEntry) used everywhere in the router: {request, resolved, origin, toRoute, fromRoute, routeNode}. Once created, the entry is to be treated as immutable. Also provides the conversion to a storable/serializable form (without functions) and its validation.

## Notes

- request = {name, fullRoute, params, query, options}; resolved = copy of the route configuration without children, onEnter, onMount, onLeave or functions, plus name, params, query and the extras (breadcrumbs, scope...). resolved.ui defaults to uiTypes {"angular", "vue"} and uiTypesFilter any.
- request.params contains only the real screen parameters; the router's control keys (preferredScope, decorator, showDecorator...) stay in request.options so that reload/back can find them.
- routeNode references the original route configuration (with its hooks); it is neither serialized nor restored (nil after fromStorable).
- validate requires request.name (string), resolved.name (string), resolved.screenId (non-empty string) and resolved.ui.uiTypes (array).
- Deprecated aliases kept: createNew (does nothing), create, toMinimal.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName)` | Deprecated alias: creates a request then the resolved route (moduleName added as extra). | 179 |
| `ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry)` | Creates the full navigation entry, with origin = {route = name of the previous request} if a previous entry exists. | 90 |
| `ui_router_models_ResolvedRoute.createNew()` | Deprecated alias, does nothing. | 176 |
| `ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute)` | Creates the navigation request. | 41 |
| `ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras)` | Builds the resolved route from the route configuration, the request and extras (copy without hooks or functions). | 53 |
| `ui_router_models_ResolvedRoute.fromStorable(data)` | Rebuilds an entry from stored data (routeNode = nil; toRoute recomputed if absent). | 129 |
| `ui_router_models_ResolvedRoute.toCompatRoute(resolved)` | Reduced compatibility view of a resolved route. | 80 |
| `ui_router_models_ResolvedRoute.toMinimal(route)` | Deprecated alias: minimal view {name, params, query}. | 186 |
| `ui_router_models_ResolvedRoute.toStorable(entry)` | Copies the entry removing the functions from resolved and the routeNode, for serialization. | 108 |
| `ui_router_models_ResolvedRoute.validate(entry)` | Validates the structure of a navigation entry. | 141 |

### Parameter details

#### `ui_router_models_ResolvedRoute.create(config, name, params, query, moduleName)`

Deprecated alias: creates a request then the resolved route (moduleName added as extra).

- `config` (*table*) : Route configuration.
- `name` (*string*) : Road name.
- `params` (*table|nil*) : Parameters.
- `query` (*table|nil*) : Request.
- `moduleName` (*string|nil*) : Module name.
- **returns**: table Resolved route.

#### `ui_router_models_ResolvedRoute.createEntry(routeConfig, request, extras, previousEntry)`

Creates the full navigation entry, with origin = {route = name of the previous request} if a previous entry exists.

- `routeConfig` (*table*) : Route configuration (becomes routeNode).
- `request` (*table*) : Request.
- `extras` (*table|nil*) : Extras for resolved.
- `previousEntry` (*table|nil*) : Previous entry.
- **returns**: table {request, resolved, origin, toRoute, fromRoute, routeNode}.

#### `ui_router_models_ResolvedRoute.createRequest(name, params, query, options, fullRoute)`

Creates the navigation request.

- `name` (*string*) : Canonical route name.
- `params` (*table|nil*) : Parameters ({} by default).
- `query` (*table|nil*) : Query parameters ({} by default).
- `options` (*table|nil*) : Navigation options ({} by default).
- `fullRoute` (*string|nil*) : Full reference base[:scope]; otherwise the canonical name.
- **returns**: table {name, fullRoute, params, query, options}.

#### `ui_router_models_ResolvedRoute.createResolved(routeConfig, request, extras)`

Builds the resolved route from the route configuration, the request and extras (copy without hooks or functions).

- `routeConfig` (*table|nil*) : Route configuration.
- `request` (*table*) : Request (name, params, query).
- `extras` (*table|nil*) : Fields added into resolved (breadcrumbs, scope...).
- **returns**: table Resolved route.

#### `ui_router_models_ResolvedRoute.fromStorable(data)`

Rebuilds an entry from stored data (routeNode = nil; toRoute recomputed if absent).

- `data` (*table|nil*) : Data produced by toStorable.
- **returns**: table|nil Navigation entry.

#### `ui_router_models_ResolvedRoute.toCompatRoute(resolved)`

Reduced compatibility view of a resolved route.

- `resolved` (*table|nil*) : Resolved route.
- **returns**: table|nil {name, screenId (or name), params, meta} or nil.

#### `ui_router_models_ResolvedRoute.toMinimal(route)`

Deprecated alias: minimal view {name, params, query}.

- `route` (*table*) : Road.
- **returns**: table {name, params, query}.

#### `ui_router_models_ResolvedRoute.toStorable(entry)`

Copies the entry removing the functions from resolved and the routeNode, for serialization.

- `entry` (*table|nil*) : Navigation entry.
- **returns**: table|nil {request, resolved, origin, toRoute, fromRoute}.

#### `ui_router_models_ResolvedRoute.validate(entry)`

Validates the structure of a navigation entry.

- `entry` (*table|nil*) : Entry to validate.
- **returns**: boolean true if valid.
- **returns**: string[] List of errors.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/models/ResolvedRoute.lua`.*

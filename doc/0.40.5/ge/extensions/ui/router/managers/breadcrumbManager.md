# `ui_router_managers_breadcrumbManager`

*File: `lua/ge/extensions/ui/router/managers/breadcrumbManager.lua` · VM: Game Engine (GE) · 105 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_managers_breadcrumbManager`: `extensions.load("ui_router_managers_breadcrumbManager")`, then the global `ui_router_managers_breadcrumbManager`

Builds a route's breadcrumb for the router. For a non-global route, it optionally adds a module decorator at the head, then one crumb per node of the route chain (label, abstract, isMinorRoute, routeName, params). Titles can be static (string or non-dynamic table) or dynamic (source function called with the parameters, with fallback value).

## Notes

- A dynamic title: {mode="dynamic", source=<function reference>, paramKey?, fallback?}. If paramKey is set, only params[paramKey] is passed to the source, otherwise the whole params table. A nil or empty value gives fallback.
- The decorator: the one provided, otherwise (if visible) the module's configuration via ui_router_routeManager.getModuleDecorator, in dynamic mode (source called with params, fallback config.fallback) or static ({label}). It is added as the first crumb with decorator=true and routeName=nil.
- A route with global = true has no crumb.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator)` | Builds the list of crumbs for a route: optional decorator then one crumb per node returned by ui_router_routeManager.getRouteNodes(routename). | 72 |
| `ui_router_managers_breadcrumbManager.isDecoratorVisible()` | Indicates whether the decorator is visible (NavigationState.isDecoratorVisible). | 100 |
| `ui_router_managers_breadcrumbManager.setDecoratorVisible(visible)` | Shows or hides the decorator in the breadcrumb (delegates to NavigationState.setDecoratorVisible). | 96 |

### Parameter details

#### `ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator)`

Builds the list of crumbs for a route: optional decorator then one crumb per node returned by ui_router_routeManager.getRouteNodes(routename).

- `routename` (*string*) : Base route name.
- `route` (*table*) : Route configuration (route.global disables the breadcrumb).
- `params` (*table|nil*) : Route parameters (used for dynamic titles).
- `decorator` (*any|nil*) : Already resolved decorator (otherwise computed if the decorator is visible).
- **returns**: table[] Crumbs {label, abstract, isMinorRoute, routeName, params}; the decorator is {label, routeName=nil, decorator=true}.

#### `ui_router_managers_breadcrumbManager.isDecoratorVisible()`

Indicates whether the decorator is visible (NavigationState.isDecoratorVisible).

- **returns**: boolean true if visible.

#### `ui_router_managers_breadcrumbManager.setDecoratorVisible(visible)`

Shows or hides the decorator in the breadcrumb (delegates to NavigationState.setDecoratorVisible).

- `visible` (*boolean*) : true to show.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/managers/breadcrumbManager.lua`.*

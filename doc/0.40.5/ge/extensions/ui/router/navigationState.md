# `ui_router_navigationState`

*File: `lua/ge/extensions/ui/router/navigationState.lua` · VM: Game Engine (GE) · 176 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_navigationState`: `extensions.load("ui_router_navigationState")`, then the global `ui_router_navigationState`

State memory of the UI router: previous entry, current entry and pending entry, breadcrumb decorator state, and last active scope per route. It provides the accessors, the promotion of a pending entry to current entry, serialization (to survive Lua extensions reload) and reset. No navigation logic: the router decides.

## Notes

- promotePendingEntry shifts: previous = current, current = pending, pending = nil. clearPendingEntry drops the pending entry (timeout, rejection, cancellation, preemption).
- The "Compatibility shims" functions (getCurrentResolved, getCurrentRouteNode, getPendingRouteNode, getBreadcrumbs, setPendingState, promotePendingStates, setRequest) keep the return shapes of the old API; setRequest does nothing. Note: getCurrentResolved returns the full entry (currentEntry) and not its resolved part.
- The decorator: {value, moduleName, visible}; visible initially equals Config.ShowContextDecoratorInBreadcrumbs.
- serialize/deserialize use ResolvedRoute.toStorable/fromStorable (routeNode and functions not kept). lastActiveScopeByRoute is not serialized.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_navigationState.clearDecorator()` | Resets the decorator (value and module to nil, visibility to the config default). | 132 |
| `ui_router_navigationState.clearLastActiveScope(routeName)` | Forgets a route's last active scope (ignored if routeName is nil). | 26 |
| `ui_router_navigationState.clearPendingEntry()` | Removes the unvalidated pending entry. | 44 |
| `ui_router_navigationState.deserialize(data)` | Restores the state from serialize data (no effect if data is nil). Without a decorator field, the decorator is reset. *(internal)* | 153 |
| `ui_router_navigationState.getBreadcrumbs()` | Returns the breadcrumb of the current entry ({} if none). | 82 |
| `ui_router_navigationState.getCurrentEntry()` | Returns the current (committed) navigation entry. | 54 |
| `ui_router_navigationState.getCurrentResolved()` | Compatibility shortcut: returns the full current entry (see notes). | 70 |
| `ui_router_navigationState.getCurrentRouteNode()` | Returns the route configuration (routeNode, with its hooks) of the current entry. | 74 |
| `ui_router_navigationState.getDecorator()` | Returns the decorator value. | 116 |
| `ui_router_navigationState.getDecoratorModule()` | Returns the decorator's owner module. | 120 |
| `ui_router_navigationState.getLastActiveScope(routeName)` | Returns the last stored active scope for the route. | 22 |
| `ui_router_navigationState.getPendingEntry()` | Returns the pending entry. | 58 |
| `ui_router_navigationState.getPendingRouteNode()` | Returns the routeNode of the pending entry. | 78 |
| `ui_router_navigationState.getPreviousEntry()` | Returns the previous entry. | 62 |
| `ui_router_navigationState.isDecoratorVisible()` | Returns whether the decorator is visible. | 128 |
| `ui_router_navigationState.promotePendingEntry()` | Promotes the pending entry to current entry (the old current becomes previous). | 48 |
| `ui_router_navigationState.promotePendingStates()` | Compatibility shortcut: calls promotePendingEntry. | 95 |
| `ui_router_navigationState.reset()` | Resets the three entries, the last active scopes and the decorator. | 167 |
| `ui_router_navigationState.serialize()` | Serializes the previous/current/pending entries (storable forms) and the decorator. *(internal)* | 140 |
| `ui_router_navigationState.setDecorator(value, moduleName)` | Sets the decorator value and its module. | 111 |
| `ui_router_navigationState.setDecoratorVisible(visible)` | Shows or hides the decorator. | 124 |
| `ui_router_navigationState.setLastActiveScope(routeName, scopeId)` | Stores a route's last active scope. | 18 |
| `ui_router_navigationState.setPendingEntry(entry)` | Sets the navigation entry pending validation by the framework. | 38 |
| `ui_router_navigationState.setPendingState(routeNode, data)` | Compatibility shortcut: builds the pending entry from a routeNode and {request, resolved, origin}. | 86 |
| `ui_router_navigationState.setRequest()` | Compatibility shortcut: does nothing. | 99 |

### Parameter details

#### `ui_router_navigationState.clearLastActiveScope(routeName)`

Forgets a route's last active scope (ignored if routeName is nil).

- `routeName` (*string|nil*) : Road name.

#### `ui_router_navigationState.deserialize(data)`

Restores the state from serialize data (no effect if data is nil). Without a decorator field, the decorator is reset.

- `data` (*table|nil*) : Data produced by serialize.

#### `ui_router_navigationState.getBreadcrumbs()`

Returns the breadcrumb of the current entry ({} if none).

- **returns**: table[] Breadcrumbs.

#### `ui_router_navigationState.getCurrentEntry()`

Returns the current (committed) navigation entry.

- **returns**: table|nil Entry {request, resolved, origin, toRoute, fromRoute, routeNode}.

#### `ui_router_navigationState.getCurrentResolved()`

Compatibility shortcut: returns the full current entry (see notes).

- **returns**: table|nil Current entry.

#### `ui_router_navigationState.getCurrentRouteNode()`

Returns the route configuration (routeNode, with its hooks) of the current entry.

- **returns**: table|nil Route node.

#### `ui_router_navigationState.getDecorator()`

Returns the decorator value.

- **returns**: any Decorator or nil.

#### `ui_router_navigationState.getDecoratorModule()`

Returns the decorator's owner module.

- **returns**: string|nil Module name.

#### `ui_router_navigationState.getLastActiveScope(routeName)`

Returns the last stored active scope for the route.

- `routeName` (*string*) : Road name.
- **returns**: string|nil Scope identifier.

#### `ui_router_navigationState.getPendingEntry()`

Returns the pending entry.

- **returns**: table|nil Pending entry.

#### `ui_router_navigationState.getPendingRouteNode()`

Returns the routeNode of the pending entry.

- **returns**: table|nil Route node.

#### `ui_router_navigationState.getPreviousEntry()`

Returns the previous entry.

- **returns**: table|nil Previous entry.

#### `ui_router_navigationState.isDecoratorVisible()`

Returns whether the decorator is visible.

- **returns**: boolean Visibility.

#### `ui_router_navigationState.serialize()`

Serializes the previous/current/pending entries (storable forms) and the decorator.

- **returns**: table {previousEntry, currentEntry, pendingEntry, decorator={value, moduleName, visible}}.

#### `ui_router_navigationState.setDecorator(value, moduleName)`

Sets the decorator value and its module.

- `value` (*any*) : Decorator value.
- `moduleName` (*string*) : Owner module (first segment of the route name).

#### `ui_router_navigationState.setDecoratorVisible(visible)`

Shows or hides the decorator.

- `visible` (*boolean*) : Visibility.

#### `ui_router_navigationState.setLastActiveScope(routeName, scopeId)`

Stores a route's last active scope.

- `routeName` (*string*) : Road name.
- `scopeId` (*string*) : Scope identifier.

#### `ui_router_navigationState.setPendingEntry(entry)`

Sets the navigation entry pending validation by the framework.

- `entry` (*table*) : Navigation entry.

#### `ui_router_navigationState.setPendingState(routeNode, data)`

Compatibility shortcut: builds the pending entry from a routeNode and {request, resolved, origin}.

- `routeNode` (*table*) : Route node.
- `data` (*table*) : {request, resolved, origin}.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/navigationState.lua`.*

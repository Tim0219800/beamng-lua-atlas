# `ui_router`

*File: `lua/ge/extensions/ui/router.lua` · VM: Game Engine (GE) · 1176 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router`: `extensions.load("ui_router")`, then the global `ui_router`

UI navigation router on the Lua side (ui_router). It orchestrates a "handshake" with the UI frameworks (Vue, Angular/legacy): route resolution, exit/entry guards, lifecycle hooks (onLeave, onEnter, onMount), sending the route change to the framework, then receiving the acknowledgments (received, navigation started, route committed, mounted). It delegates state to the ui/router/* modules (navigationState, transitionManager, frameworkManager, guardManager, scopeManager, breadcrumbManager...). A modder mostly uses it to call navigate/back/reload and to listen to the onUiChangedState and onUiActiveScopeChanged hooks.

## Example

```lua
-- navigate to a route with parameters
local res = ui_router.navigate("mainmenu", {})
if not res.success then log("W", "mod", "failed: " .. tostring(res.reason)) end
-- non-cancellable navigation (protection lock)
ui_router.navigate("photomode", nil, {cancellable = false})
```

## Notes

- Sequence of a navigation: 1) navigate emits the route change (FrameworkManager.sendRouteChange); 2) routeChangeReceived; 3) routeNavigationStarted; 4) routeChangeComplete promotes the pending entry and ends the transition, except for Vue routes which wait for a mount acknowledgment; 5) routeMounted runs onMount and ends the transition.
- For Vue routes, the acknowledgments must return a non-empty transition identifier (otherwise reason="missing_transition_id"). Angular/legacy can do without it and are validated by route name.
- A navigate with options.cancellable == false acquires a lock identified by a unique token ("navProtect_N") that blocks any following navigate/back/reload (reason="active_navigation_not_cancellable") until the terminal state of this navigation (end, cancellation, failure, timeout, reset, deserialization). Otherwise the last navigation wins and cancels the transition in progress (cancellation "navigation_replaced").
- navigate failures return {result=false, success=false, reason=...}: active_navigation_not_cancellable, route_not_found, guard_blocked_exit, guard_blocked_enter, lifecycle_hook_error, navigation_preempted, or the route reference resolution error.
- The route name accepts an enriched reference: relative route resolved against the current route, inline query (?a=1) and scope (:scope). Explicit parameters take precedence over those of the query.
- Emitted hooks: extensions.hook(BEFORE_ROUTE_CHANGE, entry), AFTER_ROUTE_CHANGE, ROUTE_CHANGE_CANCELLED (toRoute, fromRoute, reason, transitionId, plus timeoutClassification/phase/... for a timeout), ROUTE_TIMING (routeName, {total, enter, ready, mountAcked} in ms), onUiChangedState(routeName, originRoute) and onUiActiveScopeChanged(payload). UI event: guihooks ui_router_routeData (namespace, route, fromRoute, scopeTree, scopeParentMap, targetScope, breadcrumbs, data, status, error) with status = enter-ready, mounted-ready or error.
- NavigationObserver (diagnostic) is loaded only if shipping_build ~= true.
- back() returns nothing (nil) if the current route has neither a backTarget nor a valid back handler.
- The extension sets itself to manual unload on load (setExtensionUnloadMode manual) and reloads the guards (GuardManager.reloadGuards).
- Deprecated functions: push, replace (log a warning then call navigate) and forward (returns {result=false, reason="deprecated_method"}). The __test_* functions are access points reserved for tests.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router.__test_getProtectionToken()` | Access point reserved for tests: returns the token of the protected navigation lock. *(internal)* | 1148 |
| `ui_router.__test_setProtectionToken(token)` | Access point reserved for tests: forces the token of the protected navigation lock. *(internal)* | 1152 |
| `ui_router.back(options)` | Back: navigates to the current route's backTarget (with the parameters of the previous entry if it matches, otherwise those of the current route, and restoreLastScope = true); otherwise runs the declared back handler (RouteHandlers) if the mode is "handler". | 715 |
| `ui_router.cancel(options)` | Cancels the transition in progress (reason "cancelled"): notifies the framework and emits the ROUTE_CHANGE_CANCELLED hook. | 751 |
| `ui_router.forward(options)` | Deprecated and not implemented: always returns a failure. | 1167 |
| `ui_router.getBreadcrumbs()` | Returns the breadcrumb of the current route (NavigationState.getBreadcrumbs). | 1049 |
| `ui_router.getCurrent()` | Returns the current (committed) navigation entry from NavigationState. | 768 |
| `ui_router.getState()` | Returns the router state: the current route and the active scope state. | 1122 |
| `ui_router.isNavigationProtected()` | Indicates whether a protected navigation (cancellable = false) is active. | 1129 |
| `ui_router.navigate(routename, params, options)` | Navigates to a route: resolves the target, runs the exit guards of the current route, cancels any transition in progress, runs onLeave, the entry guards, onEnter, emits the route data (status enter-ready) then starts the transition to the UI framework. | 624 |
| `ui_router.onDeserialize(data)` | Hook called after a reload: clears the (stale) protection lock and restores NavigationState from data.navigation. *(internal)* *(hook)* | 1072 |
| `ui_router.onExtensionLoaded()` | Hook called when the extension is loaded: switches to manual unload and reloads the route guards. *(internal)* *(hook)* | 1083 |
| `ui_router.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook called on every GUI update (time arguments of the main loop): advances the TransitionManager, resends the route change message to the framework if needed (startup resends) or handles a transition timeout (emits the route data in error then cancels). *(internal)* *(hook)* | 1053 |
| `ui_router.onSerialize()` | Hook called before a Lua extensions reload: returns {navigation = NavigationState.serialize()}. *(internal)* *(hook)* | 1065 |
| `ui_router.push(routename, params, options)` | Deprecated: logs a warning and calls navigate. | 1157 |
| `ui_router.reload(routeName, params, options)` | Replays the navigation: reuses the name, parameters and options of the current entry for missing arguments, then calls navigate. | 772 |
| `ui_router.replace(routename, params, options)` | Deprecated: logs a warning and calls navigate. | 1162 |
| `ui_router.reportActiveScope(payload)` | Called by the UI to report the active scope. Ignores reports from a stale route, stores the route's last active scope (excluding popups, and if the scope is declared in the tree) then emits the onUiActiveScopeChanged hook. | 1089 |
| `ui_router.resetStates()` | Resets the whole router state: navigation, transition, observer (non-shipping), protection lock, route data and active scope. | 1133 |
| `ui_router.routeChangeComplete(frameworkId, routeName, transitionId)` | Framework acknowledgment: the route is committed on the UI side. Promotes the pending entry to current entry, notifies the framework, emits the AFTER_ROUTE_CHANGE and onUiChangedState hooks, and ends the transition unless a Vue mount acknowledgment is expected (and onEnter did not fail). | 853 |
| `ui_router.routeChangeFailed(frameworkId, routeName, transitionId)` | Navigation failure reported by the framework (for example a Vue component that cannot be loaded). Cancels the navigation in progress without touching the committed route: validates route and identifier, refuses if the route is already committed, runs the pending destination's onLeave to cancel the effects of its onEnter, then cancels the transition. | 934 |
| `ui_router.routeChangeReceived(frameworkId, routeName, transitionId)` | Framework acknowledgment: the route change was received. Marks the routeChangeReceived progress of the transition. | 802 |
| `ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason)` | Definitive rejection by the UI of an impossible or malformed route change (routes that are merely absent are not rejected because they may register later). Cancels the active transition if the identifier matches. | 830 |
| `ui_router.routeMounted(routeName, transitionId)` | Vue acknowledgment: the route's component is mounted. Requires a transition identifier, a committed route (otherwise reason="not_committed"), runs onMount, emits the route data (status mounted-ready or error) and ends the transition. A late/duplicate acknowledgment for the already committed route returns {success=true, stale=true}. | 977 |
| `ui_router.routeNavigationStarted(frameworkId, routeName, transitionId)` | Framework acknowledgment: navigation on the UI side has started. Requires a transition identifier for Vue during a transition. | 807 |

### Parameter details

#### `ui_router.__test_getProtectionToken()`

Access point reserved for tests: returns the token of the protected navigation lock.

- **returns**: string|nil Active token or nil.

#### `ui_router.__test_setProtectionToken(token)`

Access point reserved for tests: forces the token of the protected navigation lock.

- `token` (*string|nil*) : Token to force.

#### `ui_router.back(options)`

Back: navigates to the current route's backTarget (with the parameters of the previous entry if it matches, otherwise those of the current route, and restoreLastScope = true); otherwise runs the declared back handler (RouteHandlers) if the mode is "handler".

- `options` (*table|nil*) : Navigation options copied into the back navigation.
- **returns**: table|any Result of navigate or of the handler; {result=false, reason="no_current_route"} without a current route; nil if nothing to do.

#### `ui_router.cancel(options)`

Cancels the transition in progress (reason "cancelled"): notifies the framework and emits the ROUTE_CHANGE_CANCELLED hook.

- `options` (*table|nil*) : Unused.
- **returns**: table {success=true}, or {success=false, message} if there is no transition.

#### `ui_router.forward(options)`

Deprecated and not implemented: always returns a failure.

- `options` (*table|nil*) : Unused.
- **returns**: table {result=false, reason="deprecated_method"}.

#### `ui_router.getBreadcrumbs()`

Returns the breadcrumb of the current route (NavigationState.getBreadcrumbs).

- **returns**: table List of breadcrumbs.

#### `ui_router.getCurrent()`

Returns the current (committed) navigation entry from NavigationState.

- **returns**: table|nil Current entry {request, resolved, routeNode, ...} or nil.

#### `ui_router.getState()`

Returns the router state: the current route and the active scope state.

- **returns**: table {currentRoute=entry|nil, activeScope={activeScopeId, previousActiveScopeId, routeName}}.

#### `ui_router.isNavigationProtected()`

Indicates whether a protected navigation (cancellable = false) is active.

- **returns**: boolean true if the protection lock is held.

#### `ui_router.navigate(routename, params, options)`

Navigates to a route: resolves the target, runs the exit guards of the current route, cancels any transition in progress, runs onLeave, the entry guards, onEnter, emits the route data (status enter-ready) then starts the transition to the UI framework.

- `routename` (*string*) : Route name, possibly relative, with inline query (?a=1) and scope (:scope).
- `params` (*table|nil*) : Route parameters (take precedence over the inline query parameters).
- `options` (*table|nil*) : Options: cancellable (false = protected navigation), decorator, showDecorator, restoreLastScope, routeScopeId (added automatically)... passed to the route request.
- **returns**: table {result=true, success=true, data=entry} or {result=false, success=false, reason=string, failedGuard?}.

#### `ui_router.onDeserialize(data)`

Hook called after a reload: clears the (stale) protection lock and restores NavigationState from data.navigation.

- `data` (*table|nil*) : Data produced by onSerialize.

#### `ui_router.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook called on every GUI update (time arguments of the main loop): advances the TransitionManager, resends the route change message to the framework if needed (startup resends) or handles a transition timeout (emits the route data in error then cancels).

- `dtReal` (*number*) : Real time delta (seconds).
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).

#### `ui_router.onSerialize()`

Hook called before a Lua extensions reload: returns {navigation = NavigationState.serialize()}.

- **returns**: table Data to restore by onDeserialize.

#### `ui_router.push(routename, params, options)`

Deprecated: logs a warning and calls navigate.

- `routename` (*string*) : Target route.
- `params` (*table|nil*) : Parameters.
- `options` (*table|nil*) : Options.
- **returns**: table Result of navigate.

#### `ui_router.reload(routeName, params, options)`

Replays the navigation: reuses the name, parameters and options of the current entry for missing arguments, then calls navigate.

- `routeName` (*string|nil*) : Target route (default: current route).
- `params` (*table|nil*) : Parameters (default: those of the current request).
- `options` (*table|nil*) : Options (default: those of the current request).
- **returns**: table Result of navigate, or {success=false, message} if there is no route to reload.

#### `ui_router.replace(routename, params, options)`

Deprecated: logs a warning and calls navigate.

- `routename` (*string*) : Target route.
- `params` (*table|nil*) : Parameters.
- `options` (*table|nil*) : Options.
- **returns**: table Result of navigate.

#### `ui_router.reportActiveScope(payload)`

Called by the UI to report the active scope. Ignores reports from a stale route, stores the route's last active scope (excluding popups, and if the scope is declared in the tree) then emits the onUiActiveScopeChanged hook.

- `payload` (*table*) : {routeName?, activeScopeId?, isPopup?}.
- **returns**: table {success=true}, or {success=false, reason="invalid_payload"|"stale_route", stale?}.

#### `ui_router.routeChangeComplete(frameworkId, routeName, transitionId)`

Framework acknowledgment: the route is committed on the UI side. Promotes the pending entry to current entry, notifies the framework, emits the AFTER_ROUTE_CHANGE and onUiChangedState hooks, and ends the transition unless a Vue mount acknowledgment is expected (and onEnter did not fail).

- `frameworkId` (*string*) : Emitting framework.
- `routeName` (*string*) : Committed route (must match the pending entry).
- `transitionId` (*string|nil*) : Transition identifier (required for Vue).
- **returns**: table {success=true, alreadyCommitted?} or {success=false, reason=no_active_transition|missing_transition_id|missing_transition_meta|missing_pending_entry|route_mismatch|transition_id_mismatch|missing_current_entry}.

#### `ui_router.routeChangeFailed(frameworkId, routeName, transitionId)`

Navigation failure reported by the framework (for example a Vue component that cannot be loaded). Cancels the navigation in progress without touching the committed route: validates route and identifier, refuses if the route is already committed, runs the pending destination's onLeave to cancel the effects of its onEnter, then cancels the transition.

- `frameworkId` (*string*) : Emitting framework (required with identifier for Vue).
- `routeName` (*string*) : Failing route.
- `transitionId` (*string|nil*) : Transition identifier.
- **returns**: table {success=true} or {success=false, reason=no_active_transition|missing_transition_id|already_committed|<validation reason>}.

#### `ui_router.routeChangeReceived(frameworkId, routeName, transitionId)`

Framework acknowledgment: the route change was received. Marks the routeChangeReceived progress of the transition.

- `frameworkId` (*string*) : Framework ("vue", ...); unused here.
- `routeName` (*string*) : Acknowledged route.
- `transitionId` (*string|nil*) : Transition identifier returned by the UI.
- **returns**: table Result of TransitionManager.markProgress.

#### `ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason)`

Definitive rejection by the UI of an impossible or malformed route change (routes that are merely absent are not rejected because they may register later). Cancels the active transition if the identifier matches.

- `frameworkId` (*string*) : Emitting framework.
- `routeName` (*string*) : Rejected route.
- `transitionId` (*string|nil*) : Transition identifier (validated if provided).
- `reason` (*string|nil*) : Rejection reason (diagnostic, passed to the hook).
- **returns**: table {success=true} or {success=false, reason="no_active_transition"|"transition_id_mismatch"}.

#### `ui_router.routeMounted(routeName, transitionId)`

Vue acknowledgment: the route's component is mounted. Requires a transition identifier, a committed route (otherwise reason="not_committed"), runs onMount, emits the route data (status mounted-ready or error) and ends the transition. A late/duplicate acknowledgment for the already committed route returns {success=true, stale=true}.

- `routeName` (*string*) : Mounted route.
- `transitionId` (*string*) : UI transition identifier (required).
- **returns**: table {success=true, stale?|skipped?|alreadyMounted?} or {success=false, reason=no_active_transition|missing_transition_id|missing_transition_context|route_mismatch|transition_id_mismatch|missing_transition_meta|not_committed|lifecycle_hook_error}.

#### `ui_router.routeNavigationStarted(frameworkId, routeName, transitionId)`

Framework acknowledgment: navigation on the UI side has started. Requires a transition identifier for Vue during a transition.

- `frameworkId` (*string*) : Emitting framework.
- `routeName` (*string*) : Acknowledged route.
- `transitionId` (*string|nil*) : Transition identifier.
- **returns**: table {success=false, reason="missing_transition_id"} or result of markProgress.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUiActiveScopeChanged`
- `onUiChangedState` — listened to by 7 module(s)

**UI events (guihooks.trigger):** `ui_router_routeData`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router.lua`.*

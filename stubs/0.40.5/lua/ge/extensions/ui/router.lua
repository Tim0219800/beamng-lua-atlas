---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI navigation router on the Lua side (ui_router). It orchestrates a "handshake" with the UI frameworks (Vue, Angular/legacy): route resolution, exit/entry guards, lifecycle hooks (onLeave, onEnter, onMount), sending the route change to the framework, then receiving the acknowledgments (received, navigation started, route committed, mounted). It delegates state to the ui/router/* modules (navigationState, transitionManager, frameworkManager, guardManager, scopeManager, breadcrumbManager...). A modder mostly uses it to call navigate/back/reload and to listen to the onUiChangedState and onUiActiveScopeChanged hooks.
--- Access: extension `ui_router`: `extensions.load("ui_router")`, then the global `ui_router`
---@class ui_router
ui_router = {}

--- Access point reserved for tests: returns the token of the protected navigation lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1148
---@return string|nil  Active token or nil.
function ui_router.__test_getProtectionToken() end

--- Access point reserved for tests: forces the token of the protected navigation lock.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1152
---@param token string|nil Token to force.
function ui_router.__test_setProtectionToken(token) end

--- Back: navigates to the current route's backTarget (with the parameters of the previous entry if it matches, otherwise those of the current route, and restoreLastScope = true); otherwise runs the declared back handler (RouteHandlers) if the mode is "handler".
---Source: lua/ge/extensions/ui/router.lua:715
---@param options table|nil Navigation options copied into the back navigation.
---@return table|any  Result of navigate or of the handler; {result=false, reason="no_current_route"} without a current route; nil if nothing to do.
function ui_router.back(options) end

--- Cancels the transition in progress (reason "cancelled"): notifies the framework and emits the ROUTE_CHANGE_CANCELLED hook.
---Source: lua/ge/extensions/ui/router.lua:751
---@param options table|nil Unused.
---@return table  {success=true}, or {success=false, message} if there is no transition.
function ui_router.cancel(options) end

--- Deprecated and not implemented: always returns a failure.
---Source: lua/ge/extensions/ui/router.lua:1167
---@param options table|nil Unused.
---@return table  {result=false, reason="deprecated_method"}.
function ui_router.forward(options) end

--- Returns the breadcrumb of the current route (NavigationState.getBreadcrumbs).
---Source: lua/ge/extensions/ui/router.lua:1049
---@return table  List of breadcrumbs.
function ui_router.getBreadcrumbs() end

--- Returns the current (committed) navigation entry from NavigationState.
---Source: lua/ge/extensions/ui/router.lua:768
---@return table|nil  Current entry {request, resolved, routeNode, ...} or nil.
function ui_router.getCurrent() end

--- Returns the router state: the current route and the active scope state.
---Source: lua/ge/extensions/ui/router.lua:1122
---@return table  {currentRoute=entry|nil, activeScope={activeScopeId, previousActiveScopeId, routeName}}.
function ui_router.getState() end

--- Indicates whether a protected navigation (cancellable = false) is active.
---Source: lua/ge/extensions/ui/router.lua:1129
---@return boolean  true if the protection lock is held.
function ui_router.isNavigationProtected() end

--- Navigates to a route: resolves the target, runs the exit guards of the current route, cancels any transition in progress, runs onLeave, the entry guards, onEnter, emits the route data (status enter-ready) then starts the transition to the UI framework.
---Source: lua/ge/extensions/ui/router.lua:624
---@param routename string Route name, possibly relative, with inline query (?a=1) and scope (:scope).
---@param params table|nil Route parameters (take precedence over the inline query parameters).
---@param options table|nil Options: cancellable (false = protected navigation), decorator, showDecorator, restoreLastScope, routeScopeId (added automatically)... passed to the route request.
---@return table  {result=true, success=true, data=entry} or {result=false, success=false, reason=string, failedGuard?}.
function ui_router.navigate(routename, params, options) end

--- Hook called after a reload: clears the (stale) protection lock and restores NavigationState from data.navigation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1072
---@param data table|nil Data produced by onSerialize.
function ui_router.onDeserialize(data) end

--- Hook called when the extension is loaded: switches to manual unload and reloads the route guards.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1083
function ui_router.onExtensionLoaded() end

--- Hook called on every GUI update (time arguments of the main loop): advances the TransitionManager, resends the route change message to the framework if needed (startup resends) or handles a transition timeout (emits the route data in error then cancels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1053
---@param dtReal number Real time delta (seconds).
---@param dtSim number Simulated time delta (unused).
---@param dtRaw number Raw time delta (unused).
function ui_router.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook called before a Lua extensions reload: returns {navigation = NavigationState.serialize()}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router.lua:1065
---@return table  Data to restore by onDeserialize.
function ui_router.onSerialize() end

--- Deprecated: logs a warning and calls navigate.
---Source: lua/ge/extensions/ui/router.lua:1157
---@param routename string Target route.
---@param params table|nil Parameters.
---@param options table|nil Options.
---@return table  Result of navigate.
function ui_router.push(routename, params, options) end

--- Replays the navigation: reuses the name, parameters and options of the current entry for missing arguments, then calls navigate.
---Source: lua/ge/extensions/ui/router.lua:772
---@param routeName string|nil Target route (default: current route).
---@param params table|nil Parameters (default: those of the current request).
---@param options table|nil Options (default: those of the current request).
---@return table  Result of navigate, or {success=false, message} if there is no route to reload.
function ui_router.reload(routeName, params, options) end

--- Deprecated: logs a warning and calls navigate.
---Source: lua/ge/extensions/ui/router.lua:1162
---@param routename string Target route.
---@param params table|nil Parameters.
---@param options table|nil Options.
---@return table  Result of navigate.
function ui_router.replace(routename, params, options) end

--- Called by the UI to report the active scope. Ignores reports from a stale route, stores the route's last active scope (excluding popups, and if the scope is declared in the tree) then emits the onUiActiveScopeChanged hook.
---Source: lua/ge/extensions/ui/router.lua:1089
---@param payload table {routeName?, activeScopeId?, isPopup?}.
---@return table  {success=true}, or {success=false, reason="invalid_payload"|"stale_route", stale?}.
function ui_router.reportActiveScope(payload) end

--- Resets the whole router state: navigation, transition, observer (non-shipping), protection lock, route data and active scope.
---Source: lua/ge/extensions/ui/router.lua:1133
function ui_router.resetStates() end

--- Framework acknowledgment: the route is committed on the UI side. Promotes the pending entry to current entry, notifies the framework, emits the AFTER_ROUTE_CHANGE and onUiChangedState hooks, and ends the transition unless a Vue mount acknowledgment is expected (and onEnter did not fail).
---Source: lua/ge/extensions/ui/router.lua:853
---@param frameworkId string Emitting framework.
---@param routeName string Committed route (must match the pending entry).
---@param transitionId string|nil Transition identifier (required for Vue).
---@return table  {success=true, alreadyCommitted?} or {success=false, reason=no_active_transition|missing_transition_id|missing_transition_meta|missing_pending_entry|route_mismatch|transition_id_mismatch|missing_current_entry}.
function ui_router.routeChangeComplete(frameworkId, routeName, transitionId) end

--- Navigation failure reported by the framework (for example a Vue component that cannot be loaded). Cancels the navigation in progress without touching the committed route: validates route and identifier, refuses if the route is already committed, runs the pending destination's onLeave to cancel the effects of its onEnter, then cancels the transition.
---Source: lua/ge/extensions/ui/router.lua:934
---@param frameworkId string Emitting framework (required with identifier for Vue).
---@param routeName string Failing route.
---@param transitionId string|nil Transition identifier.
---@return table  {success=true} or {success=false, reason=no_active_transition|missing_transition_id|already_committed|<validation reason>}.
function ui_router.routeChangeFailed(frameworkId, routeName, transitionId) end

--- Framework acknowledgment: the route change was received. Marks the routeChangeReceived progress of the transition.
---Source: lua/ge/extensions/ui/router.lua:802
---@param frameworkId string Framework ("vue", ...); unused here.
---@param routeName string Acknowledged route.
---@param transitionId string|nil Transition identifier returned by the UI.
---@return table  Result of TransitionManager.markProgress.
function ui_router.routeChangeReceived(frameworkId, routeName, transitionId) end

--- Definitive rejection by the UI of an impossible or malformed route change (routes that are merely absent are not rejected because they may register later). Cancels the active transition if the identifier matches.
---Source: lua/ge/extensions/ui/router.lua:830
---@param frameworkId string Emitting framework.
---@param routeName string Rejected route.
---@param transitionId string|nil Transition identifier (validated if provided).
---@param reason string|nil Rejection reason (diagnostic, passed to the hook).
---@return table  {success=true} or {success=false, reason="no_active_transition"|"transition_id_mismatch"}.
function ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason) end

--- Vue acknowledgment: the route's component is mounted. Requires a transition identifier, a committed route (otherwise reason="not_committed"), runs onMount, emits the route data (status mounted-ready or error) and ends the transition. A late/duplicate acknowledgment for the already committed route returns {success=true, stale=true}.
---Source: lua/ge/extensions/ui/router.lua:977
---@param routeName string Mounted route.
---@param transitionId string UI transition identifier (required).
---@return table  {success=true, stale?|skipped?|alreadyMounted?} or {success=false, reason=no_active_transition|missing_transition_id|missing_transition_context|route_mismatch|transition_id_mismatch|missing_transition_meta|not_committed|lifecycle_hook_error}.
function ui_router.routeMounted(routeName, transitionId) end

--- Framework acknowledgment: navigation on the UI side has started. Requires a transition identifier for Vue during a transition.
---Source: lua/ge/extensions/ui/router.lua:807
---@param frameworkId string Emitting framework.
---@param routeName string Acknowledged route.
---@param transitionId string|nil Transition identifier.
---@return table  {success=false, reason="missing_transition_id"} or result of markProgress.
function ui_router.routeNavigationStarted(frameworkId, routeName, transitionId) end


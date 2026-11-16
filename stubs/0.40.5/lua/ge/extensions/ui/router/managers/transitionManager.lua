---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/transitionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the lifecycle of the UI router's route transitions: a single transition at a time, transition session (progress milestones, phase, elapsed time per phase and total, route change resends), validation of the frameworks' acknowledgments and classification of timeouts. The module has no side effects on the router: update() returns events (resendRouteChange or timeout) that router.lua handles. Time is accumulated from dtReal provided by onGuiUpdate (not os.clock).
--- Access: extension `ui_router_managers_transitionManager`: `extensions.load("ui_router_managers_transitionManager")`, then the global `ui_router_managers_transitionManager`
---@class ui_router_managers_transitionManager
ui_router_managers_transitionManager = {}

--- Indicates whether a new transition can start (none in progress).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:426
---@return boolean  true if status ~= transitioning.
function ui_router_managers_transitionManager.canStartTransition() end

--- Cancels the active transition, clears the state and returns to idle.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:508
---@param reason string|nil Reason ("cancelled" by default), logged.
---@return boolean  true if there was a transition.
---@return string|nil  Identifier of the cancelled transition.
function ui_router_managers_transitionManager.cancel(reason) end

--- Ends the transition successfully after validating the identifier and route name, then resets all state.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:468
---@param routeName string|nil Finished route (validated against the expected name).
---@param transitionId string|nil Transition identifier (validated if provided).
---@return boolean  true if finished.
---@return string  "completed" or failure reason (no_active_transition, transition_id_mismatch, route_name_mismatch).
function ui_router_managers_transitionManager.complete(routeName, transitionId) end

--- Returns debug information.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:543
---@return table  {status, transitionId, elapsedTime}.
function ui_router_managers_transitionManager.getDebugInfo() end

--- Elapsed time (seconds) since the start of the flat transition, accumulated from dtReal.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:107
---@return number  Seconds.
function ui_router_managers_transitionManager.getElapsedTime() end

--- Returns the origin route of the active transition.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:124
---@return table|nil  Origin route (compat view).
function ui_router_managers_transitionManager.getFromRoute() end

--- Returns the transition type (context.kind, "navigate" by default).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:116
---@return string|nil  Type or nil.
function ui_router_managers_transitionManager.getKind() end

--- Returns the active transition session created by router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken...).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:170
---@return table|nil  Session or nil if inactive.
function ui_router_managers_transitionManager.getSession() end

--- Returns the current state: "idle", "transitioning" or "cancelled" (transient).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:92
---@return string  Constants.TransitionStatus.
function ui_router_managers_transitionManager.getStatus() end

--- Timing snapshot for the router's timeout handler; the classification is inferred from the progress milestones if not provided.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:299
---@param classification string|nil Already computed classification (phased path).
---@return table  {transitionId, classification, phase, phaseElapsed, totalElapsed, handoffAttempts}.
function ui_router_managers_transitionManager.getTimeoutInfo(classification) end

--- Returns the destination route of the active transition.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:120
---@return table|nil  Resolved route.
function ui_router_managers_transitionManager.getToRoute() end

--- Returns a snapshot of the transition context.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:128
---@return table  {transitionId, kind, toRoute, fromRoute}.
function ui_router_managers_transitionManager.getTransitionContext() end

--- Returns the identifier of the active transition.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:102
---@return string|nil  Identifier or nil if no transition.
function ui_router_managers_transitionManager.getTransitionId() end

--- Indicates whether the flat regime delay (Config.Timeout) is reached.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:112
---@return boolean  true if elapsedTime >= Config.Timeout.
function ui_router_managers_transitionManager.isTimeoutReached() end

--- Indicates whether a transition is in progress.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:97
---@return boolean  true if status == transitioning.
function ui_router_managers_transitionManager.isTransitioning() end

--- Marks the session as committed (routeChangeComplete promoted the entry). Validation and promotion are done by the router.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:206
---@param routeName string Committed route (unused, for symmetry).
---@param transitionId string|nil Transition identifier.
---@return table  {success=true} or {success=false, reason=no_active_transition|transition_id_mismatch}.
function ui_router_managers_transitionManager.markCommitted(routeName, transitionId) end

--- Marks the session as mounted (routeMounted acknowledgment handled).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:232
---@param routeName string Mounted route (unused).
---@param transitionId string|nil Transition identifier.
---@return table  {success=true} or {success=false, reason}.
function ui_router_managers_transitionManager.markMounted(routeName, transitionId) end

--- Records a progress milestone reported by the framework after validation of the acknowledgment.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:183
---@param routeName string Acknowledged route.
---@param milestone string routeChangeReceived or routeNavigationStarted.
---@param transitionId string|nil Transition identifier.
---@return table  {success=true} or {success=false, reason}.
function ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId) end

--- Resets the state (tests or recovery): idle status, identifier, time, session. Does not reset kind, toRoute or fromRoute to nil.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:533
function ui_router_managers_transitionManager.reset() end

--- Starts a transition: generates the identifier, records target/origin route and session, switches to transitioning. Fails if a transition is already in progress or without a target route.
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:435
---@param context table {toRoute (or resolved), fromRoute?, kind?, session?}.
---@return boolean  true if started; false otherwise.
---@return string  Transition identifier, or reason (transition_already_in_progress, no_target_route) on failure.
function ui_router_managers_transitionManager.start(context) end

--- Advances the timing of the active transition; called by router.onGuiUpdate. Returns nil if there is nothing to report.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:413
---@param dtReal number Real time delta in seconds.
---@return table|nil  {type="resendRouteChange", entry} or {type="timeout", reason, classification?}.
function ui_router_managers_transitionManager.update(dtReal) end

--- Validates a framework acknowledgment against the active transition (see notes).
---Source: lua/ge/extensions/ui/router/managers/transitionManager.lua:150
---@param routeName string|nil Acknowledged route (optional).
---@param transitionId string|nil Transition identifier returned by the UI (optional).
---@return table  {success=true} or {success=false, reason}.
function ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId) end


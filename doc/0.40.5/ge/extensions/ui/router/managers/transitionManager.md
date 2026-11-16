# `ui_router_managers_transitionManager`

*File: `lua/ge/extensions/ui/router/managers/transitionManager.lua` · VM: Game Engine (GE) · 552 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_managers_transitionManager`: `extensions.load("ui_router_managers_transitionManager")`, then the global `ui_router_managers_transitionManager`

Manages the lifecycle of the UI router's route transitions: a single transition at a time, transition session (progress milestones, phase, elapsed time per phase and total, route change resends), validation of the frameworks' acknowledgments and classification of timeouts. The module has no side effects on the router: update() returns events (resendRouteChange or timeout) that router.lua handles. Time is accumulated from dtReal provided by onGuiUpdate (not os.clock).

## Notes

- Two timeout regimes. Flat (Angular/legacy, session.phase == nil): a single Config.Timeout delay (3 s) on elapsedTime; on expiry, the TRANSITION_TIMEOUT hook is emitted once ({type="hard", context}) and update returns {type="timeout", reason="timeout_reached"}. Phased (Vue): phases startup, routeCommit, mountReady, done.
- Startup phase: returns {type="resendRouteChange", entry=pendingEntry} every Config.PhaseTimeouts.startupResendInterval seconds, never expiring; the phase ends when routeNavigationStarted is received (totalElapsed is then reset to 0). Following phases: routeCommit and mountReady budgets, then total cap; classifications: route_change_not_completed, route_mounted_not_acknowledged, transition_total_timeout.
- An acknowledgment is valid if a transition is active, if transitionId (when provided) matches, and if routeName (when provided) matches the expected name (pending entry, otherwise session name, otherwise target route). Failure reasons: no_active_transition, transition_id_mismatch, route_mismatch (complete returns route_name_mismatch).
- The transition identifier is generated in the form "transition_<counter>_<UUID>" (Engine.generateUUID).
- Minor inconsistency: the comment of start() announces "@return transitionId, success" whereas the function returns (success, transitionId); router.lua does use the order (success, id).
- isTimeoutReached only concerns the flat regime (elapsedTime >= Config.Timeout); in the phased regime elapsedTime is not incremented.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_managers_transitionManager.canStartTransition()` | Indicates whether a new transition can start (none in progress). | 426 |
| `ui_router_managers_transitionManager.cancel(reason)` | Cancels the active transition, clears the state and returns to idle. | 508 |
| `ui_router_managers_transitionManager.complete(routeName, transitionId)` | Ends the transition successfully after validating the identifier and route name, then resets all state. | 468 |
| `ui_router_managers_transitionManager.getDebugInfo()` | Returns debug information. | 543 |
| `ui_router_managers_transitionManager.getElapsedTime()` | Elapsed time (seconds) since the start of the flat transition, accumulated from dtReal. | 107 |
| `ui_router_managers_transitionManager.getFromRoute()` | Returns the origin route of the active transition. | 124 |
| `ui_router_managers_transitionManager.getKind()` | Returns the transition type (context.kind, "navigate" by default). | 116 |
| `ui_router_managers_transitionManager.getSession()` | Returns the active transition session created by router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken...). | 170 |
| `ui_router_managers_transitionManager.getStatus()` | Returns the current state: "idle", "transitioning" or "cancelled" (transient). | 92 |
| `ui_router_managers_transitionManager.getTimeoutInfo(classification)` | Timing snapshot for the router's timeout handler; the classification is inferred from the progress milestones if not provided. | 299 |
| `ui_router_managers_transitionManager.getToRoute()` | Returns the destination route of the active transition. | 120 |
| `ui_router_managers_transitionManager.getTransitionContext()` | Returns a snapshot of the transition context. | 128 |
| `ui_router_managers_transitionManager.getTransitionId()` | Returns the identifier of the active transition. | 102 |
| `ui_router_managers_transitionManager.isTimeoutReached()` | Indicates whether the flat regime delay (Config.Timeout) is reached. | 112 |
| `ui_router_managers_transitionManager.isTransitioning()` | Indicates whether a transition is in progress. | 97 |
| `ui_router_managers_transitionManager.markCommitted(routeName, transitionId)` | Marks the session as committed (routeChangeComplete promoted the entry). Validation and promotion are done by the router. | 206 |
| `ui_router_managers_transitionManager.markMounted(routeName, transitionId)` | Marks the session as mounted (routeMounted acknowledgment handled). | 232 |
| `ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId)` | Records a progress milestone reported by the framework after validation of the acknowledgment. | 183 |
| `ui_router_managers_transitionManager.reset()` | Resets the state (tests or recovery): idle status, identifier, time, session. Does not reset kind, toRoute or fromRoute to nil. | 533 |
| `ui_router_managers_transitionManager.start(context)` | Starts a transition: generates the identifier, records target/origin route and session, switches to transitioning. Fails if a transition is already in progress or without a target route. | 435 |
| `ui_router_managers_transitionManager.update(dtReal)` | Advances the timing of the active transition; called by router.onGuiUpdate. Returns nil if there is nothing to report. *(internal)* | 413 |
| `ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId)` | Validates a framework acknowledgment against the active transition (see notes). | 150 |

### Parameter details

#### `ui_router_managers_transitionManager.canStartTransition()`

Indicates whether a new transition can start (none in progress).

- **returns**: boolean true if status ~= transitioning.

#### `ui_router_managers_transitionManager.cancel(reason)`

Cancels the active transition, clears the state and returns to idle.

- `reason` (*string|nil*) : Reason ("cancelled" by default), logged.
- **returns**: boolean true if there was a transition.
- **returns**: string|nil Identifier of the cancelled transition.

#### `ui_router_managers_transitionManager.complete(routeName, transitionId)`

Ends the transition successfully after validating the identifier and route name, then resets all state.

- `routeName` (*string|nil*) : Finished route (validated against the expected name).
- `transitionId` (*string|nil*) : Transition identifier (validated if provided).
- **returns**: boolean true if finished.
- **returns**: string "completed" or failure reason (no_active_transition, transition_id_mismatch, route_name_mismatch).

#### `ui_router_managers_transitionManager.getDebugInfo()`

Returns debug information.

- **returns**: table {status, transitionId, elapsedTime}.

#### `ui_router_managers_transitionManager.getElapsedTime()`

Elapsed time (seconds) since the start of the flat transition, accumulated from dtReal.

- **returns**: number Seconds.

#### `ui_router_managers_transitionManager.getFromRoute()`

Returns the origin route of the active transition.

- **returns**: table|nil Origin route (compat view).

#### `ui_router_managers_transitionManager.getKind()`

Returns the transition type (context.kind, "navigate" by default).

- **returns**: string|nil Type or nil.

#### `ui_router_managers_transitionManager.getSession()`

Returns the active transition session created by router.lua (routeName, routeData, navigationContext, pendingEntry, skipOnMount, mounted, routeChangeCommitted, expectsMountAck, phase, phaseElapsed, totalElapsed, timeSinceLastEmit, handoffAttempts, progress, milestoneAt, protectionToken...).

- **returns**: table|nil Session or nil if inactive.

#### `ui_router_managers_transitionManager.getStatus()`

Returns the current state: "idle", "transitioning" or "cancelled" (transient).

- **returns**: string Constants.TransitionStatus.

#### `ui_router_managers_transitionManager.getTimeoutInfo(classification)`

Timing snapshot for the router's timeout handler; the classification is inferred from the progress milestones if not provided.

- `classification` (*string|nil*) : Already computed classification (phased path).
- **returns**: table {transitionId, classification, phase, phaseElapsed, totalElapsed, handoffAttempts}.

#### `ui_router_managers_transitionManager.getToRoute()`

Returns the destination route of the active transition.

- **returns**: table|nil Resolved route.

#### `ui_router_managers_transitionManager.getTransitionContext()`

Returns a snapshot of the transition context.

- **returns**: table {transitionId, kind, toRoute, fromRoute}.

#### `ui_router_managers_transitionManager.getTransitionId()`

Returns the identifier of the active transition.

- **returns**: string|nil Identifier or nil if no transition.

#### `ui_router_managers_transitionManager.isTimeoutReached()`

Indicates whether the flat regime delay (Config.Timeout) is reached.

- **returns**: boolean true if elapsedTime >= Config.Timeout.

#### `ui_router_managers_transitionManager.isTransitioning()`

Indicates whether a transition is in progress.

- **returns**: boolean true if status == transitioning.

#### `ui_router_managers_transitionManager.markCommitted(routeName, transitionId)`

Marks the session as committed (routeChangeComplete promoted the entry). Validation and promotion are done by the router.

- `routeName` (*string*) : Committed route (unused, for symmetry).
- `transitionId` (*string|nil*) : Transition identifier.
- **returns**: table {success=true} or {success=false, reason=no_active_transition|transition_id_mismatch}.

#### `ui_router_managers_transitionManager.markMounted(routeName, transitionId)`

Marks the session as mounted (routeMounted acknowledgment handled).

- `routeName` (*string*) : Mounted route (unused).
- `transitionId` (*string|nil*) : Transition identifier.
- **returns**: table {success=true} or {success=false, reason}.

#### `ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId)`

Records a progress milestone reported by the framework after validation of the acknowledgment.

- `routeName` (*string*) : Acknowledged route.
- `milestone` (*string*) : routeChangeReceived or routeNavigationStarted.
- `transitionId` (*string|nil*) : Transition identifier.
- **returns**: table {success=true} or {success=false, reason}.

#### `ui_router_managers_transitionManager.start(context)`

Starts a transition: generates the identifier, records target/origin route and session, switches to transitioning. Fails if a transition is already in progress or without a target route.

- `context` (*table*) : {toRoute (or resolved), fromRoute?, kind?, session?}.
- **returns**: boolean true if started; false otherwise.
- **returns**: string Transition identifier, or reason (transition_already_in_progress, no_target_route) on failure.

#### `ui_router_managers_transitionManager.update(dtReal)`

Advances the timing of the active transition; called by router.onGuiUpdate. Returns nil if there is nothing to report.

- `dtReal` (*number*) : Real time delta in seconds.
- **returns**: table|nil {type="resendRouteChange", entry} or {type="timeout", reason, classification?}.

#### `ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId)`

Validates a framework acknowledgment against the active transition (see notes).

- `routeName` (*string|nil*) : Acknowledged route (optional).
- `transitionId` (*string|nil*) : Transition identifier returned by the UI (optional).
- **returns**: table {success=true} or {success=false, reason}.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/managers/transitionManager.lua`.*

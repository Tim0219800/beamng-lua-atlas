# `ui_router_managers_transitionManager`

*Fichier : `lua/ge/extensions/ui/router/managers/transitionManager.lua` · VM : Game Engine (GE) · 552 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_transitionManager` : `extensions.load("ui_router_managers_transitionManager")`, puis la globale `ui_router_managers_transitionManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_transitionManager.canStartTransition()` |  | 426 |
| `ui_router_managers_transitionManager.cancel(reason)` | Cancel the current transition.<br><br>  @param reason - Reason for cancellation<br>  @return wasTransitioning, transitionId | 508 |
| `ui_router_managers_transitionManager.complete(routeName, transitionId)` | Complete the current transition successfully.<br><br>  @param routeName - Route name being completed (validated against the pending/session route)<br>  @param transitionId - Active transition id being echoed back (optional, validated when provided)<br>  @return success, reason | 468 |
| `ui_router_managers_transitionManager.getDebugInfo()` | Get debug info | 543 |
| `ui_router_managers_transitionManager.getElapsedTime()` | Get elapsed time since transition started (accumulated from dtReal) | 107 |
| `ui_router_managers_transitionManager.getFromRoute()` |  | 124 |
| `ui_router_managers_transitionManager.getKind()` |  | 116 |
| `ui_router_managers_transitionManager.getSession()` | Get the active transition session (nil when idle). | 170 |
| `ui_router_managers_transitionManager.getStatus()` | Get current status | 92 |
| `ui_router_managers_transitionManager.getTimeoutInfo(classification)` | Timing/classification snapshot for the router's timeout handler.<br><br>  @param classification - Optional pre-computed classification (phased path).<br>                          When nil, it is derived from the flat progress acks.<br>  @return { classification, phase, phaseElapsed, totalElapsed, handoffAttempts } | 299 |
| `ui_router_managers_transitionManager.getToRoute()` |  | 120 |
| `ui_router_managers_transitionManager.getTransitionContext()` |  | 128 |
| `ui_router_managers_transitionManager.getTransitionId()` | Get current transition ID | 102 |
| `ui_router_managers_transitionManager.isTimeoutReached()` | Check if hard timeout reached | 112 |
| `ui_router_managers_transitionManager.isTransitioning()` | Check if currently transitioning | 97 |
| `ui_router_managers_transitionManager.markCommitted(routeName, transitionId)` | Mark the transition as committed (routeChangeComplete promoted the entry).<br>  Router owns the promotion and validation; this only records session state.<br><br>  @param routeName - Route name being committed (kept for API symmetry)<br>  @param transitionId - Active transition id being echoed back (optional)<br>  @return { success, reason? } | 206 |
| `ui_router_managers_transitionManager.markMounted(routeName, transitionId)` | Mark the transition as mounted (routeMounted ack processed by router).<br><br>  @param routeName - Route name being mounted (kept for API symmetry)<br>  @param transitionId - Active transition id being echoed back (optional)<br>  @return { success, reason? } | 232 |
| `ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId)` | Mark a progress milestone reported by the UI framework.<br><br>  @param routeName - Route name the framework is acknowledging<br>  @param milestone - Progress key (routeChangeReceived \| routeNavigationStarted)<br>  @param transitionId - Active transition id being echoed back (optional)<br>  @return { success, reason? } | 183 |
| `ui_router_managers_transitionManager.reset()` | Reset state (for testing or recovery) | 533 |
| `ui_router_managers_transitionManager.start(context)` | Start a new transition.<br><br>  @return transitionId, success | 435 |
| `ui_router_managers_transitionManager.update(dtReal)` | Update transition timing. Called by the main router extension from onGuiUpdate.<br><br>  Handles both timeout regimes:<br>    - Phased: Vue handoff transitions advance per-phase budgets and resend the<br>      route-change event while waiting for the handoff ack.<br>    - Flat: Angular/legacy transitions use a single dtReal-accumulated timeout.<br><br>  @param dtReal - Real time delta from game's onGuiUpdate hook<br>  @return event table or nil. Event shapes:<br>    { type = "resendRouteChange", entry = <pendingEntry> }<br>    { type = "timeout", reason = <reason>, classification = <classification?> } | 413 |
| `ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId)` | Validate an acknowledgement against the active transition.<br><br>  Rules:<br>    - There must be an active transition.<br>    - If transitionId is provided (and one is active), it must match state.transitionId.<br>    - If routeName is provided, it must match the expected pending/session route name.<br>    - If transitionId is omitted, validation falls back to route-name only (compatibility).<br><br>  @param routeName - Route name the framework is acknowledging (optional)<br>  @param transitionId - Active transition id being echoed back (optional)<br>  @return { success, reason? } | 150 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/transitionManager.lua`.*

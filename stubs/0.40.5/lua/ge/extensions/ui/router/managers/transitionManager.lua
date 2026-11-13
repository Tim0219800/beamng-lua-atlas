---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/transitionManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_managers_transitionManager` : `extensions.load("ui_router_managers_transitionManager")`, puis la globale `ui_router_managers_transitionManager`
---@class ui_router_managers_transitionManager
ui_router_managers_transitionManager = {}

---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:426
function ui_router_managers_transitionManager.canStartTransition() end

--- Cancel the current transition.
---
---   @param reason - Reason for cancellation
---   @return wasTransitioning, transitionId
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:508
---@param reason any
function ui_router_managers_transitionManager.cancel(reason) end

--- Complete the current transition successfully.
---
---   @param routeName - Route name being completed (validated against the pending/session route)
---   @param transitionId - Active transition id being echoed back (optional, validated when provided)
---   @return success, reason
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:468
---@param routeName any
---@param transitionId any
function ui_router_managers_transitionManager.complete(routeName, transitionId) end

--- Get debug info
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:543
function ui_router_managers_transitionManager.getDebugInfo() end

--- Get elapsed time since transition started (accumulated from dtReal)
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:107
function ui_router_managers_transitionManager.getElapsedTime() end

---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:124
function ui_router_managers_transitionManager.getFromRoute() end

---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:116
function ui_router_managers_transitionManager.getKind() end

--- Get the active transition session (nil when idle).
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:170
function ui_router_managers_transitionManager.getSession() end

--- Get current status
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:92
function ui_router_managers_transitionManager.getStatus() end

--- Timing/classification snapshot for the router's timeout handler.
---
---   @param classification - Optional pre-computed classification (phased path).
---                           When nil, it is derived from the flat progress acks.
---   @return { classification, phase, phaseElapsed, totalElapsed, handoffAttempts }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:299
---@param classification any
function ui_router_managers_transitionManager.getTimeoutInfo(classification) end

---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:120
function ui_router_managers_transitionManager.getToRoute() end

---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:128
function ui_router_managers_transitionManager.getTransitionContext() end

--- Get current transition ID
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:102
function ui_router_managers_transitionManager.getTransitionId() end

--- Check if hard timeout reached
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:112
function ui_router_managers_transitionManager.isTimeoutReached() end

--- Check if currently transitioning
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:97
function ui_router_managers_transitionManager.isTransitioning() end

--- Mark the transition as committed (routeChangeComplete promoted the entry).
---   Router owns the promotion and validation; this only records session state.
---
---   @param routeName - Route name being committed (kept for API symmetry)
---   @param transitionId - Active transition id being echoed back (optional)
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:206
---@param routeName any
---@param transitionId any
function ui_router_managers_transitionManager.markCommitted(routeName, transitionId) end

--- Mark the transition as mounted (routeMounted ack processed by router).
---
---   @param routeName - Route name being mounted (kept for API symmetry)
---   @param transitionId - Active transition id being echoed back (optional)
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:232
---@param routeName any
---@param transitionId any
function ui_router_managers_transitionManager.markMounted(routeName, transitionId) end

--- Mark a progress milestone reported by the UI framework.
---
---   @param routeName - Route name the framework is acknowledging
---   @param milestone - Progress key (routeChangeReceived | routeNavigationStarted)
---   @param transitionId - Active transition id being echoed back (optional)
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:183
---@param routeName any
---@param milestone any
---@param transitionId any
function ui_router_managers_transitionManager.markProgress(routeName, milestone, transitionId) end

--- Reset state (for testing or recovery)
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:533
function ui_router_managers_transitionManager.reset() end

--- Start a new transition.
---
---   @return transitionId, success
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:435
---@param context any
function ui_router_managers_transitionManager.start(context) end

--- Update transition timing. Called by the main router extension from onGuiUpdate.
---
---   Handles both timeout regimes:
---     - Phased: Vue handoff transitions advance per-phase budgets and resend the
---       route-change event while waiting for the handoff ack.
---     - Flat: Angular/legacy transitions use a single dtReal-accumulated timeout.
---
---   @param dtReal - Real time delta from game's onGuiUpdate hook
---   @return event table or nil. Event shapes:
---     { type = "resendRouteChange", entry = <pendingEntry> }
---     { type = "timeout", reason = <reason>, classification = <classification?> }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:413
---@param dtReal any
function ui_router_managers_transitionManager.update(dtReal) end

--- Validate an acknowledgement against the active transition.
---
---   Rules:
---     - There must be an active transition.
---     - If transitionId is provided (and one is active), it must match state.transitionId.
---     - If routeName is provided, it must match the expected pending/session route name.
---     - If transitionId is omitted, validation falls back to route-name only (compatibility).
---
---   @param routeName - Route name the framework is acknowledging (optional)
---   @param transitionId - Active transition id being echoed back (optional)
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router/managers/transitionManager.lua:150
---@param routeName any
---@param transitionId any
function ui_router_managers_transitionManager.validateAcknowledgement(routeName, transitionId) end


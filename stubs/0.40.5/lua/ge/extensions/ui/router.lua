---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router` : `extensions.load("ui_router")`, puis la globale `ui_router`
---@class ui_router
ui_router = {}

--- Test-only seams for the protected-navigation lock. Not part of the public router API; they let
---  the co-located navigationProtection tests seed and inspect the identity-safe token directly.
---Source : lua/ge/extensions/ui/router.lua:1148
function ui_router.__test_getProtectionToken() end

---Source : lua/ge/extensions/ui/router.lua:1152
---@param token any
function ui_router.__test_setProtectionToken(token) end

---Source : lua/ge/extensions/ui/router.lua:715
---@param options any
function ui_router.back(options) end

---Source : lua/ge/extensions/ui/router.lua:751
---@param options any
function ui_router.cancel(options) end

---Source : lua/ge/extensions/ui/router.lua:1167
---@param options any
function ui_router.forward(options) end

---Source : lua/ge/extensions/ui/router.lua:1049
function ui_router.getBreadcrumbs() end

---Source : lua/ge/extensions/ui/router.lua:768
function ui_router.getCurrent() end

---Source : lua/ge/extensions/ui/router.lua:1122
function ui_router.getState() end

---Source : lua/ge/extensions/ui/router.lua:1129
function ui_router.isNavigationProtected() end

---Source : lua/ge/extensions/ui/router.lua:624
---@param routename any
---@param params any
---@param options any
function ui_router.navigate(routename, params, options) end

---Source : lua/ge/extensions/ui/router.lua:1072
---@param data any
function ui_router.onDeserialize(data) end

---Source : lua/ge/extensions/ui/router.lua:1083
function ui_router.onExtensionLoaded() end

---Source : lua/ge/extensions/ui/router.lua:1053
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function ui_router.onGuiUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/ui/router.lua:1065
function ui_router.onSerialize() end

--- Deprecated methods
---Source : lua/ge/extensions/ui/router.lua:1157
---@param routename any
---@param params any
---@param options any
function ui_router.push(routename, params, options) end

---Source : lua/ge/extensions/ui/router.lua:772
---@param routeName any
---@param params any
---@param options any
function ui_router.reload(routeName, params, options) end

---Source : lua/ge/extensions/ui/router.lua:1162
---@param routename any
---@param params any
---@param options any
function ui_router.replace(routename, params, options) end

---Source : lua/ge/extensions/ui/router.lua:1089
---@param payload any
function ui_router.reportActiveScope(payload) end

---Source : lua/ge/extensions/ui/router.lua:1133
function ui_router.resetStates() end

---Source : lua/ge/extensions/ui/router.lua:853
---@param frameworkId any
---@param routeName any
---@param transitionId any
function ui_router.routeChangeComplete(frameworkId, routeName, transitionId) end

--- Framework-reported navigation failure (e.g. the Vue push rejected because a component
---   chunk failed to load). Rolls back the in-flight navigation without disturbing the
---   committed route:
---     - validates the failure against the active transition (route + transition id),
---     - rejects a failure that arrives after commit (too late to roll back safely),
---     - runs the pending destination's onLeave to reverse its onEnter side effects,
---     - cancels the matching transition (which clears the pending entry), leaving the
---       committed route untouched.
---
---   @param frameworkId - Reporting framework (kept for API symmetry)
---   @param routeName - Canonical route name that failed to hand off
---   @param transitionId - Active transition id being echoed back (optional)
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router.lua:934
---@param frameworkId any
---@param routeName any
---@param transitionId any
function ui_router.routeChangeFailed(frameworkId, routeName, transitionId) end

---Source : lua/ge/extensions/ui/router.lua:802
---@param frameworkId any
---@param routeName any
---@param transitionId any
function ui_router.routeChangeReceived(frameworkId, routeName, transitionId) end

--- Definitive UI rejection of an in-flight route change.
---
---   This is only for structurally impossible / malformed requests that can never resolve on the
---   UI side. Missing routes are NOT rejected here: runtime/mod routes may register later, so those
---   requests stay retryable via the startup resends. When the rejection matches the active
---   transition, cancel it (clearing the pending entry) and notify with the transition id.
---
---   @param frameworkId - Framework reporting the rejection (e.g. "vue")
---   @param routeName - Route the UI rejected
---   @param transitionId - Active transition id being echoed back (validated when provided)
---   @param reason - Optional rejection reason for diagnostics
---   @return { success, reason? }
---Source : lua/ge/extensions/ui/router.lua:830
---@param frameworkId any
---@param routeName any
---@param transitionId any
---@param reason any
function ui_router.routeChangeRejected(frameworkId, routeName, transitionId, reason) end

---Source : lua/ge/extensions/ui/router.lua:977
---@param routeName any
---@param transitionId any
function ui_router.routeMounted(routeName, transitionId) end

---Source : lua/ge/extensions/ui/router.lua:807
---@param frameworkId any
---@param routeName any
---@param transitionId any
function ui_router.routeNavigationStarted(frameworkId, routeName, transitionId) end


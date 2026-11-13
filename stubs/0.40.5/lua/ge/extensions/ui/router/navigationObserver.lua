---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationObserver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_navigationObserver` : `extensions.load("ui_router_navigationObserver")`, puis la globale `ui_router_navigationObserver`
---@class ui_router_navigationObserver
---@field ModuleName string
ui_router_navigationObserver = {}

--- Attach the resolved navigation target (canonical route, effective params, scope, options) to
---  an attempt after resolveNavigationTarget() succeeds.
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:179
---@param attempt any
---@param target any
function ui_router_navigationObserver.attachResolvedTarget(attempt, target) end

--- Begin a new attempt at navigate() entry, capturing the external Lua caller. Must be called
---   before any router wrapper obscures the caller. Returns the attempt so the navigate() call can
---   hold its own reference across re-entrant navigations.
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:164
function ui_router_navigationObserver.beginAttempt() end

---Source : lua/ge/extensions/ui/router/navigationObserver.lua:189
function ui_router_navigationObserver.getCurrentAttempt() end

--- Report a proven preemption: preemptedAttempt was in flight when replacementAttempt superseded
---   it. Classifies the pair, emits a single warning, and returns the record. Skips no-op cases
---   (missing attempts, self-preemption) and never reports the same preempted attempt twice.
---
---   @param preemptedAttempt - the older navigation that was cut short
---   @param replacementAttempt - the navigation that superseded it
---   @param phase - diagnostic label for where the preemption was detected
---   @return the warning record, or nil when nothing was reported
---Source : lua/ge/extensions/ui/router/navigationObserver.lua:203
---@param preemptedAttempt any
---@param replacementAttempt any
---@param phase any
function ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase) end

---Source : lua/ge/extensions/ui/router/navigationObserver.lua:227
function ui_router_navigationObserver.reset() end


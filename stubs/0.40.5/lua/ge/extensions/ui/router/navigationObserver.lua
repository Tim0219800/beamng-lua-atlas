---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationObserver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Non-shipping diagnostic of the router: attributes each navigate() call to the calling Lua module (walking up the stack ignoring "ui/router/" files) and warns when a navigation preempts another still in progress (active transition replaced, or navigate() whose epoch was incremented by a reentrant navigate() during its guards/onEnter). Each preemption is classified duplicate_navigation (identical requests: route, params, scope, options) or conflicting_navigation. It has no effect on the router's behavior: it records attempts and writes warnings.
--- Access: extension `ui_router_navigationObserver`: `extensions.load("ui_router_navigationObserver")`, then the global `ui_router_navigationObserver`
---@class ui_router_navigationObserver
---@field ModuleName string Module name: "navigationObserver".
ui_router_navigationObserver = {}

--- Associates the resolved target (full route, effective parameters, scope, options) with an attempt.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.lua:179
---@param attempt table|nil Attempt created by beginAttempt.
---@param target table|nil Target from resolveNavigationTarget (fullRouteName, params, options).
function ui_router_navigationObserver.attachResolvedTarget(attempt, target) end

--- Starts a new attempt on entering navigate() by capturing the external Lua caller. Must be called before any router wrapper.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.lua:164
---@return table  Attempt {id, source, route, params, scope, options} (the last four filled in by attachResolvedTarget).
function ui_router_navigationObserver.beginAttempt() end

--- Returns the last attempt started (a reentrant navigate() overwrites the previous one).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.lua:189
---@return table|nil  Current attempt.
function ui_router_navigationObserver.getCurrentAttempt() end

--- Reports a confirmed preemption: classifies the pair of attempts, writes a single warning and returns the record. Does nothing if an attempt is missing, if they are the same or if the preempted one has already been reported.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.lua:203
---@param preemptedAttempt table|nil Interrupted navigation.
---@param replacementAttempt table|nil Navigation that replaced it.
---@param phase string Label indicating where the preemption was detected.
---@return table|nil  {category, phase, preempted, replacement} or nil if nothing was reported.
function ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase) end

--- Resets the observer (current attempt, counter, attempts already reported).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationObserver.lua:227
function ui_router_navigationObserver.reset() end


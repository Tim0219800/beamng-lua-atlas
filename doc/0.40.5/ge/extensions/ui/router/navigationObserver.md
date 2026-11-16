# `ui_router_navigationObserver`

*File: `lua/ge/extensions/ui/router/navigationObserver.lua` · VM: Game Engine (GE) · 234 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_navigationObserver`: `extensions.load("ui_router_navigationObserver")`, then the global `ui_router_navigationObserver`

Non-shipping diagnostic of the router: attributes each navigate() call to the calling Lua module (walking up the stack ignoring "ui/router/" files) and warns when a navigation preempts another still in progress (active transition replaced, or navigate() whose epoch was incremented by a reentrant navigate() during its guards/onEnter). Each preemption is classified duplicate_navigation (identical requests: route, params, scope, options) or conflicting_navigation. It has no effect on the router's behavior: it records attempts and writes warnings.

## Notes

- Must be loaded and called only if shipping_build ~= true (router.lua guarantees it).
- The warning message is written with the log tag "LuaRouterObserver" at level W, in the form "<category>: navigation from <source> [route=… scope=…] preempted by … (phase: …); check and fix duplicate navigation".
- The source is {module, file, func, line} of the first non-router frame within the first 24 stack levels; otherwise module = "bridge/unknown" (call coming from the engine/UI).
- A given preempted attempt is never reported twice, and an attempt does not preempt itself.
- Phase values used by router.lua: active_transition, post_guard, post_enter.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_navigationObserver.attachResolvedTarget(attempt, target)` | Associates the resolved target (full route, effective parameters, scope, options) with an attempt. *(internal)* | 179 |
| `ui_router_navigationObserver.beginAttempt()` | Starts a new attempt on entering navigate() by capturing the external Lua caller. Must be called before any router wrapper. *(internal)* | 164 |
| `ui_router_navigationObserver.getCurrentAttempt()` | Returns the last attempt started (a reentrant navigate() overwrites the previous one). *(internal)* | 189 |
| `ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase)` | Reports a confirmed preemption: classifies the pair of attempts, writes a single warning and returns the record. Does nothing if an attempt is missing, if they are the same or if the preempted one has already been reported. *(internal)* | 203 |
| `ui_router_navigationObserver.reset()` | Resets the observer (current attempt, counter, attempts already reported). *(internal)* | 227 |

### Parameter details

#### `ui_router_navigationObserver.attachResolvedTarget(attempt, target)`

Associates the resolved target (full route, effective parameters, scope, options) with an attempt.

- `attempt` (*table|nil*) : Attempt created by beginAttempt.
- `target` (*table|nil*) : Target from resolveNavigationTarget (fullRouteName, params, options).

#### `ui_router_navigationObserver.beginAttempt()`

Starts a new attempt on entering navigate() by capturing the external Lua caller. Must be called before any router wrapper.

- **returns**: table Attempt {id, source, route, params, scope, options} (the last four filled in by attachResolvedTarget).

#### `ui_router_navigationObserver.getCurrentAttempt()`

Returns the last attempt started (a reentrant navigate() overwrites the previous one).

- **returns**: table|nil Current attempt.

#### `ui_router_navigationObserver.reportPreemption(preemptedAttempt, replacementAttempt, phase)`

Reports a confirmed preemption: classifies the pair of attempts, writes a single warning and returns the record. Does nothing if an attempt is missing, if they are the same or if the preempted one has already been reported.

- `preemptedAttempt` (*table|nil*) : Interrupted navigation.
- `replacementAttempt` (*table|nil*) : Navigation that replaced it.
- `phase` (*string*) : Label indicating where the preemption was detected.
- **returns**: table|nil {category, phase, preempted, replacement} or nil if nothing was reported.

## Fields

| Field | Type | Description |
|---|---|---|
| `ModuleName` | string | Module name: "navigationObserver". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/navigationObserver.lua`.*

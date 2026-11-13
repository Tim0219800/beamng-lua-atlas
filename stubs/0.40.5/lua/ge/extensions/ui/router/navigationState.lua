---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_navigationState` : `extensions.load("ui_router_navigationState")`, puis la globale `ui_router_navigationState`
---@class ui_router_navigationState
ui_router_navigationState = {}

---Source : lua/ge/extensions/ui/router/navigationState.lua:132
function ui_router_navigationState.clearDecorator() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:26
---@param routeName any
function ui_router_navigationState.clearLastActiveScope(routeName) end

--- Drop an uncommitted pending entry. Used on timeout, rejection, explicit cancellation,
---  and preemption so a superseded/aborted navigation never leaves stale pending state behind.
---Source : lua/ge/extensions/ui/router/navigationState.lua:44
function ui_router_navigationState.clearPendingEntry() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:153
---@param data any
function ui_router_navigationState.deserialize(data) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:82
function ui_router_navigationState.getBreadcrumbs() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:54
function ui_router_navigationState.getCurrentEntry() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:70
function ui_router_navigationState.getCurrentResolved() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:74
function ui_router_navigationState.getCurrentRouteNode() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:116
function ui_router_navigationState.getDecorator() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:120
function ui_router_navigationState.getDecoratorModule() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:22
---@param routeName any
function ui_router_navigationState.getLastActiveScope(routeName) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:58
function ui_router_navigationState.getPendingEntry() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:78
function ui_router_navigationState.getPendingRouteNode() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:62
function ui_router_navigationState.getPreviousEntry() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:128
function ui_router_navigationState.isDecoratorVisible() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:48
function ui_router_navigationState.promotePendingEntry() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:95
function ui_router_navigationState.promotePendingStates() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:167
function ui_router_navigationState.reset() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:140
function ui_router_navigationState.serialize() end

---Source : lua/ge/extensions/ui/router/navigationState.lua:111
---@param value any
---@param moduleName any
function ui_router_navigationState.setDecorator(value, moduleName) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:124
---@param visible any
function ui_router_navigationState.setDecoratorVisible(visible) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:18
---@param routeName any
---@param scopeId any
function ui_router_navigationState.setLastActiveScope(routeName, scopeId) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:38
---@param entry any
function ui_router_navigationState.setPendingEntry(entry) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:86
---@param routeNode any
---@param data any
function ui_router_navigationState.setPendingState(routeNode, data) end

---Source : lua/ge/extensions/ui/router/navigationState.lua:99
function ui_router_navigationState.setRequest() end


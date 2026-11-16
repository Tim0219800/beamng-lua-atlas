---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/navigationState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- State memory of the UI router: previous entry, current entry and pending entry, breadcrumb decorator state, and last active scope per route. It provides the accessors, the promotion of a pending entry to current entry, serialization (to survive Lua extensions reload) and reset. No navigation logic: the router decides.
--- Access: extension `ui_router_navigationState`: `extensions.load("ui_router_navigationState")`, then the global `ui_router_navigationState`
---@class ui_router_navigationState
ui_router_navigationState = {}

--- Resets the decorator (value and module to nil, visibility to the config default).
---Source: lua/ge/extensions/ui/router/navigationState.lua:132
function ui_router_navigationState.clearDecorator() end

--- Forgets a route's last active scope (ignored if routeName is nil).
---Source: lua/ge/extensions/ui/router/navigationState.lua:26
---@param routeName string|nil Road name.
function ui_router_navigationState.clearLastActiveScope(routeName) end

--- Removes the unvalidated pending entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:44
function ui_router_navigationState.clearPendingEntry() end

--- Restores the state from serialize data (no effect if data is nil). Without a decorator field, the decorator is reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationState.lua:153
---@param data table|nil Data produced by serialize.
function ui_router_navigationState.deserialize(data) end

--- Returns the breadcrumb of the current entry ({} if none).
---Source: lua/ge/extensions/ui/router/navigationState.lua:82
---@return table[]  Breadcrumbs.
function ui_router_navigationState.getBreadcrumbs() end

--- Returns the current (committed) navigation entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:54
---@return table|nil  Entry {request, resolved, origin, toRoute, fromRoute, routeNode}.
function ui_router_navigationState.getCurrentEntry() end

--- Compatibility shortcut: returns the full current entry (see notes).
---Source: lua/ge/extensions/ui/router/navigationState.lua:70
---@return table|nil  Current entry.
function ui_router_navigationState.getCurrentResolved() end

--- Returns the route configuration (routeNode, with its hooks) of the current entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:74
---@return table|nil  Route node.
function ui_router_navigationState.getCurrentRouteNode() end

--- Returns the decorator value.
---Source: lua/ge/extensions/ui/router/navigationState.lua:116
---@return any  Decorator or nil.
function ui_router_navigationState.getDecorator() end

--- Returns the decorator's owner module.
---Source: lua/ge/extensions/ui/router/navigationState.lua:120
---@return string|nil  Module name.
function ui_router_navigationState.getDecoratorModule() end

--- Returns the last stored active scope for the route.
---Source: lua/ge/extensions/ui/router/navigationState.lua:22
---@param routeName string Road name.
---@return string|nil  Scope identifier.
function ui_router_navigationState.getLastActiveScope(routeName) end

--- Returns the pending entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:58
---@return table|nil  Pending entry.
function ui_router_navigationState.getPendingEntry() end

--- Returns the routeNode of the pending entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:78
---@return table|nil  Route node.
function ui_router_navigationState.getPendingRouteNode() end

--- Returns the previous entry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:62
---@return table|nil  Previous entry.
function ui_router_navigationState.getPreviousEntry() end

--- Returns whether the decorator is visible.
---Source: lua/ge/extensions/ui/router/navigationState.lua:128
---@return boolean  Visibility.
function ui_router_navigationState.isDecoratorVisible() end

--- Promotes the pending entry to current entry (the old current becomes previous).
---Source: lua/ge/extensions/ui/router/navigationState.lua:48
function ui_router_navigationState.promotePendingEntry() end

--- Compatibility shortcut: calls promotePendingEntry.
---Source: lua/ge/extensions/ui/router/navigationState.lua:95
function ui_router_navigationState.promotePendingStates() end

--- Resets the three entries, the last active scopes and the decorator.
---Source: lua/ge/extensions/ui/router/navigationState.lua:167
function ui_router_navigationState.reset() end

--- Serializes the previous/current/pending entries (storable forms) and the decorator.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/router/navigationState.lua:140
---@return table  {previousEntry, currentEntry, pendingEntry, decorator={value, moduleName, visible}}.
function ui_router_navigationState.serialize() end

--- Sets the decorator value and its module.
---Source: lua/ge/extensions/ui/router/navigationState.lua:111
---@param value any Decorator value.
---@param moduleName string Owner module (first segment of the route name).
function ui_router_navigationState.setDecorator(value, moduleName) end

--- Shows or hides the decorator.
---Source: lua/ge/extensions/ui/router/navigationState.lua:124
---@param visible boolean Visibility.
function ui_router_navigationState.setDecoratorVisible(visible) end

--- Stores a route's last active scope.
---Source: lua/ge/extensions/ui/router/navigationState.lua:18
---@param routeName string Road name.
---@param scopeId string Scope identifier.
function ui_router_navigationState.setLastActiveScope(routeName, scopeId) end

--- Sets the navigation entry pending validation by the framework.
---Source: lua/ge/extensions/ui/router/navigationState.lua:38
---@param entry table Navigation entry.
function ui_router_navigationState.setPendingEntry(entry) end

--- Compatibility shortcut: builds the pending entry from a routeNode and {request, resolved, origin}.
---Source: lua/ge/extensions/ui/router/navigationState.lua:86
---@param routeNode table Route node.
---@param data table {request, resolved, origin}.
function ui_router_navigationState.setPendingState(routeNode, data) end

--- Compatibility shortcut: does nothing.
---Source: lua/ge/extensions/ui/router/navigationState.lua:99
function ui_router_navigationState.setRequest() end


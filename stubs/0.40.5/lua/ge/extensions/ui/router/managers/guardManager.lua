---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/guardManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry of the router's navigation guards. reloadGuards scans the lua/ge/extensions/ui/router/guards/ folder, loads each file and registers the functions of its M.guards table under their key. Routes reference these keys in their guard lists (enterGuards, exitGuards); executeGuards runs them in order. A modder can add their own guards with addGuard.
--- Access: extension `ui_router_managers_guardManager`: `extensions.load("ui_router_managers_guardManager")`, then the global `ui_router_managers_guardManager`
---@class ui_router_managers_guardManager
ui_router_managers_guardManager = {}

--- Adds a guard under the given key; does nothing (warning) if the key already exists.
---Source: lua/ge/extensions/ui/router/managers/guardManager.lua:26
---@param key string Guard key.
---@param fn function Function (route, params, context) -> boolean.
function ui_router_managers_guardManager.addGuard(key, fn) end

--- Runs the listed guards in order; stops at the first one that returns false.
---Source: lua/ge/extensions/ui/router/managers/guardManager.lua:46
---@param specifiedGuards string[] Keys of the guards to run.
---@param route table Target route (or the current route for exit guards).
---@param params table|nil Route parameters.
---@param context table|nil Context (for example {routeName, options} for exit guards).
---@return table  {result = value of the last guard run (true by default), failedGuard = key of the blocking guard}.
function ui_router_managers_guardManager.executeGuards(specifiedGuards, route, params, context) end

--- Empties the registry then reloads all guards from the files of the guards/ folder. Called when ui_router loads.
---Source: lua/ge/extensions/ui/router/managers/guardManager.lua:9
function ui_router_managers_guardManager.reloadGuards() end

--- Removes the guard with the given key.
---Source: lua/ge/extensions/ui/router/managers/guardManager.lua:42
---@param key string Guard key.
function ui_router_managers_guardManager.removeGuard(key) end

--- Replaces an existing guard; does nothing (warning) if the key is unknown.
---Source: lua/ge/extensions/ui/router/managers/guardManager.lua:34
---@param key string Guard key.
---@param fn function New function.
function ui_router_managers_guardManager.updateGuard(key, fn) end


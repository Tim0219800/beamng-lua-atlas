---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small UI router utilities: detection and resolution of relative route names (Angular "^." and Vue "./", "../" styles), deep table merging and resolution of a "module.func" function reference into a callable Lua function. Used by the router and its services.
--- Access: extension `ui_router_utils`: `extensions.load("ui_router_utils")`, then the global `ui_router_utils`
---@class ui_router_utils
ui_router_utils = {}

--- Recursively merges `source` into `target` (modified in place): common tables are merged, other values are overwritten by those from source. If source is not a table, returns source (or target if source is nil).
---Source: lua/ge/extensions/ui/router/utils.lua:101
---@param target table Table to modify.
---@param source table Table to merge.
---@return table  The merged target table.
function ui_router_utils.deepMerge(target, source) end

--- Returns whether the route name is relative: starts with '^' (Angular) or '.' (Vue).
---Source: lua/ge/extensions/ui/router/utils.lua:5
---@param route string|any Road name.
---@return boolean  true if relative; false for a non-string.
function ui_router_utils.isRelativeRoute(route) end

--- Resolves a "module.func" string (split at the last dot) into a function of the matching extension.
---Source: lua/ge/extensions/ui/router/utils.lua:123
---@param reference string|nil "module.func" reference; nil gives three nils.
---@param contextLabel string|nil Label used in error messages (default "Function reference").
---@return function|nil  The function found.
---@return string|nil  Error message.
---@return boolean|nil  true on error.
function ui_router_utils.resolveFunctionReference(reference, contextLabel) end

--- Converts a relative route into a dotted absolute name relative to the current state. "^^.x" or "../../x" go up n levels; "./x" stays at the same level (adds a child); '/' become '.'. An absolute route is returned as is.
---Source: lua/ge/extensions/ui/router/utils.lua:23
---@param route string Relative or absolute route.
---@param currentState string Dotted name of the current route.
---@return string  Resolved dotted name.
function ui_router_utils.resolveRelativeRoute(route, currentState) end


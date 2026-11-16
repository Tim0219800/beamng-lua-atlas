---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/managers/scopeManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the focus scopes of a UI route. A route declares a scope tree (scopeTree); this module determines the target scope of a navigation, checks that a scope exists in the tree and builds the parent table of each scope with its metadata (backTarget, optional, escapeTargets, preferAutoFocus...).
--- Access: extension `ui_router_managers_scopeManager`: `extensions.load("ui_router_managers_scopeManager")`, then the global `ui_router_managers_scopeManager`
---@class ui_router_managers_scopeManager
ui_router_managers_scopeManager = {}

--- Walks the scope tree and returns a table keyed by scope identifier.
---Source: lua/ge/extensions/ui/router/managers/scopeManager.lua:67
---@param scopeTree table|nil Scope tree; nil gives {}.
---@return table<string, table>  For each scope: {parentScopeId (false for the root), isRoot, backTarget, backTargetType, optional (boolean), escapeTargets, preferAutoFocus (boolean)}.
function ui_router_managers_scopeManager.buildScopeParentMap(scopeTree) end

--- Determines the target scope of a navigation according to the priority described in the notes.
---Source: lua/ge/extensions/ui/router/managers/scopeManager.lua:38
---@param route table Route configuration (name, scopeTree, targetScope).
---@param options table|nil Navigation options: routeScopeId, preferredScope, restoreLastScope.
---@return table  {targetScope = string|nil}.
function ui_router_managers_scopeManager.getTargetScope(route, options) end

--- Indicates whether scopeId is a scope declared in the tree.
---Source: lua/ge/extensions/ui/router/managers/scopeManager.lua:24
---@param scopeTree table|nil Route's scope tree.
---@param scopeId string|nil Scope identifier (non-empty string).
---@return boolean  true if the scope exists in the tree.
function ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId) end


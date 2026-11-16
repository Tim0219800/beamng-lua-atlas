# `ui_router_managers_scopeManager`

*File: `lua/ge/extensions/ui/router/managers/scopeManager.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_managers_scopeManager`: `extensions.load("ui_router_managers_scopeManager")`, then the global `ui_router_managers_scopeManager`

Manages the focus scopes of a UI route. A route declares a scope tree (scopeTree); this module determines the target scope of a navigation, checks that a scope exists in the tree and builds the parent table of each scope with its metadata (backTarget, optional, escapeTargets, preferAutoFocus...).

## Notes

- Target scope priority: options.routeScopeId (the route's :scope suffix), then options.preferredScope, then (if options.restoreLastScope == true) the stored last active scope if it is still declared in the tree (otherwise it is forgotten), then route.targetScope, then the first key of route.scopeTree.
- If routeScopeId and preferredScope are both provided, a warning is logged and routeScopeId wins.
- Reserved keys of a scope node (not treated as child scopes): backTarget, backTargetType, optional, escapeTargets, preferAutoFocus.
- getScopeTreeRoot uses pairs on the table: if the tree has several roots, the "first" key is undetermined (pairs order).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_managers_scopeManager.buildScopeParentMap(scopeTree)` | Walks the scope tree and returns a table keyed by scope identifier. | 67 |
| `ui_router_managers_scopeManager.getTargetScope(route, options)` | Determines the target scope of a navigation according to the priority described in the notes. | 38 |
| `ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId)` | Indicates whether scopeId is a scope declared in the tree. | 24 |

### Parameter details

#### `ui_router_managers_scopeManager.buildScopeParentMap(scopeTree)`

Walks the scope tree and returns a table keyed by scope identifier.

- `scopeTree` (*table|nil*) : Scope tree; nil gives {}.
- **returns**: table<string, table> For each scope: {parentScopeId (false for the root), isRoot, backTarget, backTargetType, optional (boolean), escapeTargets, preferAutoFocus (boolean)}.

#### `ui_router_managers_scopeManager.getTargetScope(route, options)`

Determines the target scope of a navigation according to the priority described in the notes.

- `route` (*table*) : Route configuration (name, scopeTree, targetScope).
- `options` (*table|nil*) : Navigation options: routeScopeId, preferredScope, restoreLastScope.
- **returns**: table {targetScope = string|nil}.

#### `ui_router_managers_scopeManager.isScopeDeclaredInTree(scopeTree, scopeId)`

Indicates whether scopeId is a scope declared in the tree.

- `scopeTree` (*table|nil*) : Route's scope tree.
- `scopeId` (*string|nil*) : Scope identifier (non-empty string).
- **returns**: boolean true if the scope exists in the tree.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/managers/scopeManager.lua`.*

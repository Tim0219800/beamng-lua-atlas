---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_barrierMgr` : `extensions.load("editor_heroRoadEditor_barrierMgr")`, puis la globale `editor_heroRoadEditor_barrierMgr`
---@class editor_heroRoadEditor_barrierMgr
editor_heroRoadEditor_barrierMgr = {}

--- Burn: flip the group's current furniture pieces to persistent (canSave=true) and detach them from the transient pools
---  (props.commitPool). Returns the merged name manifest; the caller (exportMgr bake) stores it.
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:159
---@param group any
function editor_heroRoadEditor_barrierMgr.burnGroup(group) end

--- Live placed-piece counts for a group, by category (both sides summed). Reads the transient prop pools -- so it reflects the
---  editable preview; a baked road's furniture is committed out of the pools, so this reports 0 there (as intended -- baked = locked).
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:146
---@param group any
function editor_heroRoadEditor_barrierMgr.counts(group) end

--- Deletes all placed furniture for the group (teardown / node count dropped below 2).
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:131
---@param group any
function editor_heroRoadEditor_barrierMgr.removeGroup(group) end

--- (Re)builds the group's barriers + fences + lamp posts to match the current mesh edge + selections. Called after the mesh rebuild.
---Source : lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:111
---@param group any
function editor_heroRoadEditor_barrierMgr.updateGroup(group) end


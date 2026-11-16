---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the roadside furniture (guardrails, fences, lampposts) of a Hero Road Editor group. It reads the group's mesh edges (meshEdgeL/R, meshEdgeDirL/R, meshEdgeUp) and places pieces via editor/toolUtilities/roadsideProps (transient pools identified by id..'bL', 'fL', 'lL'...). It handles the rails of the whole road (Furniture tab) and the placed barrier segments (Features tab, group.barriers).
--- Access: extension `editor_heroRoadEditor_barrierMgr`: `extensions.load("editor_heroRoadEditor_barrierMgr")`, then the global `editor_heroRoadEditor_barrierMgr`
---@class editor_heroRoadEditor_barrierMgr
editor_heroRoadEditor_barrierMgr = {}

--- "Burn": makes the current pieces persistent (canSave=true) via props.commitPool and detaches them from the transient pools. Returns the manifest of names, which exportMgr stores during the bake.
---Source: lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:159
---@param group table Hero Road group.
---@return table  Array of identifiers/names of created scene objects (empty if the group is invalid).
function editor_heroRoadEditor_barrierMgr.burnGroup(group) end

--- Number of pieces currently placed for the group, per category, both sides combined. Reads the transient pools (so the editable preview).
---Source: lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:146
---@param group table Hero Road group.
---@return integer  Number of barriers.
---@return integer  Number of fences.
---@return integer  Number of lampposts.
function editor_heroRoadEditor_barrierMgr.counts(group) end

--- Removes all the furniture placed for the group (teardown or fewer than 2 nodes).
---Source: lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:131
---@param group table Hero Road group.
function editor_heroRoadEditor_barrierMgr.removeGroup(group) end

--- (Re)builds the group's barriers, fences and lampposts from the current mesh edges and the selections. Called after the mesh is rebuilt; does nothing if the group has no scenetree folder (sceneTreeFolderId).
---Source: lua/ge/extensions/editor/heroRoadEditor/barrierMgr.lua:111
---@param group table Hero Road group (id, sceneTreeFolderId, meshEdgeL/R, barrierLeftType, fenceLeftType, lampLeftType, barriers...).
function editor_heroRoadEditor_barrierMgr.updateGroup(group) end


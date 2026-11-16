---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendering of the repair patch clusters (asphalt patches) of a Hero Road Editor road. Each cluster group.repairs[i] (created in the Features tab) becomes a pseudo-random fixed-seed scatter of decal instances placed on the roadway via editor.addDecalInstanceWithTan, with a DecalData shared per material. It is surface only: no impact on mesh, sidewalks or collision. The result is a pure function of the cluster's parameters and its seed, so identical after save or undo.
--- Access: extension `editor_heroRoadEditor_repairMgr`: `extensions.load("editor_heroRoadEditor_repairMgr")`, then the global `editor_heroRoadEditor_repairMgr`
---@class editor_heroRoadEditor_repairMgr
editor_heroRoadEditor_repairMgr = {}

--- Deletes the group's repair decal instances and their DecalData templates, then forgets its store entry. Called on every rebuild and at teardown.
---Source: lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:41
---@param group table|nil Hero Road group.
function editor_heroRoadEditor_repairMgr.clearRepairs(group) end

--- Rebuilds the decal scatter of each placed cluster (first calls clearRepairs). Does nothing more if the road has no repairs, fewer than 2 divPoints, no binormals, no scene folder or a zero length.
---Source: lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:144
---@param group table|nil Hero Road group (repairs, divPoints, binormals, divWidths, sceneTreeFolderId).
function editor_heroRoadEditor_repairMgr.updateRepairs(group) end


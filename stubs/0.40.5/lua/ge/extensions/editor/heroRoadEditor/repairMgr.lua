---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_repairMgr` : `extensions.load("editor_heroRoadEditor_repairMgr")`, puis la globale `editor_heroRoadEditor_repairMgr`
---@class editor_heroRoadEditor_repairMgr
editor_heroRoadEditor_repairMgr = {}

--- Delete a group's live repair decal instances + DecalData templates, and forget the bucket. Called on every rebuild + on
---  teardown.
---Source : lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:41
---@param group any
function editor_heroRoadEditor_repairMgr.clearRepairs(group) end

--- (Re)build every placed repair cluster's decal scatter. No-op (past the clear) when the road has none / isn't ready.
---Source : lua/ge/extensions/editor/heroRoadEditor/repairMgr.lua:144
---@param group any
function editor_heroRoadEditor_repairMgr.updateRepairs(group) end


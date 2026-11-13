---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_sidewalkMgr` : `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, puis la globale `editor_heroRoadEditor_sidewalkMgr`
---@class editor_heroRoadEditor_sidewalkMgr
editor_heroRoadEditor_sidewalkMgr = {}

--- Bake: write the group's walk to `dir` as a .dae and stand a persistent TSStatic on it, in place of the mesh. The geometry
--- is written around its own centre and the static placed there, so a road far out on the map still bakes small local
--- coordinates. Returns the scene-object name manifest, which is what un-baking removes it by.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:95
---@param group any
---@param dir any
function editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir) end

--- Delete a group's walk mesh and forget it.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:61
---@param group any
function editor_heroRoadEditor_sidewalkMgr.removeGroup(group) end

--- The triangles this group's walk stands as, for the tool's own tally.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:87
---@param group any
function editor_heroRoadEditor_sidewalkMgr.tris(group) end

--- (Re)builds the group's sidewalks to match the current mesh edge + toggles. Called right after the mesh rebuild. Both sides
---  go into ONE mesh: they are the same two stones, so a road's whole footway is two draws whichever sides are on.
---Source : lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:70
---@param group any
function editor_heroRoadEditor_sidewalkMgr.updateGroup(group) end


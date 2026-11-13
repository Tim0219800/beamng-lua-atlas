---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/terrainPainter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_terrainPainter` : `extensions.load("editor_toolUtilities_terrainPainter")`, puis la globale `editor_toolUtilities_terrainPainter`
---@class editor_toolUtilities_terrainPainter
editor_toolUtilities_terrainPainter = {}

--- Paints the given spline: work its footprint out, then paint that. `runs` (optional, divPoint index pairs { i0, i1 }): only
---  those stretches of it, into the one record.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:143
---@param group any
---@param runs any
function editor_toolUtilities_terrainPainter.paint(group, runs) end

--- Paint one closed world-XY polygon in the given terrain material, recording what was there into `store` so it can be put
---  back. `skip`, if given, is asked about each point and leaves the ground it claims alone.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:83
---@param store any
---@param poly any
---@param materialIdx any
---@param skip any
function editor_toolUtilities_terrainPainter.paintPolygon(store, poly, materialIdx, skip) end

--- Reverts the terrain under whatever was painted back to the state it had before.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:179
---@param group any
function editor_toolUtilities_terrainPainter.revert(group) end

--- Reverts all terrain painting for all groups.
---Source : lua/ge/extensions/editor/toolUtilities/terrainPainter.lua:207
---@param groups any
function editor_toolUtilities_terrainPainter.revertAll(groups) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_treeSpline_populate` : `extensions.load("editor_treeSpline_populate")`, puis la globale `editor_treeSpline_populate`
---@class editor_treeSpline_populate
editor_treeSpline_populate = {}

--- Takes back the trees release() let go of (those still in the forest), as they are.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:78
---@param spline any
---@param kept any
function editor_treeSpline_populate.adopt(spline, kept) end

--- (Re)plants the spline: clears its previous instances, then scatters a fresh evenly-spaced row along the
---  current centreline from the spline's foliage params.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:31
---@param spline any
function editor_treeSpline_populate.populateTreeSpline(spline) end

--- Lua reload: the tool lets go of a locked spline's trees without removing them (they are the level's) and returns their keys
---  and positions, for adopt() to find again.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:67
---@param spline any
function editor_treeSpline_populate.release(spline) end

--- Removes the forest instances previously planted for this spline.
---Source : lua/ge/extensions/editor/treeSpline/populate.lua:21
---@param spline any
function editor_treeSpline_populate.tryRemove(spline) end


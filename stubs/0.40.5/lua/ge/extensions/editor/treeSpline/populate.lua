---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/populate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Submodule of the editor's Tree Spline tool: plants or removes trees (Forest instances) along a spline. Relies on editor/toolUtilities/foliageScatter (scatterLine, removeItems, ensureForest) and editor/toolUtilities/occupancy (exclusion mask). The planted instances are stored in spline.items and spline.count.
--- Access: extension `editor_treeSpline_populate`: `extensions.load("editor_treeSpline_populate")`, then the global `editor_treeSpline_populate`
---@class editor_treeSpline_populate
editor_treeSpline_populate = {}

--- Takes back the trees returned by release() that still exist in the Forest (found by key and position) and updates spline.items / spline.count.
---Source: lua/ge/extensions/editor/treeSpline/populate.lua:78
---@param spline table Spline that gets its trees back.
---@param kept table List returned by release().
function editor_treeSpline_populate.adopt(spline, kept) end

--- (Re)plants the spline: deletes its old instances then distributes a new regular row along the centerline (divPoints, binormals) according to the foliage parameters (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Fills spline.items and spline.count.
---Source: lua/ge/extensions/editor/treeSpline/populate.lua:31
---@param spline table Tree spline with its foliage parameters.
function editor_treeSpline_populate.populateTreeSpline(spline) end

--- Used during a Lua reload: the tool lets go of the trees of a locked spline without deleting them (they belong to the level) and returns their keys and positions for adopt().
---Source: lua/ge/extensions/editor/treeSpline/populate.lua:67
---@param spline table Spline locked.
---@return table  List of {key, x, y, z} for each kept tree.
function editor_treeSpline_populate.release(spline) end

--- Removes from the Forest the instances previously planted for this spline, then empties spline.items and sets spline.count back to 0. No effect if spline or spline.items is nil.
---Source: lua/ge/extensions/editor/treeSpline/populate.lua:21
---@param spline table Tree spline (fields items, count).
function editor_treeSpline_populate.tryRemove(spline) end


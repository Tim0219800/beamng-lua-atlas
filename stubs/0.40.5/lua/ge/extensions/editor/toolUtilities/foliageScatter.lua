---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliageScatter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vegetation planting engine (Forest, ForestItemData objects) for the editor tools. It scatters instances in a polygon (scatterArea, with Poisson-type spacing), along a line (scatterLine) or on specific points (scatterPoints), places each plant on the terrain (core_terrain.getTerrainHeight) while removing the mesh floor, and handles removal, holding aside during a level save (lift/relay) and re-draping onto the terrain (redrape).
--- Access: extension `editor_toolUtilities_foliageScatter`: `extensions.load("editor_toolUtilities_foliageScatter")`, then the global `editor_toolUtilities_foliageScatter`
---@class editor_toolUtilities_foliageScatter
editor_toolUtilities_foliageScatter = {}

--- Registers an item list provider for re-draping onto the terrain: fn(out) must add to out each item list (a slot can be false). Used by tools whose plants must stay on the ground when it moves.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:602
---@param fn function Function fn(out) that adds its lists to out.
function editor_toolUtilities_foliageScatter.addDraped(fn) end

--- Like defaultSpeciesSelection but shrub-oriented: first species whose name contains bush, shrub, fern, hedge, flower, plant, grass or reed, otherwise the first of the list.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:124
---@return table<string, boolean>  Set { name = true }.
function editor_toolUtilities_foliageScatter.defaultShrubSelection() end

--- Chooses a default species selection among those of the level: the first found among tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, otherwise the first species of the list.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:111
---@return table<string, boolean>  Set { name = true } (empty if the level has no species).
function editor_toolUtilities_foliageScatter.defaultSpeciesSelection() end

--- Returns the level's Forest object and its data, creating an empty Forest if the level has none. On failure, logs an error and returns nil, nil.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:81
---@return userdata|nil  Forest object.
---@return userdata|nil  ForestData (forest:getData()).
function editor_toolUtilities_foliageScatter.ensureForest() end

--- Returns the stable order of the classes for the interface: forest, dense, sparse, shrub, orchard.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:545
---@return string[]  Class names.
function editor_toolUtilities_foliageScatter.getClassOrder() end

--- Returns the table of class presets (forest, dense, sparse, shrub, orchard) with spacingM and scaleVariance. It is the internal table, not copied.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:542
---@return table<string, table>  Presets.
function editor_toolUtilities_foliageScatter.getClassPresets() end

--- Returns a fresh copy of the default distribution parameters, to initialize a new area.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:539
---@return table  { class, spacingM, densityScale, scaleVariance, alignToNormal, slopeMaxDeg, seed }.
function editor_toolUtilities_foliageScatter.getDefaultDistribution() end

--- Crown radius of a ForestItemData at scale 1: largest horizontal side of its bounding box around the origin, valid whatever the orientation. Plants a temporary item to get its box, then removes it.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:70
---@param fd userdata Level ForestData (the one from forest:getData()).
---@param obj userdata ForestItemData object of the species.
---@return number  Radius in meters, 0 if unavailable.
function editor_toolUtilities_foliageScatter.itemCrownR(fd, obj) end

--- Takes a tool's live planting out of the forest before a level save (which writes the forest as is). Stores the data, transform and scale of each item and keeps the slots. Returns nil if there is no forest.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:169
---@param lists table[] List of item lists; a slot can be false.
---@return table|nil  'held' token to pass back to relay.
function editor_toolUtilities_foliageScatter.lift(lists) end

--- Sorted list of the level's ForestItemData names, i.e. the species that the tools can plant.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:96
---@return string[]  Sorted names.
function editor_toolUtilities_foliageScatter.listForestItemData() end

--- Plants an already decided item (species, scale, rotation, position) by placing it on the terrain, mesh floor removed. Returns nil if the species does not exist in the level.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:551
---@param it table { x, y, sp (species name), s (scale, default 1), rx, ry, a (Euler angles in rad, default 0) }.
---@param fd userdata ForestData.
---@param byName table Species cache between calls (to be supplied, e.g. {}).
---@return userdata|nil  Handle of the created item.
function editor_toolUtilities_foliageScatter.plantOne(it, fd, byName) end

--- Puts back on the terrain all the plants registered via addDraped located in the given world box, if their height differs by more than 0.005 m. The moved item is rewritten in its list (updateItem).
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:606
---@param x0 number Minimum X of the box.
---@param y0 number Minimum Y.
---@param x1 number Maximum X.
---@param y1 number Maximum Y.
---@return integer  Number of moved plants (0 if there is no forest).
function editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1) end

--- Puts back the items removed by lift, in the same slots of the same lists (new handles created with createNewItem), once the save is done. No effect if held is nil.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:188
---@param held table|nil Result of lift.
function editor_toolUtilities_foliageScatter.relay(held) end

--- Removes the listed items (from a previous scatter) from the forest and empties the items table.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:159
---@param fd userdata|nil ForestData; no effect if nil.
---@param items table|nil List of item handles; false slots are ignored.
function editor_toolUtilities_foliageScatter.removeItems(fd, items) end

--- Scatters instances in a polygon (with optional holes) using low-discrepancy candidates (R2 sequence) filtered by minimum spacing, maximum slope and occupancy. The species is drawn by weighted random for each instance. Returns ({}, 0) if the ring has fewer than 3 points or if no species is resolved.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:243
---@param params table ring (outline points, z ignored), holes (hole rings), forestData (otherwise ensureForest), species, speciesWeights, spacingM (min 0.5, default 6), densityScale (min 0.01), scaleVariance, scaleBase (min 0.05), alignToNormal (boolean), slopeMaxDeg (default 35), seed, occupiedFn, holdFn (true = the location stays in the plan but nothing is planted, slot false), maxInstances, record (table filled with { x, y, sp, s, a, ... } of what is planted).
---@return table  List of placed items (slots can be false with holdFn).
---@return integer  Number of placed instances.
function editor_toolUtilities_foliageScatter.scatterArea(params) end

--- Lays out a row of evenly spaced plants along a resampled centerline, with optional lateral scatter.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:372
---@param params table divPoints (line), binormals, forestData, species, speciesWeights, spacingM (min 0.5), posVariance (m, position scatter), scaleVariance, scaleBase, alignToNormal, slopeMaxDeg (default 89), seed, occupiedFn, maxInstances.
---@return table  Placed items.
---@return integer  Number of placed instances.
function editor_toolUtilities_foliageScatter.scatterLine(params) end

--- Plants exactly one instance at each supplied world point. By default the plant is placed on the terrain; with onPointZ it is placed at the point's z (+ zLift), e.g. bushes in a planter.
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:489
---@param params table points, forestData, species, speciesWeights, scaleVariance, scaleBase, seed, occupiedFn, onPointZ, zLift, record (see scatterArea).
---@return table  Placed items.
---@return integer  Number of placed instances.
function editor_toolUtilities_foliageScatter.scatterPoints(params) end

--- Sows a complete plan: list of anchor groups. A group with items is planted as is (plantOne); a group with points and species goes through scatterPoints (size -> scaleBase, vary -> scaleVariance, seed default 1, drape false = z of the point).
---Source: lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:581
---@param groups table[]|nil Groups { items } or { points, species, speciesWeights, size, vary, seed, drape }.
---@param fd userdata|nil ForestData (otherwise ensureForest).
---@return table  All the planted items.
function editor_toolUtilities_foliageScatter.sowGroups(groups, fd) end


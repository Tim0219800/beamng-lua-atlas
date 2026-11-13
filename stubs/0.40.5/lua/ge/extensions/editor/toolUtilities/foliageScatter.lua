---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliageScatter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_foliageScatter` : `extensions.load("editor_toolUtilities_foliageScatter")`, puis la globale `editor_toolUtilities_foliageScatter`
---@class editor_toolUtilities_foliageScatter
editor_toolUtilities_foliageScatter = {}

--- A tool whose plants stand straight on the terrain hands its item lists over here, so the ground moving under them sets
--- them back on it. `fn(out)` appends each list; a slot may be false.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:602
---@param fn any
function editor_toolUtilities_foliageScatter.addDraped(fn) end

--- Like defaultSpeciesSelection but biased to a low shrub.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:124
function editor_toolUtilities_foliageScatter.defaultShrubSelection() end

--- Picks a sensible default species selection from what the level actually has.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:111
function editor_toolUtilities_foliageScatter.defaultSpeciesSelection() end

--- Returns the level's Forest object, creating an (empty) one if the level has none.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:81
function editor_toolUtilities_foliageScatter.ensureForest() end

--- Returns the stable class ordering (for UI).
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:545
function editor_toolUtilities_foliageScatter.getClassOrder() end

--- Returns the class preset table.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:542
function editor_toolUtilities_foliageScatter.getClassPresets() end

--- Returns a fresh copy of the default distribution params (for seeding a new zone).
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:539
function editor_toolUtilities_foliageScatter.getDefaultDistribution() end

--- How far a ForestItemData mesh reaches out from its origin across the ground at scale 1 (the AABB's widest horizontal
---  side), so it holds whichever way the item is turned. Only a planted item has a box, so one is planted and taken up again.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:70
---@param fd any
---@param obj any
function editor_toolUtilities_foliageScatter.itemCrownR(fd, obj) end

--- A tool's live planting taken out of the forest for a level save, which writes the forest as it finds it. Each list keeps
--- its slots, and `relay` puts the same items back into them once the save is done.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:169
---@param lists any
function editor_toolUtilities_foliageScatter.lift(lists) end

--- Lists the ForestItemData names available in the level (sorted). These are the species the tools can plant.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:96
function editor_toolUtilities_foliageScatter.listForestItemData() end

--- One of them, or nil when its species is not in the level. `byName` caches the species across calls.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:551
---@param it any
---@param fd any
---@param byName any
function editor_toolUtilities_foliageScatter.plantOne(it, fd, byName) end

--- Every draped plant inside the world box set back on the terrain under it, seated the way it was planted. A moved item is
--- written back into its list, so the tool holding it holds the moved one. Returns how many moved.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:606
---@param x0 any
---@param y0 any
---@param x1 any
---@param y1 any
function editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1) end

---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:188
---@param held any
function editor_toolUtilities_foliageScatter.relay(held) end

--- Removes a list of planted forest items (from a previous scatter of the same zone).
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:159
---@param fd any
---@param items any
function editor_toolUtilities_foliageScatter.removeItems(fd, items) end

--- Scatters forest instances inside a polygon and returns the array of placed item handles.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:243
---@param params any
function editor_toolUtilities_foliageScatter.scatterArea(params) end

--- Scatters an evenly-spaced ROW of forest instances along a resampled centreline.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:372
---@param params any
function editor_toolUtilities_foliageScatter.scatterLine(params) end

--- Places exactly one instance at each supplied world point and returns the placed handles.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:489
---@param params any
function editor_toolUtilities_foliageScatter.scatterPoints(params) end

--- Sow a whole PLAN: a list of anchor groups. A group either names its points and lets the scatter choose what goes on them,
--- or carries the plants themselves already chosen. Both are here because both are what a site honestly has: a bed of shrubs
--- is a recipe, and a wood that was scattered over an area once and must come up the same way again is not.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:581
---@param groups any
---@param fd any
function editor_toolUtilities_foliageScatter.sowGroups(groups, fd) end


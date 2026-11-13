---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/forestGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_forestGenerator` : `extensions.load("util_forestGenerator")`, puis la globale `util_forestGenerator`
---@class util_forestGenerator
util_forestGenerator = {}

--- deletes all forest items (except for template items)
---Source : lua/ge/extensions/util/forestGenerator.lua:176
function util_forestGenerator.clearForest() end

--- creates a single forest item
---Source : lua/ge/extensions/util/forestGenerator.lua:57
---@param itemType any
---@param pos any
---@param rotDeg any
---@param scl any
function util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl) end

--- creates a forest with some randomized parameters (within a radius)
---Source : lua/ge/extensions/util/forestGenerator.lua:109
---@param itemTypeArray any
---@param amount any
---@param pos any
---@param radius any
---@param rotSteps any
---@param minScl any
---@param maxScl any
function util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl) end

--- creates a forest with some randomized parameters (within rectangle bounds)
---Source : lua/ge/extensions/util/forestGenerator.lua:68
---@param itemTypeArray any
---@param amount any
---@param pos any
---@param minX any
---@param maxX any
---@param minY any
---@param maxY any
---@param rotSteps any
---@param minScl any
---@param maxScl any
function util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl) end

--- deletes a single forest item
---Source : lua/ge/extensions/util/forestGenerator.lua:171
---@param item any
function util_forestGenerator.deleteForestItem(item) end

--- returns the forest item template
---Source : lua/ge/extensions/util/forestGenerator.lua:52
function util_forestGenerator.getForestItemDict() end

--- returns an array of all forest item types
---Source : lua/ge/extensions/util/forestGenerator.lua:47
function util_forestGenerator.getForestItemTypes() end

--- returns an array of forest items found within a given polygon (or if none given, returns all items)
---Source : lua/ge/extensions/util/forestGenerator.lua:148
---@param polygon any
function util_forestGenerator.getForestItemsPolygon(polygon) end

--- returns an array of forest items found within a given position and radius
---Source : lua/ge/extensions/util/forestGenerator.lua:164
---@param pos any
---@param radius any
function util_forestGenerator.getForestItemsRadius(pos, radius) end

--- initialize forest data
---Source : lua/ge/extensions/util/forestGenerator.lua:23
function util_forestGenerator.initForest() end

--- updates an existing forest item
---Source : lua/ge/extensions/util/forestGenerator.lua:141
---@param item any
---@param pos any
---@param rotDeg any
---@param scl any
function util_forestGenerator.updateForestItem(item, pos, rotDeg, scl) end


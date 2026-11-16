---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/forestGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utility to create, modify, list and delete objects of the forest (Forest system) of the loaded level: trees, bushes, rocks, etc. On load, it reads the level's forest object (core_forest.getForestObject()) and indexes the ForestItemData templates by internal name. A modder or an editor script uses it to randomly scatter vegetation (rectangle with blue noise, or disk) or to move/delete items.
--- Access: extension `util_forestGenerator`: `extensions.load("util_forestGenerator")`, then the global `util_forestGenerator`
---@class util_forestGenerator
util_forestGenerator = {}

--- Removes all items from the forest except the templates, then calls initForest() again.
---Source: lua/ge/extensions/util/forestGenerator.lua:176
function util_forestGenerator.clearForest() end

--- Creates a forest item from a template.
---Source: lua/ge/extensions/util/forestGenerator.lua:57
---@param itemType string Internal name of the template (see getForestItemTypes)
---@param pos vec3|nil World position (default vec3())
---@param rotDeg number|nil Rotation in degrees around Z (default 0)
---@param scl number|nil Uniform scale (default 1)
---@return userdata|nil  Item created, or nil if the template does not exist (error logged)
function util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl) end

--- Creates amount random items in a disk of radius radius around pos (getRandomPointInCircle).
---Source: lua/ge/extensions/util/forestGenerator.lua:109
---@param itemTypeArray string[]|nil Possible types (default: all templates)
---@param amount integer Number of items to create
---@param pos vec3|nil Disk center (default 0,0,0)
---@param radius number|nil Radius in meters (default 50)
---@param rotSteps number|nil Number of rotation steps over 360° (default 360)
---@param minScl number|nil Minimum scale (default 0.75)
---@param maxScl number|nil Maximum scale (default 1.25)
---@return table  List of created items
function util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl) end

--- Creates amount random items in a rectangle around pos. XY positions follow blue noise (getBlueNoise2d), the type is chosen at random from itemTypeArray, the rotation by steps, the scale between minScl and maxScl.
---Source: lua/ge/extensions/util/forestGenerator.lua:68
---@param itemTypeArray string[]|nil Possible types (default: all templates)
---@param amount integer Number of items to create
---@param pos vec3|nil Reference center (default 0,0,0)
---@param minX number|nil Minimum X offset from pos (default -100)
---@param maxX number|nil Maximum X offset (default 100)
---@param minY number|nil Minimum Y offset (default -100)
---@param maxY number|nil Maximum Y offset (default 100)
---@param rotSteps number|nil Number of rotation steps over 360° (default 360, minimum 1)
---@param minScl number|nil Minimum scale (default 0.75)
---@param maxScl number|nil Maximum scale (default 1.25)
---@return table  List of created items
function util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl) end

--- Removes an item from the forest.
---Source: lua/ge/extensions/util/forestGenerator.lua:171
---@param item userdata Item to remove
function util_forestGenerator.deleteForestItem(item) end

--- Returns the dictionary internal name -> template item.
---Source: lua/ge/extensions/util/forestGenerator.lua:52
---@return table<string, userdata>  Templates
function util_forestGenerator.getForestItemDict() end

--- Returns the sorted list of the internal names of the forest templates.
---Source: lua/ge/extensions/util/forestGenerator.lua:47
---@return string[]  Item types
function util_forestGenerator.getForestItemTypes() end

--- Returns the items located in a 2D polygon (projected on XY); without a polygon, returns all items.
---Source: lua/ge/extensions/util/forestGenerator.lua:148
---@param polygon vec3[]|nil Polygon vertices
---@return table  Forest items
function util_forestGenerator.getForestItemsPolygon(polygon) end

--- Returns the items located in a circle around a position.
---Source: lua/ge/extensions/util/forestGenerator.lua:164
---@param pos vec3|nil Center (default: camera position)
---@param radius number|nil Radius in meters (default 20)
---@return table  Forest items
function util_forestGenerator.getForestItemsRadius(pos, radius) end

--- (Re)initializes forestData from the level's forest object, rebuilds the dictionary of templates by internal name and the sorted list of types. Warns (log W) if the level or the forest object is absent.
---Source: lua/ge/extensions/util/forestGenerator.lua:23
function util_forestGenerator.initForest() end

--- Updates the position, Z rotation and scale of an existing item (forestData:updateItem).
---Source: lua/ge/extensions/util/forestGenerator.lua:141
---@param item userdata Existing forest item
---@param pos vec3 New position
---@param rotDeg number|nil Z rotation in degrees (default 0)
---@param scl number|nil Scale (default 1)
---@return userdata  Updated item (return of updateItem)
function util_forestGenerator.updateForestItem(item, pos, rotDeg, scl) end


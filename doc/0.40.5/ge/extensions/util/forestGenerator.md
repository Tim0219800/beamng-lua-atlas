# `util_forestGenerator`

*File: `lua/ge/extensions/util/forestGenerator.lua` · VM: Game Engine (GE) · 198 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_forestGenerator`: `extensions.load("util_forestGenerator")`, then the global `util_forestGenerator`

Utility to create, modify, list and delete objects of the forest (Forest system) of the loaded level: trees, bushes, rocks, etc. On load, it reads the level's forest object (core_forest.getForestObject()) and indexes the ForestItemData templates by internal name. A modder or an editor script uses it to randomly scatter vegetation (rectangle with blue noise, or disk) or to move/delete items.

## Example

```lua
local fg = extensions.util_forestGenerator
local types = fg.getForestItemTypes()
fg.createRandomForestRadial({types[1]}, 50, vec3(0,0,0), 30)
```

## Notes

- initForest() runs as soon as the file loads: if no level (scenetree.MissionGroup) or no forest object exists at that moment, forestData stays nil and the other functions fail. Call initForest() again after the level loads.
- Rotation angles are in degrees, around the Z axis only. The Z position is adjusted to the terrain height if a terrain exists (core_terrain.getTerrain()).
- createRandomForestRect/Radial insert the result of createForestItem into the table: if a type is not found, createForestItem returns nil (nothing is inserted, but the error is logged by createForestItem).
- clearForest does not remove the template items (the one whose key is the dictionary's).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_forestGenerator.clearForest()` | Removes all items from the forest except the templates, then calls initForest() again. | 176 |
| `util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl)` | Creates a forest item from a template. | 57 |
| `util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl)` | Creates amount random items in a disk of radius radius around pos (getRandomPointInCircle). | 109 |
| `util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl)` | Creates amount random items in a rectangle around pos. XY positions follow blue noise (getBlueNoise2d), the type is chosen at random from itemTypeArray, the rotation by steps, the scale between minScl and maxScl. | 68 |
| `util_forestGenerator.deleteForestItem(item)` | Removes an item from the forest. | 171 |
| `util_forestGenerator.getForestItemDict()` | Returns the dictionary internal name -> template item. | 52 |
| `util_forestGenerator.getForestItemTypes()` | Returns the sorted list of the internal names of the forest templates. | 47 |
| `util_forestGenerator.getForestItemsPolygon(polygon)` | Returns the items located in a 2D polygon (projected on XY); without a polygon, returns all items. | 148 |
| `util_forestGenerator.getForestItemsRadius(pos, radius)` | Returns the items located in a circle around a position. | 164 |
| `util_forestGenerator.initForest()` | (Re)initializes forestData from the level's forest object, rebuilds the dictionary of templates by internal name and the sorted list of types. Warns (log W) if the level or the forest object is absent. | 23 |
| `util_forestGenerator.updateForestItem(item, pos, rotDeg, scl)` | Updates the position, Z rotation and scale of an existing item (forestData:updateItem). | 141 |

### Parameter details

#### `util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl)`

Creates a forest item from a template.

- `itemType` (*string*) : Internal name of the template (see getForestItemTypes)
- `pos` (*vec3|nil*) : World position (default vec3())
- `rotDeg` (*number|nil*) : Rotation in degrees around Z (default 0)
- `scl` (*number|nil*) : Uniform scale (default 1)
- **returns**: userdata|nil Item created, or nil if the template does not exist (error logged)

#### `util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl)`

Creates amount random items in a disk of radius radius around pos (getRandomPointInCircle).

- `itemTypeArray` (*string[]|nil*) : Possible types (default: all templates)
- `amount` (*integer*) : Number of items to create
- `pos` (*vec3|nil*) : Disk center (default 0,0,0)
- `radius` (*number|nil*) : Radius in meters (default 50)
- `rotSteps` (*number|nil*) : Number of rotation steps over 360° (default 360)
- `minScl` (*number|nil*) : Minimum scale (default 0.75)
- `maxScl` (*number|nil*) : Maximum scale (default 1.25)
- **returns**: table List of created items

#### `util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl)`

Creates amount random items in a rectangle around pos. XY positions follow blue noise (getBlueNoise2d), the type is chosen at random from itemTypeArray, the rotation by steps, the scale between minScl and maxScl.

- `itemTypeArray` (*string[]|nil*) : Possible types (default: all templates)
- `amount` (*integer*) : Number of items to create
- `pos` (*vec3|nil*) : Reference center (default 0,0,0)
- `minX` (*number|nil*) : Minimum X offset from pos (default -100)
- `maxX` (*number|nil*) : Maximum X offset (default 100)
- `minY` (*number|nil*) : Minimum Y offset (default -100)
- `maxY` (*number|nil*) : Maximum Y offset (default 100)
- `rotSteps` (*number|nil*) : Number of rotation steps over 360° (default 360, minimum 1)
- `minScl` (*number|nil*) : Minimum scale (default 0.75)
- `maxScl` (*number|nil*) : Maximum scale (default 1.25)
- **returns**: table List of created items

#### `util_forestGenerator.deleteForestItem(item)`

Removes an item from the forest.

- `item` (*userdata*) : Item to remove

#### `util_forestGenerator.getForestItemDict()`

Returns the dictionary internal name -> template item.

- **returns**: table<string, userdata> Templates

#### `util_forestGenerator.getForestItemTypes()`

Returns the sorted list of the internal names of the forest templates.

- **returns**: string[] Item types

#### `util_forestGenerator.getForestItemsPolygon(polygon)`

Returns the items located in a 2D polygon (projected on XY); without a polygon, returns all items.

- `polygon` (*vec3[]|nil*) : Polygon vertices
- **returns**: table Forest items

#### `util_forestGenerator.getForestItemsRadius(pos, radius)`

Returns the items located in a circle around a position.

- `pos` (*vec3|nil*) : Center (default: camera position)
- `radius` (*number|nil*) : Radius in meters (default 20)
- **returns**: table Forest items

#### `util_forestGenerator.updateForestItem(item, pos, rotDeg, scl)`

Updates the position, Z rotation and scale of an existing item (forestData:updateItem).

- `item` (*userdata*) : Existing forest item
- `pos` (*vec3*) : New position
- `rotDeg` (*number|nil*) : Z rotation in degrees (default 0)
- `scl` (*number|nil*) : Scale (default 1)
- **returns**: userdata Updated item (return of updateItem)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/forestGenerator.lua`.*

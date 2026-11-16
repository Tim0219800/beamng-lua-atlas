# `editor_toolUtilities_foliageScatter`

*File: `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua` · VM: Game Engine (GE) · 659 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_foliageScatter`: `extensions.load("editor_toolUtilities_foliageScatter")`, then the global `editor_toolUtilities_foliageScatter`

Vegetation planting engine (Forest, ForestItemData objects) for the editor tools. It scatters instances in a polygon (scatterArea, with Poisson-type spacing), along a line (scatterLine) or on specific points (scatterPoints), places each plant on the terrain (core_terrain.getTerrainHeight) while removing the mesh floor, and handles removal, holding aside during a level save (lift/relay) and re-draping onto the terrain (redrape).

## Example

```lua
local fs = require('editor/toolUtilities/foliageScatter')
local items, n = fs.scatterArea({ring = ring, species = fs.defaultSpeciesSelection(), spacingM = 6, seed = 1337})
-- later:
fs.removeItems(select(2, fs.ensureForest()), items)
```

## Notes

- Species are names of ForestItemData objects of the scene; 'species' is a set { name = true } (or an array of names) and 'speciesWeights' are weights per name (default 1.0; all-zero weights = equal weights).
- The scatter* functions return (items, placedCount); the items list contains Forest item handles, which must be removed with removeItems before re-scattering the same area.
- Safety cap: 60000 instances per area (params.maxInstances to change it).
- Class presets: forest (6 m, variance 0.20), dense (4 m, 0.18), sparse (12 m, 0.22), shrub (2.5 m, 0.20), orchard (7 m, 0.08). Default distribution: spacingM 6, densityScale 1, scaleVariance 0.20, slopeMaxDeg 35, seed 1337.
- The result depends on params.seed (deterministic hash): the same seed and the same parameters give the same planting.
- If the level has no Forest object, ensureForest creates one ('theForest') in MissionGroup and marks the editor as modified.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_foliageScatter.addDraped(fn)` | Registers an item list provider for re-draping onto the terrain: fn(out) must add to out each item list (a slot can be false). Used by tools whose plants must stay on the ground when it moves. | 602 |
| `editor_toolUtilities_foliageScatter.defaultShrubSelection()` | Like defaultSpeciesSelection but shrub-oriented: first species whose name contains bush, shrub, fern, hedge, flower, plant, grass or reed, otherwise the first of the list. | 124 |
| `editor_toolUtilities_foliageScatter.defaultSpeciesSelection()` | Chooses a default species selection among those of the level: the first found among tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, otherwise the first species of the list. | 111 |
| `editor_toolUtilities_foliageScatter.ensureForest()` | Returns the level's Forest object and its data, creating an empty Forest if the level has none. On failure, logs an error and returns nil, nil. | 81 |
| `editor_toolUtilities_foliageScatter.getClassOrder()` | Returns the stable order of the classes for the interface: forest, dense, sparse, shrub, orchard. | 545 |
| `editor_toolUtilities_foliageScatter.getClassPresets()` | Returns the table of class presets (forest, dense, sparse, shrub, orchard) with spacingM and scaleVariance. It is the internal table, not copied. | 542 |
| `editor_toolUtilities_foliageScatter.getDefaultDistribution()` | Returns a fresh copy of the default distribution parameters, to initialize a new area. | 539 |
| `editor_toolUtilities_foliageScatter.itemCrownR(fd, obj)` | Crown radius of a ForestItemData at scale 1: largest horizontal side of its bounding box around the origin, valid whatever the orientation. Plants a temporary item to get its box, then removes it. | 70 |
| `editor_toolUtilities_foliageScatter.lift(lists)` | Takes a tool's live planting out of the forest before a level save (which writes the forest as is). Stores the data, transform and scale of each item and keeps the slots. Returns nil if there is no forest. | 169 |
| `editor_toolUtilities_foliageScatter.listForestItemData()` | Sorted list of the level's ForestItemData names, i.e. the species that the tools can plant. | 96 |
| `editor_toolUtilities_foliageScatter.plantOne(it, fd, byName)` | Plants an already decided item (species, scale, rotation, position) by placing it on the terrain, mesh floor removed. Returns nil if the species does not exist in the level. | 551 |
| `editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1)` | Puts back on the terrain all the plants registered via addDraped located in the given world box, if their height differs by more than 0.005 m. The moved item is rewritten in its list (updateItem). | 606 |
| `editor_toolUtilities_foliageScatter.relay(held)` | Puts back the items removed by lift, in the same slots of the same lists (new handles created with createNewItem), once the save is done. No effect if held is nil. | 188 |
| `editor_toolUtilities_foliageScatter.removeItems(fd, items)` | Removes the listed items (from a previous scatter) from the forest and empties the items table. | 159 |
| `editor_toolUtilities_foliageScatter.scatterArea(params)` | Scatters instances in a polygon (with optional holes) using low-discrepancy candidates (R2 sequence) filtered by minimum spacing, maximum slope and occupancy. The species is drawn by weighted random for each instance. Returns ({}, 0) if the ring has fewer than 3 points or if no species is resolved. | 243 |
| `editor_toolUtilities_foliageScatter.scatterLine(params)` | Lays out a row of evenly spaced plants along a resampled centerline, with optional lateral scatter. | 372 |
| `editor_toolUtilities_foliageScatter.scatterPoints(params)` | Plants exactly one instance at each supplied world point. By default the plant is placed on the terrain; with onPointZ it is placed at the point's z (+ zLift), e.g. bushes in a planter. | 489 |
| `editor_toolUtilities_foliageScatter.sowGroups(groups, fd)` | Sows a complete plan: list of anchor groups. A group with items is planted as is (plantOne); a group with points and species goes through scatterPoints (size -> scaleBase, vary -> scaleVariance, seed default 1, drape false = z of the point). | 581 |

### Parameter details

#### `editor_toolUtilities_foliageScatter.addDraped(fn)`

Registers an item list provider for re-draping onto the terrain: fn(out) must add to out each item list (a slot can be false). Used by tools whose plants must stay on the ground when it moves.

- `fn` (*function*) : Function fn(out) that adds its lists to out.

#### `editor_toolUtilities_foliageScatter.defaultShrubSelection()`

Like defaultSpeciesSelection but shrub-oriented: first species whose name contains bush, shrub, fern, hedge, flower, plant, grass or reed, otherwise the first of the list.

- **returns**: table<string, boolean> Set { name = true }.

#### `editor_toolUtilities_foliageScatter.defaultSpeciesSelection()`

Chooses a default species selection among those of the level: the first found among tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, otherwise the first species of the list.

- **returns**: table<string, boolean> Set { name = true } (empty if the level has no species).

#### `editor_toolUtilities_foliageScatter.ensureForest()`

Returns the level's Forest object and its data, creating an empty Forest if the level has none. On failure, logs an error and returns nil, nil.

- **returns**: userdata|nil Forest object.
- **returns**: userdata|nil ForestData (forest:getData()).

#### `editor_toolUtilities_foliageScatter.getClassOrder()`

Returns the stable order of the classes for the interface: forest, dense, sparse, shrub, orchard.

- **returns**: string[] Class names.

#### `editor_toolUtilities_foliageScatter.getClassPresets()`

Returns the table of class presets (forest, dense, sparse, shrub, orchard) with spacingM and scaleVariance. It is the internal table, not copied.

- **returns**: table<string, table> Presets.

#### `editor_toolUtilities_foliageScatter.getDefaultDistribution()`

Returns a fresh copy of the default distribution parameters, to initialize a new area.

- **returns**: table { class, spacingM, densityScale, scaleVariance, alignToNormal, slopeMaxDeg, seed }.

#### `editor_toolUtilities_foliageScatter.itemCrownR(fd, obj)`

Crown radius of a ForestItemData at scale 1: largest horizontal side of its bounding box around the origin, valid whatever the orientation. Plants a temporary item to get its box, then removes it.

- `fd` (*userdata*) : Level ForestData (the one from forest:getData()).
- `obj` (*userdata*) : ForestItemData object of the species.
- **returns**: number Radius in meters, 0 if unavailable.

#### `editor_toolUtilities_foliageScatter.lift(lists)`

Takes a tool's live planting out of the forest before a level save (which writes the forest as is). Stores the data, transform and scale of each item and keeps the slots. Returns nil if there is no forest.

- `lists` (*table[]*) : List of item lists; a slot can be false.
- **returns**: table|nil 'held' token to pass back to relay.

#### `editor_toolUtilities_foliageScatter.listForestItemData()`

Sorted list of the level's ForestItemData names, i.e. the species that the tools can plant.

- **returns**: string[] Sorted names.

#### `editor_toolUtilities_foliageScatter.plantOne(it, fd, byName)`

Plants an already decided item (species, scale, rotation, position) by placing it on the terrain, mesh floor removed. Returns nil if the species does not exist in the level.

- `it` (*table*) : { x, y, sp (species name), s (scale, default 1), rx, ry, a (Euler angles in rad, default 0) }.
- `fd` (*userdata*) : ForestData.
- `byName` (*table*) : Species cache between calls (to be supplied, e.g. {}).
- **returns**: userdata|nil Handle of the created item.

#### `editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1)`

Puts back on the terrain all the plants registered via addDraped located in the given world box, if their height differs by more than 0.005 m. The moved item is rewritten in its list (updateItem).

- `x0` (*number*) : Minimum X of the box.
- `y0` (*number*) : Minimum Y.
- `x1` (*number*) : Maximum X.
- `y1` (*number*) : Maximum Y.
- **returns**: integer Number of moved plants (0 if there is no forest).

#### `editor_toolUtilities_foliageScatter.relay(held)`

Puts back the items removed by lift, in the same slots of the same lists (new handles created with createNewItem), once the save is done. No effect if held is nil.

- `held` (*table|nil*) : Result of lift.

#### `editor_toolUtilities_foliageScatter.removeItems(fd, items)`

Removes the listed items (from a previous scatter) from the forest and empties the items table.

- `fd` (*userdata|nil*) : ForestData; no effect if nil.
- `items` (*table|nil*) : List of item handles; false slots are ignored.

#### `editor_toolUtilities_foliageScatter.scatterArea(params)`

Scatters instances in a polygon (with optional holes) using low-discrepancy candidates (R2 sequence) filtered by minimum spacing, maximum slope and occupancy. The species is drawn by weighted random for each instance. Returns ({}, 0) if the ring has fewer than 3 points or if no species is resolved.

- `params` (*table*) : ring (outline points, z ignored), holes (hole rings), forestData (otherwise ensureForest), species, speciesWeights, spacingM (min 0.5, default 6), densityScale (min 0.01), scaleVariance, scaleBase (min 0.05), alignToNormal (boolean), slopeMaxDeg (default 35), seed, occupiedFn, holdFn (true = the location stays in the plan but nothing is planted, slot false), maxInstances, record (table filled with { x, y, sp, s, a, ... } of what is planted).
- **returns**: table List of placed items (slots can be false with holdFn).
- **returns**: integer Number of placed instances.

#### `editor_toolUtilities_foliageScatter.scatterLine(params)`

Lays out a row of evenly spaced plants along a resampled centerline, with optional lateral scatter.

- `params` (*table*) : divPoints (line), binormals, forestData, species, speciesWeights, spacingM (min 0.5), posVariance (m, position scatter), scaleVariance, scaleBase, alignToNormal, slopeMaxDeg (default 89), seed, occupiedFn, maxInstances.
- **returns**: table Placed items.
- **returns**: integer Number of placed instances.

#### `editor_toolUtilities_foliageScatter.scatterPoints(params)`

Plants exactly one instance at each supplied world point. By default the plant is placed on the terrain; with onPointZ it is placed at the point's z (+ zLift), e.g. bushes in a planter.

- `params` (*table*) : points, forestData, species, speciesWeights, scaleVariance, scaleBase, seed, occupiedFn, onPointZ, zLift, record (see scatterArea).
- **returns**: table Placed items.
- **returns**: integer Number of placed instances.

#### `editor_toolUtilities_foliageScatter.sowGroups(groups, fd)`

Sows a complete plan: list of anchor groups. A group with items is planted as is (plantOne); a group with points and species goes through scatterPoints (size -> scaleBase, vary -> scaleVariance, seed default 1, drape false = z of the point).

- `groups` (*table[]|nil*) : Groups { items } or { points, species, speciesWeights, size, vary, seed, drape }.
- `fd` (*userdata|nil*) : ForestData (otherwise ensureForest).
- **returns**: table All the planted items.

## Calls into the engine (C++)

- `obj:` `getObjBox`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/foliageScatter.lua`.*

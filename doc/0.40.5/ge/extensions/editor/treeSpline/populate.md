# `editor_treeSpline_populate`

*File: `lua/ge/extensions/editor/treeSpline/populate.lua` · VM: Game Engine (GE) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_treeSpline_populate`: `extensions.load("editor_treeSpline_populate")`, then the global `editor_treeSpline_populate`

Submodule of the editor's Tree Spline tool: plants or removes trees (Forest instances) along a spline. Relies on editor/toolUtilities/foliageScatter (scatterLine, removeItems, ensureForest) and editor/toolUtilities/occupancy (exclusion mask). The planted instances are stored in spline.items and spline.count.

## Notes

- populateTreeSpline plants nothing (and empties the list) if spline.divPoints has fewer than 2 points.
- The occupancy mask is only used if spline.avoidInfrastructure is true; without a built mask, it has no effect.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_treeSpline_populate.adopt(spline, kept)` | Takes back the trees returned by release() that still exist in the Forest (found by key and position) and updates spline.items / spline.count. | 78 |
| `editor_treeSpline_populate.populateTreeSpline(spline)` | (Re)plants the spline: deletes its old instances then distributes a new regular row along the centerline (divPoints, binormals) according to the foliage parameters (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Fills spline.items and spline.count. | 31 |
| `editor_treeSpline_populate.release(spline)` | Used during a Lua reload: the tool lets go of the trees of a locked spline without deleting them (they belong to the level) and returns their keys and positions for adopt(). | 67 |
| `editor_treeSpline_populate.tryRemove(spline)` | Removes from the Forest the instances previously planted for this spline, then empties spline.items and sets spline.count back to 0. No effect if spline or spline.items is nil. | 21 |

### Parameter details

#### `editor_treeSpline_populate.adopt(spline, kept)`

Takes back the trees returned by release() that still exist in the Forest (found by key and position) and updates spline.items / spline.count.

- `spline` (*table*) : Spline that gets its trees back.
- `kept` (*table*) : List returned by release().

#### `editor_treeSpline_populate.populateTreeSpline(spline)`

(Re)plants the spline: deletes its old instances then distributes a new regular row along the centerline (divPoints, binormals) according to the foliage parameters (species, speciesWeights, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed). Fills spline.items and spline.count.

- `spline` (*table*) : Tree spline with its foliage parameters.

#### `editor_treeSpline_populate.release(spline)`

Used during a Lua reload: the tool lets go of the trees of a locked spline without deleting them (they belong to the level) and returns their keys and positions for adopt().

- `spline` (*table*) : Spline locked.
- **returns**: table List of {key, x, y, z} for each kept tree.

#### `editor_treeSpline_populate.tryRemove(spline)`

Removes from the Forest the instances previously planted for this spline, then empties spline.items and sets spline.count back to 0. No effect if spline or spline.items is nil.

- `spline` (*table*) : Tree spline (fields items, count).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/treeSpline/populate.lua`.*

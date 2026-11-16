# `core_audioForest_audioForestCommon`

*File: `lua/ge/extensions/core/audioForest/audioForestCommon.lua` · VM: Game Engine (GE) · 428 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_audioForest_audioForestCommon`: `extensions.load("core_audioForest_audioForestCommon")`, then the global `core_audioForest_audioForestCommon`

Code shared between runtime (audioForest.lua) and the editor: turns the objects of a Forest into a thinned cloud of audio nodes. Loaded with require('core/audioForest/audioForestCommon'). The algorithm: (1) a prepass that reads the forest items (in blocks) and computes volume and height per model (shape); (2) S/M/L classification by normalized volume (95th percentile) with possible override; (3) greedy thinning: keep an item and absorb all its neighbors within minNodeSpacing (20 m); (4) construction of a 3D KD-tree of the nodes.

## Example

```lua
local c = require('core/audioForest/audioForestCommon')
local cloud = c.buildNodeCloudFromForest(forestObj, toolState, nil, {})
-- cloud.nodeCount, cloud.kdNodes ...
```

## Notes

- Default config (defaultCfg): minNodeSpacing 20 m, thinningOuterRadiusMul 1.5, nodeHeightBlend 0.5, classT0 1/3, classT1 2/3, volumeClassPercentile 0.95, pitchNormPercentile 0.95.
- Classes: 1 = small (audio value 0.0), 2 = medium (0.5), 3 = large (1.0).
- An item's volume is the volume of its bounding box multiplied by its scale.
- Only these functions are exported; the rest (thinning priority queue, emptyCloud, etc.) is local.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts)` | Builds the audio node cloud. Finishes the prepass if needed, classifies the models, thins the items and builds a KD-tree (kdtreepoint3d). Returns an empty cloud (nodeCount 0) if there are no included items. | 231 |
| `core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1)` | Converts a normalized volume [0..1] into a size class: 1 below t0, 2 below t1, otherwise 3. | 137 |
| `core_audioForest_audioForestCommon.getItemVolume(item)` | Volume (m³) of a forest item's bounding box, multiplied by its scale. Returns 0 without a box. | 113 |
| `core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st)` | Prepares the state of an incremental prepass: fetches all forest items (forestObj:getData():getItems()). | 170 |
| `core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps)` | Processes up to maxSteps prepass items: keeps the included items and measures the volume and max height once per model. Sets isReady to true when all items have been seen. | 190 |

### Parameter details

#### `core_audioForest_audioForestCommon.buildNodeCloudFromForest(forestObj, st, cfg, opts)`

Builds the audio node cloud. Finishes the prepass if needed, classifies the models, thins the items and builds a KD-tree (kdtreepoint3d). Returns an empty cloud (nodeCount 0) if there are no included items.

- `forestObj` (*userdata*) : Forest object
- `st` (*table|nil*) : Tool state: classSelByShape, classOverrideByShape, includeByShape
- `cfg` (*table|nil*) : Configuration (defaultCfg keys, as well as pitchDensityPercentile)
- `opts` (*table|nil*) : Options: prepass (prepass already done), shapeToRow + includeEditorFields (adds nodeTypeRow and nodeClassId for the editor)
- **returns**: table {minNodeSpacing, nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, nodeTypeRow, nodeClassId, kdNodes}

#### `core_audioForest_audioForestCommon.computeDefaultClassFromNormVol(normVol, classT0, classT1)`

Converts a normalized volume [0..1] into a size class: 1 below t0, 2 below t1, otherwise 3.

- `normVol` (*number*) : Normalized volume
- `classT0` (*number|nil*) : Threshold 1/2, 1/3 by default
- `classT1` (*number|nil*) : Threshold 2/3, 2/3 by default (swapped with t0 if t0 > t1)
- **returns**: integer 1, 2 or 3

#### `core_audioForest_audioForestCommon.getItemVolume(item)`

Volume (m³) of a forest item's bounding box, multiplied by its scale. Returns 0 without a box.

- `item` (*userdata|nil*) : Forest item (getObjBox, getScale)
- **returns**: number Volume

#### `core_audioForest_audioForestCommon.startRuntimePrepass(forestObj, st)`

Prepares the state of an incremental prepass: fetches all forest items (forestObj:getData():getItems()).

- `forestObj` (*userdata*) : Forest object
- `st` (*table|nil*) : Tool state; uses includeByShape (an absent model or true is included, false is excluded)
- **returns**: table Prepass state {all, allCount, i, includeByShape, shapeVol, shapeMaxZ, includedItem, includedShape, volList, volN, itemCount, isReady}

#### `core_audioForest_audioForestCommon.stepRuntimePrepass(p, maxSteps)`

Processes up to maxSteps prepass items: keeps the included items and measures the volume and max height once per model. Sets isReady to true when all items have been seen.

- `p` (*table*) : State returned by startRuntimePrepass
- `maxSteps` (*integer|nil*) : Maximum number of items per call, 10000 by default
- **returns**: boolean true when the prepass is finished

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/audioForest/audioForestCommon.lua`.*

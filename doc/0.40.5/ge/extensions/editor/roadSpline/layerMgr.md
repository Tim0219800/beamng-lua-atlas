# `editor_roadSpline_layerMgr`

*File: `lua/ge/extensions/editor/roadSpline/layerMgr.lua` · VM: Game Engine (GE) · 1033 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadSpline_layerMgr`: `extensions.load("editor_roadSpline_layerMgr")`, then the global `editor_roadSpline_layerMgr`

Manager of the layers of a Road Spline group. A layer is an offset strip along the road, materialized by one or more DecalRoads (split into sections beyond 100 points) with material, width, lateral position, texture length, fades and render priority. The module creates/duplicates/deletes layers, generates the automatic "hidden" layers (tire marks, cracks, repairs, patches, damaged asphalt, centerline, edge and lane lines, edge fades 1 to 3 with their default materials), updates the DecalRoads and (de)serializes the layers.

## Notes

- Layer fields: name, id (UUID), isDirty, isHidden (automatic layer), isEnabled, material, isFlip, isTrackWidth, isOverObjects, width (m), position (lateral, relative to the road half-width), texLen (m), fadeIn, fadeOut, renderPriority, decalRoadId, decalRoadIds (sections), and runtime buffers pClipped/wClipped/pFlip/wFlip.
- Default values (getSliderDefaults): width 10, position 0, renderPriority 10, texLength 10, fadeIn 1, fadeOut 1, paintMargin 0, paintMaterialIdx 0. Default material of a new layer: road_invisible.
- The decal nodes are resampled at a regular step (2 m, 1 m for edge lines) to avoid overshoots of the engine spline; segments < 5 cm are welded.
- Automatic layers are found by their name (string.find, Lua pattern): renaming or naming a layer like "Repair 1" makes it get deleted by the removeXxxLayers functions.
- The "full length" layers (tire marks, cracks, repairs, patches, damaged asphalt) create one layer per 5 m lane on the left and on the right (at least one on each side).
- A disabled layer (isEnabled = false) has its DecalRoad deleted during the update.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadSpline_layerMgr.addEdgeBlend1Layers(group)` | Adds the "Edge Blend 1" layers (m_road_asphalt_edge); width and offset from group.edgeBlend1Width (1.0) and edgeBlend1Offset (1.1). | 767 |
| `editor_roadSpline_layerMgr.addEdgeBlend2Layers(group)` | Adds the "Edge Blend 2" layers (m_road_edge_dirt); defaults width 2.0 and offset 1.25 (group.edgeBlend2Width/Offset). | 823 |
| `editor_roadSpline_layerMgr.addEdgeBlend3Layers(group)` | Adds the "Edge Blend 3" layers (m_road_asphalt_edge_grass); defaults width 3.0 and offset 1.35 (group.edgeBlend3Width/Offset). | 879 |
| `editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group)` | Adds the "Heavy Tread Marks" layers (road_rubber_double, texLen 5). | 602 |
| `editor_roadSpline_layerMgr.addLightTreadMarksLayers(group)` | Adds the "Light Tread Marks" layers (material m_tread_marks_clean, texLen 5), one per left/right lane. | 600 |
| `editor_roadSpline_layerMgr.addNewLayer(group)` | Adds an empty layer "New Layer N" (road_invisible material, default slider values, follows the road width). | 465 |
| `editor_roadSpline_layerMgr.addPatchesLayers(group)` | Adds the "Patches" layers (road_patches1, texLen 45). | 610 |
| `editor_roadSpline_layerMgr.addRepair1Layers(group)` | Adds the "Repair 1" layers (material repair1, texLen 25). | 606 |
| `editor_roadSpline_layerMgr.addRepair2Layers(group)` | Adds the "Repair 2" layers (material repair2, texLen 25). | 608 |
| `editor_roadSpline_layerMgr.addRoadCenterLineLayers(group)` | Adds the "Center Line" layer (double yellow line m_line_yellow_double, width 0.2 m, position 0, texLen 5). | 618 |
| `editor_roadSpline_layerMgr.addRoadCrackLayers(group)` | Adds the "Road Crack" layers (m_asphalt_cracks_02, texLen 15). | 604 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group)` | Adds the "Damage Asphalt 1" layers (m_asphalt_damaged_01, texLen 10). | 612 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group)` | Adds the "Damage Asphalt 2" layers (m_asphalt_damaged_02, texLen 25). | 614 |
| `editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group)` | Adds the edge lines "Edge Line - Left/Right" (m_line_white); width and offset come from group.edgeLineWidth (default 0.25 m) and group.edgeLineOffset (default 1.0). | 648 |
| `editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group)` | Adds the dashed "Lane Line" lane lines (m_line_white_discontinue, default width 0.2 m). | 707 |
| `editor_roadSpline_layerMgr.deepCopyAllLayers(layers)` | Deep copy of a list of layers. | 144 |
| `editor_roadSpline_layerMgr.deepCopyLayer(layer)` | Deep copy of a layer via string.buffer. The runtime geometry buffers are detached from the source before encoding then restored (the source is not altered); the copy starts with empty buffers, rebuilt on the next update. | 134 |
| `editor_roadSpline_layerMgr.deserializeLayer(data)` | Rebuilds a clean layer from a table: default values for missing fields, isDirty = true, empty buffers and DecalRoad ids. A missing name becomes "?" and a missing id is generated. | 955 |
| `editor_roadSpline_layerMgr.duplicateLayer(idx, group)` | Duplicates a layer right after the original ("name (Copy)", new UUID, DecalRoad ids forgotten so that the copy builds its own roads). | 494 |
| `editor_roadSpline_layerMgr.eachLayerRoad(layer, fn)` | Calls fn(decalRoad) for each DecalRoad of the layer (single road and sections). Objects that cannot be found are passed to fn as nil. | 186 |
| `editor_roadSpline_layerMgr.getSliderDefaults()` | Returns the default values of the sliders (width, position, priority, texture length, fades, paint margin and material) for the tool's interface. | 118 |
| `editor_roadSpline_layerMgr.removeAllHiddenLayers(group)` | Deletes the group's hidden (automatic) layers. | 455 |
| `editor_roadSpline_layerMgr.removeAllLayers(group)` | Deletes all the group's layers. | 448 |
| `editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer)` | Removes the layer's DecalRoad (and its possible sections) from the scene and forgets the ids. | 173 |
| `editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group)` | Deletes the "Edge Blend 1" layers. | 820 |
| `editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group)` | Deletes the "Edge Blend 2" layers. | 876 |
| `editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group)` | Deletes the "Edge Blend 3" layers. | 932 |
| `editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group)` | Deletes the "Heavy Tread Marks" layers. | 603 |
| `editor_roadSpline_layerMgr.removeLayer(idx, group)` | Deletes the layer at the given index (its DecalRoad too). | 440 |
| `editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group)` | Deletes the layers whose name contains "Light Tread Marks". | 601 |
| `editor_roadSpline_layerMgr.removePatchesLayers(group)` | Deletes the "Patches" layers. | 611 |
| `editor_roadSpline_layerMgr.removeRepair1Layers(group)` | Deletes the "Repair 1" layers. | 607 |
| `editor_roadSpline_layerMgr.removeRepair2Layers(group)` | Deletes the "Repair 2" layers. | 609 |
| `editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group)` | Deletes the "Center Line" layer. | 645 |
| `editor_roadSpline_layerMgr.removeRoadCrackLayers(group)` | Deletes the "Road Crack" layers. | 605 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group)` | Deletes the "Damage Asphalt 1" layers. | 613 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group)` | Deletes the "Damage Asphalt 2" layers. | 615 |
| `editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group)` | Deletes the "Edge Line" layers. | 704 |
| `editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group)` | Deletes the "Lane Line" layers. | 764 |
| `editor_roadSpline_layerMgr.serializeLayer(layer)` | Reduces a layer to its authoring fields (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), without scene ids or runtime buffers. | 935 |
| `editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup)` | Sets to false all the group's automatic layer options (14 flags) and marks it dirty. | 509 |
| `editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx)` | Updates the DecalRoads of all the group's layers; a disabled layer has its DecalRoad deleted. | 411 |
| `editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Only updates the layers marked dirty (isDirty), then clears their flag. | 424 |

### Parameter details

#### `editor_roadSpline_layerMgr.addEdgeBlend1Layers(group)`

Adds the "Edge Blend 1" layers (m_road_asphalt_edge); width and offset from group.edgeBlend1Width (1.0) and edgeBlend1Offset (1.1).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addEdgeBlend2Layers(group)`

Adds the "Edge Blend 2" layers (m_road_edge_dirt); defaults width 2.0 and offset 1.25 (group.edgeBlend2Width/Offset).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addEdgeBlend3Layers(group)`

Adds the "Edge Blend 3" layers (m_road_asphalt_edge_grass); defaults width 3.0 and offset 1.35 (group.edgeBlend3Width/Offset).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group)`

Adds the "Heavy Tread Marks" layers (road_rubber_double, texLen 5).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addLightTreadMarksLayers(group)`

Adds the "Light Tread Marks" layers (material m_tread_marks_clean, texLen 5), one per left/right lane.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addNewLayer(group)`

Adds an empty layer "New Layer N" (road_invisible material, default slider values, follows the road width).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addPatchesLayers(group)`

Adds the "Patches" layers (road_patches1, texLen 45).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRepair1Layers(group)`

Adds the "Repair 1" layers (material repair1, texLen 25).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRepair2Layers(group)`

Adds the "Repair 2" layers (material repair2, texLen 25).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadCenterLineLayers(group)`

Adds the "Center Line" layer (double yellow line m_line_yellow_double, width 0.2 m, position 0, texLen 5).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadCrackLayers(group)`

Adds the "Road Crack" layers (m_asphalt_cracks_02, texLen 15).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group)`

Adds the "Damage Asphalt 1" layers (m_asphalt_damaged_01, texLen 10).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group)`

Adds the "Damage Asphalt 2" layers (m_asphalt_damaged_02, texLen 25).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group)`

Adds the edge lines "Edge Line - Left/Right" (m_line_white); width and offset come from group.edgeLineWidth (default 0.25 m) and group.edgeLineOffset (default 1.0).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group)`

Adds the dashed "Lane Line" lane lines (m_line_white_discontinue, default width 0.2 m).

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.deepCopyAllLayers(layers)`

Deep copy of a list of layers.

- `layers` (*table[]*) : Layers.
- **returns**: table[] Copies.

#### `editor_roadSpline_layerMgr.deepCopyLayer(layer)`

Deep copy of a layer via string.buffer. The runtime geometry buffers are detached from the source before encoding then restored (the source is not altered); the copy starts with empty buffers, rebuilt on the next update.

- `layer` (*table*) : Source layer.
- **returns**: table Independent copy.

#### `editor_roadSpline_layerMgr.deserializeLayer(data)`

Rebuilds a clean layer from a table: default values for missing fields, isDirty = true, empty buffers and DecalRoad ids. A missing name becomes "?" and a missing id is generated.

- `data` (*table*) : Table from serializeLayer or from a JSON.
- **returns**: table Layer ready to insert into group.layers.

#### `editor_roadSpline_layerMgr.duplicateLayer(idx, group)`

Duplicates a layer right after the original ("name (Copy)", new UUID, DecalRoad ids forgotten so that the copy builds its own roads).

- `idx` (*integer*) : Index of the layer to copy.
- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.eachLayerRoad(layer, fn)`

Calls fn(decalRoad) for each DecalRoad of the layer (single road and sections). Objects that cannot be found are passed to fn as nil.

- `layer` (*table*) : Layer.
- `fn` (*function*) : Callback receiving a DecalRoad (or nil).

#### `editor_roadSpline_layerMgr.getSliderDefaults()`

Returns the default values of the sliders (width, position, priority, texture length, fades, paint margin and material) for the tool's interface.

- **returns**: table<string, number> sliderDefaults table (live).

#### `editor_roadSpline_layerMgr.removeAllHiddenLayers(group)`

Deletes the group's hidden (automatic) layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeAllLayers(group)`

Deletes all the group's layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer)`

Removes the layer's DecalRoad (and its possible sections) from the scene and forgets the ids.

- `layer` (*table*) : Layer.

#### `editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group)`

Deletes the "Edge Blend 1" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group)`

Deletes the "Edge Blend 2" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group)`

Deletes the "Edge Blend 3" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group)`

Deletes the "Heavy Tread Marks" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeLayer(idx, group)`

Deletes the layer at the given index (its DecalRoad too).

- `idx` (*integer*) : Layer index.
- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group)`

Deletes the layers whose name contains "Light Tread Marks".

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removePatchesLayers(group)`

Deletes the "Patches" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRepair1Layers(group)`

Deletes the "Repair 1" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRepair2Layers(group)`

Deletes the "Repair 2" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group)`

Deletes the "Center Line" layer.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadCrackLayers(group)`

Deletes the "Road Crack" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group)`

Deletes the "Damage Asphalt 1" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group)`

Deletes the "Damage Asphalt 2" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group)`

Deletes the "Edge Line" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group)`

Deletes the "Lane Line" layers.

- `group` (*table*) : Group.

#### `editor_roadSpline_layerMgr.serializeLayer(layer)`

Reduces a layer to its authoring fields (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), without scene ids or runtime buffers.

- `layer` (*table*) : Layer.
- **returns**: table JSON-compatible table.

#### `editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup)`

Sets to false all the group's automatic layer options (14 flags) and marks it dirty.

- `selGroup` (*table*) : Group.

#### `editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx)`

Updates the DecalRoads of all the group's layers; a disabled layer has its DecalRoad deleted.

- `group` (*table*) : Group.
- `groupIdx` (*integer*) : Index of the group in the list.

#### `editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx)`

Only updates the layers marked dirty (isDirty), then clears their flag.

- `group` (*table*) : Group.
- `groupIdx` (*integer*) : Group index.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadSpline/layerMgr.lua`.*

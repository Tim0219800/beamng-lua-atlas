# `editor_heroRoadEditor_layerMgr`

*File: `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua` · VM: Game Engine (GE) · 1621 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_layerMgr`: `extensions.load("editor_heroRoadEditor_layerMgr")`, then the global `editor_heroRoadEditor_layerMgr`

Management of the marking and detail layers of a Hero Road. A layer (group.layers[i]) describes a decal strip laid on the roadway (material, width, lateral position, texture length, fades, render priority) and becomes one or more DecalRoad objects in the group's scene folder, draped over the road mesh (overObjects). The module also builds the automatic layers (tire tracks, cracks, repairs, damaged asphalt, patches, centerline, edge and lane lines, edge fades) from the actual lane model, and the decals of the placed elements (crosswalk bars, widening dividers, intersection lines); it delegates the repair clusters to repairMgr.

## Notes

- Lateral position of a layer: fraction of the half-width (0 = axis, -1/+1 = left/right edge, >1 = outside the roadway). For N = lanesLeft + lanesRight lanes, lane j is centered at (2j-1-N)/N, the boundary k between lanes at (2k-N)/N, the centerline at (nL-nR)/(nL+nR).
- Centerline: no layer if only one direction (lanesLeft or lanesRight = 0). Lane lines: at least 2 lanes, and the boundary between opposite directions (k == lanesLeft) is left to the centerline.
- Splitting: a DecalRoad section is limited to 250 m of arc and 500 nodes (16-bit index limit of the GPU buffer, beyond which the end is no longer rendered). Sections join with C1 continuity thanks to handle nodes (startTangent/endTangent). Resampling: 8 m (4 m for edge lines); segments shorter than 0.05 m are welded.
- The decal nodes are raised by 2.0 m (decalDrapeHeight) then projected downward onto the mesh collision: the collision must exist before creating the decals.
- Only the painted lines (centerline, edge and lane lines) are cut by the potholes marked cutMarkings (0.4 m fade at the cut edge); the edge lines and edge fades are also interrupted at the mouth of an intersection, and follow the widening (edgeBulge).
- Default materials: light tracks 'm_tread_marks_clean', heavy 'road_rubber_double', cracks 'm_asphalt_cracks_02', 'repair1', 'repair2', 'road_patches1', 'm_asphalt_damaged_01/02', centerline 'm_line_yellow_double', edge 'm_line_white', lane 'm_line_white_discontinue', fades 'm_road_asphalt_edge', 'm_road_edge_dirt', 'm_road_asphalt_edge_grass'. New manual layer: material 'road_invisible'.
- Automatic layers are hidden (isHidden = true) and recreated at each rebuild; removal by pattern (removeXxxLayers) removes any layer whose name contains the type's text (e.g. 'Repair 1'), including a manual layer that happens to have a name containing that text (string.find search with pattern).
- canSave of the DecalRoads: false in Edit (nothing is written to the level), true for a Live/baked road (setGroupDecalsCanSave).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group)` | Adds the 'Edge Blend 1' layers (edge asphalt fade, material 'm_road_asphalt_edge') on each side, with width group.edgeBlend1Width (default 1.0 m) and offset group.edgeBlend1Offset (default 1.1). | 1348 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group)` | Adds the 'Edge Blend 2' layers (dirt fade, material 'm_road_edge_dirt') on each side, default width 2.0 m, default offset 1.25. | 1404 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group)` | Adds the 'Edge Blend 3' layers (grass fade, material 'm_road_asphalt_edge_grass') on each side, default width 3.0 m, default offset 1.35. | 1460 |
| `editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group)` | Adds a hidden 'Heavy Tread Marks' layer per lane (material 'road_rubber_double', texLen group.heavyTreadTexLen or 5). | 1190 |
| `editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group)` | Adds a hidden 'Light Tread Marks' layer per lane, centered in the lane (material 'm_tread_marks_clean', texLen group.lightTreadTexLen or 5). | 1188 |
| `editor_heroRoadEditor_layerMgr.addNewLayer(group)` | Adds a manual layer 'New Layer N' (material 'road_invisible', width 10 m, position 0, priority 10, texLen 10, track width active). | 1074 |
| `editor_heroRoadEditor_layerMgr.addPatchesLayers(group)` | Adds a hidden 'Patches' layer per lane (material 'road_patches1', texLen group.patchesTexLen or 45). | 1198 |
| `editor_heroRoadEditor_layerMgr.addRepair1Layers(group)` | Adds a hidden 'Repair 1' layer per lane (material 'repair1', texLen group.repair1TexLen or 25). | 1194 |
| `editor_heroRoadEditor_layerMgr.addRepair2Layers(group)` | Adds a hidden 'Repair 2' layer per lane (material 'repair2', texLen group.repair2TexLen or 25). | 1196 |
| `editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group)` | Adds the hidden 'Center Line' layer at the boundary between the left and right lanes (position (nL-nR)/(nL+nR)). Nothing is added for a one-way road. Material group.centerLineMaterial or 'm_line_yellow_double', width of the USA region (or 0.2 m). | 1206 |
| `editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group)` | Adds a hidden 'Road Crack' layer per lane (material 'm_asphalt_cracks_02', texLen group.roadCrackTexLen or 15). | 1192 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group)` | Adds a hidden 'Damage Asphalt 1' layer per lane (material 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen or 10). | 1200 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group)` | Adds a hidden 'Damage Asphalt 2' layer per lane (material 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen or 25). | 1202 |
| `editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group)` | Adds two hidden layers 'Edge Line - Left' and 'Edge Line - Right' at positions -/+ group.edgeLineOffset (default 1.0 = roadway edge), width group.edgeLineWidth (default 0.25 m), material group.edgeLineMaterial or 'm_line_white'. | 1244 |
| `editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group)` | Adds the lane separation lines from the actual lane model: N-1 boundaries at position (2k-N)/N; on a two-way road, the boundary k == lanesLeft is omitted (it is the centerline). Nothing if fewer than 2 lanes. Material group.laneLineMaterial or 'm_line_white_discontinue', width 0.2 m. | 1308 |
| `editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group)` | Hides during a drag: deletes all rendered decals (layers, crosswalks, widenings, intersections, repairs) but keeps the layer definitions and the placed elements' data; the rebuild at the end of the drag recreates the decals. | 1054 |
| `editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers)` | Deep copy of a list of layers. | 179 |
| `editor_heroRoadEditor_layerMgr.deepCopyLayer(layer)` | Deep copy of a layer for undo: temporarily detaches the geometry buffers (pClipped, wClipped, pFlip, wFlip), encodes/decodes, then restores them on the source; the copy receives empty buffers rebuilt at the next update. | 169 |
| `editor_heroRoadEditor_layerMgr.deserializeLayer(data)` | Reconstitutes a layer from a table (missing values replaced by the sliders' defaults), marked isDirty with empty geometry buffers; the objects are created at the next update. | 1539 |
| `editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group)` | Duplicates the layer at index idx right after it, with a new id and the name '<name> (Copy)'; the source's DecalRoad handles are not copied so that the copy builds its own objects. | 1103 |
| `editor_heroRoadEditor_layerMgr.getSliderDefaults()` | Default values of the sliders, for the interface and the reset buttons. | 122 |
| `editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group)` | Deletes the hidden (automatic) layers of the group, leaving the manual layers. | 1064 |
| `editor_heroRoadEditor_layerMgr.removeAllLayers(group)` | Deletes all the group's layers, as well as the decals of crosswalks, widenings, intersections and repairs. | 1041 |
| `editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer)` | Deletes the layer's DecalRoad object (decalRoadId) and all its split sections (decalRoadIds), if they exist. | 208 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group)` | Deletes the 'Edge Blend 1' layers. | 1401 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group)` | Deletes the 'Edge Blend 2' layers. | 1457 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group)` | Deletes the 'Edge Blend 3' layers. | 1513 |
| `editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group)` | Deletes the layers whose name contains 'Heavy Tread Marks'. | 1191 |
| `editor_heroRoadEditor_layerMgr.removeLayer(idx, group)` | Deletes the layer at index idx (its DecalRoad then the list entry). | 1033 |
| `editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group)` | Deletes the layers whose name contains 'Light Tread Marks'. | 1189 |
| `editor_heroRoadEditor_layerMgr.removePatchesLayers(group)` | Deletes the layers whose name contains 'Patches'. | 1199 |
| `editor_heroRoadEditor_layerMgr.removeRepair1Layers(group)` | Deletes the layers whose name contains 'Repair 1'. | 1195 |
| `editor_heroRoadEditor_layerMgr.removeRepair2Layers(group)` | Deletes the layers whose name contains 'Repair 2'. | 1197 |
| `editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group)` | Deletes the layers whose name contains 'Center Line'. | 1241 |
| `editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group)` | Deletes the layers whose name contains 'Road Crack'. | 1193 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group)` | Deletes the layers whose name contains 'Damage Asphalt 1'. | 1201 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group)` | Deletes the layers whose name contains 'Damage Asphalt 2'. | 1203 |
| `editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group)` | Deletes the layers whose name contains 'Edge Line'. | 1300 |
| `editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group)` | Deletes the layers whose name contains 'Lane Line'. | 1345 |
| `editor_heroRoadEditor_layerMgr.serializeLayer(layer)` | Serializes a layer to a simple table (author data: name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) without the handles or the runtime geometry. | 1516 |
| `editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist)` | Toggles canSave on all the group's DecalRoads (simple layers and sections, crosswalks, widening dividers, intersection lines) to respect the Edit/Live separation: false = nothing is written to the level, true = written with the road. Called on the Edit/Live switch and after a bake. | 231 |
| `editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup)` | Disables all automatic layer flags (tracks, damaged asphalt, cracks, repairs, patches, centerline, edge/lane lines, edge fades) and marks the group dirty. | 1118 |
| `editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx)` | Updates all the group's layers (creates/updates the DecalRoads of enabled layers, deletes those of disabled layers), then rebuilds the crosswalk bars, widening dividers, intersection lines and repair decals. | 1000 |
| `editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Only updates the layers marked isDirty (creates/updates or deletes their DecalRoad) then resets the flag to false. | 1017 |

### Parameter details

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group)`

Adds the 'Edge Blend 1' layers (edge asphalt fade, material 'm_road_asphalt_edge') on each side, with width group.edgeBlend1Width (default 1.0 m) and offset group.edgeBlend1Offset (default 1.1).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group)`

Adds the 'Edge Blend 2' layers (dirt fade, material 'm_road_edge_dirt') on each side, default width 2.0 m, default offset 1.25.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group)`

Adds the 'Edge Blend 3' layers (grass fade, material 'm_road_asphalt_edge_grass') on each side, default width 3.0 m, default offset 1.35.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group)`

Adds a hidden 'Heavy Tread Marks' layer per lane (material 'road_rubber_double', texLen group.heavyTreadTexLen or 5).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group)`

Adds a hidden 'Light Tread Marks' layer per lane, centered in the lane (material 'm_tread_marks_clean', texLen group.lightTreadTexLen or 5).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addNewLayer(group)`

Adds a manual layer 'New Layer N' (material 'road_invisible', width 10 m, position 0, priority 10, texLen 10, track width active).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addPatchesLayers(group)`

Adds a hidden 'Patches' layer per lane (material 'road_patches1', texLen group.patchesTexLen or 45).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRepair1Layers(group)`

Adds a hidden 'Repair 1' layer per lane (material 'repair1', texLen group.repair1TexLen or 25).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRepair2Layers(group)`

Adds a hidden 'Repair 2' layer per lane (material 'repair2', texLen group.repair2TexLen or 25).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group)`

Adds the hidden 'Center Line' layer at the boundary between the left and right lanes (position (nL-nR)/(nL+nR)). Nothing is added for a one-way road. Material group.centerLineMaterial or 'm_line_yellow_double', width of the USA region (or 0.2 m).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group)`

Adds a hidden 'Road Crack' layer per lane (material 'm_asphalt_cracks_02', texLen group.roadCrackTexLen or 15).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group)`

Adds a hidden 'Damage Asphalt 1' layer per lane (material 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen or 10).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group)`

Adds a hidden 'Damage Asphalt 2' layer per lane (material 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen or 25).

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group)`

Adds two hidden layers 'Edge Line - Left' and 'Edge Line - Right' at positions -/+ group.edgeLineOffset (default 1.0 = roadway edge), width group.edgeLineWidth (default 0.25 m), material group.edgeLineMaterial or 'm_line_white'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group)`

Adds the lane separation lines from the actual lane model: N-1 boundaries at position (2k-N)/N; on a two-way road, the boundary k == lanesLeft is omitted (it is the centerline). Nothing if fewer than 2 lanes. Material group.laneLineMaterial or 'm_line_white_discontinue', width 0.2 m.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group)`

Hides during a drag: deletes all rendered decals (layers, crosswalks, widenings, intersections, repairs) but keeps the layer definitions and the placed elements' data; the rebuild at the end of the drag recreates the decals.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers)`

Deep copy of a list of layers.

- `layers` (*table[]*) : List of layers.
- **returns**: table[] List of copies.

#### `editor_heroRoadEditor_layerMgr.deepCopyLayer(layer)`

Deep copy of a layer for undo: temporarily detaches the geometry buffers (pClipped, wClipped, pFlip, wFlip), encodes/decodes, then restores them on the source; the copy receives empty buffers rebuilt at the next update.

- `layer` (*table*) : Layer.
- **returns**: table Independent copy.

#### `editor_heroRoadEditor_layerMgr.deserializeLayer(data)`

Reconstitutes a layer from a table (missing values replaced by the sliders' defaults), marked isDirty with empty geometry buffers; the objects are created at the next update.

- `data` (*table*) : Table from serializeLayer or a session file.
- **returns**: table Layer ready to be added to group.layers.

#### `editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group)`

Duplicates the layer at index idx right after it, with a new id and the name '<name> (Copy)'; the source's DecalRoad handles are not copied so that the copy builds its own objects.

- `idx` (*integer*) : Index of the layer to duplicate.
- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.getSliderDefaults()`

Default values of the sliders, for the interface and the reset buttons.

- **returns**: table { defaultWidth 10.0, defaultLateralPosition 0.0, defaultRenderPriority 10, defaultTexLength 10.0, defaultFadeIn 1.0, defaultFadeOut 1.0, defaultPaintMargin 0.0, defaultPaintMaterialIdx 0 }.

#### `editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group)`

Deletes the hidden (automatic) layers of the group, leaving the manual layers.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeAllLayers(group)`

Deletes all the group's layers, as well as the decals of crosswalks, widenings, intersections and repairs.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer)`

Deletes the layer's DecalRoad object (decalRoadId) and all its split sections (decalRoadIds), if they exist.

- `layer` (*table*) : Layer.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group)`

Deletes the 'Edge Blend 1' layers.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group)`

Deletes the 'Edge Blend 2' layers.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group)`

Deletes the 'Edge Blend 3' layers.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group)`

Deletes the layers whose name contains 'Heavy Tread Marks'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeLayer(idx, group)`

Deletes the layer at index idx (its DecalRoad then the list entry).

- `idx` (*integer*) : Layer index.
- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group)`

Deletes the layers whose name contains 'Light Tread Marks'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removePatchesLayers(group)`

Deletes the layers whose name contains 'Patches'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRepair1Layers(group)`

Deletes the layers whose name contains 'Repair 1'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRepair2Layers(group)`

Deletes the layers whose name contains 'Repair 2'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group)`

Deletes the layers whose name contains 'Center Line'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group)`

Deletes the layers whose name contains 'Road Crack'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group)`

Deletes the layers whose name contains 'Damage Asphalt 1'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group)`

Deletes the layers whose name contains 'Damage Asphalt 2'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group)`

Deletes the layers whose name contains 'Edge Line'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group)`

Deletes the layers whose name contains 'Lane Line'.

- `group` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.serializeLayer(layer)`

Serializes a layer to a simple table (author data: name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) without the handles or the runtime geometry.

- `layer` (*table*) : Layer.
- **returns**: table Serializable table.

#### `editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist)`

Toggles canSave on all the group's DecalRoads (simple layers and sections, crosswalks, widening dividers, intersection lines) to respect the Edit/Live separation: false = nothing is written to the level, true = written with the road. Called on the Edit/Live switch and after a bake.

- `group` (*table*) : Hero Road group.
- `persist` (*boolean*) : true to persist in the level.

#### `editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup)`

Disables all automatic layer flags (tracks, damaged asphalt, cracks, repairs, patches, centerline, edge/lane lines, edge fades) and marks the group dirty.

- `selGroup` (*table*) : Hero Road group.

#### `editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx)`

Updates all the group's layers (creates/updates the DecalRoads of enabled layers, deletes those of disabled layers), then rebuilds the crosswalk bars, widening dividers, intersection lines and repair decals.

- `group` (*table*) : Hero Road group.
- `groupIdx` (*integer*) : Group index (passed to the layer updates).

#### `editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx)`

Only updates the layers marked isDirty (creates/updates or deletes their DecalRoad) then resets the flag to false.

- `group` (*table*) : Hero Road group.
- `groupIdx` (*integer*) : Group index.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `obj:` `delete`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua`.*

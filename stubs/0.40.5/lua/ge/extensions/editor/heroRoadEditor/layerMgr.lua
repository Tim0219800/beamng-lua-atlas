---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of the marking and detail layers of a Hero Road. A layer (group.layers[i]) describes a decal strip laid on the roadway (material, width, lateral position, texture length, fades, render priority) and becomes one or more DecalRoad objects in the group's scene folder, draped over the road mesh (overObjects). The module also builds the automatic layers (tire tracks, cracks, repairs, damaged asphalt, patches, centerline, edge and lane lines, edge fades) from the actual lane model, and the decals of the placed elements (crosswalk bars, widening dividers, intersection lines); it delegates the repair clusters to repairMgr.
--- Access: extension `editor_heroRoadEditor_layerMgr`: `extensions.load("editor_heroRoadEditor_layerMgr")`, then the global `editor_heroRoadEditor_layerMgr`
---@class editor_heroRoadEditor_layerMgr
editor_heroRoadEditor_layerMgr = {}

--- Adds the 'Edge Blend 1' layers (edge asphalt fade, material 'm_road_asphalt_edge') on each side, with width group.edgeBlend1Width (default 1.0 m) and offset group.edgeBlend1Offset (default 1.1).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1348
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group) end

--- Adds the 'Edge Blend 2' layers (dirt fade, material 'm_road_edge_dirt') on each side, default width 2.0 m, default offset 1.25.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1404
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group) end

--- Adds the 'Edge Blend 3' layers (grass fade, material 'm_road_asphalt_edge_grass') on each side, default width 3.0 m, default offset 1.35.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1460
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group) end

--- Adds a hidden 'Heavy Tread Marks' layer per lane (material 'road_rubber_double', texLen group.heavyTreadTexLen or 5).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1190
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group) end

--- Adds a hidden 'Light Tread Marks' layer per lane, centered in the lane (material 'm_tread_marks_clean', texLen group.lightTreadTexLen or 5).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1188
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group) end

--- Adds a manual layer 'New Layer N' (material 'road_invisible', width 10 m, position 0, priority 10, texLen 10, track width active).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1074
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addNewLayer(group) end

--- Adds a hidden 'Patches' layer per lane (material 'road_patches1', texLen group.patchesTexLen or 45).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1198
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addPatchesLayers(group) end

--- Adds a hidden 'Repair 1' layer per lane (material 'repair1', texLen group.repair1TexLen or 25).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1194
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRepair1Layers(group) end

--- Adds a hidden 'Repair 2' layer per lane (material 'repair2', texLen group.repair2TexLen or 25).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1196
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRepair2Layers(group) end

--- Adds the hidden 'Center Line' layer at the boundary between the left and right lanes (position (nL-nR)/(nL+nR)). Nothing is added for a one-way road. Material group.centerLineMaterial or 'm_line_yellow_double', width of the USA region (or 0.2 m).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1206
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group) end

--- Adds a hidden 'Road Crack' layer per lane (material 'm_asphalt_cracks_02', texLen group.roadCrackTexLen or 15).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1192
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group) end

--- Adds a hidden 'Damage Asphalt 1' layer per lane (material 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen or 10).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1200
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group) end

--- Adds a hidden 'Damage Asphalt 2' layer per lane (material 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen or 25).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1202
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Adds two hidden layers 'Edge Line - Left' and 'Edge Line - Right' at positions -/+ group.edgeLineOffset (default 1.0 = roadway edge), width group.edgeLineWidth (default 0.25 m), material group.edgeLineMaterial or 'm_line_white'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1244
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group) end

--- Adds the lane separation lines from the actual lane model: N-1 boundaries at position (2k-N)/N; on a two-way road, the boundary k == lanesLeft is omitted (it is the centerline). Nothing if fewer than 2 lanes. Material group.laneLineMaterial or 'm_line_white_discontinue', width 0.2 m.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1308
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group) end

--- Hides during a drag: deletes all rendered decals (layers, crosswalks, widenings, intersections, repairs) but keeps the layer definitions and the placed elements' data; the rebuild at the end of the drag recreates the decals.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1054
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group) end

--- Deep copy of a list of layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:179
---@param layers table[] List of layers.
---@return table[]  List of copies.
function editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers) end

--- Deep copy of a layer for undo: temporarily detaches the geometry buffers (pClipped, wClipped, pFlip, wFlip), encodes/decodes, then restores them on the source; the copy receives empty buffers rebuilt at the next update.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:169
---@param layer table Layer.
---@return table  Independent copy.
function editor_heroRoadEditor_layerMgr.deepCopyLayer(layer) end

--- Reconstitutes a layer from a table (missing values replaced by the sliders' defaults), marked isDirty with empty geometry buffers; the objects are created at the next update.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1539
---@param data table Table from serializeLayer or a session file.
---@return table  Layer ready to be added to group.layers.
function editor_heroRoadEditor_layerMgr.deserializeLayer(data) end

--- Duplicates the layer at index idx right after it, with a new id and the name '<name> (Copy)'; the source's DecalRoad handles are not copied so that the copy builds its own objects.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1103
---@param idx integer Index of the layer to duplicate.
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group) end

--- Default values of the sliders, for the interface and the reset buttons.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:122
---@return table  { defaultWidth 10.0, defaultLateralPosition 0.0, defaultRenderPriority 10, defaultTexLength 10.0, defaultFadeIn 1.0, defaultFadeOut 1.0, defaultPaintMargin 0.0, defaultPaintMaterialIdx 0 }.
function editor_heroRoadEditor_layerMgr.getSliderDefaults() end

--- Deletes the hidden (automatic) layers of the group, leaving the manual layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1064
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group) end

--- Deletes all the group's layers, as well as the decals of crosswalks, widenings, intersections and repairs.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1041
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeAllLayers(group) end

--- Deletes the layer's DecalRoad object (decalRoadId) and all its split sections (decalRoadIds), if they exist.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:208
---@param layer table Layer.
function editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer) end

--- Deletes the 'Edge Blend 1' layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1401
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group) end

--- Deletes the 'Edge Blend 2' layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1457
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group) end

--- Deletes the 'Edge Blend 3' layers.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1513
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group) end

--- Deletes the layers whose name contains 'Heavy Tread Marks'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1191
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Deletes the layer at index idx (its DecalRoad then the list entry).
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1033
---@param idx integer Layer index.
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeLayer(idx, group) end

--- Deletes the layers whose name contains 'Light Tread Marks'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1189
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group) end

--- Deletes the layers whose name contains 'Patches'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1199
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removePatchesLayers(group) end

--- Deletes the layers whose name contains 'Repair 1'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1195
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRepair1Layers(group) end

--- Deletes the layers whose name contains 'Repair 2'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1197
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRepair2Layers(group) end

--- Deletes the layers whose name contains 'Center Line'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1241
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group) end

--- Deletes the layers whose name contains 'Road Crack'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1193
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group) end

--- Deletes the layers whose name contains 'Damage Asphalt 1'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1201
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group) end

--- Deletes the layers whose name contains 'Damage Asphalt 2'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1203
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Deletes the layers whose name contains 'Edge Line'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1300
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Deletes the layers whose name contains 'Lane Line'.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1345
---@param group table Hero Road group.
function editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group) end

--- Serializes a layer to a simple table (author data: name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) without the handles or the runtime geometry.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1516
---@param layer table Layer.
---@return table  Serializable table.
function editor_heroRoadEditor_layerMgr.serializeLayer(layer) end

--- Toggles canSave on all the group's DecalRoads (simple layers and sections, crosswalks, widening dividers, intersection lines) to respect the Edit/Live separation: false = nothing is written to the level, true = written with the road. Called on the Edit/Live switch and after a bake.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:231
---@param group table Hero Road group.
---@param persist boolean true to persist in the level.
function editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist) end

--- Disables all automatic layer flags (tracks, damaged asphalt, cracks, repairs, patches, centerline, edge/lane lines, edge fades) and marks the group dirty.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1118
---@param selGroup table Hero Road group.
function editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup) end

--- Updates all the group's layers (creates/updates the DecalRoads of enabled layers, deletes those of disabled layers), then rebuilds the crosswalk bars, widening dividers, intersection lines and repair decals.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1000
---@param group table Hero Road group.
---@param groupIdx integer Group index (passed to the layer updates).
function editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx) end

--- Only updates the layers marked isDirty (creates/updates or deletes their DecalRoad) then resets the flag to false.
---Source: lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1017
---@param group table Hero Road group.
---@param groupIdx integer Group index.
function editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


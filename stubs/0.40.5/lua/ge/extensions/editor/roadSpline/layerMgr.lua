---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the layers of a Road Spline group. A layer is an offset strip along the road, materialized by one or more DecalRoads (split into sections beyond 100 points) with material, width, lateral position, texture length, fades and render priority. The module creates/duplicates/deletes layers, generates the automatic "hidden" layers (tire marks, cracks, repairs, patches, damaged asphalt, centerline, edge and lane lines, edge fades 1 to 3 with their default materials), updates the DecalRoads and (de)serializes the layers.
--- Access: extension `editor_roadSpline_layerMgr`: `extensions.load("editor_roadSpline_layerMgr")`, then the global `editor_roadSpline_layerMgr`
---@class editor_roadSpline_layerMgr
editor_roadSpline_layerMgr = {}

--- Adds the "Edge Blend 1" layers (m_road_asphalt_edge); width and offset from group.edgeBlend1Width (1.0) and edgeBlend1Offset (1.1).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:767
---@param group table Group.
function editor_roadSpline_layerMgr.addEdgeBlend1Layers(group) end

--- Adds the "Edge Blend 2" layers (m_road_edge_dirt); defaults width 2.0 and offset 1.25 (group.edgeBlend2Width/Offset).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:823
---@param group table Group.
function editor_roadSpline_layerMgr.addEdgeBlend2Layers(group) end

--- Adds the "Edge Blend 3" layers (m_road_asphalt_edge_grass); defaults width 3.0 and offset 1.35 (group.edgeBlend3Width/Offset).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:879
---@param group table Group.
function editor_roadSpline_layerMgr.addEdgeBlend3Layers(group) end

--- Adds the "Heavy Tread Marks" layers (road_rubber_double, texLen 5).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:602
---@param group table Group.
function editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group) end

--- Adds the "Light Tread Marks" layers (material m_tread_marks_clean, texLen 5), one per left/right lane.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:600
---@param group table Group.
function editor_roadSpline_layerMgr.addLightTreadMarksLayers(group) end

--- Adds an empty layer "New Layer N" (road_invisible material, default slider values, follows the road width).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:465
---@param group table Group.
function editor_roadSpline_layerMgr.addNewLayer(group) end

--- Adds the "Patches" layers (road_patches1, texLen 45).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:610
---@param group table Group.
function editor_roadSpline_layerMgr.addPatchesLayers(group) end

--- Adds the "Repair 1" layers (material repair1, texLen 25).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:606
---@param group table Group.
function editor_roadSpline_layerMgr.addRepair1Layers(group) end

--- Adds the "Repair 2" layers (material repair2, texLen 25).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:608
---@param group table Group.
function editor_roadSpline_layerMgr.addRepair2Layers(group) end

--- Adds the "Center Line" layer (double yellow line m_line_yellow_double, width 0.2 m, position 0, texLen 5).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:618
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadCenterLineLayers(group) end

--- Adds the "Road Crack" layers (m_asphalt_cracks_02, texLen 15).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:604
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadCrackLayers(group) end

--- Adds the "Damage Asphalt 1" layers (m_asphalt_damaged_01, texLen 10).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:612
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group) end

--- Adds the "Damage Asphalt 2" layers (m_asphalt_damaged_02, texLen 25).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:614
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Adds the edge lines "Edge Line - Left/Right" (m_line_white); width and offset come from group.edgeLineWidth (default 0.25 m) and group.edgeLineOffset (default 1.0).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:648
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group) end

--- Adds the dashed "Lane Line" lane lines (m_line_white_discontinue, default width 0.2 m).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:707
---@param group table Group.
function editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group) end

--- Deep copy of a list of layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:144
---@param layers table[] Layers.
---@return table[]  Copies.
function editor_roadSpline_layerMgr.deepCopyAllLayers(layers) end

--- Deep copy of a layer via string.buffer. The runtime geometry buffers are detached from the source before encoding then restored (the source is not altered); the copy starts with empty buffers, rebuilt on the next update.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:134
---@param layer table Source layer.
---@return table  Independent copy.
function editor_roadSpline_layerMgr.deepCopyLayer(layer) end

--- Rebuilds a clean layer from a table: default values for missing fields, isDirty = true, empty buffers and DecalRoad ids. A missing name becomes "?" and a missing id is generated.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:955
---@param data table Table from serializeLayer or from a JSON.
---@return table  Layer ready to insert into group.layers.
function editor_roadSpline_layerMgr.deserializeLayer(data) end

--- Duplicates a layer right after the original ("name (Copy)", new UUID, DecalRoad ids forgotten so that the copy builds its own roads).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:494
---@param idx integer Index of the layer to copy.
---@param group table Group.
function editor_roadSpline_layerMgr.duplicateLayer(idx, group) end

--- Calls fn(decalRoad) for each DecalRoad of the layer (single road and sections). Objects that cannot be found are passed to fn as nil.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:186
---@param layer table Layer.
---@param fn function Callback receiving a DecalRoad (or nil).
function editor_roadSpline_layerMgr.eachLayerRoad(layer, fn) end

--- Returns the default values of the sliders (width, position, priority, texture length, fades, paint margin and material) for the tool's interface.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:118
---@return table<string, number>  sliderDefaults table (live).
function editor_roadSpline_layerMgr.getSliderDefaults() end

--- Deletes the group's hidden (automatic) layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:455
---@param group table Group.
function editor_roadSpline_layerMgr.removeAllHiddenLayers(group) end

--- Deletes all the group's layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:448
---@param group table Group.
function editor_roadSpline_layerMgr.removeAllLayers(group) end

--- Removes the layer's DecalRoad (and its possible sections) from the scene and forgets the ids.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:173
---@param layer table Layer.
function editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer) end

--- Deletes the "Edge Blend 1" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:820
---@param group table Group.
function editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group) end

--- Deletes the "Edge Blend 2" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:876
---@param group table Group.
function editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group) end

--- Deletes the "Edge Blend 3" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:932
---@param group table Group.
function editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group) end

--- Deletes the "Heavy Tread Marks" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:603
---@param group table Group.
function editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Deletes the layer at the given index (its DecalRoad too).
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:440
---@param idx integer Layer index.
---@param group table Group.
function editor_roadSpline_layerMgr.removeLayer(idx, group) end

--- Deletes the layers whose name contains "Light Tread Marks".
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:601
---@param group table Group.
function editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group) end

--- Deletes the "Patches" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:611
---@param group table Group.
function editor_roadSpline_layerMgr.removePatchesLayers(group) end

--- Deletes the "Repair 1" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:607
---@param group table Group.
function editor_roadSpline_layerMgr.removeRepair1Layers(group) end

--- Deletes the "Repair 2" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:609
---@param group table Group.
function editor_roadSpline_layerMgr.removeRepair2Layers(group) end

--- Deletes the "Center Line" layer.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:645
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group) end

--- Deletes the "Road Crack" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:605
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadCrackLayers(group) end

--- Deletes the "Damage Asphalt 1" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:613
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group) end

--- Deletes the "Damage Asphalt 2" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:615
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Deletes the "Edge Line" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:704
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Deletes the "Lane Line" layers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:764
---@param group table Group.
function editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group) end

--- Reduces a layer to its authoring fields (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), without scene ids or runtime buffers.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:935
---@param layer table Layer.
---@return table  JSON-compatible table.
function editor_roadSpline_layerMgr.serializeLayer(layer) end

--- Sets to false all the group's automatic layer options (14 flags) and marks it dirty.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:509
---@param selGroup table Group.
function editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup) end

--- Updates the DecalRoads of all the group's layers; a disabled layer has its DecalRoad deleted.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:411
---@param group table Group.
---@param groupIdx integer Index of the group in the list.
function editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx) end

--- Only updates the layers marked dirty (isDirty), then clears their flag.
---Source: lua/ge/extensions/editor/roadSpline/layerMgr.lua:424
---@param group table Group.
---@param groupIdx integer Group index.
function editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


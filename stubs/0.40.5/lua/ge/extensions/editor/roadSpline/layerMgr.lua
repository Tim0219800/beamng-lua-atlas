---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadSpline_layerMgr` : `extensions.load("editor_roadSpline_layerMgr")`, puis la globale `editor_roadSpline_layerMgr`
---@class editor_roadSpline_layerMgr
editor_roadSpline_layerMgr = {}

--- Adds new edge blend 1 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:767
---@param group any
function editor_roadSpline_layerMgr.addEdgeBlend1Layers(group) end

--- Adds new edge blend 2 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:823
---@param group any
function editor_roadSpline_layerMgr.addEdgeBlend2Layers(group) end

--- Adds new edge blend 3 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:879
---@param group any
function editor_roadSpline_layerMgr.addEdgeBlend3Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:602
---@param group any
function editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group) end

--- Add/remove functions for various detail layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:600
---@param group any
function editor_roadSpline_layerMgr.addLightTreadMarksLayers(group) end

--- Adds a new layer.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:465
---@param group any
function editor_roadSpline_layerMgr.addNewLayer(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:610
---@param group any
function editor_roadSpline_layerMgr.addPatchesLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:606
---@param group any
function editor_roadSpline_layerMgr.addRepair1Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:608
---@param group any
function editor_roadSpline_layerMgr.addRepair2Layers(group) end

--- Adds new road center line layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:618
---@param group any
function editor_roadSpline_layerMgr.addRoadCenterLineLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:604
---@param group any
function editor_roadSpline_layerMgr.addRoadCrackLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:612
---@param group any
function editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:614
---@param group any
function editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Adds new road edge lines layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:648
---@param group any
function editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group) end

--- Adds new road lane lines layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:707
---@param group any
function editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group) end

--- Deep copies all layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:144
---@param layers any
function editor_roadSpline_layerMgr.deepCopyAllLayers(layers) end

--- Deep copies a layer. The runtime geometry buffers (pClipped/pFlip hold vec3 cdata that buffer.encode can't
---  serialise) are detached from the SOURCE before encoding and restored afterwards -- so copying never wipes the
---  source layer's live geometry (the old version cleared it in place, a destructive side effect). The copy starts
---  with fresh empty buffers; they are rebuilt on the next updateLayer.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:134
---@param layer any
function editor_roadSpline_layerMgr.deepCopyLayer(layer) end

--- Deserialises a layer from a table.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:955
---@param data any
function editor_roadSpline_layerMgr.deserializeLayer(data) end

--- Duplicates a layer at the given index.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:494
---@param idx any
---@param group any
function editor_roadSpline_layerMgr.duplicateLayer(idx, group) end

--- Calls fn(decalRoad) for each of a layer's DecalRoads (single-road and chunked-road representations).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:186
---@param layer any
---@param fn any
function editor_roadSpline_layerMgr.eachLayerRoad(layer, fn) end

--- Returns the default values for the slider properties, for use in the tool's front end.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:118
function editor_roadSpline_layerMgr.getSliderDefaults() end

--- Removes all hidden layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:455
---@param group any
function editor_roadSpline_layerMgr.removeAllHiddenLayers(group) end

--- Removes all layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:448
---@param group any
function editor_roadSpline_layerMgr.removeAllLayers(group) end

--- Removes the decal road object associated with the given layer, if it exists.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:173
---@param layer any
function editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer) end

--- Removes the edge blend 1 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:820
---@param group any
function editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group) end

--- Removes the edge blend 2 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:876
---@param group any
function editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group) end

--- Removes the edge blend 3 layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:932
---@param group any
function editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:603
---@param group any
function editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Removes a layer at the given index.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:440
---@param idx any
---@param group any
function editor_roadSpline_layerMgr.removeLayer(idx, group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:601
---@param group any
function editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:611
---@param group any
function editor_roadSpline_layerMgr.removePatchesLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:607
---@param group any
function editor_roadSpline_layerMgr.removeRepair1Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:609
---@param group any
function editor_roadSpline_layerMgr.removeRepair2Layers(group) end

--- Removes the road center line layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:645
---@param group any
function editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:605
---@param group any
function editor_roadSpline_layerMgr.removeRoadCrackLayers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:613
---@param group any
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group) end

---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:615
---@param group any
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Removes the road edge lines layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:704
---@param group any
function editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Removes the road lane lines layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:764
---@param group any
function editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group) end

--- Serialises a layer to a table.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:935
---@param layer any
function editor_roadSpline_layerMgr.serializeLayer(layer) end

--- Switches off all auto layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:509
---@param selGroup any
function editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup) end

--- Updates the properties of all layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:411
---@param group any
---@param groupIdx any
function editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx) end

--- Updates the properties of only the dirty layers.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:424
---@param group any
---@param groupIdx any
function editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


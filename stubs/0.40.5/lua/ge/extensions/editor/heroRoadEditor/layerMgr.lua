---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_layerMgr` : `extensions.load("editor_heroRoadEditor_layerMgr")`, puis la globale `editor_heroRoadEditor_layerMgr`
---@class editor_heroRoadEditor_layerMgr
editor_heroRoadEditor_layerMgr = {}

--- Adds new edge blend 1 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1348
---@param group any
function editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group) end

--- Adds new edge blend 2 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1404
---@param group any
function editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group) end

--- Adds new edge blend 3 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1460
---@param group any
function editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1190
---@param group any
function editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group) end

--- Add/remove functions for various detail layers. The texture tile length is per-road (group.<field>, set from the Materials
---  tab) and falls back to the module default when a road was authored before the field existed.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1188
---@param group any
function editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group) end

--- Adds a new layer.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1074
---@param group any
function editor_heroRoadEditor_layerMgr.addNewLayer(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1198
---@param group any
function editor_heroRoadEditor_layerMgr.addPatchesLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1194
---@param group any
function editor_heroRoadEditor_layerMgr.addRepair1Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1196
---@param group any
function editor_heroRoadEditor_layerMgr.addRepair2Layers(group) end

--- Adds new road center line layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1206
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1192
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1200
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1202
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Adds new road edge lines layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1244
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group) end

--- Adds new road lane lines layers.
---  Lane-division lines from the ACTUAL lane model (roadNetwork-style), not roadSpline's width heuristic. The
---  carriageway is symmetric about the spline and spans N = lanesLeft + lanesRight equal lanes, so the interior lane
---  boundaries sit at normalised position (2k - N)/N for k = 1..N-1 (position is a fraction of the half-width, so it is
---  independent of lane width). We skip k == lanesLeft: that boundary is the opposing-traffic divider, which the
---  separate centre-line layer draws.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1308
---@param group any
function editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group) end

--- Drag-hide teardown: remove every layer's rendered DecalRoad(s) plus the crossing/widening/junction/repair decals, but KEEP the
---  layer definitions (and all authored placeable data) on the group -- the release rebuild recreates the decals. Unlike
---  removeAllLayers, this does NOT table.remove the layer entries, so a node drag no longer permanently drops the artist's layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1054
---@param group any
function editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group) end

--- Deep copies all layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:179
---@param layers any
function editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers) end

--- Deep copies a layer. The runtime geometry buffers (pClipped/pFlip hold vec3 cdata that buffer.encode can't
---  serialise) are detached from the SOURCE before encoding and restored afterwards -- so copying never wipes the
---  source layer's live geometry (the old version cleared it in place, a destructive side effect). The copy starts
---  with fresh empty buffers; they are rebuilt on the next updateLayer.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:169
---@param layer any
function editor_heroRoadEditor_layerMgr.deepCopyLayer(layer) end

--- Deserialises a layer from a table.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1539
---@param data any
function editor_heroRoadEditor_layerMgr.deserializeLayer(data) end

--- Duplicates a layer at the given index.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1103
---@param idx any
---@param group any
function editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group) end

--- Returns the default values for the slider properties, for use in the tool's front end.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:122
function editor_heroRoadEditor_layerMgr.getSliderDefaults() end

--- Removes all hidden layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1064
---@param group any
function editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group) end

--- Removes all layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1041
---@param group any
function editor_heroRoadEditor_layerMgr.removeAllLayers(group) end

--- Removes the decal road object associated with the given layer, if it exists.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:208
---@param layer any
function editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer) end

--- Removes the edge blend 1 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1401
---@param group any
function editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group) end

--- Removes the edge blend 2 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1457
---@param group any
function editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group) end

--- Removes the edge blend 3 layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1513
---@param group any
function editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1191
---@param group any
function editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Removes a layer at the given index.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1033
---@param idx any
---@param group any
function editor_heroRoadEditor_layerMgr.removeLayer(idx, group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1189
---@param group any
function editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1199
---@param group any
function editor_heroRoadEditor_layerMgr.removePatchesLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1195
---@param group any
function editor_heroRoadEditor_layerMgr.removeRepair1Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1197
---@param group any
function editor_heroRoadEditor_layerMgr.removeRepair2Layers(group) end

--- Removes the road center line layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1241
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1193
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1201
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1203
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Removes the road edge lines layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1300
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Removes the road lane lines layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1345
---@param group any
function editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group) end

--- Serialises a layer to a table.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1516
---@param layer any
function editor_heroRoadEditor_layerMgr.serializeLayer(layer) end

--- Flip canSave on every DecalRoad this group owns (layer singles + chunks, crossings, widening dividers, junction lines) so a
---  level save honours the Edit/Live split: Edit (persist=false) writes nothing; Live/baked (persist=true) writes them with the road.
---  Called on the enable/disable (Edit/Live) toggle and after a bake, since those transitions don't rebuild the decals.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:231
---@param group any
---@param persist any
function editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist) end

--- Switches off all auto layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1118
---@param selGroup any
function editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup) end

---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1000
---@param group any
---@param groupIdx any
function editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx) end

--- Updates the properties of only the dirty layers.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1017
---@param group any
---@param groupIdx any
function editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


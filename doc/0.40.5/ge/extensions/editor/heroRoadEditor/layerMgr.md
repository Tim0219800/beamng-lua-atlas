# `editor_heroRoadEditor_layerMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua` · VM : Game Engine (GE) · 1621 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_layerMgr` : `extensions.load("editor_heroRoadEditor_layerMgr")`, puis la globale `editor_heroRoadEditor_layerMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group)` | Adds new edge blend 1 layers. | 1348 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group)` | Adds new edge blend 2 layers. | 1404 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group)` | Adds new edge blend 3 layers. | 1460 |
| `editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group)` |  | 1190 |
| `editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group)` | Add/remove functions for various detail layers. The texture tile length is per-road (group.<field>, set from the Materials<br> tab) and falls back to the module default when a road was authored before the field existed. | 1188 |
| `editor_heroRoadEditor_layerMgr.addNewLayer(group)` | Adds a new layer. | 1074 |
| `editor_heroRoadEditor_layerMgr.addPatchesLayers(group)` |  | 1198 |
| `editor_heroRoadEditor_layerMgr.addRepair1Layers(group)` |  | 1194 |
| `editor_heroRoadEditor_layerMgr.addRepair2Layers(group)` |  | 1196 |
| `editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group)` | Adds new road center line layers. | 1206 |
| `editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group)` |  | 1192 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group)` |  | 1200 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group)` |  | 1202 |
| `editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group)` | Adds new road edge lines layers. | 1244 |
| `editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group)` | Adds new road lane lines layers.<br> Lane-division lines from the ACTUAL lane model (roadNetwork-style), not roadSpline's width heuristic. The<br> carriageway is symmetric about the spline and spans N = lanesLeft + lanesRight equal lanes, so the interior lane<br> boundaries sit at normalised position (2k - N)/N for k = 1..N-1 (position is a fraction of the half-width, so it is<br> independent of lane width). We skip k == lanesLeft: that boundary is the opposing-traffic divider, which the<br> separate centre-line layer draws. | 1308 |
| `editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group)` | Drag-hide teardown: remove every layer's rendered DecalRoad(s) plus the crossing/widening/junction/repair decals, but KEEP the<br> layer definitions (and all authored placeable data) on the group -- the release rebuild recreates the decals. Unlike<br> removeAllLayers, this does NOT table.remove the layer entries, so a node drag no longer permanently drops the artist's layers. | 1054 |
| `editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers)` | Deep copies all layers. | 179 |
| `editor_heroRoadEditor_layerMgr.deepCopyLayer(layer)` | Deep copies a layer. The runtime geometry buffers (pClipped/pFlip hold vec3 cdata that buffer.encode can't<br> serialise) are detached from the SOURCE before encoding and restored afterwards -- so copying never wipes the<br> source layer's live geometry (the old version cleared it in place, a destructive side effect). The copy starts<br> with fresh empty buffers; they are rebuilt on the next updateLayer. | 169 |
| `editor_heroRoadEditor_layerMgr.deserializeLayer(data)` | Deserialises a layer from a table. | 1539 |
| `editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group)` | Duplicates a layer at the given index. | 1103 |
| `editor_heroRoadEditor_layerMgr.getSliderDefaults()` | Returns the default values for the slider properties, for use in the tool's front end. | 122 |
| `editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group)` | Removes all hidden layers. | 1064 |
| `editor_heroRoadEditor_layerMgr.removeAllLayers(group)` | Removes all layers. | 1041 |
| `editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer)` | Removes the decal road object associated with the given layer, if it exists. | 208 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group)` | Removes the edge blend 1 layers. | 1401 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group)` | Removes the edge blend 2 layers. | 1457 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group)` | Removes the edge blend 3 layers. | 1513 |
| `editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group)` |  | 1191 |
| `editor_heroRoadEditor_layerMgr.removeLayer(idx, group)` | Removes a layer at the given index. | 1033 |
| `editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group)` |  | 1189 |
| `editor_heroRoadEditor_layerMgr.removePatchesLayers(group)` |  | 1199 |
| `editor_heroRoadEditor_layerMgr.removeRepair1Layers(group)` |  | 1195 |
| `editor_heroRoadEditor_layerMgr.removeRepair2Layers(group)` |  | 1197 |
| `editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group)` | Removes the road center line layers. | 1241 |
| `editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group)` |  | 1193 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group)` |  | 1201 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group)` |  | 1203 |
| `editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group)` | Removes the road edge lines layers. | 1300 |
| `editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group)` | Removes the road lane lines layers. | 1345 |
| `editor_heroRoadEditor_layerMgr.serializeLayer(layer)` | Serialises a layer to a table. | 1516 |
| `editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist)` | Flip canSave on every DecalRoad this group owns (layer singles + chunks, crossings, widening dividers, junction lines) so a<br> level save honours the Edit/Live split: Edit (persist=false) writes nothing; Live/baked (persist=true) writes them with the road.<br> Called on the enable/disable (Edit/Live) toggle and after a bake, since those transitions don't rebuild the decals. | 231 |
| `editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup)` | Switches off all auto layers. | 1118 |
| `editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx)` |  | 1000 |
| `editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Updates the properties of only the dirty layers. | 1017 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `obj:` `delete`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua`.*

# `editor_roadSpline_layerMgr`

*Fichier : `lua/ge/extensions/editor/roadSpline/layerMgr.lua` · VM : Game Engine (GE) · 1033 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline_layerMgr` : `extensions.load("editor_roadSpline_layerMgr")`, puis la globale `editor_roadSpline_layerMgr`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline_layerMgr.addEdgeBlend1Layers(group)` | Adds new edge blend 1 layers. | 767 |
| `editor_roadSpline_layerMgr.addEdgeBlend2Layers(group)` | Adds new edge blend 2 layers. | 823 |
| `editor_roadSpline_layerMgr.addEdgeBlend3Layers(group)` | Adds new edge blend 3 layers. | 879 |
| `editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group)` |  | 602 |
| `editor_roadSpline_layerMgr.addLightTreadMarksLayers(group)` | Add/remove functions for various detail layers. | 600 |
| `editor_roadSpline_layerMgr.addNewLayer(group)` | Adds a new layer. | 465 |
| `editor_roadSpline_layerMgr.addPatchesLayers(group)` |  | 610 |
| `editor_roadSpline_layerMgr.addRepair1Layers(group)` |  | 606 |
| `editor_roadSpline_layerMgr.addRepair2Layers(group)` |  | 608 |
| `editor_roadSpline_layerMgr.addRoadCenterLineLayers(group)` | Adds new road center line layers. | 618 |
| `editor_roadSpline_layerMgr.addRoadCrackLayers(group)` |  | 604 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group)` |  | 612 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group)` |  | 614 |
| `editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group)` | Adds new road edge lines layers. | 648 |
| `editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group)` | Adds new road lane lines layers. | 707 |
| `editor_roadSpline_layerMgr.deepCopyAllLayers(layers)` | Deep copies all layers. | 144 |
| `editor_roadSpline_layerMgr.deepCopyLayer(layer)` | Deep copies a layer. The runtime geometry buffers (pClipped/pFlip hold vec3 cdata that buffer.encode can't<br> serialise) are detached from the SOURCE before encoding and restored afterwards -- so copying never wipes the<br> source layer's live geometry (the old version cleared it in place, a destructive side effect). The copy starts<br> with fresh empty buffers; they are rebuilt on the next updateLayer. | 134 |
| `editor_roadSpline_layerMgr.deserializeLayer(data)` | Deserialises a layer from a table. | 955 |
| `editor_roadSpline_layerMgr.duplicateLayer(idx, group)` | Duplicates a layer at the given index. | 494 |
| `editor_roadSpline_layerMgr.eachLayerRoad(layer, fn)` | Calls fn(decalRoad) for each of a layer's DecalRoads (single-road and chunked-road representations). | 186 |
| `editor_roadSpline_layerMgr.getSliderDefaults()` | Returns the default values for the slider properties, for use in the tool's front end. | 118 |
| `editor_roadSpline_layerMgr.removeAllHiddenLayers(group)` | Removes all hidden layers. | 455 |
| `editor_roadSpline_layerMgr.removeAllLayers(group)` | Removes all layers. | 448 |
| `editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer)` | Removes the decal road object associated with the given layer, if it exists. | 173 |
| `editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group)` | Removes the edge blend 1 layers. | 820 |
| `editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group)` | Removes the edge blend 2 layers. | 876 |
| `editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group)` | Removes the edge blend 3 layers. | 932 |
| `editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group)` |  | 603 |
| `editor_roadSpline_layerMgr.removeLayer(idx, group)` | Removes a layer at the given index. | 440 |
| `editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group)` |  | 601 |
| `editor_roadSpline_layerMgr.removePatchesLayers(group)` |  | 611 |
| `editor_roadSpline_layerMgr.removeRepair1Layers(group)` |  | 607 |
| `editor_roadSpline_layerMgr.removeRepair2Layers(group)` |  | 609 |
| `editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group)` | Removes the road center line layers. | 645 |
| `editor_roadSpline_layerMgr.removeRoadCrackLayers(group)` |  | 605 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group)` |  | 613 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group)` |  | 615 |
| `editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group)` | Removes the road edge lines layers. | 704 |
| `editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group)` | Removes the road lane lines layers. | 764 |
| `editor_roadSpline_layerMgr.serializeLayer(layer)` | Serialises a layer to a table. | 935 |
| `editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup)` | Switches off all auto layers. | 509 |
| `editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx)` | Updates the properties of all layers. | 411 |
| `editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Updates the properties of only the dirty layers. | 424 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline/layerMgr.lua`.*

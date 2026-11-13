# `editor_roadSpline_layerMgr`

*Fichier : `lua/ge/extensions/editor/roadSpline/layerMgr.lua` · VM : Game Engine (GE) · 1033 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline_layerMgr` : `extensions.load("editor_roadSpline_layerMgr")`, puis la globale `editor_roadSpline_layerMgr`

Gestionnaire des couches d'un groupe Road Spline. Une couche (layer) est une bande décalée le long de la route, matérialisée par un ou plusieurs DecalRoads (découpés en tronçons au-delà de 100 points) avec matériau, largeur, position latérale, longueur de texture, fondus et priorité de rendu. Le module crée/duplique/supprime les couches, génère les couches « cachées » automatiques (marques de pneus, fissures, réparations, rustines, asphalte abîmé, ligne centrale, lignes de rive et de voie, fondus de bord 1 à 3 avec leurs matériaux par défaut), met à jour les DecalRoads et (dé)sérialise les couches.

## Remarques

- Champs d'une couche : name, id (UUID), isDirty, isHidden (couche automatique), isEnabled, material, isFlip, isTrackWidth, isOverObjects, width (m), position (latérale, relative à la demi-largeur de la route), texLen (m), fadeIn, fadeOut, renderPriority, decalRoadId, decalRoadIds (tronçons), et tampons runtime pClipped/wClipped/pFlip/wFlip.
- Valeurs par défaut (getSliderDefaults) : width 10, position 0, renderPriority 10, texLength 10, fadeIn 1, fadeOut 1, paintMargin 0, paintMaterialIdx 0. Matériau par défaut d'une nouvelle couche : road_invisible.
- Les nœuds des décals sont ré-échantillonnés à pas régulier (2 m, 1 m pour les lignes de rive) pour éviter les dépassements de la spline du moteur ; segments < 5 cm soudés.
- Les couches automatiques sont retrouvées par leur nom (string.find, motif Lua) : renommer ou nommer une couche comme « Repair 1 » les fait supprimer avec les removeXxxLayers.
- Les couches « pleine longueur » (marques de pneus, fissures, réparations, rustines, asphalte abîmé) créent une couche par voie de 5 m à gauche et à droite (au moins une de chaque côté).
- Une couche désactivée (isEnabled = false) voit son DecalRoad supprimé lors de la mise à jour.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline_layerMgr.addEdgeBlend1Layers(group)` | Ajoute les couches « Edge Blend 1 » (m_road_asphalt_edge) ; largeur et décalage de group.edgeBlend1Width (1,0) et edgeBlend1Offset (1,1). | 767 |
| `editor_roadSpline_layerMgr.addEdgeBlend2Layers(group)` | Ajoute les couches « Edge Blend 2 » (m_road_edge_dirt) ; défauts largeur 2,0 et décalage 1,25 (group.edgeBlend2Width/Offset). | 823 |
| `editor_roadSpline_layerMgr.addEdgeBlend3Layers(group)` | Ajoute les couches « Edge Blend 3 » (m_road_asphalt_edge_grass) ; défauts largeur 3,0 et décalage 1,35 (group.edgeBlend3Width/Offset). | 879 |
| `editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group)` | Ajoute les couches « Heavy Tread Marks » (road_rubber_double, texLen 5). | 602 |
| `editor_roadSpline_layerMgr.addLightTreadMarksLayers(group)` | Ajoute les couches « Light Tread Marks » (matériau m_tread_marks_clean, texLen 5), une par voie gauche/droite. | 600 |
| `editor_roadSpline_layerMgr.addNewLayer(group)` | Ajoute une couche vide « New Layer N » (matériau road_invisible, valeurs par défaut des curseurs, suit la largeur de la route). | 465 |
| `editor_roadSpline_layerMgr.addPatchesLayers(group)` | Ajoute les couches « Patches » (road_patches1, texLen 45). | 610 |
| `editor_roadSpline_layerMgr.addRepair1Layers(group)` | Ajoute les couches « Repair 1 » (matériau repair1, texLen 25). | 606 |
| `editor_roadSpline_layerMgr.addRepair2Layers(group)` | Ajoute les couches « Repair 2 » (matériau repair2, texLen 25). | 608 |
| `editor_roadSpline_layerMgr.addRoadCenterLineLayers(group)` | Ajoute la couche « Center Line » (double ligne jaune m_line_yellow_double, largeur 0,2 m, position 0, texLen 5). | 618 |
| `editor_roadSpline_layerMgr.addRoadCrackLayers(group)` | Ajoute les couches « Road Crack » (m_asphalt_cracks_02, texLen 15). | 604 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group)` | Ajoute les couches « Damage Asphalt 1 » (m_asphalt_damaged_01, texLen 10). | 612 |
| `editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group)` | Ajoute les couches « Damage Asphalt 2 » (m_asphalt_damaged_02, texLen 25). | 614 |
| `editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group)` | Ajoute les lignes de rive « Edge Line - Left/Right » (m_line_white) ; largeur et décalage viennent de group.edgeLineWidth (défaut 0,25 m) et group.edgeLineOffset (défaut 1,0). | 648 |
| `editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group)` | Ajoute les lignes de voie « Lane Line » en pointillés (m_line_white_discontinue, largeur 0,2 m par défaut). | 707 |
| `editor_roadSpline_layerMgr.deepCopyAllLayers(layers)` | Copie profonde d'une liste de couches. | 144 |
| `editor_roadSpline_layerMgr.deepCopyLayer(layer)` | Copie profonde d'une couche via string.buffer. Les tampons géométriques runtime sont détachés de la source avant encodage puis restaurés (la source n'est pas altérée) ; la copie démarre avec des tampons vides, reconstruits à la prochaine mise à jour. | 134 |
| `editor_roadSpline_layerMgr.deserializeLayer(data)` | Reconstruit une couche propre depuis une table : valeurs par défaut pour les champs absents, isDirty = true, tampons et ids de DecalRoad vides. Le nom manquant devient « ? » et l'id manquant est généré. | 955 |
| `editor_roadSpline_layerMgr.duplicateLayer(idx, group)` | Duplique une couche juste après l'original (« nom (Copy) », nouvel UUID, ids de DecalRoad oubliés pour que la copie construise ses propres routes). | 494 |
| `editor_roadSpline_layerMgr.eachLayerRoad(layer, fn)` | Appelle fn(decalRoad) pour chaque DecalRoad de la couche (route unique et tronçons). Les objets introuvables sont passés à fn comme nil. | 186 |
| `editor_roadSpline_layerMgr.getSliderDefaults()` | Renvoie les valeurs par défaut des curseurs (largeur, position, priorité, longueur de texture, fondus, marge et matériau de peinture) pour l'interface de l'outil. | 118 |
| `editor_roadSpline_layerMgr.removeAllHiddenLayers(group)` | Supprime les couches cachées (automatiques) du groupe. | 455 |
| `editor_roadSpline_layerMgr.removeAllLayers(group)` | Supprime toutes les couches du groupe. | 448 |
| `editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer)` | Supprime de la scène le DecalRoad de la couche (et ses tronçons éventuels) et oublie les ids. | 173 |
| `editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group)` | Supprime les couches « Edge Blend 1 ». | 820 |
| `editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group)` | Supprime les couches « Edge Blend 2 ». | 876 |
| `editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group)` | Supprime les couches « Edge Blend 3 ». | 932 |
| `editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group)` | Supprime les couches « Heavy Tread Marks ». | 603 |
| `editor_roadSpline_layerMgr.removeLayer(idx, group)` | Supprime la couche à l'indice donné (son DecalRoad aussi). | 440 |
| `editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group)` | Supprime les couches dont le nom contient « Light Tread Marks ». | 601 |
| `editor_roadSpline_layerMgr.removePatchesLayers(group)` | Supprime les couches « Patches ». | 611 |
| `editor_roadSpline_layerMgr.removeRepair1Layers(group)` | Supprime les couches « Repair 1 ». | 607 |
| `editor_roadSpline_layerMgr.removeRepair2Layers(group)` | Supprime les couches « Repair 2 ». | 609 |
| `editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group)` | Supprime la couche « Center Line ». | 645 |
| `editor_roadSpline_layerMgr.removeRoadCrackLayers(group)` | Supprime les couches « Road Crack ». | 605 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group)` | Supprime les couches « Damage Asphalt 1 ». | 613 |
| `editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group)` | Supprime les couches « Damage Asphalt 2 ». | 615 |
| `editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group)` | Supprime les couches « Edge Line ». | 704 |
| `editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group)` | Supprime les couches « Lane Line ». | 764 |
| `editor_roadSpline_layerMgr.serializeLayer(layer)` | Réduit une couche à ses champs auteur (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), sans ids de scène ni tampons runtime. | 935 |
| `editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup)` | Met à false toutes les options de couches automatiques du groupe (14 drapeaux) et le marque sale. | 509 |
| `editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx)` | Met à jour les DecalRoads de toutes les couches du groupe ; une couche désactivée voit son DecalRoad supprimé. | 411 |
| `editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Ne met à jour que les couches marquées sales (isDirty), puis efface leur drapeau. | 424 |

### Détail des paramètres

#### `editor_roadSpline_layerMgr.addEdgeBlend1Layers(group)`

Ajoute les couches « Edge Blend 1 » (m_road_asphalt_edge) ; largeur et décalage de group.edgeBlend1Width (1,0) et edgeBlend1Offset (1,1).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addEdgeBlend2Layers(group)`

Ajoute les couches « Edge Blend 2 » (m_road_edge_dirt) ; défauts largeur 2,0 et décalage 1,25 (group.edgeBlend2Width/Offset).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addEdgeBlend3Layers(group)`

Ajoute les couches « Edge Blend 3 » (m_road_asphalt_edge_grass) ; défauts largeur 3,0 et décalage 1,35 (group.edgeBlend3Width/Offset).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group)`

Ajoute les couches « Heavy Tread Marks » (road_rubber_double, texLen 5).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addLightTreadMarksLayers(group)`

Ajoute les couches « Light Tread Marks » (matériau m_tread_marks_clean, texLen 5), une par voie gauche/droite.

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addNewLayer(group)`

Ajoute une couche vide « New Layer N » (matériau road_invisible, valeurs par défaut des curseurs, suit la largeur de la route).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addPatchesLayers(group)`

Ajoute les couches « Patches » (road_patches1, texLen 45).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRepair1Layers(group)`

Ajoute les couches « Repair 1 » (matériau repair1, texLen 25).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRepair2Layers(group)`

Ajoute les couches « Repair 2 » (matériau repair2, texLen 25).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadCenterLineLayers(group)`

Ajoute la couche « Center Line » (double ligne jaune m_line_yellow_double, largeur 0,2 m, position 0, texLen 5).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadCrackLayers(group)`

Ajoute les couches « Road Crack » (m_asphalt_cracks_02, texLen 15).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group)`

Ajoute les couches « Damage Asphalt 1 » (m_asphalt_damaged_01, texLen 10).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group)`

Ajoute les couches « Damage Asphalt 2 » (m_asphalt_damaged_02, texLen 25).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group)`

Ajoute les lignes de rive « Edge Line - Left/Right » (m_line_white) ; largeur et décalage viennent de group.edgeLineWidth (défaut 0,25 m) et group.edgeLineOffset (défaut 1,0).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group)`

Ajoute les lignes de voie « Lane Line » en pointillés (m_line_white_discontinue, largeur 0,2 m par défaut).

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.deepCopyAllLayers(layers)`

Copie profonde d'une liste de couches.

- `layers` (*table[]*) : Couches.
- **renvoie** : table[] Copies.

#### `editor_roadSpline_layerMgr.deepCopyLayer(layer)`

Copie profonde d'une couche via string.buffer. Les tampons géométriques runtime sont détachés de la source avant encodage puis restaurés (la source n'est pas altérée) ; la copie démarre avec des tampons vides, reconstruits à la prochaine mise à jour.

- `layer` (*table*) : Couche source.
- **renvoie** : table Copie indépendante.

#### `editor_roadSpline_layerMgr.deserializeLayer(data)`

Reconstruit une couche propre depuis une table : valeurs par défaut pour les champs absents, isDirty = true, tampons et ids de DecalRoad vides. Le nom manquant devient « ? » et l'id manquant est généré.

- `data` (*table*) : Table issue de serializeLayer ou d'un JSON.
- **renvoie** : table Couche prête à insérer dans group.layers.

#### `editor_roadSpline_layerMgr.duplicateLayer(idx, group)`

Duplique une couche juste après l'original (« nom (Copy) », nouvel UUID, ids de DecalRoad oubliés pour que la copie construise ses propres routes).

- `idx` (*integer*) : Indice de la couche à copier.
- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.eachLayerRoad(layer, fn)`

Appelle fn(decalRoad) pour chaque DecalRoad de la couche (route unique et tronçons). Les objets introuvables sont passés à fn comme nil.

- `layer` (*table*) : Couche.
- `fn` (*function*) : Rappel recevant un DecalRoad (ou nil).

#### `editor_roadSpline_layerMgr.getSliderDefaults()`

Renvoie les valeurs par défaut des curseurs (largeur, position, priorité, longueur de texture, fondus, marge et matériau de peinture) pour l'interface de l'outil.

- **renvoie** : table<string, number> Table sliderDefaults (vivante).

#### `editor_roadSpline_layerMgr.removeAllHiddenLayers(group)`

Supprime les couches cachées (automatiques) du groupe.

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeAllLayers(group)`

Supprime toutes les couches du groupe.

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer)`

Supprime de la scène le DecalRoad de la couche (et ses tronçons éventuels) et oublie les ids.

- `layer` (*table*) : Couche.

#### `editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group)`

Supprime les couches « Edge Blend 1 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group)`

Supprime les couches « Edge Blend 2 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group)`

Supprime les couches « Edge Blend 3 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group)`

Supprime les couches « Heavy Tread Marks ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeLayer(idx, group)`

Supprime la couche à l'indice donné (son DecalRoad aussi).

- `idx` (*integer*) : Indice de la couche.
- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group)`

Supprime les couches dont le nom contient « Light Tread Marks ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removePatchesLayers(group)`

Supprime les couches « Patches ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRepair1Layers(group)`

Supprime les couches « Repair 1 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRepair2Layers(group)`

Supprime les couches « Repair 2 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group)`

Supprime la couche « Center Line ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadCrackLayers(group)`

Supprime les couches « Road Crack ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group)`

Supprime les couches « Damage Asphalt 1 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group)`

Supprime les couches « Damage Asphalt 2 ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group)`

Supprime les couches « Edge Line ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group)`

Supprime les couches « Lane Line ».

- `group` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.serializeLayer(layer)`

Réduit une couche à ses champs auteur (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), sans ids de scène ni tampons runtime.

- `layer` (*table*) : Couche.
- **renvoie** : table Table JSON-compatible.

#### `editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup)`

Met à false toutes les options de couches automatiques du groupe (14 drapeaux) et le marque sale.

- `selGroup` (*table*) : Groupe.

#### `editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx)`

Met à jour les DecalRoads de toutes les couches du groupe ; une couche désactivée voit son DecalRoad supprimé.

- `group` (*table*) : Groupe.
- `groupIdx` (*integer*) : Indice du groupe dans la liste.

#### `editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx)`

Ne met à jour que les couches marquées sales (isDirty), puis efface leur drapeau.

- `group` (*table*) : Groupe.
- `groupIdx` (*integer*) : Indice du groupe.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline/layerMgr.lua`.*

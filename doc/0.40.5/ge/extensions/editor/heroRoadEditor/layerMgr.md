# `editor_heroRoadEditor_layerMgr`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua` · VM : Game Engine (GE) · 1621 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_layerMgr` : `extensions.load("editor_heroRoadEditor_layerMgr")`, puis la globale `editor_heroRoadEditor_layerMgr`

Gestion des calques de marquage et de détail d'une route Hero Road. Un calque (group.layers[i]) décrit une bande de décalque posée sur la chaussée (matériau, largeur, position latérale, longueur de texture, fondus, priorité de rendu) et devient un ou plusieurs objets DecalRoad dans le dossier de scène du groupe, drapés sur le maillage de la route (overObjects). Le module fabrique aussi les calques automatiques (traces de pneus, fissures, réparations, asphalte endommagé, patchs, ligne centrale, lignes de rive et de voie, fondus de bord) d'après le vrai modèle de voies, et les décalques des éléments posés (barres de passage piéton, séparateurs d'élargissement, lignes de carrefour) ; il délègue les amas de réparations à repairMgr.

## Remarques

- Position latérale d'un calque : fraction de la demi-largeur (0 = axe, -1/+1 = bord gauche/droit, >1 = hors chaussée). Pour N = lanesLeft + lanesRight voies, la voie j est centrée en (2j-1-N)/N, la limite k entre voies en (2k-N)/N, la ligne centrale en (nL-nR)/(nL+nR).
- Ligne centrale : pas de calque si une seule direction (lanesLeft ou lanesRight = 0). Lignes de voie : au moins 2 voies, et la limite entre sens opposés (k == lanesLeft) est laissée à la ligne centrale.
- Découpage : une section DecalRoad est limitée à 250 m d'arc et 500 nœuds (limite d'index 16 bits du buffer GPU, au-delà l'extrémité n'est plus rendue). Les sections se raccordent en C1 grâce à des nœuds poignée (startTangent/endTangent). Rééchantillonnage : 8 m (4 m pour les lignes de rive) ; les segments de moins de 0.05 m sont soudés.
- Les nœuds de décalque sont relevés de 2.0 m (decalDrapeHeight) puis projetés vers le bas sur la collision du maillage : la collision doit exister avant de créer les décalques.
- Seules les lignes peintes (ligne centrale, lignes de rive et de voie) sont coupées par les nids-de-poule marqués cutMarkings (fondu de 0.4 m au bord de coupe) ; les lignes de rive et fondus de bord sont aussi interrompus à l'embouchure d'un carrefour, et suivent l'élargissement (edgeBulge).
- Matériaux par défaut : traces légères 'm_tread_marks_clean', lourdes 'road_rubber_double', fissures 'm_asphalt_cracks_02', 'repair1', 'repair2', 'road_patches1', 'm_asphalt_damaged_01/02', ligne centrale 'm_line_yellow_double', rive 'm_line_white', voie 'm_line_white_discontinue', fondus 'm_road_asphalt_edge', 'm_road_edge_dirt', 'm_road_asphalt_edge_grass'. Nouveau calque manuel : matériau 'road_invisible'.
- Les calques automatiques sont cachés (isHidden = true) et recréés à chaque reconstruction ; la suppression par motif (removeXxxLayers) retire tout calque dont le nom contient le texte du type (ex. 'Repair 1'), y compris un calque manuel qui porterait un nom contenant ce texte (recherche string.find avec motif).
- canSave des DecalRoad : false en Edit (rien n'est écrit dans le niveau), true pour une route Live/cuite (setGroupDecalsCanSave).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group)` | Ajoute les calques 'Edge Blend 1' (fondu d'asphalte de bord, matériau 'm_road_asphalt_edge') de chaque côté, de largeur group.edgeBlend1Width (défaut 1.0 m) et décalage group.edgeBlend1Offset (défaut 1.1). | 1348 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group)` | Ajoute les calques 'Edge Blend 2' (fondu de terre, matériau 'm_road_edge_dirt') de chaque côté, largeur par défaut 2.0 m, décalage par défaut 1.25. | 1404 |
| `editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group)` | Ajoute les calques 'Edge Blend 3' (fondu d'herbe, matériau 'm_road_asphalt_edge_grass') de chaque côté, largeur par défaut 3.0 m, décalage par défaut 1.35. | 1460 |
| `editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group)` | Ajoute un calque caché 'Heavy Tread Marks' par voie (matériau 'road_rubber_double', texLen group.heavyTreadTexLen ou 5). | 1190 |
| `editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group)` | Ajoute un calque caché 'Light Tread Marks' par voie, centré dans la voie (matériau 'm_tread_marks_clean', texLen group.lightTreadTexLen ou 5). | 1188 |
| `editor_heroRoadEditor_layerMgr.addNewLayer(group)` | Ajoute un calque manuel 'New Layer N' (matériau 'road_invisible', largeur 10 m, position 0, priorité 10, texLen 10, largeur de piste active). | 1074 |
| `editor_heroRoadEditor_layerMgr.addPatchesLayers(group)` | Ajoute un calque caché 'Patches' par voie (matériau 'road_patches1', texLen group.patchesTexLen ou 45). | 1198 |
| `editor_heroRoadEditor_layerMgr.addRepair1Layers(group)` | Ajoute un calque caché 'Repair 1' par voie (matériau 'repair1', texLen group.repair1TexLen ou 25). | 1194 |
| `editor_heroRoadEditor_layerMgr.addRepair2Layers(group)` | Ajoute un calque caché 'Repair 2' par voie (matériau 'repair2', texLen group.repair2TexLen ou 25). | 1196 |
| `editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group)` | Ajoute le calque caché 'Center Line' à la limite entre les voies de gauche et de droite (position (nL-nR)/(nL+nR)). Rien n'est ajouté pour une route à sens unique. Matériau group.centerLineMaterial ou 'm_line_yellow_double', largeur de la région USA (ou 0.2 m). | 1206 |
| `editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group)` | Ajoute un calque caché 'Road Crack' par voie (matériau 'm_asphalt_cracks_02', texLen group.roadCrackTexLen ou 15). | 1192 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group)` | Ajoute un calque caché 'Damage Asphalt 1' par voie (matériau 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen ou 10). | 1200 |
| `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group)` | Ajoute un calque caché 'Damage Asphalt 2' par voie (matériau 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen ou 25). | 1202 |
| `editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group)` | Ajoute deux calques cachés 'Edge Line - Left' et 'Edge Line - Right' aux positions -/+ group.edgeLineOffset (défaut 1.0 = bord de chaussée), largeur group.edgeLineWidth (défaut 0.25 m), matériau group.edgeLineMaterial ou 'm_line_white'. | 1244 |
| `editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group)` | Ajoute les lignes de séparation de voies d'après le vrai modèle de voies : N-1 limites à la position (2k-N)/N ; sur route à double sens, la limite k == lanesLeft est omise (c'est la ligne centrale). Rien si moins de 2 voies. Matériau group.laneLineMaterial ou 'm_line_white_discontinue', largeur 0.2 m. | 1308 |
| `editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group)` | Masque pendant un glissement : supprime tous les décalques rendus (calques, passages piétons, élargissements, carrefours, réparations) mais garde les définitions de calques et les données des éléments posés ; la reconstruction à la fin du glissement recrée les décalques. | 1054 |
| `editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers)` | Copie profonde d'une liste de calques. | 179 |
| `editor_heroRoadEditor_layerMgr.deepCopyLayer(layer)` | Copie profonde d'un calque pour l'annulation : détache temporairement les tampons de géométrie (pClipped, wClipped, pFlip, wFlip), encode/décode, puis les restaure sur la source ; la copie reçoit des tampons vides reconstruits à la prochaine mise à jour. | 169 |
| `editor_heroRoadEditor_layerMgr.deserializeLayer(data)` | Reconstitue un calque à partir d'une table (valeurs manquantes remplacées par les défauts des curseurs), marqué isDirty avec des tampons de géométrie vides ; les objets sont créés à la prochaine mise à jour. | 1539 |
| `editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group)` | Duplique le calque d'indice idx juste après lui, avec un nouvel id et le nom '<nom> (Copy)' ; les handles DecalRoad de la source ne sont pas copiés pour que la copie construise ses propres objets. | 1103 |
| `editor_heroRoadEditor_layerMgr.getSliderDefaults()` | Valeurs par défaut des curseurs, pour l'interface et les boutons de remise à zéro. | 122 |
| `editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group)` | Supprime les calques cachés (automatiques) du groupe, en laissant les calques manuels. | 1064 |
| `editor_heroRoadEditor_layerMgr.removeAllLayers(group)` | Supprime tous les calques du groupe, ainsi que les décalques de passages piétons, d'élargissements, de carrefours et de réparations. | 1041 |
| `editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer)` | Supprime l'objet DecalRoad du calque (decalRoadId) et toutes ses sections découpées (decalRoadIds), s'ils existent. | 208 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group)` | Supprime les calques 'Edge Blend 1'. | 1401 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group)` | Supprime les calques 'Edge Blend 2'. | 1457 |
| `editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group)` | Supprime les calques 'Edge Blend 3'. | 1513 |
| `editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group)` | Supprime les calques dont le nom contient 'Heavy Tread Marks'. | 1191 |
| `editor_heroRoadEditor_layerMgr.removeLayer(idx, group)` | Supprime le calque d'indice idx (son DecalRoad puis l'entrée de la liste). | 1033 |
| `editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group)` | Supprime les calques dont le nom contient 'Light Tread Marks'. | 1189 |
| `editor_heroRoadEditor_layerMgr.removePatchesLayers(group)` | Supprime les calques dont le nom contient 'Patches'. | 1199 |
| `editor_heroRoadEditor_layerMgr.removeRepair1Layers(group)` | Supprime les calques dont le nom contient 'Repair 1'. | 1195 |
| `editor_heroRoadEditor_layerMgr.removeRepair2Layers(group)` | Supprime les calques dont le nom contient 'Repair 2'. | 1197 |
| `editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group)` | Supprime les calques dont le nom contient 'Center Line'. | 1241 |
| `editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group)` | Supprime les calques dont le nom contient 'Road Crack'. | 1193 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group)` | Supprime les calques dont le nom contient 'Damage Asphalt 1'. | 1201 |
| `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group)` | Supprime les calques dont le nom contient 'Damage Asphalt 2'. | 1203 |
| `editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group)` | Supprime les calques dont le nom contient 'Edge Line'. | 1300 |
| `editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group)` | Supprime les calques dont le nom contient 'Lane Line'. | 1345 |
| `editor_heroRoadEditor_layerMgr.serializeLayer(layer)` | Sérialise un calque en table simple (données d'auteur : nom, id, isHidden, isEnabled, matériau, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) sans les handles ni la géométrie d'exécution. | 1516 |
| `editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist)` | Bascule canSave de tous les DecalRoad du groupe (calques simples et sections, passages piétons, séparateurs d'élargissement, lignes de carrefour) pour respecter la séparation Edit/Live : false = rien n'est écrit au niveau, true = écrit avec la route. Appelé au basculement Edit/Live et après un bake. | 231 |
| `editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup)` | Désactive tous les drapeaux de calques automatiques (traces, asphalte endommagé, fissures, réparations, patchs, ligne centrale, lignes de rive/voie, fondus de bord) et marque le groupe sale. | 1118 |
| `editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx)` | Met à jour tous les calques du groupe (crée/met à jour les DecalRoad des calques activés, supprime ceux des calques désactivés), puis reconstruit les barres de passages piétons, les séparateurs d'élargissement, les lignes de carrefour et les décalques de réparations. | 1000 |
| `editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx)` | Met à jour seulement les calques marqués isDirty (crée/met à jour ou supprime leur DecalRoad) puis remet le drapeau à false. | 1017 |

### Détail des paramètres

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group)`

Ajoute les calques 'Edge Blend 1' (fondu d'asphalte de bord, matériau 'm_road_asphalt_edge') de chaque côté, de largeur group.edgeBlend1Width (défaut 1.0 m) et décalage group.edgeBlend1Offset (défaut 1.1).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group)`

Ajoute les calques 'Edge Blend 2' (fondu de terre, matériau 'm_road_edge_dirt') de chaque côté, largeur par défaut 2.0 m, décalage par défaut 1.25.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group)`

Ajoute les calques 'Edge Blend 3' (fondu d'herbe, matériau 'm_road_asphalt_edge_grass') de chaque côté, largeur par défaut 3.0 m, décalage par défaut 1.35.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group)`

Ajoute un calque caché 'Heavy Tread Marks' par voie (matériau 'road_rubber_double', texLen group.heavyTreadTexLen ou 5).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group)`

Ajoute un calque caché 'Light Tread Marks' par voie, centré dans la voie (matériau 'm_tread_marks_clean', texLen group.lightTreadTexLen ou 5).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addNewLayer(group)`

Ajoute un calque manuel 'New Layer N' (matériau 'road_invisible', largeur 10 m, position 0, priorité 10, texLen 10, largeur de piste active).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addPatchesLayers(group)`

Ajoute un calque caché 'Patches' par voie (matériau 'road_patches1', texLen group.patchesTexLen ou 45).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRepair1Layers(group)`

Ajoute un calque caché 'Repair 1' par voie (matériau 'repair1', texLen group.repair1TexLen ou 25).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRepair2Layers(group)`

Ajoute un calque caché 'Repair 2' par voie (matériau 'repair2', texLen group.repair2TexLen ou 25).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group)`

Ajoute le calque caché 'Center Line' à la limite entre les voies de gauche et de droite (position (nL-nR)/(nL+nR)). Rien n'est ajouté pour une route à sens unique. Matériau group.centerLineMaterial ou 'm_line_yellow_double', largeur de la région USA (ou 0.2 m).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group)`

Ajoute un calque caché 'Road Crack' par voie (matériau 'm_asphalt_cracks_02', texLen group.roadCrackTexLen ou 15).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group)`

Ajoute un calque caché 'Damage Asphalt 1' par voie (matériau 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen ou 10).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group)`

Ajoute un calque caché 'Damage Asphalt 2' par voie (matériau 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen ou 25).

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group)`

Ajoute deux calques cachés 'Edge Line - Left' et 'Edge Line - Right' aux positions -/+ group.edgeLineOffset (défaut 1.0 = bord de chaussée), largeur group.edgeLineWidth (défaut 0.25 m), matériau group.edgeLineMaterial ou 'm_line_white'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group)`

Ajoute les lignes de séparation de voies d'après le vrai modèle de voies : N-1 limites à la position (2k-N)/N ; sur route à double sens, la limite k == lanesLeft est omise (c'est la ligne centrale). Rien si moins de 2 voies. Matériau group.laneLineMaterial ou 'm_line_white_discontinue', largeur 0.2 m.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group)`

Masque pendant un glissement : supprime tous les décalques rendus (calques, passages piétons, élargissements, carrefours, réparations) mais garde les définitions de calques et les données des éléments posés ; la reconstruction à la fin du glissement recrée les décalques.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers)`

Copie profonde d'une liste de calques.

- `layers` (*table[]*) : Liste de calques.
- **renvoie** : table[] Liste de copies.

#### `editor_heroRoadEditor_layerMgr.deepCopyLayer(layer)`

Copie profonde d'un calque pour l'annulation : détache temporairement les tampons de géométrie (pClipped, wClipped, pFlip, wFlip), encode/décode, puis les restaure sur la source ; la copie reçoit des tampons vides reconstruits à la prochaine mise à jour.

- `layer` (*table*) : Calque.
- **renvoie** : table Copie indépendante.

#### `editor_heroRoadEditor_layerMgr.deserializeLayer(data)`

Reconstitue un calque à partir d'une table (valeurs manquantes remplacées par les défauts des curseurs), marqué isDirty avec des tampons de géométrie vides ; les objets sont créés à la prochaine mise à jour.

- `data` (*table*) : Table issue de serializeLayer ou d'un fichier de session.
- **renvoie** : table Calque prêt à être ajouté à group.layers.

#### `editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group)`

Duplique le calque d'indice idx juste après lui, avec un nouvel id et le nom '<nom> (Copy)' ; les handles DecalRoad de la source ne sont pas copiés pour que la copie construise ses propres objets.

- `idx` (*integer*) : Indice du calque à dupliquer.
- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.getSliderDefaults()`

Valeurs par défaut des curseurs, pour l'interface et les boutons de remise à zéro.

- **renvoie** : table { defaultWidth 10.0, defaultLateralPosition 0.0, defaultRenderPriority 10, defaultTexLength 10.0, defaultFadeIn 1.0, defaultFadeOut 1.0, defaultPaintMargin 0.0, defaultPaintMaterialIdx 0 }.

#### `editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group)`

Supprime les calques cachés (automatiques) du groupe, en laissant les calques manuels.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeAllLayers(group)`

Supprime tous les calques du groupe, ainsi que les décalques de passages piétons, d'élargissements, de carrefours et de réparations.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer)`

Supprime l'objet DecalRoad du calque (decalRoadId) et toutes ses sections découpées (decalRoadIds), s'ils existent.

- `layer` (*table*) : Calque.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group)`

Supprime les calques 'Edge Blend 1'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group)`

Supprime les calques 'Edge Blend 2'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group)`

Supprime les calques 'Edge Blend 3'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group)`

Supprime les calques dont le nom contient 'Heavy Tread Marks'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeLayer(idx, group)`

Supprime le calque d'indice idx (son DecalRoad puis l'entrée de la liste).

- `idx` (*integer*) : Indice du calque.
- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group)`

Supprime les calques dont le nom contient 'Light Tread Marks'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removePatchesLayers(group)`

Supprime les calques dont le nom contient 'Patches'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRepair1Layers(group)`

Supprime les calques dont le nom contient 'Repair 1'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRepair2Layers(group)`

Supprime les calques dont le nom contient 'Repair 2'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group)`

Supprime les calques dont le nom contient 'Center Line'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group)`

Supprime les calques dont le nom contient 'Road Crack'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group)`

Supprime les calques dont le nom contient 'Damage Asphalt 1'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group)`

Supprime les calques dont le nom contient 'Damage Asphalt 2'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group)`

Supprime les calques dont le nom contient 'Edge Line'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group)`

Supprime les calques dont le nom contient 'Lane Line'.

- `group` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.serializeLayer(layer)`

Sérialise un calque en table simple (données d'auteur : nom, id, isHidden, isEnabled, matériau, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) sans les handles ni la géométrie d'exécution.

- `layer` (*table*) : Calque.
- **renvoie** : table Table sérialisable.

#### `editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist)`

Bascule canSave de tous les DecalRoad du groupe (calques simples et sections, passages piétons, séparateurs d'élargissement, lignes de carrefour) pour respecter la séparation Edit/Live : false = rien n'est écrit au niveau, true = écrit avec la route. Appelé au basculement Edit/Live et après un bake.

- `group` (*table*) : Groupe Hero Road.
- `persist` (*boolean*) : true pour persister dans le niveau.

#### `editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup)`

Désactive tous les drapeaux de calques automatiques (traces, asphalte endommagé, fissures, réparations, patchs, ligne centrale, lignes de rive/voie, fondus de bord) et marque le groupe sale.

- `selGroup` (*table*) : Groupe Hero Road.

#### `editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx)`

Met à jour tous les calques du groupe (crée/met à jour les DecalRoad des calques activés, supprime ceux des calques désactivés), puis reconstruit les barres de passages piétons, les séparateurs d'élargissement, les lignes de carrefour et les décalques de réparations.

- `group` (*table*) : Groupe Hero Road.
- `groupIdx` (*integer*) : Indice du groupe (transmis aux mises à jour de calque).

#### `editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx)`

Met à jour seulement les calques marqués isDirty (crée/met à jour ou supprime leur DecalRoad) puis remet le drapeau à false.

- `group` (*table*) : Groupe Hero Road.
- `groupIdx` (*integer*) : Indice du groupe.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `obj:` `delete`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua`.*

---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des calques de marquage et de détail d'une route Hero Road. Un calque (group.layers[i]) décrit une bande de décalque posée sur la chaussée (matériau, largeur, position latérale, longueur de texture, fondus, priorité de rendu) et devient un ou plusieurs objets DecalRoad dans le dossier de scène du groupe, drapés sur le maillage de la route (overObjects). Le module fabrique aussi les calques automatiques (traces de pneus, fissures, réparations, asphalte endommagé, patchs, ligne centrale, lignes de rive et de voie, fondus de bord) d'après le vrai modèle de voies, et les décalques des éléments posés (barres de passage piéton, séparateurs d'élargissement, lignes de carrefour) ; il délègue les amas de réparations à repairMgr.
--- Accès : extension `editor_heroRoadEditor_layerMgr` : `extensions.load("editor_heroRoadEditor_layerMgr")`, puis la globale `editor_heroRoadEditor_layerMgr`
---@class editor_heroRoadEditor_layerMgr
editor_heroRoadEditor_layerMgr = {}

--- Ajoute les calques 'Edge Blend 1' (fondu d'asphalte de bord, matériau 'm_road_asphalt_edge') de chaque côté, de largeur group.edgeBlend1Width (défaut 1.0 m) et décalage group.edgeBlend1Offset (défaut 1.1).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1348
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addEdgeBlend1Layers(group) end

--- Ajoute les calques 'Edge Blend 2' (fondu de terre, matériau 'm_road_edge_dirt') de chaque côté, largeur par défaut 2.0 m, décalage par défaut 1.25.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1404
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addEdgeBlend2Layers(group) end

--- Ajoute les calques 'Edge Blend 3' (fondu d'herbe, matériau 'm_road_asphalt_edge_grass') de chaque côté, largeur par défaut 3.0 m, décalage par défaut 1.35.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1460
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addEdgeBlend3Layers(group) end

--- Ajoute un calque caché 'Heavy Tread Marks' par voie (matériau 'road_rubber_double', texLen group.heavyTreadTexLen ou 5).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1190
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addHeavyTreadMarksLayers(group) end

--- Ajoute un calque caché 'Light Tread Marks' par voie, centré dans la voie (matériau 'm_tread_marks_clean', texLen group.lightTreadTexLen ou 5).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1188
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addLightTreadMarksLayers(group) end

--- Ajoute un calque manuel 'New Layer N' (matériau 'road_invisible', largeur 10 m, position 0, priorité 10, texLen 10, largeur de piste active).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1074
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addNewLayer(group) end

--- Ajoute un calque caché 'Patches' par voie (matériau 'road_patches1', texLen group.patchesTexLen ou 45).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1198
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addPatchesLayers(group) end

--- Ajoute un calque caché 'Repair 1' par voie (matériau 'repair1', texLen group.repair1TexLen ou 25).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1194
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRepair1Layers(group) end

--- Ajoute un calque caché 'Repair 2' par voie (matériau 'repair2', texLen group.repair2TexLen ou 25).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1196
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRepair2Layers(group) end

--- Ajoute le calque caché 'Center Line' à la limite entre les voies de gauche et de droite (position (nL-nR)/(nL+nR)). Rien n'est ajouté pour une route à sens unique. Matériau group.centerLineMaterial ou 'm_line_yellow_double', largeur de la région USA (ou 0.2 m).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1206
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadCenterLineLayers(group) end

--- Ajoute un calque caché 'Road Crack' par voie (matériau 'm_asphalt_cracks_02', texLen group.roadCrackTexLen ou 15).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1192
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadCrackLayers(group) end

--- Ajoute un calque caché 'Damage Asphalt 1' par voie (matériau 'm_asphalt_damaged_01', texLen group.damageAsphalt1TexLen ou 10).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1200
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt1Layers(group) end

--- Ajoute un calque caché 'Damage Asphalt 2' par voie (matériau 'm_asphalt_damaged_02', texLen group.damageAsphalt2TexLen ou 25).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1202
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Ajoute deux calques cachés 'Edge Line - Left' et 'Edge Line - Right' aux positions -/+ group.edgeLineOffset (défaut 1.0 = bord de chaussée), largeur group.edgeLineWidth (défaut 0.25 m), matériau group.edgeLineMaterial ou 'm_line_white'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1244
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadEdgeLinesLayers(group) end

--- Ajoute les lignes de séparation de voies d'après le vrai modèle de voies : N-1 limites à la position (2k-N)/N ; sur route à double sens, la limite k == lanesLeft est omise (c'est la ligne centrale). Rien si moins de 2 voies. Matériau group.laneLineMaterial ou 'm_line_white_discontinue', largeur 0.2 m.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1308
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.addRoadLaneLinesLayers(group) end

--- Masque pendant un glissement : supprime tous les décalques rendus (calques, passages piétons, élargissements, carrefours, réparations) mais garde les définitions de calques et les données des éléments posés ; la reconstruction à la fin du glissement recrée les décalques.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1054
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.clearAllLayerDecals(group) end

--- Copie profonde d'une liste de calques.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:179
---@param layers table[] Liste de calques.
---@return table[]  Liste de copies.
function editor_heroRoadEditor_layerMgr.deepCopyAllLayers(layers) end

--- Copie profonde d'un calque pour l'annulation : détache temporairement les tampons de géométrie (pClipped, wClipped, pFlip, wFlip), encode/décode, puis les restaure sur la source ; la copie reçoit des tampons vides reconstruits à la prochaine mise à jour.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:169
---@param layer table Calque.
---@return table  Copie indépendante.
function editor_heroRoadEditor_layerMgr.deepCopyLayer(layer) end

--- Reconstitue un calque à partir d'une table (valeurs manquantes remplacées par les défauts des curseurs), marqué isDirty avec des tampons de géométrie vides ; les objets sont créés à la prochaine mise à jour.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1539
---@param data table Table issue de serializeLayer ou d'un fichier de session.
---@return table  Calque prêt à être ajouté à group.layers.
function editor_heroRoadEditor_layerMgr.deserializeLayer(data) end

--- Duplique le calque d'indice idx juste après lui, avec un nouvel id et le nom '<nom> (Copy)' ; les handles DecalRoad de la source ne sont pas copiés pour que la copie construise ses propres objets.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1103
---@param idx integer Indice du calque à dupliquer.
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.duplicateLayer(idx, group) end

--- Valeurs par défaut des curseurs, pour l'interface et les boutons de remise à zéro.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:122
---@return table  { defaultWidth 10.0, defaultLateralPosition 0.0, defaultRenderPriority 10, defaultTexLength 10.0, defaultFadeIn 1.0, defaultFadeOut 1.0, defaultPaintMargin 0.0, defaultPaintMaterialIdx 0 }.
function editor_heroRoadEditor_layerMgr.getSliderDefaults() end

--- Supprime les calques cachés (automatiques) du groupe, en laissant les calques manuels.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1064
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeAllHiddenLayers(group) end

--- Supprime tous les calques du groupe, ainsi que les décalques de passages piétons, d'élargissements, de carrefours et de réparations.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1041
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeAllLayers(group) end

--- Supprime l'objet DecalRoad du calque (decalRoadId) et toutes ses sections découpées (decalRoadIds), s'ils existent.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:208
---@param layer table Calque.
function editor_heroRoadEditor_layerMgr.removeDecalRoadInLayer(layer) end

--- Supprime les calques 'Edge Blend 1'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1401
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend1Layers(group) end

--- Supprime les calques 'Edge Blend 2'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1457
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend2Layers(group) end

--- Supprime les calques 'Edge Blend 3'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1513
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeEdgeBlend3Layers(group) end

--- Supprime les calques dont le nom contient 'Heavy Tread Marks'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1191
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Supprime le calque d'indice idx (son DecalRoad puis l'entrée de la liste).
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1033
---@param idx integer Indice du calque.
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeLayer(idx, group) end

--- Supprime les calques dont le nom contient 'Light Tread Marks'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1189
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeLightTreadMarksLayers(group) end

--- Supprime les calques dont le nom contient 'Patches'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1199
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removePatchesLayers(group) end

--- Supprime les calques dont le nom contient 'Repair 1'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1195
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRepair1Layers(group) end

--- Supprime les calques dont le nom contient 'Repair 2'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1197
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRepair2Layers(group) end

--- Supprime les calques dont le nom contient 'Center Line'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1241
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadCenterLineLayers(group) end

--- Supprime les calques dont le nom contient 'Road Crack'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1193
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadCrackLayers(group) end

--- Supprime les calques dont le nom contient 'Damage Asphalt 1'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1201
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt1Layers(group) end

--- Supprime les calques dont le nom contient 'Damage Asphalt 2'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1203
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Supprime les calques dont le nom contient 'Edge Line'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1300
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Supprime les calques dont le nom contient 'Lane Line'.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1345
---@param group table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.removeRoadLaneLinesLayers(group) end

--- Sérialise un calque en table simple (données d'auteur : nom, id, isHidden, isEnabled, matériau, isFlip, isTrackWidth, isEdge, edgeSide, edgeOffsetM, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority) sans les handles ni la géométrie d'exécution.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1516
---@param layer table Calque.
---@return table  Table sérialisable.
function editor_heroRoadEditor_layerMgr.serializeLayer(layer) end

--- Bascule canSave de tous les DecalRoad du groupe (calques simples et sections, passages piétons, séparateurs d'élargissement, lignes de carrefour) pour respecter la séparation Edit/Live : false = rien n'est écrit au niveau, true = écrit avec la route. Appelé au basculement Edit/Live et après un bake.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:231
---@param group table Groupe Hero Road.
---@param persist boolean true pour persister dans le niveau.
function editor_heroRoadEditor_layerMgr.setGroupDecalsCanSave(group, persist) end

--- Désactive tous les drapeaux de calques automatiques (traces, asphalte endommagé, fissures, réparations, patchs, ligne centrale, lignes de rive/voie, fondus de bord) et marque le groupe sale.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1118
---@param selGroup table Groupe Hero Road.
function editor_heroRoadEditor_layerMgr.switchOffAllAutoLayers(selGroup) end

--- Met à jour tous les calques du groupe (crée/met à jour les DecalRoad des calques activés, supprime ceux des calques désactivés), puis reconstruit les barres de passages piétons, les séparateurs d'élargissement, les lignes de carrefour et les décalques de réparations.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1000
---@param group table Groupe Hero Road.
---@param groupIdx integer Indice du groupe (transmis aux mises à jour de calque).
function editor_heroRoadEditor_layerMgr.updateAllLayers(group, groupIdx) end

--- Met à jour seulement les calques marqués isDirty (crée/met à jour ou supprime leur DecalRoad) puis remet le drapeau à false.
---Source : lua/ge/extensions/editor/heroRoadEditor/layerMgr.lua:1017
---@param group table Groupe Hero Road.
---@param groupIdx integer Indice du groupe.
function editor_heroRoadEditor_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des couches d'un groupe Road Spline. Une couche (layer) est une bande décalée le long de la route, matérialisée par un ou plusieurs DecalRoads (découpés en tronçons au-delà de 100 points) avec matériau, largeur, position latérale, longueur de texture, fondus et priorité de rendu. Le module crée/duplique/supprime les couches, génère les couches « cachées » automatiques (marques de pneus, fissures, réparations, rustines, asphalte abîmé, ligne centrale, lignes de rive et de voie, fondus de bord 1 à 3 avec leurs matériaux par défaut), met à jour les DecalRoads et (dé)sérialise les couches.
--- Accès : extension `editor_roadSpline_layerMgr` : `extensions.load("editor_roadSpline_layerMgr")`, puis la globale `editor_roadSpline_layerMgr`
---@class editor_roadSpline_layerMgr
editor_roadSpline_layerMgr = {}

--- Ajoute les couches « Edge Blend 1 » (m_road_asphalt_edge) ; largeur et décalage de group.edgeBlend1Width (1,0) et edgeBlend1Offset (1,1).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:767
---@param group table Groupe.
function editor_roadSpline_layerMgr.addEdgeBlend1Layers(group) end

--- Ajoute les couches « Edge Blend 2 » (m_road_edge_dirt) ; défauts largeur 2,0 et décalage 1,25 (group.edgeBlend2Width/Offset).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:823
---@param group table Groupe.
function editor_roadSpline_layerMgr.addEdgeBlend2Layers(group) end

--- Ajoute les couches « Edge Blend 3 » (m_road_asphalt_edge_grass) ; défauts largeur 3,0 et décalage 1,35 (group.edgeBlend3Width/Offset).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:879
---@param group table Groupe.
function editor_roadSpline_layerMgr.addEdgeBlend3Layers(group) end

--- Ajoute les couches « Heavy Tread Marks » (road_rubber_double, texLen 5).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:602
---@param group table Groupe.
function editor_roadSpline_layerMgr.addHeavyTreadMarksLayers(group) end

--- Ajoute les couches « Light Tread Marks » (matériau m_tread_marks_clean, texLen 5), une par voie gauche/droite.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:600
---@param group table Groupe.
function editor_roadSpline_layerMgr.addLightTreadMarksLayers(group) end

--- Ajoute une couche vide « New Layer N » (matériau road_invisible, valeurs par défaut des curseurs, suit la largeur de la route).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:465
---@param group table Groupe.
function editor_roadSpline_layerMgr.addNewLayer(group) end

--- Ajoute les couches « Patches » (road_patches1, texLen 45).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:610
---@param group table Groupe.
function editor_roadSpline_layerMgr.addPatchesLayers(group) end

--- Ajoute les couches « Repair 1 » (matériau repair1, texLen 25).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:606
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRepair1Layers(group) end

--- Ajoute les couches « Repair 2 » (matériau repair2, texLen 25).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:608
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRepair2Layers(group) end

--- Ajoute la couche « Center Line » (double ligne jaune m_line_yellow_double, largeur 0,2 m, position 0, texLen 5).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:618
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadCenterLineLayers(group) end

--- Ajoute les couches « Road Crack » (m_asphalt_cracks_02, texLen 15).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:604
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadCrackLayers(group) end

--- Ajoute les couches « Damage Asphalt 1 » (m_asphalt_damaged_01, texLen 10).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:612
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadDamageAsphalt1Layers(group) end

--- Ajoute les couches « Damage Asphalt 2 » (m_asphalt_damaged_02, texLen 25).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:614
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadDamageAsphalt2Layers(group) end

--- Ajoute les lignes de rive « Edge Line - Left/Right » (m_line_white) ; largeur et décalage viennent de group.edgeLineWidth (défaut 0,25 m) et group.edgeLineOffset (défaut 1,0).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:648
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadEdgeLinesLayers(group) end

--- Ajoute les lignes de voie « Lane Line » en pointillés (m_line_white_discontinue, largeur 0,2 m par défaut).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:707
---@param group table Groupe.
function editor_roadSpline_layerMgr.addRoadLaneLinesLayers(group) end

--- Copie profonde d'une liste de couches.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:144
---@param layers table[] Couches.
---@return table[]  Copies.
function editor_roadSpline_layerMgr.deepCopyAllLayers(layers) end

--- Copie profonde d'une couche via string.buffer. Les tampons géométriques runtime sont détachés de la source avant encodage puis restaurés (la source n'est pas altérée) ; la copie démarre avec des tampons vides, reconstruits à la prochaine mise à jour.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:134
---@param layer table Couche source.
---@return table  Copie indépendante.
function editor_roadSpline_layerMgr.deepCopyLayer(layer) end

--- Reconstruit une couche propre depuis une table : valeurs par défaut pour les champs absents, isDirty = true, tampons et ids de DecalRoad vides. Le nom manquant devient « ? » et l'id manquant est généré.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:955
---@param data table Table issue de serializeLayer ou d'un JSON.
---@return table  Couche prête à insérer dans group.layers.
function editor_roadSpline_layerMgr.deserializeLayer(data) end

--- Duplique une couche juste après l'original (« nom (Copy) », nouvel UUID, ids de DecalRoad oubliés pour que la copie construise ses propres routes).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:494
---@param idx integer Indice de la couche à copier.
---@param group table Groupe.
function editor_roadSpline_layerMgr.duplicateLayer(idx, group) end

--- Appelle fn(decalRoad) pour chaque DecalRoad de la couche (route unique et tronçons). Les objets introuvables sont passés à fn comme nil.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:186
---@param layer table Couche.
---@param fn function Rappel recevant un DecalRoad (ou nil).
function editor_roadSpline_layerMgr.eachLayerRoad(layer, fn) end

--- Renvoie les valeurs par défaut des curseurs (largeur, position, priorité, longueur de texture, fondus, marge et matériau de peinture) pour l'interface de l'outil.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:118
---@return table<string, number>  Table sliderDefaults (vivante).
function editor_roadSpline_layerMgr.getSliderDefaults() end

--- Supprime les couches cachées (automatiques) du groupe.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:455
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeAllHiddenLayers(group) end

--- Supprime toutes les couches du groupe.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:448
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeAllLayers(group) end

--- Supprime de la scène le DecalRoad de la couche (et ses tronçons éventuels) et oublie les ids.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:173
---@param layer table Couche.
function editor_roadSpline_layerMgr.removeDecalRoadInLayer(layer) end

--- Supprime les couches « Edge Blend 1 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:820
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeEdgeBlend1Layers(group) end

--- Supprime les couches « Edge Blend 2 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:876
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeEdgeBlend2Layers(group) end

--- Supprime les couches « Edge Blend 3 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:932
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeEdgeBlend3Layers(group) end

--- Supprime les couches « Heavy Tread Marks ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:603
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeHeavyTreadMarksLayers(group) end

--- Supprime la couche à l'indice donné (son DecalRoad aussi).
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:440
---@param idx integer Indice de la couche.
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeLayer(idx, group) end

--- Supprime les couches dont le nom contient « Light Tread Marks ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:601
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeLightTreadMarksLayers(group) end

--- Supprime les couches « Patches ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:611
---@param group table Groupe.
function editor_roadSpline_layerMgr.removePatchesLayers(group) end

--- Supprime les couches « Repair 1 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:607
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRepair1Layers(group) end

--- Supprime les couches « Repair 2 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:609
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRepair2Layers(group) end

--- Supprime la couche « Center Line ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:645
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadCenterLineLayers(group) end

--- Supprime les couches « Road Crack ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:605
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadCrackLayers(group) end

--- Supprime les couches « Damage Asphalt 1 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:613
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt1Layers(group) end

--- Supprime les couches « Damage Asphalt 2 ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:615
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadDamageAsphalt2Layers(group) end

--- Supprime les couches « Edge Line ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:704
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadEdgeLinesLayers(group) end

--- Supprime les couches « Lane Line ».
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:764
---@param group table Groupe.
function editor_roadSpline_layerMgr.removeRoadLaneLinesLayers(group) end

--- Réduit une couche à ses champs auteur (name, id, isHidden, isEnabled, material, isFlip, isTrackWidth, isOverObjects, width, position, texLen, fadeIn, fadeOut, renderPriority), sans ids de scène ni tampons runtime.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:935
---@param layer table Couche.
---@return table  Table JSON-compatible.
function editor_roadSpline_layerMgr.serializeLayer(layer) end

--- Met à false toutes les options de couches automatiques du groupe (14 drapeaux) et le marque sale.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:509
---@param selGroup table Groupe.
function editor_roadSpline_layerMgr.switchOffAllAutoLayers(selGroup) end

--- Met à jour les DecalRoads de toutes les couches du groupe ; une couche désactivée voit son DecalRoad supprimé.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:411
---@param group table Groupe.
---@param groupIdx integer Indice du groupe dans la liste.
function editor_roadSpline_layerMgr.updateAllLayers(group, groupIdx) end

--- Ne met à jour que les couches marquées sales (isDirty), puis efface leur drapeau.
---Source : lua/ge/extensions/editor/roadSpline/layerMgr.lua:424
---@param group table Groupe.
---@param groupIdx integer Indice du groupe.
function editor_roadSpline_layerMgr.updateOnlyDirtyLayers(group, groupIdx) end


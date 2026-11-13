---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/dynamicDecals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- API du système de decals dynamiques (peinture de livrée sur le véhicule joueur) utilisé par l'outil Dynamic Decals de l'éditeur. Il gère une pile de calques (layerStack : decal, fill, textureFill, group, brushStroke, path, linkedSet) avec historique undo/redo, projette/cuit ces calques dans les textures dynamiques du véhicule via le binding C++ DecalProjection, expose les réglages courants de projection (couleur, échelle, rotation, masque alpha, miroir, SDF, chemin, pinceau) sous forme de get/set, sérialise la pile en JSON et exporte textures et skins (jbeam + matériaux) dans /mods/unpacked. setup() doit être appelé avant tout le reste.
--- Accès : extension `editor_api_dynamicDecals` : `extensions.load("editor_api_dynamicDecals")`, puis la globale `editor_api_dynamicDecals`
---@class editor_api_dynamicDecals
---@field blendModes table[] Modes de fusion {name, value} : Clear 0, Normal 1, Screen / Add 2, Subtract 3, Multiply 4, Eraser 5.
---@field blendModesMap table<string, integer> name -> value de blendModes.
---@field debug boolean Active des logs détaillés (print) dans la plupart des fonctions. false par défaut.
---@field layerBakingStatusCode table<string, integer> Drapeaux de résultat du cuisson (res.status) : Ok 0, Warning 1, Error 2, LayerStackDataTypeIncorrect 4, LayerDataTypeIncorrect 8, TextureFileMissing 16, FontFileMissing 32.
---@field layerTypes table<string, integer> decal 0, fill 1, textureFill 2, group 3, brushStroke 4, path 5, linkedSet 6.
---@field layerTypesMap table<integer, string> Inverse de layerTypes (valeur -> nom).
---@field loadingModes table[] Modes de chargement de pile {key, value} : Overwrite 0, Append 1 (pour loadLayerStackFromFile).
---@field pathTypes table<string, integer> Linear 0, Bezier 1.
---@field projectDynamicDecals boolean Si true (défaut), onUpdate_ projette chaque frame le decal de prévisualisation sous la caméra.
---@field properties table<string, table[]> Description des propriétés éditables par type de calque (Decal, etc.) : id, name, description, type, default, min/max pour le widget, format, getMod/setMod, widgetType.
---@field propertiesMap table Index des propriétés (construit à partir de properties).
---@field ready boolean true une fois setup() terminé.
---@field settingsFlags table<string, table> Drapeaux de réglage du projecteur ({name, value[, description]}) : None, UseMousePos (bit 2), UseGradientColor (3), AlphaMaskInvert (4), WrapAlphaMaskX (5), WrapAlphaMaskY (6), WrapColorTextureX (7), WrapColorTextureY (8).
---@field textureResolutions table[] Résolutions possibles {name, value} : 512, 1024, 2048, 4096.
---@field types table<string, integer> Types de propriété pour M.properties : bool 0, int 1, float 2, Point2F 3, Point3F 4, Point4F 5, string 6, Texture 7, File 8, ColorI 9, MultiColor 10.
---@field typesMap table<integer, string> Inverse de types.
---@field widgetTypes table Pour chaque type de propriété, table des widgets possibles (Default, Input, Slider, Drag, Combo, Checkbox, Color, File, ImageButton, ColorGradient, InputMultiline selon le type).
editor_api_dynamicDecals = {}

--- Ajoute un calque de coup de pinceau à partir de getBrushStrokeLayerData(), annulable.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1342
---@param params table|nil name (déduit du code)
---@return table  Calque créé (déduit du code)
function editor_api_dynamicDecals.addBrushStrokeLayer(params) end

--- Crée un calque decal à partir de la projection courante (caméra + réglages), le cuit et l'ajoute à la pile (annulable). Si tous les meshes ne sont pas activés, limite le decal aux meshes activés du véhicule.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1098
---@param params table|nil name (défaut généré), parentUid (calque groupe parent)
---@return table  Données du calque créé
function editor_api_dynamicDecals.addDecal(params) end

--- Ajoute un calque de remplissage de couleur (couleur et palette de fillLayer courantes), annulable.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1187
---@param params table|nil name, parentUid
---@return table  Calque créé
function editor_api_dynamicDecals.addFillLayer(params) end

--- Ajoute un calque groupe (peut contenir des enfants), annulable.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1270
---@param params table|nil name, parentUid
---@return table  Calque créé
function editor_api_dynamicDecals.addGroup(params) end

--- Ajoute un calque « linked set » (type 6, avec table properties), annulable. L'annulation supprime le dernier calque racine.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1305
---@param params table|nil name, parentUid
---@return table  Calque créé
function editor_api_dynamicDecals.addLinkedSet(params) end

--- Ajoute un decal dans le masque (layer.mask.layers) du calque donné, à partir de la projection courante (annulable).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1053
---@param layerUid_string string uid du calque à masquer
function editor_api_dynamicDecals.addMaskDecal(layerUid_string) end

--- Ajoute un matériau aux cibles.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2427
---@param materialIdx_int integer Index
function editor_api_dynamicDecals.addMaterialIdx(materialIdx_int) end

--- Ajoute un point au calque chemin en cours (le crée au premier appel avec les réglages de chemin courants : orientDecals, pathType, interpolationSteps, text, fontPath), puis reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1142
---@return table  Données du point/calque
function editor_api_dynamicDecals.addPathDataPoint() end

--- Ajoute un calque de remplissage par texture (fillTexturePath, scale, offset courants), annulable.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1229
---@param params table|nil name, parentUid
---@return table  Calque créé
function editor_api_dynamicDecals.addTextureFillLayer(params) end

--- true si tous les meshes sont activés.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2639
---@return boolean  État
function editor_api_dynamicDecals.areAllMeshesEnabled() end

--- Cuit le coup de pinceau courant.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2751
function editor_api_dynamicDecals.bakeBrush() end

--- Cuit une liste de calques dans les textures du véhicule joueur (decalProjection:bakeLayers). Renvoie nil avec un message s'il n'y a pas de véhicule.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1584
---@param layers table[] Calques à cuire
---@return table|nil  Résultat (champ status : M.layerBakingStatusCode)
function editor_api_dynamicDecals.bakeLayers(layers) end

--- Tourne le decal courant d'un pas (15 degrés par défaut, en radians).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1579
---@param clockwise_bool boolean Sens horaire
---@param step_radian_number number|nil Pas en radians
function editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number) end

--- Agrandit/réduit le decal courant (x et z de decalScale) d'un pas (0.025 par défaut).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1573
---@param increase_bool boolean true pour agrandir
---@param step_number number|nil Pas
function editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number) end

--- Vide la pile de calques et les textures cuites (annulable).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1638
function editor_api_dynamicDecals.clearLayerStack() end

--- Vide la liste des matériaux ciblés.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2415
function editor_api_dynamicDecals.clearMaterialIdx() end

--- Reconstruit un calque à partir de données sérialisées.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:483
---@param layer table Données sérialisées
---@return table  Calque
function editor_api_dynamicDecals.deserializeLayer(layer) end

--- Désactive tous les meshes.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2635
function editor_api_dynamicDecals.disableAllMeshes() end

--- Supprime la mise en évidence.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1524
function editor_api_dynamicDecals.disableDecalHighlighting() end

--- Affiche les textures cuites dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2218
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawBakedTextures(maxImageWidth) end

--- Affiche les textures d'entrée du pinceau dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2226
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth) end

--- Affiche les textures dynamiques dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2214
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth) end

--- Affiche les textures de surbrillance dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2222
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth) end

--- Affiche les textures de masque dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2230
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawMaskTextures(maxImageWidth) end

--- Affiche un textureSet donné dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2234
---@param textureSet userdata TextureSet
---@param name string Titre
---@param maxImageWidth number Largeur max
function editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth) end

--- Duplique un calque en le miroitant (nom + " Mirrored Copy") juste après l'original (annulable).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2008
---@param layerId_number integer Indice
---@param parentUid_string string|nil Parent
---@param mirrorChildren boolean|nil Miroiter aussi les enfants
function editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren) end

--- Duplique un calque (nouveaux uids, nom + " Copy") juste après l'original (annulable).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1980
---@param layerId_number integer Indice
---@param parentUid_string string|nil Parent
function editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string) end

--- Active tous les meshes pour la projection.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2631
function editor_api_dynamicDecals.enableAllMeshes() end

--- Exporte le masque d'un calque dans un fichier.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2074
---@param layer table Calque
---@param directory string Dossier
---@param filename string Nom de fichier
---@param extension string Extension
function editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension) end

--- Exporte un skin utilisable comme mod : textures png (_d, _m, _r, _cp), matériaux <mat>.skin.<skinName> copiés des presets <mat>.skin.dynamicTextures et fichier jbeam du skin (slotType paint_design) dans /mods/unpacked/<skinName>/..., puis rafraîchit le gestionnaire de mods.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2078
---@param vehicleName string Nom du véhicule
---@param skinName string Nom du skin
function editor_api_dynamicDecals.exportSkin(vehicleName, skinName) end

--- Exporte les textures cuites dans un dossier.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2070
---@param directoryPath string Dossier
---@param exportName string Nom de base
---@param extension string Extension (ex. png)
---@return any  Résultat du moteur
function editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension) end

--- Termine le chemin en cours (les prochains points créeront un nouveau chemin).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2590
function editor_api_dynamicDecals.finishPathLayer() end

--- Mode de fusion du masque alpha (0 ou 1 d'après les bornes de propriété).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2463
---@return integer  Mode
function editor_api_dynamicDecals.getAlphaMaskBlendMode() end

--- Canal du masque alpha (0 à 3 d'après les bornes de propriété).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2455
---@return integer  Canal
function editor_api_dynamicDecals.getAlphaMaskChannel() end

--- Intensité du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2311
---@return number  Intensité
function editor_api_dynamicDecals.getAlphaMaskIntensity() end

--- Décalage du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2303
---@return Point2F  Décalage
function editor_api_dynamicDecals.getAlphaMaskOffset() end

--- Rotation du masque alpha (radians).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2471
---@return number  Radians
function editor_api_dynamicDecals.getAlphaMaskRotation() end

--- Échelle du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2295
---@return Point2F  Échelle
function editor_api_dynamicDecals.getAlphaMaskScale() end

--- Mode de fusion courant (M.blendModes).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2062
---@return integer  Valeur
function editor_api_dynamicDecals.getBlendMode() end

--- Pas d'interpolation du pinceau.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2519
---@return integer  Pas
function editor_api_dynamicDecals.getBrushStrokeInterpolationSteps() end

--- Données du calque pinceau courant (côté C++).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2623
---@return table  Données
function editor_api_dynamicDecals.getBrushStrokeLayerData() end

--- Index de palette de couleurs du véhicule utilisé par le decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2375
---@return integer  Index
function editor_api_dynamicDecals.getColorPaletteMapId() end

--- Échelle de la texture de couleur.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2287
---@return Point2F  Échelle
function editor_api_dynamicDecals.getColorTextureScale() end

--- Position du curseur de projection (écran, UV).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2759
---@return Point2F  Position
function editor_api_dynamicDecals.getCursorPosition() end

--- Couleur courante du decal (RGBA).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2190
---@return Point4F  Couleur
function editor_api_dynamicDecals.getDecalColor() end

--- Caractère de police utilisé par le decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2671
---@return string  Caractère
function editor_api_dynamicDecals.getDecalLayerFontCharacter() end

--- Chemin de la police du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2679
---@return string  Chemin
function editor_api_dynamicDecals.getDecalLayerFontPath() end

--- Position locale (véhicule) d'un calque decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2651
---@param decal table Calque
---@return vec3  Position
function editor_api_dynamicDecals.getDecalLocalPos(decal) end

--- Rotation courante du decal (radians).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2206
---@return number  Radians
function editor_api_dynamicDecals.getDecalRotation() end

--- Échelle courante du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2198
---@return vec3  Échelle
function editor_api_dynamicDecals.getDecalScale() end

--- Cisaillement du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2279
---@return Point2F  Skew
function editor_api_dynamicDecals.getDecalSkew() end

--- Chemin de la texture courante d'un type de decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2174
---@param type_string string Type de texture (color, normal, metallic, roughness, alpha, déduit des champs decal*TexturePath)
---@return string  Chemin
function editor_api_dynamicDecals.getDecalTexturePath(type_string) end

--- Décalage UV du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2271
---@return Point2F  UV
function editor_api_dynamicDecals.getDecalUv() end

--- Position monde d'un calque decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2647
---@param decal table Calque
---@return vec3  Position
function editor_api_dynamicDecals.getDecalWorldPos(decal) end

--- Matrice de transformation monde d'un calque.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2659
---@param decal table Calque
---@return MatrixF  Transformation
function editor_api_dynamicDecals.getDecalWorldTransform(decal) end

--- Profondeur de projection.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2547
---@return number  Profondeur
function editor_api_dynamicDecals.getDepth() end

--- Indique si le mode chemin est actif.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2582
---@return boolean  État
function editor_api_dynamicDecals.getEnablePathLayer() end

--- Projection dynamique activée ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2238
---@return boolean  État
function editor_api_dynamicDecals.getEnabled() end

--- Couleur des calques de remplissage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2439
---@return Point4F  Couleur
function editor_api_dynamicDecals.getFillLayerColor() end

--- Index de palette pour le remplissage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2447
---@return integer  Index
function editor_api_dynamicDecals.getFillLayerColorPaletteMapId() end

--- Texture de remplissage courante.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2182
---@return string  Chemin
function editor_api_dynamicDecals.getFillTexturePath() end

--- Inverser le decal côté miroir ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2695
---@return boolean  État
function editor_api_dynamicDecals.getFlipMirroredDecal() end

--- Chemin de l'atlas de texture de police.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2263
---@return string  Chemin
function editor_api_dynamicDecals.getFontTextureAtlasPath() end

--- Couleur du dégradé, coin bas-gauche.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2359
---@return ColorI  Couleur
function editor_api_dynamicDecals.getGradientColorBottomLeft() end

--- Couleur du dégradé, coin bas-droit.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2367
---@return ColorI  Couleur
function editor_api_dynamicDecals.getGradientColorBottomRight() end

--- Couleur du dégradé, coin haut-gauche.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2343
---@return ColorI  Couleur
function editor_api_dynamicDecals.getGradientColorTopLeft() end

--- Couleur du dégradé, coin haut-droit.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2351
---@return ColorI  Couleur
function editor_api_dynamicDecals.getGradientColorTopRight() end

--- Calque actuellement surligné, ou nil.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1598
---@return table|nil  Calque
function editor_api_dynamicDecals.getHighlightedLayer() end

--- Historique undo/redo propre à ce module.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3046
---@return table  Historique
function editor_api_dynamicDecals.getHistory() end

--- Renvoie le calque d'indice donné (à partir de 1) dans la pile racine ou dans les enfants du parent.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1708
---@param layerId_number integer Indice
---@param parentUid_string string|nil uid du parent
---@return table|nil  Calque
function editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string) end

--- Cherche un calque (récursivement) par uid ; logge un message et renvoie nil s'il est introuvable.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1699
---@param layerUid_string string uid
---@return table|nil  Calque
function editor_api_dynamicDecals.getLayerByUid(layerUid_string) end

--- Nombre total de calques (enfants compris).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1567
---@return integer  Nombre
function editor_api_dynamicDecals.getLayerCount() end

--- Renvoie le modèle de nom de calque.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1009
---@return string  Modèle
function editor_api_dynamicDecals.getLayerNameBuildString() end

--- Renvoie la pile de calques racine (table partagée, pas une copie).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1563
---@return table[]  Calques
function editor_api_dynamicDecals.getLayerStack() end

--- Profondeur verrouillée ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2539
---@return boolean  État
function editor_api_dynamicDecals.getLockDepth() end

--- Normale de surface verrouillée ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2551
---@return boolean  État
function editor_api_dynamicDecals.getLockSurfaceNormal() end

--- Liste des index de matériaux ciblés.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2419
---@return integer[]  Index
function editor_api_dynamicDecals.getMaterialIndices() end

--- Nombre de meshes du shape.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2435
---@return integer  Nombre
function editor_api_dynamicDecals.getMeshObjectCount() end

--- Intensité métallique.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2327
---@return number  Intensité
function editor_api_dynamicDecals.getMetallicIntensity() end

--- Affichage de debug du miroir actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2495
---@return boolean  État
function editor_api_dynamicDecals.getMirrorDebug() end

--- Décalage du plan de miroir.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2487
---@return number  Décalage
function editor_api_dynamicDecals.getMirrorOffset() end

--- Mode miroir actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2479
---@return boolean  État
function editor_api_dynamicDecals.getMirrored() end

--- Intensité de la normal map.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2319
---@return number  Intensité
function editor_api_dynamicDecals.getNormalIntensity() end

--- Si les decals suivent la direction du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2607
---@return boolean  État
function editor_api_dynamicDecals.getOrientPathDecals() end

--- Chemin de la police du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2687
---@return string  Chemin
function editor_api_dynamicDecals.getPathLayerFontPath() end

--- Pas d'interpolation du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2527
---@return integer  Pas
function editor_api_dynamicDecals.getPathLayerInterpolationSteps() end

--- Texte posé le long du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2663
---@return string  Texte
function editor_api_dynamicDecals.getPathLayerText() end

--- Type de chemin (M.pathTypes).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2615
---@return integer  0 Linear, 1 Bezier
function editor_api_dynamicDecals.getPathType() end

--- Génère un uid pseudo-unique "XXXX-XXXX" (hexadécimal).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:48
---@return string  uid
function editor_api_dynamicDecals.getRandomUid() end

--- Intensité de rugosité.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2335
---@return number  Intensité
function editor_api_dynamicDecals.getRoughnessIntensity() end

--- Rendu SDF actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2711
---@return boolean  État
function editor_api_dynamicDecals.getSdfEnabled() end

--- Couleur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2703
---@return ColorI  Couleur
function editor_api_dynamicDecals.getSdfOutlineColor() end

--- Douceur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2743
---@return number  Valeur
function editor_api_dynamicDecals.getSdfOutlineSoftness() end

--- Épaisseur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2735
---@return number  Valeur
function editor_api_dynamicDecals.getSdfOutlineThickness() end

--- Douceur SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2727
---@return number  Valeur
function editor_api_dynamicDecals.getSdfSoftness() end

--- Épaisseur SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2719
---@return number  Valeur
function editor_api_dynamicDecals.getSdfThickness() end

--- Masque de bits des réglages du projecteur (M.settingsFlags).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2026
---@return integer  Drapeaux
function editor_api_dynamicDecals.getSettings() end

--- Matériaux du shape (index -> nom).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2535
---@return table<integer, string>  Noms
function editor_api_dynamicDecals.getShapeMaterialNames() end

--- Meshes du shape et leur état d'activation.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2627
---@return table<string, boolean>  name -> activé
function editor_api_dynamicDecals.getShapeMeshes() end

--- Chemin du modèle 3D (shape) sur lequel on projette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2385
---@return string  Chemin
function editor_api_dynamicDecals.getShapePath() end

--- Normale de surface courante.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2559
---@return vec3  Normale
function editor_api_dynamicDecals.getSurfaceNormal() end

--- Échelle des calques de remplissage par texture.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2503
---@return Point2F  Échelle
function editor_api_dynamicDecals.getTextureFillLayerScale() end

--- Décalage du remplissage par texture.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2511
---@return Point2F  Décalage
function editor_api_dynamicDecals.getTextureFillOffset() end

--- Résolution des textures dynamiques.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2394
---@return Point2I  Résolution
function editor_api_dynamicDecals.getTextureResolution() end

--- TextureSet des textures dynamiques (nil avant setup).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2755
---@return userdata|nil  TextureSet
function editor_api_dynamicDecals.getTextureSet() end

--- Orienter le decal selon la normale de surface ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2563
---@return boolean  État
function editor_api_dynamicDecals.getUseSurfaceNormal() end

--- Canal UV utilisé.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2406
---@return integer  Index UV
function editor_api_dynamicDecals.getUvLayer() end

--- true si un calque chemin est en cours d'édition.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2586
---@return boolean  État
function editor_api_dynamicDecals.hasActivePathLayer() end

--- Surligne un calque (table).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1603
---@param layer_table table Calque
function editor_api_dynamicDecals.highlightLayer(layer_table) end

--- Surligne un calque par uid.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1612
---@param layerUid_string string uid
function editor_api_dynamicDecals.highlightLayerByUid(layerUid_string) end

--- Drapeau AlphaMaskInvert actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2034
---@return boolean  État
function editor_api_dynamicDecals.isAlphaMaskInvertEnabled() end

--- Drapeau UseGradientColor actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2030
---@return boolean  État
function editor_api_dynamicDecals.isDecalGradientColorEnabled() end

--- Drapeau UseMousePos actif (projection au curseur souris plutôt qu'au centre) ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2054
---@return boolean  État
function editor_api_dynamicDecals.isUseMousePos() end

--- Drapeau WrapAlphaMaskX actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2038
---@return boolean  État
function editor_api_dynamicDecals.isWrapAlphaMaskXEnabled() end

--- Drapeau WrapAlphaMaskY actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2042
---@return boolean  État
function editor_api_dynamicDecals.isWrapAlphaMaskYEnabled() end

--- Drapeau WrapColorTextureX actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2046
---@return boolean  État
function editor_api_dynamicDecals.isWrapColorTextureXEnabled() end

--- Drapeau WrapColorTextureY actif ?
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2050
---@return boolean  État
function editor_api_dynamicDecals.isWrapColorTextureYEnabled() end

--- Charge une pile depuis un JSON, en écrasant (Overwrite, défaut) ou ajoutant (Append), puis reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3017
---@param path_string string Fichier
---@param mode_number integer|nil M.loadingModes : 0 Overwrite, 1 Append
---@return table|nil  Résultat de reprojectLayers (nil dans le code actuel, la fonction ne renvoie rien)
function editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number) end

--- Déplace un calque vers une autre position/parent (annulable). Refuse de faire d'un calque son propre enfant. Émet dynamicDecals_moveLayer.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1899
---@param from_number integer Indice source
---@param fromParentUid_string string|nil Parent source
---@param to_number integer Indice destination
---@param toParentUid_string string|nil Parent destination
function editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string) end

--- Déplace un calque (decal, brushStroke, path ou group) à une nouvelle position locale au véhicule. Pour un groupe, referenceLayerUid est obligatoire.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2921
---@param layerUid string uid du calque
---@param newLocalPosition vec3 Nouvelle position
---@param includeChildren boolean|nil Déplacer aussi les enfants
---@param referenceLayerUid string|nil Calque de référence (groupes)
function editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid) end

--- Hook appelé avec les données sauvegardées : recrée la pile de calques et mémorise materialIdx pour setup().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3004
---@param data table Données de onSerialize
function editor_api_dynamicDecals.onDeserialized(data) end

--- Hook de sérialisation d'extension : renvoie {layerStackData, materialIdx} (nil sans projecteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2994
---@return table|nil  Données
function editor_api_dynamicDecals.onSerialize() end

--- Appelé à chaque frame par l'outil : met à jour l'app, projette le decal de prévisualisation si projectDynamicDecals, puis combine les textures dans le textureSet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3028
function editor_api_dynamicDecals.onUpdate_() end

--- Hook appelé au changement de véhicule : rafraîchit le shape et les matériaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3071
function editor_api_dynamicDecals.onVehicleSwitched() end

--- Refait la dernière action annulée.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3054
function editor_api_dynamicDecals.redo() end

--- Retire le dernier point du chemin en cours ; s'il n'en reste qu'un, supprime le calque.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2594
function editor_api_dynamicDecals.removeLastPathLayerPoint() end

--- Supprime un calque (annulable) et coupe la mise en évidence s'il était surligné.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1941
---@param index_number integer Indice
---@param parentUid_string string|nil Parent
function editor_api_dynamicDecals.removeLayer(index_number, parentUid_string) end

--- Retire un matériau des cibles.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2431
---@param materialIdx_int integer Index
function editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int) end

--- Affiche la texture SDF dans ImGui.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2767
---@param sizeX number Largeur
---@param sizeY number Hauteur
function editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY) end

--- Replace un decal déjà posé selon la caméra/projection courante en ne changeant que ses champs de transformation (camPosition, decalPos, decalScale, decalRotation, miroir…). Refuse si le curseur capturé n'est pas centré (0.5 ± 0.01) ou si le calque n'est pas un decal. Commit une action « Transform Decal ».
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1827
---@param layerUid_string string uid du decal
---@param originalLayer table Instantané du calque avant l'édition
---@return boolean  true si réussi
function editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer) end

--- Efface les textures cuites et recuit toute la pile ; affiche un échec si le cuisson renvoie nil.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1647
function editor_api_dynamicDecals.reprojectLayers() end

--- Applique une rotation delta à un calque et à ses enfants.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2938
---@param layer table Calque (uid utilisé)
---@param delta_vec3 vec3 Delta de rotation (déduit du code)
function editor_api_dynamicDecals.rotateLayer(layer, delta_vec3) end

--- Écrit la pile de calques dans un fichier JSON (sans materialIdx).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3011
---@param path_string string Fichier
function editor_api_dynamicDecals.saveLayerStackToFile(path_string) end

--- Met à l'échelle un calque et ses enfants de (1,1,1) + delta.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2960
---@param layer table Calque (uid utilisé)
---@param delta_vec3 vec3 Delta d'échelle
function editor_api_dynamicDecals.scaleLayer(layer, delta_vec3) end

--- Convertit un calque en table sérialisable JSON (types moteur convertis).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:230
---@param layer table Calque
---@return table  Données sérialisées
function editor_api_dynamicDecals.serializeLayer(layer) end

--- Définit le mode de fusion du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2467
---@param value_int integer Mode
function editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int) end

--- Définit le canal du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2459
---@param value_int integer Canal
function editor_api_dynamicDecals.setAlphaMaskChannel(value_int) end

--- Définit l'intensité du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2315
---@param value_float number Intensité
function editor_api_dynamicDecals.setAlphaMaskIntensity(value_float) end

--- Définit le décalage du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2307
---@param value_Point2F Point2F Décalage
function editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F) end

--- Définit la rotation du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2475
---@param value_radian_float number Radians
function editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float) end

--- Définit l'échelle du masque alpha.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2299
---@param value_Point2F Point2F Échelle
function editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F) end

--- Définit le mode de fusion courant.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2066
---@param blendMode_int integer Valeur de M.blendModes
function editor_api_dynamicDecals.setBlendMode(blendMode_int) end

--- Définit les pas d'interpolation du pinceau.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2523
---@param value_u32 integer Pas
function editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32) end

--- Définit l'index de palette du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2379
---@param value_int integer Index
function editor_api_dynamicDecals.setColorPaletteMapId(value_int) end

--- Définit l'échelle de la texture de couleur.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2291
---@param value_Point2F Point2F Échelle
function editor_api_dynamicDecals.setColorTextureScale(value_Point2F) end

--- Définit la position du curseur de projection.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2763
---@param value_Point2F Point2F Position
function editor_api_dynamicDecals.setCursorPosition(value_Point2F) end

--- Définit la couleur du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2194
---@param value_Point4F Point4F Couleur RGBA
function editor_api_dynamicDecals.setDecalColor(value_Point4F) end

--- Définit le caractère de police du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2675
---@param value_char string Caractère
function editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char) end

--- Définit la police du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2683
---@param value_string string Chemin
function editor_api_dynamicDecals.setDecalLayerFontPath(value_string) end

--- Définit la position d'un decal (nom du paramètre worldPos dans le code).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2655
---@param decal table Calque
---@param worldPos vec3 Position (déduit du code)
function editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos) end

--- Définit la rotation du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2210
---@param value_radian_number number Radians
function editor_api_dynamicDecals.setDecalRotation(value_radian_number) end

--- Définit l'échelle du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2202
---@param value_vec3 vec3 Échelle
function editor_api_dynamicDecals.setDecalScale(value_vec3) end

--- Définit le cisaillement du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2283
---@param value_Point2F Point2F Skew
function editor_api_dynamicDecals.setDecalSkew(value_Point2F) end

--- Définit la texture courante d'un type de decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2178
---@param type_string string Type de texture
---@param path_string string Chemin
function editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string) end

--- Définit le décalage UV du decal.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2275
---@param value_Point2F Point2F UV
function editor_api_dynamicDecals.setDecalUv(value_Point2F) end

--- Active/désactive le mode pinceau du projecteur (avec un nouvel uid aléatoire).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2571
---@param value_bool boolean État
function editor_api_dynamicDecals.setEnableBrushStroke(value_bool) end

--- Active/désactive le mode chemin ; à false, termine le chemin en cours.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2575
---@param value_bool boolean État
function editor_api_dynamicDecals.setEnablePathLayer(value_bool) end

--- Active/désactive le projecteur ; à false, vide les textures dynamiques et recombine le textureSet.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2242
---@param enabled boolean État
function editor_api_dynamicDecals.setEnabled(enabled) end

--- Définit la couleur des calques de remplissage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2443
---@param value_Point4F Point4F Couleur RGBA
function editor_api_dynamicDecals.setFillLayerColor(value_Point4F) end

--- Définit l'index de palette pour le remplissage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2451
---@param value_int integer Index
function editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int) end

--- Définit la texture de remplissage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2186
---@param path_string string Chemin
function editor_api_dynamicDecals.setFillTexturePath(path_string) end

--- Active l'inversion du decal côté miroir.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2699
---@param value_bool boolean État
function editor_api_dynamicDecals.setFlipMirroredDecal(value_bool) end

--- Définit l'atlas de texture de police.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2267
---@param path_string string Chemin
function editor_api_dynamicDecals.setFontTextureAtlasPath(path_string) end

--- Définit la couleur du dégradé, coin bas-gauche.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2363
---@param value_ColorI ColorI Couleur
function editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI) end

--- Définit la couleur du dégradé, coin bas-droit.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2371
---@param value_ColorI ColorI Couleur
function editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI) end

--- Définit la couleur du dégradé, coin haut-gauche.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2347
---@param value_ColorI ColorI Couleur
function editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI) end

--- Définit la couleur du dégradé, coin haut-droit.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2355
---@param value_ColorI ColorI Couleur
function editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI) end

--- Remplace un calque (par uid) par les données fournies, annulable, et émet dynamicDecals_setLayer(uid) ; dynamicDecals_onLayerUpdated(uid) est émis à l'application.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1754
---@param layerData_table table Nouvelles données (uid existant)
---@param doReproject_bool boolean|nil Recuire la pile après modification
function editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool) end

--- Définit le modèle de nom des nouveaux calques (défaut "$type Layer"). Balises : @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid ; un bloc {texte@balise texte} n'apparaît que si la balise n'est pas vide.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1005
---@param value_string string Modèle
function editor_api_dynamicDecals.setLayerNameBuildString(value_string) end

--- Affiche/masque un calque directement (sans historique) et reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1530
---@param layerUid_string string uid
---@param visibility_bool boolean true visible
function editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool) end

--- Verrouille/déverrouille la profondeur de projection.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2543
---@param value_bool boolean État
function editor_api_dynamicDecals.setLockDepth(value_bool) end

--- Verrouille/déverrouille la normale de surface.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2555
---@param value_bool boolean État
function editor_api_dynamicDecals.setLockSurfaceNormal(value_bool) end

--- Définit le matériau unique ciblé par la projection.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2423
---@param materialIdx_int integer Index de matériau
function editor_api_dynamicDecals.setMaterialIdx(materialIdx_int) end

--- Active/désactive un mesh par nom.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2643
---@param name_string string Nom du mesh
---@param value_bool boolean État
function editor_api_dynamicDecals.setMeshEnable(name_string, value_bool) end

--- Définit l'intensité métallique.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2331
---@param value_float number Intensité
function editor_api_dynamicDecals.setMetallicIntensity(value_float) end

--- Active le debug du miroir.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2499
---@param value_bool boolean État
function editor_api_dynamicDecals.setMirrorDebug(value_bool) end

--- Définit le décalage du plan de miroir.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2491
---@param value_float number Décalage
function editor_api_dynamicDecals.setMirrorOffset(value_float) end

--- Active/désactive le miroir.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2483
---@param value_bool boolean État
function editor_api_dynamicDecals.setMirrored(value_bool) end

--- Définit l'intensité de la normal map.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2323
---@param value_float number Intensité
function editor_api_dynamicDecals.setNormalIntensity(value_float) end

--- Définit si les decals du chemin s'orientent selon le chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2611
---@param value_bool boolean État
function editor_api_dynamicDecals.setOrientPathDecals(value_bool) end

--- Définit la police du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2691
---@param value_string string Chemin
function editor_api_dynamicDecals.setPathLayerFontPath(value_string) end

--- Définit les pas d'interpolation du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2531
---@param value_u32 integer Pas
function editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32) end

--- Définit le texte posé le long du chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2667
---@param value_string string Texte
function editor_api_dynamicDecals.setPathLayerText(value_string) end

--- Définit le type de chemin.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2619
---@param value_int integer 0 Linear, 1 Bezier
function editor_api_dynamicDecals.setPathType(value_int) end

--- Active/désactive la projection de prévisualisation (M.projectDynamicDecals).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1013
---@param value boolean État
function editor_api_dynamicDecals.setProjectDynamicDecalsState(value) end

--- Définit l'intensité de rugosité.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2339
---@param value_float number Intensité
function editor_api_dynamicDecals.setRoughnessIntensity(value_float) end

--- Active/désactive le rendu SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2715
---@param value_bool boolean État
function editor_api_dynamicDecals.setSdfEnabled(value_bool) end

--- Définit la couleur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2707
---@param value_ColorI ColorI Couleur
function editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI) end

--- Définit la douceur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2747
---@param value_f32 number Valeur
function editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32) end

--- Définit l'épaisseur du contour SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2739
---@param value_f32 number Valeur
function editor_api_dynamicDecals.setSdfOutlineThickness(value_f32) end

--- Définit la douceur SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2731
---@param value_f32 number Valeur
function editor_api_dynamicDecals.setSdfSoftness(value_f32) end

--- Définit l'épaisseur SDF.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2723
---@param value_f32 number Valeur
function editor_api_dynamicDecals.setSdfThickness(value_f32) end

--- Change le modèle de projection puis reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2389
---@param path string Chemin du shape
function editor_api_dynamicDecals.setShapePath(path) end

--- Définit l'échelle du remplissage par texture.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2507
---@param value_Point2F Point2F Échelle
function editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F) end

--- Définit le décalage du remplissage par texture.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2515
---@param value_Point2F Point2F Décalage
function editor_api_dynamicDecals.setTextureFillOffset(value_Point2F) end

--- Change la résolution ; si le moteur l'accepte, reprojette et réassigne le textureSet @DynamicTexture.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2398
---@param resolution_point2i Point2I Résolution
function editor_api_dynamicDecals.setTextureResolution(resolution_point2i) end

--- Active l'orientation selon la normale de surface.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2567
---@param value_bool boolean État
function editor_api_dynamicDecals.setUseSurfaceNormal(value_bool) end

--- Change le canal UV puis reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2410
---@param uvLayerId_int integer Index UV
function editor_api_dynamicDecals.setUvLayer(uvLayerId_int) end

--- Initialise le projecteur : utilise l'app DecalShapeRenderApp active si elle existe, sinon crée un DecalProjection (4096x2048) lié au véhicule joueur ; récupère le textureSet, met à jour les matériaux du véhicule et ajoute un calque fill de base si la pile est vide. Sans effet si déjà fait.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1452
function editor_api_dynamicDecals.setup() end

--- Inverse l'état du projecteur (mêmes effets que setEnabled).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2255
function editor_api_dynamicDecals.toggleEnabled() end

--- Inverse la visibilité d'un calque (annulable) et reprojette.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1549
---@param layerUid_string string uid
---@return boolean  Nouvelle valeur de enabled
function editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string) end

--- Inverse un drapeau de réglage.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:2058
---@param value_int integer Valeur de M.settingsFlags.X.value
---@return any  Résultat du moteur
function editor_api_dynamicDecals.toggleSetting(value_int) end

--- Annule la dernière action de l'historique des decals.
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:3050
function editor_api_dynamicDecals.undo() end

--- Lance un job qui choisit le(s) matériau(x) de décalque par défaut selon le véhicule joueur (matériaux de ses parts, sinon matériau portant le nom jbeam, sinon se terminant par main puis body).
---Source : lua/ge/extensions/editor/api/dynamicDecals.lua:1447
function editor_api_dynamicDecals.updateVehicleMaterials() end


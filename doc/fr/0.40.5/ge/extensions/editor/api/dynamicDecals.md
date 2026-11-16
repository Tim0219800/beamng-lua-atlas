# `editor_api_dynamicDecals`

*Fichier : `lua/ge/extensions/editor/api/dynamicDecals.lua` · VM : Game Engine (GE) · 3082 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dynamicDecals` : `extensions.load("editor_api_dynamicDecals")`, puis la globale `editor_api_dynamicDecals`

API du système de decals dynamiques (peinture de livrée sur le véhicule joueur) utilisé par l'outil Dynamic Decals de l'éditeur. Il gère une pile de calques (layerStack : decal, fill, textureFill, group, brushStroke, path, linkedSet) avec historique undo/redo, projette/cuit ces calques dans les textures dynamiques du véhicule via le binding C++ DecalProjection, expose les réglages courants de projection (couleur, échelle, rotation, masque alpha, miroir, SDF, chemin, pinceau) sous forme de get/set, sérialise la pile en JSON et exporte textures et skins (jbeam + matériaux) dans /mods/unpacked. setup() doit être appelé avant tout le reste.

## Exemple

```lua
local dd = extensions.editor_api_dynamicDecals
dd.setup()
dd.setDecalScale(vec3(0.5, 1, 0.5))
local layer = dd.addDecal({name = "Logo"})
dd.setLayerVisibility(layer.uid, false)
dd.undo()
```

## Remarques

- Toutes les fonctions get/set de réglages lisent ou écrivent un champ du decalProjection C++ (ou appellent sa méthode du même nom) ; elles plantent si setup() n'a pas été appelé (decalProjection = nil).
- Les ajouts/suppressions/déplacements/modifications de calques passent par history:commitAction : ils sont annulables avec undo()/redo().
- setLayerVisibility modifie le calque directement (sans historique), contrairement à toggleLayerVisibility.
- Un calque est une table avec au minimum uid (chaîne "XXXX-XXXX" hexadécimale aléatoire), name, type (M.layerTypes), enabled, locked, children.
- Dans createLayerName, le bloc final « uid » référence une variable inexistante `layer` (au lieu de layerData) : il est mort car startIndex vaut nil à ce stade, donc la balise {@uid} n'est remplacée que par le gsub final sur layerData.uid.
- addLinkedSet_Undo/addBrushStrokeLayer_Undo suppriment le dernier calque de la pile racine (#layerStack) et ignorent parentUid.
- Les commentaires de M.toggleEnabled/onVehicleSwitched dans la page auto proviennent de blocs de code commentés (onEditorDeactivated, onExtensionLoaded) : ces hooks ne sont pas actifs.
- Le fichier de skin exporté (exportSkin) est écrit dans /mods/unpacked/<skin>/vehicles/<véhicule>/<skin>/, puis core_modmanager.checkUpdate() est appelé.
- Types de calque : decal=0, fill=1, textureFill=2, group=3, brushStroke=4, path=5, linkedSet=6.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dynamicDecals.addBrushStrokeLayer(params)` | Ajoute un calque de coup de pinceau à partir de getBrushStrokeLayerData(), annulable. | 1342 |
| `editor_api_dynamicDecals.addDecal(params)` | Crée un calque decal à partir de la projection courante (caméra + réglages), le cuit et l'ajoute à la pile (annulable). Si tous les meshes ne sont pas activés, limite le decal aux meshes activés du véhicule. | 1098 |
| `editor_api_dynamicDecals.addFillLayer(params)` | Ajoute un calque de remplissage de couleur (couleur et palette de fillLayer courantes), annulable. | 1187 |
| `editor_api_dynamicDecals.addGroup(params)` | Ajoute un calque groupe (peut contenir des enfants), annulable. | 1270 |
| `editor_api_dynamicDecals.addLinkedSet(params)` | Ajoute un calque « linked set » (type 6, avec table properties), annulable. L'annulation supprime le dernier calque racine. | 1305 |
| `editor_api_dynamicDecals.addMaskDecal(layerUid_string)` | Ajoute un decal dans le masque (layer.mask.layers) du calque donné, à partir de la projection courante (annulable). | 1053 |
| `editor_api_dynamicDecals.addMaterialIdx(materialIdx_int)` | Ajoute un matériau aux cibles. | 2427 |
| `editor_api_dynamicDecals.addPathDataPoint()` | Ajoute un point au calque chemin en cours (le crée au premier appel avec les réglages de chemin courants : orientDecals, pathType, interpolationSteps, text, fontPath), puis reprojette. | 1142 |
| `editor_api_dynamicDecals.addTextureFillLayer(params)` | Ajoute un calque de remplissage par texture (fillTexturePath, scale, offset courants), annulable. | 1229 |
| `editor_api_dynamicDecals.areAllMeshesEnabled()` | true si tous les meshes sont activés. | 2639 |
| `editor_api_dynamicDecals.bakeBrush()` | Cuit le coup de pinceau courant. | 2751 |
| `editor_api_dynamicDecals.bakeLayers(layers)` | Cuit une liste de calques dans les textures du véhicule joueur (decalProjection:bakeLayers). Renvoie nil avec un message s'il n'y a pas de véhicule. | 1584 |
| `editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number)` | Tourne le decal courant d'un pas (15 degrés par défaut, en radians). | 1579 |
| `editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number)` | Agrandit/réduit le decal courant (x et z de decalScale) d'un pas (0.025 par défaut). | 1573 |
| `editor_api_dynamicDecals.clearLayerStack()` | Vide la pile de calques et les textures cuites (annulable). | 1638 |
| `editor_api_dynamicDecals.clearMaterialIdx()` | Vide la liste des matériaux ciblés. | 2415 |
| `editor_api_dynamicDecals.deserializeLayer(layer)` | Reconstruit un calque à partir de données sérialisées. | 483 |
| `editor_api_dynamicDecals.disableAllMeshes()` | Désactive tous les meshes. | 2635 |
| `editor_api_dynamicDecals.disableDecalHighlighting()` | Supprime la mise en évidence. | 1524 |
| `editor_api_dynamicDecals.drawBakedTextures(maxImageWidth)` | Affiche les textures cuites dans ImGui. | 2218 |
| `editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth)` | Affiche les textures d'entrée du pinceau dans ImGui. | 2226 |
| `editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth)` | Affiche les textures dynamiques dans ImGui. | 2214 |
| `editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth)` | Affiche les textures de surbrillance dans ImGui. | 2222 |
| `editor_api_dynamicDecals.drawMaskTextures(maxImageWidth)` | Affiche les textures de masque dans ImGui. | 2230 |
| `editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth)` | Affiche un textureSet donné dans ImGui. | 2234 |
| `editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren)` | Duplique un calque en le miroitant (nom + " Mirrored Copy") juste après l'original (annulable). | 2008 |
| `editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string)` | Duplique un calque (nouveaux uids, nom + " Copy") juste après l'original (annulable). | 1980 |
| `editor_api_dynamicDecals.enableAllMeshes()` | Active tous les meshes pour la projection. | 2631 |
| `editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension)` | Exporte le masque d'un calque dans un fichier. | 2074 |
| `editor_api_dynamicDecals.exportSkin(vehicleName, skinName)` | Exporte un skin utilisable comme mod : textures png (_d, _m, _r, _cp), matériaux <mat>.skin.<skinName> copiés des presets <mat>.skin.dynamicTextures et fichier jbeam du skin (slotType paint_design) dans /mods/unpacked/<skinName>/..., puis rafraîchit le gestionnaire de mods. | 2078 |
| `editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension)` | Exporte les textures cuites dans un dossier. | 2070 |
| `editor_api_dynamicDecals.finishPathLayer()` | Termine le chemin en cours (les prochains points créeront un nouveau chemin). | 2590 |
| `editor_api_dynamicDecals.getAlphaMaskBlendMode()` | Mode de fusion du masque alpha (0 ou 1 d'après les bornes de propriété). | 2463 |
| `editor_api_dynamicDecals.getAlphaMaskChannel()` | Canal du masque alpha (0 à 3 d'après les bornes de propriété). | 2455 |
| `editor_api_dynamicDecals.getAlphaMaskIntensity()` | Intensité du masque alpha. | 2311 |
| `editor_api_dynamicDecals.getAlphaMaskOffset()` | Décalage du masque alpha. | 2303 |
| `editor_api_dynamicDecals.getAlphaMaskRotation()` | Rotation du masque alpha (radians). | 2471 |
| `editor_api_dynamicDecals.getAlphaMaskScale()` | Échelle du masque alpha. | 2295 |
| `editor_api_dynamicDecals.getBlendMode()` | Mode de fusion courant (M.blendModes). | 2062 |
| `editor_api_dynamicDecals.getBrushStrokeInterpolationSteps()` | Pas d'interpolation du pinceau. | 2519 |
| `editor_api_dynamicDecals.getBrushStrokeLayerData()` | Données du calque pinceau courant (côté C++). | 2623 |
| `editor_api_dynamicDecals.getColorPaletteMapId()` | Index de palette de couleurs du véhicule utilisé par le decal. | 2375 |
| `editor_api_dynamicDecals.getColorTextureScale()` | Échelle de la texture de couleur. | 2287 |
| `editor_api_dynamicDecals.getCursorPosition()` | Position du curseur de projection (écran, UV). | 2759 |
| `editor_api_dynamicDecals.getDecalColor()` | Couleur courante du decal (RGBA). | 2190 |
| `editor_api_dynamicDecals.getDecalLayerFontCharacter()` | Caractère de police utilisé par le decal. | 2671 |
| `editor_api_dynamicDecals.getDecalLayerFontPath()` | Chemin de la police du decal. | 2679 |
| `editor_api_dynamicDecals.getDecalLocalPos(decal)` | Position locale (véhicule) d'un calque decal. | 2651 |
| `editor_api_dynamicDecals.getDecalRotation()` | Rotation courante du decal (radians). | 2206 |
| `editor_api_dynamicDecals.getDecalScale()` | Échelle courante du decal. | 2198 |
| `editor_api_dynamicDecals.getDecalSkew()` | Cisaillement du decal. | 2279 |
| `editor_api_dynamicDecals.getDecalTexturePath(type_string)` | Chemin de la texture courante d'un type de decal. | 2174 |
| `editor_api_dynamicDecals.getDecalUv()` | Décalage UV du decal. | 2271 |
| `editor_api_dynamicDecals.getDecalWorldPos(decal)` | Position monde d'un calque decal. | 2647 |
| `editor_api_dynamicDecals.getDecalWorldTransform(decal)` | Matrice de transformation monde d'un calque. | 2659 |
| `editor_api_dynamicDecals.getDepth()` | Profondeur de projection. | 2547 |
| `editor_api_dynamicDecals.getEnablePathLayer()` | Indique si le mode chemin est actif. | 2582 |
| `editor_api_dynamicDecals.getEnabled()` | Projection dynamique activée ? | 2238 |
| `editor_api_dynamicDecals.getFillLayerColor()` | Couleur des calques de remplissage. | 2439 |
| `editor_api_dynamicDecals.getFillLayerColorPaletteMapId()` | Index de palette pour le remplissage. | 2447 |
| `editor_api_dynamicDecals.getFillTexturePath()` | Texture de remplissage courante. | 2182 |
| `editor_api_dynamicDecals.getFlipMirroredDecal()` | Inverser le decal côté miroir ? | 2695 |
| `editor_api_dynamicDecals.getFontTextureAtlasPath()` | Chemin de l'atlas de texture de police. | 2263 |
| `editor_api_dynamicDecals.getGradientColorBottomLeft()` | Couleur du dégradé, coin bas-gauche. | 2359 |
| `editor_api_dynamicDecals.getGradientColorBottomRight()` | Couleur du dégradé, coin bas-droit. | 2367 |
| `editor_api_dynamicDecals.getGradientColorTopLeft()` | Couleur du dégradé, coin haut-gauche. | 2343 |
| `editor_api_dynamicDecals.getGradientColorTopRight()` | Couleur du dégradé, coin haut-droit. | 2351 |
| `editor_api_dynamicDecals.getHighlightedLayer()` | Calque actuellement surligné, ou nil. | 1598 |
| `editor_api_dynamicDecals.getHistory()` | Historique undo/redo propre à ce module. | 3046 |
| `editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string)` | Renvoie le calque d'indice donné (à partir de 1) dans la pile racine ou dans les enfants du parent. | 1708 |
| `editor_api_dynamicDecals.getLayerByUid(layerUid_string)` | Cherche un calque (récursivement) par uid ; logge un message et renvoie nil s'il est introuvable. | 1699 |
| `editor_api_dynamicDecals.getLayerCount()` | Nombre total de calques (enfants compris). | 1567 |
| `editor_api_dynamicDecals.getLayerNameBuildString()` | Renvoie le modèle de nom de calque. | 1009 |
| `editor_api_dynamicDecals.getLayerStack()` | Renvoie la pile de calques racine (table partagée, pas une copie). | 1563 |
| `editor_api_dynamicDecals.getLockDepth()` | Profondeur verrouillée ? | 2539 |
| `editor_api_dynamicDecals.getLockSurfaceNormal()` | Normale de surface verrouillée ? | 2551 |
| `editor_api_dynamicDecals.getMaterialIndices()` | Liste des index de matériaux ciblés. | 2419 |
| `editor_api_dynamicDecals.getMeshObjectCount()` | Nombre de meshes du shape. | 2435 |
| `editor_api_dynamicDecals.getMetallicIntensity()` | Intensité métallique. | 2327 |
| `editor_api_dynamicDecals.getMirrorDebug()` | Affichage de debug du miroir actif ? | 2495 |
| `editor_api_dynamicDecals.getMirrorOffset()` | Décalage du plan de miroir. | 2487 |
| `editor_api_dynamicDecals.getMirrored()` | Mode miroir actif ? | 2479 |
| `editor_api_dynamicDecals.getNormalIntensity()` | Intensité de la normal map. | 2319 |
| `editor_api_dynamicDecals.getOrientPathDecals()` | Si les decals suivent la direction du chemin. | 2607 |
| `editor_api_dynamicDecals.getPathLayerFontPath()` | Chemin de la police du chemin. | 2687 |
| `editor_api_dynamicDecals.getPathLayerInterpolationSteps()` | Pas d'interpolation du chemin. | 2527 |
| `editor_api_dynamicDecals.getPathLayerText()` | Texte posé le long du chemin. | 2663 |
| `editor_api_dynamicDecals.getPathType()` | Type de chemin (M.pathTypes). | 2615 |
| `editor_api_dynamicDecals.getRandomUid()` | Génère un uid pseudo-unique "XXXX-XXXX" (hexadécimal). | 48 |
| `editor_api_dynamicDecals.getRoughnessIntensity()` | Intensité de rugosité. | 2335 |
| `editor_api_dynamicDecals.getSdfEnabled()` | Rendu SDF actif ? | 2711 |
| `editor_api_dynamicDecals.getSdfOutlineColor()` | Couleur du contour SDF. | 2703 |
| `editor_api_dynamicDecals.getSdfOutlineSoftness()` | Douceur du contour SDF. | 2743 |
| `editor_api_dynamicDecals.getSdfOutlineThickness()` | Épaisseur du contour SDF. | 2735 |
| `editor_api_dynamicDecals.getSdfSoftness()` | Douceur SDF. | 2727 |
| `editor_api_dynamicDecals.getSdfThickness()` | Épaisseur SDF. | 2719 |
| `editor_api_dynamicDecals.getSettings()` | Masque de bits des réglages du projecteur (M.settingsFlags). | 2026 |
| `editor_api_dynamicDecals.getShapeMaterialNames()` | Matériaux du shape (index -> nom). | 2535 |
| `editor_api_dynamicDecals.getShapeMeshes()` | Meshes du shape et leur état d'activation. | 2627 |
| `editor_api_dynamicDecals.getShapePath()` | Chemin du modèle 3D (shape) sur lequel on projette. | 2385 |
| `editor_api_dynamicDecals.getSurfaceNormal()` | Normale de surface courante. | 2559 |
| `editor_api_dynamicDecals.getTextureFillLayerScale()` | Échelle des calques de remplissage par texture. | 2503 |
| `editor_api_dynamicDecals.getTextureFillOffset()` | Décalage du remplissage par texture. | 2511 |
| `editor_api_dynamicDecals.getTextureResolution()` | Résolution des textures dynamiques. | 2394 |
| `editor_api_dynamicDecals.getTextureSet()` | TextureSet des textures dynamiques (nil avant setup). | 2755 |
| `editor_api_dynamicDecals.getUseSurfaceNormal()` | Orienter le decal selon la normale de surface ? | 2563 |
| `editor_api_dynamicDecals.getUvLayer()` | Canal UV utilisé. | 2406 |
| `editor_api_dynamicDecals.hasActivePathLayer()` | true si un calque chemin est en cours d'édition. | 2586 |
| `editor_api_dynamicDecals.highlightLayer(layer_table)` | Surligne un calque (table). | 1603 |
| `editor_api_dynamicDecals.highlightLayerByUid(layerUid_string)` | Surligne un calque par uid. | 1612 |
| `editor_api_dynamicDecals.isAlphaMaskInvertEnabled()` | Drapeau AlphaMaskInvert actif ? | 2034 |
| `editor_api_dynamicDecals.isDecalGradientColorEnabled()` | Drapeau UseGradientColor actif ? | 2030 |
| `editor_api_dynamicDecals.isUseMousePos()` | Drapeau UseMousePos actif (projection au curseur souris plutôt qu'au centre) ? | 2054 |
| `editor_api_dynamicDecals.isWrapAlphaMaskXEnabled()` | Drapeau WrapAlphaMaskX actif ? | 2038 |
| `editor_api_dynamicDecals.isWrapAlphaMaskYEnabled()` | Drapeau WrapAlphaMaskY actif ? | 2042 |
| `editor_api_dynamicDecals.isWrapColorTextureXEnabled()` | Drapeau WrapColorTextureX actif ? | 2046 |
| `editor_api_dynamicDecals.isWrapColorTextureYEnabled()` | Drapeau WrapColorTextureY actif ? | 2050 |
| `editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number)` | Charge une pile depuis un JSON, en écrasant (Overwrite, défaut) ou ajoutant (Append), puis reprojette. | 3017 |
| `editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string)` | Déplace un calque vers une autre position/parent (annulable). Refuse de faire d'un calque son propre enfant. Émet dynamicDecals_moveLayer. | 1899 |
| `editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid)` | Déplace un calque (decal, brushStroke, path ou group) à une nouvelle position locale au véhicule. Pour un groupe, referenceLayerUid est obligatoire. | 2921 |
| `editor_api_dynamicDecals.onDeserialized(data)` | Hook appelé avec les données sauvegardées : recrée la pile de calques et mémorise materialIdx pour setup(). *(interne)* *(hook)* | 3004 |
| `editor_api_dynamicDecals.onSerialize()` | Hook de sérialisation d'extension : renvoie {layerStackData, materialIdx} (nil sans projecteur). *(interne)* *(hook)* | 2994 |
| `editor_api_dynamicDecals.onUpdate_()` | Appelé à chaque frame par l'outil : met à jour l'app, projette le decal de prévisualisation si projectDynamicDecals, puis combine les textures dans le textureSet. *(interne)* *(hook)* | 3028 |
| `editor_api_dynamicDecals.onVehicleSwitched()` | Hook appelé au changement de véhicule : rafraîchit le shape et les matériaux. *(interne)* *(hook)* | 3071 |
| `editor_api_dynamicDecals.redo()` | Refait la dernière action annulée. | 3054 |
| `editor_api_dynamicDecals.removeLastPathLayerPoint()` | Retire le dernier point du chemin en cours ; s'il n'en reste qu'un, supprime le calque. | 2594 |
| `editor_api_dynamicDecals.removeLayer(index_number, parentUid_string)` | Supprime un calque (annulable) et coupe la mise en évidence s'il était surligné. | 1941 |
| `editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int)` | Retire un matériau des cibles. | 2431 |
| `editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY)` | Affiche la texture SDF dans ImGui. | 2767 |
| `editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer)` | Replace un decal déjà posé selon la caméra/projection courante en ne changeant que ses champs de transformation (camPosition, decalPos, decalScale, decalRotation, miroir…). Refuse si le curseur capturé n'est pas centré (0.5 ± 0.01) ou si le calque n'est pas un decal. Commit une action « Transform Decal ». | 1827 |
| `editor_api_dynamicDecals.reprojectLayers()` | Efface les textures cuites et recuit toute la pile ; affiche un échec si le cuisson renvoie nil. | 1647 |
| `editor_api_dynamicDecals.rotateLayer(layer, delta_vec3)` | Applique une rotation delta à un calque et à ses enfants. | 2938 |
| `editor_api_dynamicDecals.saveLayerStackToFile(path_string)` | Écrit la pile de calques dans un fichier JSON (sans materialIdx). | 3011 |
| `editor_api_dynamicDecals.scaleLayer(layer, delta_vec3)` | Met à l'échelle un calque et ses enfants de (1,1,1) + delta. | 2960 |
| `editor_api_dynamicDecals.serializeLayer(layer)` | Convertit un calque en table sérialisable JSON (types moteur convertis). | 230 |
| `editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int)` | Définit le mode de fusion du masque alpha. | 2467 |
| `editor_api_dynamicDecals.setAlphaMaskChannel(value_int)` | Définit le canal du masque alpha. | 2459 |
| `editor_api_dynamicDecals.setAlphaMaskIntensity(value_float)` | Définit l'intensité du masque alpha. | 2315 |
| `editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F)` | Définit le décalage du masque alpha. | 2307 |
| `editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float)` | Définit la rotation du masque alpha. | 2475 |
| `editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F)` | Définit l'échelle du masque alpha. | 2299 |
| `editor_api_dynamicDecals.setBlendMode(blendMode_int)` | Définit le mode de fusion courant. | 2066 |
| `editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32)` | Définit les pas d'interpolation du pinceau. | 2523 |
| `editor_api_dynamicDecals.setColorPaletteMapId(value_int)` | Définit l'index de palette du decal. | 2379 |
| `editor_api_dynamicDecals.setColorTextureScale(value_Point2F)` | Définit l'échelle de la texture de couleur. | 2291 |
| `editor_api_dynamicDecals.setCursorPosition(value_Point2F)` | Définit la position du curseur de projection. | 2763 |
| `editor_api_dynamicDecals.setDecalColor(value_Point4F)` | Définit la couleur du decal. | 2194 |
| `editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char)` | Définit le caractère de police du decal. | 2675 |
| `editor_api_dynamicDecals.setDecalLayerFontPath(value_string)` | Définit la police du decal. | 2683 |
| `editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos)` | Définit la position d'un decal (nom du paramètre worldPos dans le code). | 2655 |
| `editor_api_dynamicDecals.setDecalRotation(value_radian_number)` | Définit la rotation du decal. | 2210 |
| `editor_api_dynamicDecals.setDecalScale(value_vec3)` | Définit l'échelle du decal. | 2202 |
| `editor_api_dynamicDecals.setDecalSkew(value_Point2F)` | Définit le cisaillement du decal. | 2283 |
| `editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string)` | Définit la texture courante d'un type de decal. | 2178 |
| `editor_api_dynamicDecals.setDecalUv(value_Point2F)` | Définit le décalage UV du decal. | 2275 |
| `editor_api_dynamicDecals.setEnableBrushStroke(value_bool)` | Active/désactive le mode pinceau du projecteur (avec un nouvel uid aléatoire). | 2571 |
| `editor_api_dynamicDecals.setEnablePathLayer(value_bool)` | Active/désactive le mode chemin ; à false, termine le chemin en cours. | 2575 |
| `editor_api_dynamicDecals.setEnabled(enabled)` | Active/désactive le projecteur ; à false, vide les textures dynamiques et recombine le textureSet. | 2242 |
| `editor_api_dynamicDecals.setFillLayerColor(value_Point4F)` | Définit la couleur des calques de remplissage. | 2443 |
| `editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int)` | Définit l'index de palette pour le remplissage. | 2451 |
| `editor_api_dynamicDecals.setFillTexturePath(path_string)` | Définit la texture de remplissage. | 2186 |
| `editor_api_dynamicDecals.setFlipMirroredDecal(value_bool)` | Active l'inversion du decal côté miroir. | 2699 |
| `editor_api_dynamicDecals.setFontTextureAtlasPath(path_string)` | Définit l'atlas de texture de police. | 2267 |
| `editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI)` | Définit la couleur du dégradé, coin bas-gauche. | 2363 |
| `editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI)` | Définit la couleur du dégradé, coin bas-droit. | 2371 |
| `editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI)` | Définit la couleur du dégradé, coin haut-gauche. | 2347 |
| `editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI)` | Définit la couleur du dégradé, coin haut-droit. | 2355 |
| `editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool)` | Remplace un calque (par uid) par les données fournies, annulable, et émet dynamicDecals_setLayer(uid) ; dynamicDecals_onLayerUpdated(uid) est émis à l'application. | 1754 |
| `editor_api_dynamicDecals.setLayerNameBuildString(value_string)` | Définit le modèle de nom des nouveaux calques (défaut "$type Layer"). Balises : @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid ; un bloc {texte@balise texte} n'apparaît que si la balise n'est pas vide. | 1005 |
| `editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool)` | Affiche/masque un calque directement (sans historique) et reprojette. | 1530 |
| `editor_api_dynamicDecals.setLockDepth(value_bool)` | Verrouille/déverrouille la profondeur de projection. | 2543 |
| `editor_api_dynamicDecals.setLockSurfaceNormal(value_bool)` | Verrouille/déverrouille la normale de surface. | 2555 |
| `editor_api_dynamicDecals.setMaterialIdx(materialIdx_int)` | Définit le matériau unique ciblé par la projection. | 2423 |
| `editor_api_dynamicDecals.setMeshEnable(name_string, value_bool)` | Active/désactive un mesh par nom. | 2643 |
| `editor_api_dynamicDecals.setMetallicIntensity(value_float)` | Définit l'intensité métallique. | 2331 |
| `editor_api_dynamicDecals.setMirrorDebug(value_bool)` | Active le debug du miroir. | 2499 |
| `editor_api_dynamicDecals.setMirrorOffset(value_float)` | Définit le décalage du plan de miroir. | 2491 |
| `editor_api_dynamicDecals.setMirrored(value_bool)` | Active/désactive le miroir. | 2483 |
| `editor_api_dynamicDecals.setNormalIntensity(value_float)` | Définit l'intensité de la normal map. | 2323 |
| `editor_api_dynamicDecals.setOrientPathDecals(value_bool)` | Définit si les decals du chemin s'orientent selon le chemin. | 2611 |
| `editor_api_dynamicDecals.setPathLayerFontPath(value_string)` | Définit la police du chemin. | 2691 |
| `editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32)` | Définit les pas d'interpolation du chemin. | 2531 |
| `editor_api_dynamicDecals.setPathLayerText(value_string)` | Définit le texte posé le long du chemin. | 2667 |
| `editor_api_dynamicDecals.setPathType(value_int)` | Définit le type de chemin. | 2619 |
| `editor_api_dynamicDecals.setProjectDynamicDecalsState(value)` | Active/désactive la projection de prévisualisation (M.projectDynamicDecals). | 1013 |
| `editor_api_dynamicDecals.setRoughnessIntensity(value_float)` | Définit l'intensité de rugosité. | 2339 |
| `editor_api_dynamicDecals.setSdfEnabled(value_bool)` | Active/désactive le rendu SDF. | 2715 |
| `editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI)` | Définit la couleur du contour SDF. | 2707 |
| `editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32)` | Définit la douceur du contour SDF. | 2747 |
| `editor_api_dynamicDecals.setSdfOutlineThickness(value_f32)` | Définit l'épaisseur du contour SDF. | 2739 |
| `editor_api_dynamicDecals.setSdfSoftness(value_f32)` | Définit la douceur SDF. | 2731 |
| `editor_api_dynamicDecals.setSdfThickness(value_f32)` | Définit l'épaisseur SDF. | 2723 |
| `editor_api_dynamicDecals.setShapePath(path)` | Change le modèle de projection puis reprojette. | 2389 |
| `editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F)` | Définit l'échelle du remplissage par texture. | 2507 |
| `editor_api_dynamicDecals.setTextureFillOffset(value_Point2F)` | Définit le décalage du remplissage par texture. | 2515 |
| `editor_api_dynamicDecals.setTextureResolution(resolution_point2i)` | Change la résolution ; si le moteur l'accepte, reprojette et réassigne le textureSet @DynamicTexture. | 2398 |
| `editor_api_dynamicDecals.setUseSurfaceNormal(value_bool)` | Active l'orientation selon la normale de surface. | 2567 |
| `editor_api_dynamicDecals.setUvLayer(uvLayerId_int)` | Change le canal UV puis reprojette. | 2410 |
| `editor_api_dynamicDecals.setup()` | Initialise le projecteur : utilise l'app DecalShapeRenderApp active si elle existe, sinon crée un DecalProjection (4096x2048) lié au véhicule joueur ; récupère le textureSet, met à jour les matériaux du véhicule et ajoute un calque fill de base si la pile est vide. Sans effet si déjà fait. | 1452 |
| `editor_api_dynamicDecals.toggleEnabled()` | Inverse l'état du projecteur (mêmes effets que setEnabled). | 2255 |
| `editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string)` | Inverse la visibilité d'un calque (annulable) et reprojette. | 1549 |
| `editor_api_dynamicDecals.toggleSetting(value_int)` | Inverse un drapeau de réglage. | 2058 |
| `editor_api_dynamicDecals.undo()` | Annule la dernière action de l'historique des decals. | 3050 |
| `editor_api_dynamicDecals.updateVehicleMaterials()` | Lance un job qui choisit le(s) matériau(x) de décalque par défaut selon le véhicule joueur (matériaux de ses parts, sinon matériau portant le nom jbeam, sinon se terminant par main puis body). | 1447 |

### Détail des paramètres

#### `editor_api_dynamicDecals.addBrushStrokeLayer(params)`

Ajoute un calque de coup de pinceau à partir de getBrushStrokeLayerData(), annulable.

- `params` (*table|nil*) : name (déduit du code)
- **renvoie** : table Calque créé (déduit du code)

#### `editor_api_dynamicDecals.addDecal(params)`

Crée un calque decal à partir de la projection courante (caméra + réglages), le cuit et l'ajoute à la pile (annulable). Si tous les meshes ne sont pas activés, limite le decal aux meshes activés du véhicule.

- `params` (*table|nil*) : name (défaut généré), parentUid (calque groupe parent)
- **renvoie** : table Données du calque créé

#### `editor_api_dynamicDecals.addFillLayer(params)`

Ajoute un calque de remplissage de couleur (couleur et palette de fillLayer courantes), annulable.

- `params` (*table|nil*) : name, parentUid
- **renvoie** : table Calque créé

#### `editor_api_dynamicDecals.addGroup(params)`

Ajoute un calque groupe (peut contenir des enfants), annulable.

- `params` (*table|nil*) : name, parentUid
- **renvoie** : table Calque créé

#### `editor_api_dynamicDecals.addLinkedSet(params)`

Ajoute un calque « linked set » (type 6, avec table properties), annulable. L'annulation supprime le dernier calque racine.

- `params` (*table|nil*) : name, parentUid
- **renvoie** : table Calque créé

#### `editor_api_dynamicDecals.addMaskDecal(layerUid_string)`

Ajoute un decal dans le masque (layer.mask.layers) du calque donné, à partir de la projection courante (annulable).

- `layerUid_string` (*string*) : uid du calque à masquer

#### `editor_api_dynamicDecals.addMaterialIdx(materialIdx_int)`

Ajoute un matériau aux cibles.

- `materialIdx_int` (*integer*) : Index

#### `editor_api_dynamicDecals.addPathDataPoint()`

Ajoute un point au calque chemin en cours (le crée au premier appel avec les réglages de chemin courants : orientDecals, pathType, interpolationSteps, text, fontPath), puis reprojette.

- **renvoie** : table Données du point/calque

#### `editor_api_dynamicDecals.addTextureFillLayer(params)`

Ajoute un calque de remplissage par texture (fillTexturePath, scale, offset courants), annulable.

- `params` (*table|nil*) : name, parentUid
- **renvoie** : table Calque créé

#### `editor_api_dynamicDecals.areAllMeshesEnabled()`

true si tous les meshes sont activés.

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.bakeLayers(layers)`

Cuit une liste de calques dans les textures du véhicule joueur (decalProjection:bakeLayers). Renvoie nil avec un message s'il n'y a pas de véhicule.

- `layers` (*table[]*) : Calques à cuire
- **renvoie** : table|nil Résultat (champ status : M.layerBakingStatusCode)

#### `editor_api_dynamicDecals.changeDecalRotation(clockwise_bool, step_radian_number)`

Tourne le decal courant d'un pas (15 degrés par défaut, en radians).

- `clockwise_bool` (*boolean*) : Sens horaire
- `step_radian_number` (*number|nil*) : Pas en radians

#### `editor_api_dynamicDecals.changeDecalSize(increase_bool, step_number)`

Agrandit/réduit le decal courant (x et z de decalScale) d'un pas (0.025 par défaut).

- `increase_bool` (*boolean*) : true pour agrandir
- `step_number` (*number|nil*) : Pas

#### `editor_api_dynamicDecals.deserializeLayer(layer)`

Reconstruit un calque à partir de données sérialisées.

- `layer` (*table*) : Données sérialisées
- **renvoie** : table Calque

#### `editor_api_dynamicDecals.drawBakedTextures(maxImageWidth)`

Affiche les textures cuites dans ImGui.

- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.drawBrushInputTextures(maxImageWidth)`

Affiche les textures d'entrée du pinceau dans ImGui.

- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.drawDynamicTextures(maxImageWidth)`

Affiche les textures dynamiques dans ImGui.

- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.drawHighlightTextures(maxImageWidth)`

Affiche les textures de surbrillance dans ImGui.

- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.drawMaskTextures(maxImageWidth)`

Affiche les textures de masque dans ImGui.

- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.drawTextureSet(textureSet, name, maxImageWidth)`

Affiche un textureSet donné dans ImGui.

- `textureSet` (*userdata*) : TextureSet
- `name` (*string*) : Titre
- `maxImageWidth` (*number*) : Largeur max

#### `editor_api_dynamicDecals.duplicateAndMirrorLayer(layerId_number, parentUid_string, mirrorChildren)`

Duplique un calque en le miroitant (nom + " Mirrored Copy") juste après l'original (annulable).

- `layerId_number` (*integer*) : Indice
- `parentUid_string` (*string|nil*) : Parent
- `mirrorChildren` (*boolean|nil*) : Miroiter aussi les enfants

#### `editor_api_dynamicDecals.duplicateLayer(layerId_number, parentUid_string)`

Duplique un calque (nouveaux uids, nom + " Copy") juste après l'original (annulable).

- `layerId_number` (*integer*) : Indice
- `parentUid_string` (*string|nil*) : Parent

#### `editor_api_dynamicDecals.exportLayerMask(layer, directory, filename, extension)`

Exporte le masque d'un calque dans un fichier.

- `layer` (*table*) : Calque
- `directory` (*string*) : Dossier
- `filename` (*string*) : Nom de fichier
- `extension` (*string*) : Extension

#### `editor_api_dynamicDecals.exportSkin(vehicleName, skinName)`

Exporte un skin utilisable comme mod : textures png (_d, _m, _r, _cp), matériaux <mat>.skin.<skinName> copiés des presets <mat>.skin.dynamicTextures et fichier jbeam du skin (slotType paint_design) dans /mods/unpacked/<skinName>/..., puis rafraîchit le gestionnaire de mods.

- `vehicleName` (*string*) : Nom du véhicule
- `skinName` (*string*) : Nom du skin

#### `editor_api_dynamicDecals.exportTextures(directoryPath, exportName, extension)`

Exporte les textures cuites dans un dossier.

- `directoryPath` (*string*) : Dossier
- `exportName` (*string*) : Nom de base
- `extension` (*string*) : Extension (ex. png)
- **renvoie** : any Résultat du moteur

#### `editor_api_dynamicDecals.getAlphaMaskBlendMode()`

Mode de fusion du masque alpha (0 ou 1 d'après les bornes de propriété).

- **renvoie** : integer Mode

#### `editor_api_dynamicDecals.getAlphaMaskChannel()`

Canal du masque alpha (0 à 3 d'après les bornes de propriété).

- **renvoie** : integer Canal

#### `editor_api_dynamicDecals.getAlphaMaskIntensity()`

Intensité du masque alpha.

- **renvoie** : number Intensité

#### `editor_api_dynamicDecals.getAlphaMaskOffset()`

Décalage du masque alpha.

- **renvoie** : Point2F Décalage

#### `editor_api_dynamicDecals.getAlphaMaskRotation()`

Rotation du masque alpha (radians).

- **renvoie** : number Radians

#### `editor_api_dynamicDecals.getAlphaMaskScale()`

Échelle du masque alpha.

- **renvoie** : Point2F Échelle

#### `editor_api_dynamicDecals.getBlendMode()`

Mode de fusion courant (M.blendModes).

- **renvoie** : integer Valeur

#### `editor_api_dynamicDecals.getBrushStrokeInterpolationSteps()`

Pas d'interpolation du pinceau.

- **renvoie** : integer Pas

#### `editor_api_dynamicDecals.getBrushStrokeLayerData()`

Données du calque pinceau courant (côté C++).

- **renvoie** : table Données

#### `editor_api_dynamicDecals.getColorPaletteMapId()`

Index de palette de couleurs du véhicule utilisé par le decal.

- **renvoie** : integer Index

#### `editor_api_dynamicDecals.getColorTextureScale()`

Échelle de la texture de couleur.

- **renvoie** : Point2F Échelle

#### `editor_api_dynamicDecals.getCursorPosition()`

Position du curseur de projection (écran, UV).

- **renvoie** : Point2F Position

#### `editor_api_dynamicDecals.getDecalColor()`

Couleur courante du decal (RGBA).

- **renvoie** : Point4F Couleur

#### `editor_api_dynamicDecals.getDecalLayerFontCharacter()`

Caractère de police utilisé par le decal.

- **renvoie** : string Caractère

#### `editor_api_dynamicDecals.getDecalLayerFontPath()`

Chemin de la police du decal.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getDecalLocalPos(decal)`

Position locale (véhicule) d'un calque decal.

- `decal` (*table*) : Calque
- **renvoie** : vec3 Position

#### `editor_api_dynamicDecals.getDecalRotation()`

Rotation courante du decal (radians).

- **renvoie** : number Radians

#### `editor_api_dynamicDecals.getDecalScale()`

Échelle courante du decal.

- **renvoie** : vec3 Échelle

#### `editor_api_dynamicDecals.getDecalSkew()`

Cisaillement du decal.

- **renvoie** : Point2F Skew

#### `editor_api_dynamicDecals.getDecalTexturePath(type_string)`

Chemin de la texture courante d'un type de decal.

- `type_string` (*string*) : Type de texture (color, normal, metallic, roughness, alpha, déduit des champs decal*TexturePath)
- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getDecalUv()`

Décalage UV du decal.

- **renvoie** : Point2F UV

#### `editor_api_dynamicDecals.getDecalWorldPos(decal)`

Position monde d'un calque decal.

- `decal` (*table*) : Calque
- **renvoie** : vec3 Position

#### `editor_api_dynamicDecals.getDecalWorldTransform(decal)`

Matrice de transformation monde d'un calque.

- `decal` (*table*) : Calque
- **renvoie** : MatrixF Transformation

#### `editor_api_dynamicDecals.getDepth()`

Profondeur de projection.

- **renvoie** : number Profondeur

#### `editor_api_dynamicDecals.getEnablePathLayer()`

Indique si le mode chemin est actif.

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getEnabled()`

Projection dynamique activée ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getFillLayerColor()`

Couleur des calques de remplissage.

- **renvoie** : Point4F Couleur

#### `editor_api_dynamicDecals.getFillLayerColorPaletteMapId()`

Index de palette pour le remplissage.

- **renvoie** : integer Index

#### `editor_api_dynamicDecals.getFillTexturePath()`

Texture de remplissage courante.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getFlipMirroredDecal()`

Inverser le decal côté miroir ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getFontTextureAtlasPath()`

Chemin de l'atlas de texture de police.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getGradientColorBottomLeft()`

Couleur du dégradé, coin bas-gauche.

- **renvoie** : ColorI Couleur

#### `editor_api_dynamicDecals.getGradientColorBottomRight()`

Couleur du dégradé, coin bas-droit.

- **renvoie** : ColorI Couleur

#### `editor_api_dynamicDecals.getGradientColorTopLeft()`

Couleur du dégradé, coin haut-gauche.

- **renvoie** : ColorI Couleur

#### `editor_api_dynamicDecals.getGradientColorTopRight()`

Couleur du dégradé, coin haut-droit.

- **renvoie** : ColorI Couleur

#### `editor_api_dynamicDecals.getHighlightedLayer()`

Calque actuellement surligné, ou nil.

- **renvoie** : table|nil Calque

#### `editor_api_dynamicDecals.getHistory()`

Historique undo/redo propre à ce module.

- **renvoie** : table Historique

#### `editor_api_dynamicDecals.getLayerById(layerId_number, parentUid_string)`

Renvoie le calque d'indice donné (à partir de 1) dans la pile racine ou dans les enfants du parent.

- `layerId_number` (*integer*) : Indice
- `parentUid_string` (*string|nil*) : uid du parent
- **renvoie** : table|nil Calque

#### `editor_api_dynamicDecals.getLayerByUid(layerUid_string)`

Cherche un calque (récursivement) par uid ; logge un message et renvoie nil s'il est introuvable.

- `layerUid_string` (*string*) : uid
- **renvoie** : table|nil Calque

#### `editor_api_dynamicDecals.getLayerCount()`

Nombre total de calques (enfants compris).

- **renvoie** : integer Nombre

#### `editor_api_dynamicDecals.getLayerNameBuildString()`

Renvoie le modèle de nom de calque.

- **renvoie** : string Modèle

#### `editor_api_dynamicDecals.getLayerStack()`

Renvoie la pile de calques racine (table partagée, pas une copie).

- **renvoie** : table[] Calques

#### `editor_api_dynamicDecals.getLockDepth()`

Profondeur verrouillée ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getLockSurfaceNormal()`

Normale de surface verrouillée ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getMaterialIndices()`

Liste des index de matériaux ciblés.

- **renvoie** : integer[] Index

#### `editor_api_dynamicDecals.getMeshObjectCount()`

Nombre de meshes du shape.

- **renvoie** : integer Nombre

#### `editor_api_dynamicDecals.getMetallicIntensity()`

Intensité métallique.

- **renvoie** : number Intensité

#### `editor_api_dynamicDecals.getMirrorDebug()`

Affichage de debug du miroir actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getMirrorOffset()`

Décalage du plan de miroir.

- **renvoie** : number Décalage

#### `editor_api_dynamicDecals.getMirrored()`

Mode miroir actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getNormalIntensity()`

Intensité de la normal map.

- **renvoie** : number Intensité

#### `editor_api_dynamicDecals.getOrientPathDecals()`

Si les decals suivent la direction du chemin.

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getPathLayerFontPath()`

Chemin de la police du chemin.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getPathLayerInterpolationSteps()`

Pas d'interpolation du chemin.

- **renvoie** : integer Pas

#### `editor_api_dynamicDecals.getPathLayerText()`

Texte posé le long du chemin.

- **renvoie** : string Texte

#### `editor_api_dynamicDecals.getPathType()`

Type de chemin (M.pathTypes).

- **renvoie** : integer 0 Linear, 1 Bezier

#### `editor_api_dynamicDecals.getRandomUid()`

Génère un uid pseudo-unique "XXXX-XXXX" (hexadécimal).

- **renvoie** : string uid

#### `editor_api_dynamicDecals.getRoughnessIntensity()`

Intensité de rugosité.

- **renvoie** : number Intensité

#### `editor_api_dynamicDecals.getSdfEnabled()`

Rendu SDF actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getSdfOutlineColor()`

Couleur du contour SDF.

- **renvoie** : ColorI Couleur

#### `editor_api_dynamicDecals.getSdfOutlineSoftness()`

Douceur du contour SDF.

- **renvoie** : number Valeur

#### `editor_api_dynamicDecals.getSdfOutlineThickness()`

Épaisseur du contour SDF.

- **renvoie** : number Valeur

#### `editor_api_dynamicDecals.getSdfSoftness()`

Douceur SDF.

- **renvoie** : number Valeur

#### `editor_api_dynamicDecals.getSdfThickness()`

Épaisseur SDF.

- **renvoie** : number Valeur

#### `editor_api_dynamicDecals.getSettings()`

Masque de bits des réglages du projecteur (M.settingsFlags).

- **renvoie** : integer Drapeaux

#### `editor_api_dynamicDecals.getShapeMaterialNames()`

Matériaux du shape (index -> nom).

- **renvoie** : table<integer, string> Noms

#### `editor_api_dynamicDecals.getShapeMeshes()`

Meshes du shape et leur état d'activation.

- **renvoie** : table<string, boolean> name -> activé

#### `editor_api_dynamicDecals.getShapePath()`

Chemin du modèle 3D (shape) sur lequel on projette.

- **renvoie** : string Chemin

#### `editor_api_dynamicDecals.getSurfaceNormal()`

Normale de surface courante.

- **renvoie** : vec3 Normale

#### `editor_api_dynamicDecals.getTextureFillLayerScale()`

Échelle des calques de remplissage par texture.

- **renvoie** : Point2F Échelle

#### `editor_api_dynamicDecals.getTextureFillOffset()`

Décalage du remplissage par texture.

- **renvoie** : Point2F Décalage

#### `editor_api_dynamicDecals.getTextureResolution()`

Résolution des textures dynamiques.

- **renvoie** : Point2I Résolution

#### `editor_api_dynamicDecals.getTextureSet()`

TextureSet des textures dynamiques (nil avant setup).

- **renvoie** : userdata|nil TextureSet

#### `editor_api_dynamicDecals.getUseSurfaceNormal()`

Orienter le decal selon la normale de surface ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.getUvLayer()`

Canal UV utilisé.

- **renvoie** : integer Index UV

#### `editor_api_dynamicDecals.hasActivePathLayer()`

true si un calque chemin est en cours d'édition.

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.highlightLayer(layer_table)`

Surligne un calque (table).

- `layer_table` (*table*) : Calque

#### `editor_api_dynamicDecals.highlightLayerByUid(layerUid_string)`

Surligne un calque par uid.

- `layerUid_string` (*string*) : uid

#### `editor_api_dynamicDecals.isAlphaMaskInvertEnabled()`

Drapeau AlphaMaskInvert actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isDecalGradientColorEnabled()`

Drapeau UseGradientColor actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isUseMousePos()`

Drapeau UseMousePos actif (projection au curseur souris plutôt qu'au centre) ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isWrapAlphaMaskXEnabled()`

Drapeau WrapAlphaMaskX actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isWrapAlphaMaskYEnabled()`

Drapeau WrapAlphaMaskY actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isWrapColorTextureXEnabled()`

Drapeau WrapColorTextureX actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.isWrapColorTextureYEnabled()`

Drapeau WrapColorTextureY actif ?

- **renvoie** : boolean État

#### `editor_api_dynamicDecals.loadLayerStackFromFile(path_string, mode_number)`

Charge une pile depuis un JSON, en écrasant (Overwrite, défaut) ou ajoutant (Append), puis reprojette.

- `path_string` (*string*) : Fichier
- `mode_number` (*integer|nil*) : M.loadingModes : 0 Overwrite, 1 Append
- **renvoie** : table|nil Résultat de reprojectLayers (nil dans le code actuel, la fonction ne renvoie rien)

#### `editor_api_dynamicDecals.moveLayer(from_number, fromParentUid_string, to_number, toParentUid_string)`

Déplace un calque vers une autre position/parent (annulable). Refuse de faire d'un calque son propre enfant. Émet dynamicDecals_moveLayer.

- `from_number` (*integer*) : Indice source
- `fromParentUid_string` (*string|nil*) : Parent source
- `to_number` (*integer*) : Indice destination
- `toParentUid_string` (*string|nil*) : Parent destination

#### `editor_api_dynamicDecals.moveLayerLocalPos(layerUid, newLocalPosition, includeChildren, referenceLayerUid)`

Déplace un calque (decal, brushStroke, path ou group) à une nouvelle position locale au véhicule. Pour un groupe, referenceLayerUid est obligatoire.

- `layerUid` (*string*) : uid du calque
- `newLocalPosition` (*vec3*) : Nouvelle position
- `includeChildren` (*boolean|nil*) : Déplacer aussi les enfants
- `referenceLayerUid` (*string|nil*) : Calque de référence (groupes)

#### `editor_api_dynamicDecals.onDeserialized(data)`

Hook appelé avec les données sauvegardées : recrée la pile de calques et mémorise materialIdx pour setup().

- `data` (*table*) : Données de onSerialize

#### `editor_api_dynamicDecals.onSerialize()`

Hook de sérialisation d'extension : renvoie {layerStackData, materialIdx} (nil sans projecteur).

- **renvoie** : table|nil Données

#### `editor_api_dynamicDecals.removeLayer(index_number, parentUid_string)`

Supprime un calque (annulable) et coupe la mise en évidence s'il était surligné.

- `index_number` (*integer*) : Indice
- `parentUid_string` (*string|nil*) : Parent

#### `editor_api_dynamicDecals.removeMaterialIdx(materialIdx_int)`

Retire un matériau des cibles.

- `materialIdx_int` (*integer*) : Index

#### `editor_api_dynamicDecals.renderSdfTextureImgui(sizeX, sizeY)`

Affiche la texture SDF dans ImGui.

- `sizeX` (*number*) : Largeur
- `sizeY` (*number*) : Hauteur

#### `editor_api_dynamicDecals.replaceDecalTransformFromCurrentProjection(layerUid_string, originalLayer)`

Replace un decal déjà posé selon la caméra/projection courante en ne changeant que ses champs de transformation (camPosition, decalPos, decalScale, decalRotation, miroir…). Refuse si le curseur capturé n'est pas centré (0.5 ± 0.01) ou si le calque n'est pas un decal. Commit une action « Transform Decal ».

- `layerUid_string` (*string*) : uid du decal
- `originalLayer` (*table*) : Instantané du calque avant l'édition
- **renvoie** : boolean true si réussi

#### `editor_api_dynamicDecals.rotateLayer(layer, delta_vec3)`

Applique une rotation delta à un calque et à ses enfants.

- `layer` (*table*) : Calque (uid utilisé)
- `delta_vec3` (*vec3*) : Delta de rotation (déduit du code)

#### `editor_api_dynamicDecals.saveLayerStackToFile(path_string)`

Écrit la pile de calques dans un fichier JSON (sans materialIdx).

- `path_string` (*string*) : Fichier

#### `editor_api_dynamicDecals.scaleLayer(layer, delta_vec3)`

Met à l'échelle un calque et ses enfants de (1,1,1) + delta.

- `layer` (*table*) : Calque (uid utilisé)
- `delta_vec3` (*vec3*) : Delta d'échelle

#### `editor_api_dynamicDecals.serializeLayer(layer)`

Convertit un calque en table sérialisable JSON (types moteur convertis).

- `layer` (*table*) : Calque
- **renvoie** : table Données sérialisées

#### `editor_api_dynamicDecals.setAlphaMaskBlendMode(value_int)`

Définit le mode de fusion du masque alpha.

- `value_int` (*integer*) : Mode

#### `editor_api_dynamicDecals.setAlphaMaskChannel(value_int)`

Définit le canal du masque alpha.

- `value_int` (*integer*) : Canal

#### `editor_api_dynamicDecals.setAlphaMaskIntensity(value_float)`

Définit l'intensité du masque alpha.

- `value_float` (*number*) : Intensité

#### `editor_api_dynamicDecals.setAlphaMaskOffset(value_Point2F)`

Définit le décalage du masque alpha.

- `value_Point2F` (*Point2F*) : Décalage

#### `editor_api_dynamicDecals.setAlphaMaskRotation(value_radian_float)`

Définit la rotation du masque alpha.

- `value_radian_float` (*number*) : Radians

#### `editor_api_dynamicDecals.setAlphaMaskScale(value_Point2F)`

Définit l'échelle du masque alpha.

- `value_Point2F` (*Point2F*) : Échelle

#### `editor_api_dynamicDecals.setBlendMode(blendMode_int)`

Définit le mode de fusion courant.

- `blendMode_int` (*integer*) : Valeur de M.blendModes

#### `editor_api_dynamicDecals.setBrushStrokeInterpolationSteps(value_u32)`

Définit les pas d'interpolation du pinceau.

- `value_u32` (*integer*) : Pas

#### `editor_api_dynamicDecals.setColorPaletteMapId(value_int)`

Définit l'index de palette du decal.

- `value_int` (*integer*) : Index

#### `editor_api_dynamicDecals.setColorTextureScale(value_Point2F)`

Définit l'échelle de la texture de couleur.

- `value_Point2F` (*Point2F*) : Échelle

#### `editor_api_dynamicDecals.setCursorPosition(value_Point2F)`

Définit la position du curseur de projection.

- `value_Point2F` (*Point2F*) : Position

#### `editor_api_dynamicDecals.setDecalColor(value_Point4F)`

Définit la couleur du decal.

- `value_Point4F` (*Point4F*) : Couleur RGBA

#### `editor_api_dynamicDecals.setDecalLayerFontCharacter(value_char)`

Définit le caractère de police du decal.

- `value_char` (*string*) : Caractère

#### `editor_api_dynamicDecals.setDecalLayerFontPath(value_string)`

Définit la police du decal.

- `value_string` (*string*) : Chemin

#### `editor_api_dynamicDecals.setDecalLocalPos(decal, worldPos)`

Définit la position d'un decal (nom du paramètre worldPos dans le code).

- `decal` (*table*) : Calque
- `worldPos` (*vec3*) : Position (déduit du code)

#### `editor_api_dynamicDecals.setDecalRotation(value_radian_number)`

Définit la rotation du decal.

- `value_radian_number` (*number*) : Radians

#### `editor_api_dynamicDecals.setDecalScale(value_vec3)`

Définit l'échelle du decal.

- `value_vec3` (*vec3*) : Échelle

#### `editor_api_dynamicDecals.setDecalSkew(value_Point2F)`

Définit le cisaillement du decal.

- `value_Point2F` (*Point2F*) : Skew

#### `editor_api_dynamicDecals.setDecalTexturePath(type_string, path_string)`

Définit la texture courante d'un type de decal.

- `type_string` (*string*) : Type de texture
- `path_string` (*string*) : Chemin

#### `editor_api_dynamicDecals.setDecalUv(value_Point2F)`

Définit le décalage UV du decal.

- `value_Point2F` (*Point2F*) : UV

#### `editor_api_dynamicDecals.setEnableBrushStroke(value_bool)`

Active/désactive le mode pinceau du projecteur (avec un nouvel uid aléatoire).

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setEnablePathLayer(value_bool)`

Active/désactive le mode chemin ; à false, termine le chemin en cours.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setEnabled(enabled)`

Active/désactive le projecteur ; à false, vide les textures dynamiques et recombine le textureSet.

- `enabled` (*boolean*) : État

#### `editor_api_dynamicDecals.setFillLayerColor(value_Point4F)`

Définit la couleur des calques de remplissage.

- `value_Point4F` (*Point4F*) : Couleur RGBA

#### `editor_api_dynamicDecals.setFillLayerColorPaletteMapId(value_int)`

Définit l'index de palette pour le remplissage.

- `value_int` (*integer*) : Index

#### `editor_api_dynamicDecals.setFillTexturePath(path_string)`

Définit la texture de remplissage.

- `path_string` (*string*) : Chemin

#### `editor_api_dynamicDecals.setFlipMirroredDecal(value_bool)`

Active l'inversion du decal côté miroir.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setFontTextureAtlasPath(path_string)`

Définit l'atlas de texture de police.

- `path_string` (*string*) : Chemin

#### `editor_api_dynamicDecals.setGradientColorBottomLeft(value_ColorI)`

Définit la couleur du dégradé, coin bas-gauche.

- `value_ColorI` (*ColorI*) : Couleur

#### `editor_api_dynamicDecals.setGradientColorBottomRight(value_ColorI)`

Définit la couleur du dégradé, coin bas-droit.

- `value_ColorI` (*ColorI*) : Couleur

#### `editor_api_dynamicDecals.setGradientColorTopLeft(value_ColorI)`

Définit la couleur du dégradé, coin haut-gauche.

- `value_ColorI` (*ColorI*) : Couleur

#### `editor_api_dynamicDecals.setGradientColorTopRight(value_ColorI)`

Définit la couleur du dégradé, coin haut-droit.

- `value_ColorI` (*ColorI*) : Couleur

#### `editor_api_dynamicDecals.setLayer(layerData_table, doReproject_bool)`

Remplace un calque (par uid) par les données fournies, annulable, et émet dynamicDecals_setLayer(uid) ; dynamicDecals_onLayerUpdated(uid) est émis à l'application.

- `layerData_table` (*table*) : Nouvelles données (uid existant)
- `doReproject_bool` (*boolean|nil*) : Recuire la pile après modification

#### `editor_api_dynamicDecals.setLayerNameBuildString(value_string)`

Définit le modèle de nom des nouveaux calques (défaut "$type Layer"). Balises : @type, @colormap, @normalmap, @metallicmap, @roughnessmap, @alphamap, @uid ; un bloc {texte@balise texte} n'apparaît que si la balise n'est pas vide.

- `value_string` (*string*) : Modèle

#### `editor_api_dynamicDecals.setLayerVisibility(layerUid_string, visibility_bool)`

Affiche/masque un calque directement (sans historique) et reprojette.

- `layerUid_string` (*string*) : uid
- `visibility_bool` (*boolean*) : true visible

#### `editor_api_dynamicDecals.setLockDepth(value_bool)`

Verrouille/déverrouille la profondeur de projection.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setLockSurfaceNormal(value_bool)`

Verrouille/déverrouille la normale de surface.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setMaterialIdx(materialIdx_int)`

Définit le matériau unique ciblé par la projection.

- `materialIdx_int` (*integer*) : Index de matériau

#### `editor_api_dynamicDecals.setMeshEnable(name_string, value_bool)`

Active/désactive un mesh par nom.

- `name_string` (*string*) : Nom du mesh
- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setMetallicIntensity(value_float)`

Définit l'intensité métallique.

- `value_float` (*number*) : Intensité

#### `editor_api_dynamicDecals.setMirrorDebug(value_bool)`

Active le debug du miroir.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setMirrorOffset(value_float)`

Définit le décalage du plan de miroir.

- `value_float` (*number*) : Décalage

#### `editor_api_dynamicDecals.setMirrored(value_bool)`

Active/désactive le miroir.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setNormalIntensity(value_float)`

Définit l'intensité de la normal map.

- `value_float` (*number*) : Intensité

#### `editor_api_dynamicDecals.setOrientPathDecals(value_bool)`

Définit si les decals du chemin s'orientent selon le chemin.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setPathLayerFontPath(value_string)`

Définit la police du chemin.

- `value_string` (*string*) : Chemin

#### `editor_api_dynamicDecals.setPathLayerInterpolationSteps(value_u32)`

Définit les pas d'interpolation du chemin.

- `value_u32` (*integer*) : Pas

#### `editor_api_dynamicDecals.setPathLayerText(value_string)`

Définit le texte posé le long du chemin.

- `value_string` (*string*) : Texte

#### `editor_api_dynamicDecals.setPathType(value_int)`

Définit le type de chemin.

- `value_int` (*integer*) : 0 Linear, 1 Bezier

#### `editor_api_dynamicDecals.setProjectDynamicDecalsState(value)`

Active/désactive la projection de prévisualisation (M.projectDynamicDecals).

- `value` (*boolean*) : État

#### `editor_api_dynamicDecals.setRoughnessIntensity(value_float)`

Définit l'intensité de rugosité.

- `value_float` (*number*) : Intensité

#### `editor_api_dynamicDecals.setSdfEnabled(value_bool)`

Active/désactive le rendu SDF.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setSdfOutlineColor(value_ColorI)`

Définit la couleur du contour SDF.

- `value_ColorI` (*ColorI*) : Couleur

#### `editor_api_dynamicDecals.setSdfOutlineSoftness(value_f32)`

Définit la douceur du contour SDF.

- `value_f32` (*number*) : Valeur

#### `editor_api_dynamicDecals.setSdfOutlineThickness(value_f32)`

Définit l'épaisseur du contour SDF.

- `value_f32` (*number*) : Valeur

#### `editor_api_dynamicDecals.setSdfSoftness(value_f32)`

Définit la douceur SDF.

- `value_f32` (*number*) : Valeur

#### `editor_api_dynamicDecals.setSdfThickness(value_f32)`

Définit l'épaisseur SDF.

- `value_f32` (*number*) : Valeur

#### `editor_api_dynamicDecals.setShapePath(path)`

Change le modèle de projection puis reprojette.

- `path` (*string*) : Chemin du shape

#### `editor_api_dynamicDecals.setTextureFillLayerScale(value_Point2F)`

Définit l'échelle du remplissage par texture.

- `value_Point2F` (*Point2F*) : Échelle

#### `editor_api_dynamicDecals.setTextureFillOffset(value_Point2F)`

Définit le décalage du remplissage par texture.

- `value_Point2F` (*Point2F*) : Décalage

#### `editor_api_dynamicDecals.setTextureResolution(resolution_point2i)`

Change la résolution ; si le moteur l'accepte, reprojette et réassigne le textureSet @DynamicTexture.

- `resolution_point2i` (*Point2I*) : Résolution

#### `editor_api_dynamicDecals.setUseSurfaceNormal(value_bool)`

Active l'orientation selon la normale de surface.

- `value_bool` (*boolean*) : État

#### `editor_api_dynamicDecals.setUvLayer(uvLayerId_int)`

Change le canal UV puis reprojette.

- `uvLayerId_int` (*integer*) : Index UV

#### `editor_api_dynamicDecals.toggleLayerVisibility(layerUid_string)`

Inverse la visibilité d'un calque (annulable) et reprojette.

- `layerUid_string` (*string*) : uid
- **renvoie** : boolean Nouvelle valeur de enabled

#### `editor_api_dynamicDecals.toggleSetting(value_int)`

Inverse un drapeau de réglage.

- `value_int` (*integer*) : Valeur de M.settingsFlags.X.value
- **renvoie** : any Résultat du moteur

## Champs

| Champ | Type | Description |
|---|---|---|
| `blendModes` | table[] | Modes de fusion {name, value} : Clear 0, Normal 1, Screen / Add 2, Subtract 3, Multiply 4, Eraser 5. |
| `blendModesMap` | table<string, integer> | name -> value de blendModes. |
| `debug` | boolean | Active des logs détaillés (print) dans la plupart des fonctions. false par défaut. |
| `layerBakingStatusCode` | table<string, integer> | Drapeaux de résultat du cuisson (res.status) : Ok 0, Warning 1, Error 2, LayerStackDataTypeIncorrect 4, LayerDataTypeIncorrect 8, TextureFileMissing 16, FontFileMissing 32. |
| `layerTypes` | table<string, integer> | decal 0, fill 1, textureFill 2, group 3, brushStroke 4, path 5, linkedSet 6. |
| `layerTypesMap` | table<integer, string> | Inverse de layerTypes (valeur -> nom). |
| `loadingModes` | table[] | Modes de chargement de pile {key, value} : Overwrite 0, Append 1 (pour loadLayerStackFromFile). |
| `pathTypes` | table<string, integer> | Linear 0, Bezier 1. |
| `projectDynamicDecals` | boolean | Si true (défaut), onUpdate_ projette chaque frame le decal de prévisualisation sous la caméra. |
| `properties` | table<string, table[]> | Description des propriétés éditables par type de calque (Decal, etc.) : id, name, description, type, default, min/max pour le widget, format, getMod/setMod, widgetType. |
| `propertiesMap` | table | Index des propriétés (construit à partir de properties). |
| `ready` | boolean | true une fois setup() terminé. |
| `settingsFlags` | table<string, table> | Drapeaux de réglage du projecteur ({name, value[, description]}) : None, UseMousePos (bit 2), UseGradientColor (3), AlphaMaskInvert (4), WrapAlphaMaskX (5), WrapAlphaMaskY (6), WrapColorTextureX (7), WrapColorTextureY (8). |
| `textureResolutions` | table[] | Résolutions possibles {name, value} : 512, 1024, 2048, 4096. |
| `types` | table<string, integer> | Types de propriété pour M.properties : bool 0, int 1, float 2, Point2F 3, Point3F 4, Point4F 5, string 6, Texture 7, File 8, ColorI 9, MultiColor 10. |
| `typesMap` | table<integer, string> | Inverse de types. |
| `widgetTypes` | table | Pour chaque type de propriété, table des widgets possibles (Default, Input, Slider, Drag, Combo, Checkbox, Color, File, ImageButton, ColorGradient, InputMultiline selon le type). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `dynamicDecals_moveLayer`
- `dynamicDecals_onLayerAdded`
- `dynamicDecals_onLayerDeleted`
- `dynamicDecals_onLayerUpdated`
- `dynamicDecals_setLayer`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dynamicDecals.lua`.*

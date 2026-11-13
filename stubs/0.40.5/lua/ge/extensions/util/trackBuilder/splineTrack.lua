---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/splineTrack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur du Track Builder (éditeur de pistes procédurales). Le module garde deux niveaux de données par sous-piste : subPieces (description abstraite : liste de pièces avec leurs marqueurs bank, height, width, checkpoint, murs, plafond, matériaux, obstacles) et subTracks (segments concrets avec points, mesh, markerInfo). Il convertit les pièces en segments (toSegments), calcule les points de Bézier, d'arc ou personnalisés, mesure la piste, interpole les marqueurs, génère les ProceduralMesh via segmentToProceduralMesh, place marqueurs et obstacles, gère les intersections multi-pistes, les checkpoints de scénario, la sauvegarde et le chargement en JSON (dossier trackEditor/) et le positionnement du véhicule. Il est piloté par l'application UI du Track Builder et par quickraceSetup.
--- Accès : extension `util_trackBuilder_splineTrack` : `extensions.load("util_trackBuilder_splineTrack")`, puis la globale `util_trackBuilder_splineTrack`
---@class util_trackBuilder_splineTrack
---@field applyStack nil Toujours nil (code de pile commenté).
---@field camDistance number Distance de la caméra au segment sélectionné lors de focusMarkerOn (80 par défaut).
---@field clearStack nil Toujours nil (code de pile commenté).
---@field curve nil Toujours nil (existe dans pieces).
---@field deepcopy nil Toujours nil : la fonction est dans un bloc commenté.
---@field emptyOffset nil Toujours nil (existe dans pieces).
---@field forward nil Toujours nil (existe dans pieces).
---@field fresnelSC nil Toujours nil (existe dans pieces).
---@field getHdgVector nil Toujours nil : fonction non définie ici (existe dans pieces).
---@field getStackCount nil Toujours nil (code de pile commenté).
---@field initialTrackPiece nil Toujours nil : fonction non définie ici (existe dans pieces).
---@field interpolateField nil Toujours nil : fonction non définie.
---@field interpolateSegment nil Toujours nil : fonction non définie.
---@field loop nil Toujours nil (existe dans pieces).
---@field materialUtil table Référence vers le module util_trackBuilder_materialUtil (gestion des matériaux A à H).
---@field offsetCurve nil Toujours nil (existe dans pieces).
---@field saveHistory nil Toujours nil (historique commenté).
---@field setAllPiecesToAsphalt nil Toujours nil : fonction non définie.
---@field spiral nil Toujours nil.
---@field stack nil Toujours nil (code de pile commenté).
---@field stackToCursor nil Toujours nil (code de pile commenté).
util_trackBuilder_splineTrack = {}

--- Crée des checkpoints (BeamNGWaypoint 'gym_<n>') régulièrement répartis sur la piste (un tous les 300 m environ, au moins 3) ou aux segments marqués hasCheckPoint, et les enregistre dans scenario.lapConfig et scenario.nodes. Réinitialise lapConfig et nodes du scénario courant.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:262
---@param reverse boolean|nil Parcours dans le sens inverse.
function util_trackBuilder_splineTrack.addCheckPointPositions(reverse) end

--- Ferme la piste : ajoute une pièce freeBezier absolue vers le point de départ et copie bank, width et height de la première pièce. Ne fait rien si la piste est déjà fermée.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1092
function util_trackBuilder_splineTrack.addClosingPiece() end

--- Ajoute un virage hexagonal ('hexCurve').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1604
---@param len number Taille du virage.
---@param hardness number Dureté.
---@param dir number Sens : 1 ou -1.
---@param index integer|nil Position d'insertion.
---@param replace boolean|nil Remplacer.
function util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace) end

--- Ajoute un déplacement sans géométrie ('hexEmptyOffset').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1608
---@param xOff number Décalage latéral.
---@param yOff number Décalage avant.
---@param zOff number Décalage vertical.
---@param dirOff number Rotation en pas.
---@param absolute boolean|nil Relatif à l'origine de la piste.
---@param index integer|nil Position d'insertion.
---@param replace boolean|nil Remplacer.
function util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace) end

--- Ajoute une ligne droite ('freeForward').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1603
---@param len number Longueur.
---@param index integer|nil Position d'insertion (fin par défaut).
---@param replace boolean|nil Remplacer la pièce à cet indice.
function util_trackBuilder_splineTrack.addForward(len, index, replace) end

--- Ajoute un looping hexagonal ('hexLoop').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1607
---@param rad number Rayon.
---@param off number Décalage latéral.
---@param index integer|nil Position d'insertion.
---@param replace boolean|nil Remplacer.
function util_trackBuilder_splineTrack.addLoop(rad, off, index, replace) end

--- Ajoute une courbe en S hexagonale ('hexOffsetCurve').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1605
---@param len number Longueur.
---@param off number Décalage latéral.
---@param hardness number Dureté.
---@param index integer|nil Position d'insertion.
---@param replace boolean|nil Remplacer.
function util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace) end

--- Ajoute (ou remplace) une pièce dans subPieces à l'indice donné, l'invalide et invalide les pièces concernées. Avec replace, conserve les marqueurs, profils, matériaux et obstacles de la pièce remplacée ; sinon les profils sont copiés de la pièce précédente (défaut 'regular').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1611
---@param params table Description de la pièce (champ piece = nom du type, plus ses paramètres ; voir pieces.toSegment).
---@param index integer|nil Position d'insertion (fin par défaut).
---@param replace boolean|nil Remplacer la pièce existante.
function util_trackBuilder_splineTrack.addPiece(params, index, replace) end

--- Ajoute une spirale hexagonale ('hexSpiral').
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1606
---@param size number Taille.
---@param inside boolean Vers l'intérieur.
---@param dir number Sens : 1 ou -1.
---@param index integer|nil Position d'insertion.
---@param replace boolean|nil Remplacer.
function util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace) end

--- Met à l'échelle et tourne les points personnalisés d'une pièce (loopings). Renvoie nil sans customPoints.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1263
---@param piece table Pièce avec customPoints, position et hdg.
---@return table[]|nil  Points {position, rot, quality}.
function util_trackBuilder_splineTrack.calculateCustomPoints(piece) end

--- Pour chaque segment invalide, calcule rotation et points (Bézier, arc ou personnalisés), marque les premiers et derniers points comme toujours présents, fixe markerInfo.basePosition ; détermine ensuite si la piste est fermée (début et fin à moins de 0,1 unité).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1111
function util_trackBuilder_splineTrack.convertToSpline() end

--- Crée le marqueur de piste ('track_marker') s'il n'existe pas et place tous les marqueurs d'édition (markers.transformMarkers pour chaque type).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:703
function util_trackBuilder_splineTrack.createMarkers() end

--- Ajoute une nouvelle sous-piste à la position et au cap donnés (position divisée par gridScale), la rend courante et renvoie son indice.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:90
---@param position vec3 Position monde en mètres.
---@param hdg number Cap en degrés.
---@return integer  Indice de la nouvelle sous-piste.
function util_trackBuilder_splineTrack.createNewSubTrack(position, hdg) end

--- Exporte la piste en table Lua simple (sous-pistes, positions, pièces, matériaux, matériaux de champs de materialUtil, intersections, tours, réversible, fermée).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1736
---@return table  Table exportable en JSON.
function util_trackBuilder_splineTrack.exportTrackToTable() end

--- Déplace en douceur (0,3 s, via cameraTransition) la caméra libre pour regarder le segment index à la distance donnée.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:616
---@param index integer Indice du segment.
---@param distance number|nil Distance (camDistance par défaut).
---@param force boolean|nil Refait la transition même si le segment est déjà celui de la dernière fois.
function util_trackBuilder_splineTrack.focusCameraOn(index, distance, force) end

--- Place le marqueur de piste sur le segment index, le sélectionne (matériau 'track_editor_grid') et, si M.camActivated est vrai, recentre la caméra. Affiche les marqueurs s'ils sont cachés.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:645
---@param index integer Indice du segment.
---@param dontRefresMaterial boolean|nil Ne change pas les matériaux de sélection.
---@param force boolean|nil Forcer le recentrage de la caméra.
function util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force) end

--- Liste les segments portant un checkpoint fixe.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:347
---@return table[]  Éléments {segmentIndex, checkpointSize, checkpointPosition}.
function util_trackBuilder_splineTrack.getAllCheckpoints() end

--- Calcule les points d'un arc de cercle (polyMult * pointsMultiplier points, 300 au plus).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1175
---@param segment table Segment de type 'arc' (position, hdg, direction, angle, radius).
---@return table[]  Points {position, rot, quality}.
function util_trackBuilder_splineTrack.getArcPoints(segment) end

--- Calcule les points d'une courbe de Bézier cubique entre origin et position (échelle de grille appliquée) avec les points de contrôle du segment.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1209
---@param segment table Segment de type 'bezier'.
---@return table[]  Points {position, rot, quality, …}.
function util_trackBuilder_splineTrack.getBezierPoints(segment) end

--- Liste les pistes JSON de trackEditor/ utilisant le format actuel (champ version présent).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2137
---@return string[]  Noms de pistes.
function util_trackBuilder_splineTrack.getCustomTracks() end

--- Renvoie le dernier segment de la sous-piste courante.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1534
---@return table|nil  Segment.
function util_trackBuilder_splineTrack.getEndOfTrack() end

--- Renvoie la table d'une intersection par son nom.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:222
---@param name string Nom de l'intersection.
---@return table|nil  {segments, centerMat, borderMat, borderMesh, name, obj}.
function util_trackBuilder_splineTrack.getIntersection(name) end

--- Renvoie le dernier segment (à partir de lastIndex en remontant) qui possède le marqueur donné. Voir notes : plante sans lastIndex.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:493
---@param markerName string Nom du marqueur.
---@param lastIndex integer Indice de départ.
---@return table|nil  Segment trouvé.
function util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex) end

--- Avec index : renvoie la pièce abstraite. Sans index : renvoie l'état global de l'éditeur (pièces, qualité, marqueurs affichés, position, sélection, piste fermée, tours, réversible, indice de sous-piste).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:502
---@param index integer|nil Indice de la pièce.
---@param sub integer|nil Sous-piste (courante par défaut).
---@return table  Pièce ou état global.
function util_trackBuilder_splineTrack.getPieceInfo(index, sub) end

--- Liste les noms des images .png et .jpg de trackEditor/ (aperçus). Les deux boucles écrivent dans les mêmes indices : les jpg écrasent les png (bug).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2158
---@return string[]  Noms d'aperçus.
function util_trackBuilder_splineTrack.getPreviewNames() end

--- Renvoie le segment concret (points, mesh, markerInfo) d'indice donné.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:521
---@param index integer Indice du segment.
---@param sub integer|nil Sous-piste.
---@return table|nil  Segment.
function util_trackBuilder_splineTrack.getSegmentInfo(index, sub) end

--- Renvoie le segment actuellement sélectionné.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:608
---@return table|nil  Segment sélectionné.
function util_trackBuilder_splineTrack.getSelectedTrackInfo() end

--- Renvoie la position et le cap de la sous-piste courante.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:477
---@return table  {x, y, z, hdg, unitX, unitY}.
function util_trackBuilder_splineTrack.getTrackPosition() end

--- Remplace la piste actuelle par celle de la table (format 1.0 ou 1.1) : reconstruit les sous-pistes, convertit les obstacles en vec3/quat, applique les matériaux, invalide toutes les pièces, et restaure l'heure du jour et le brouillard si le niveau correspond.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1902
---@param import table Table au format exporté par exportTrackToTable/save.
function util_trackBuilder_splineTrack.importTrackFromTable(import) end

--- (Ré)initialise la sous-piste courante : décharge tout (sauf noUnload), crée la pièce 'init' avec les matériaux 'track_editor_A_*' (G sur glow_city), positionne la piste puis ajoute un addForward(3).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1429
---@param noUnload boolean|nil Ne pas appeler unloadAll.
function util_trackBuilder_splineTrack.initTrack(noUnload) end

--- Enregistre qu'une pièce doit être recalculée pour un type de marqueur donné, ou pour tous si types est nil (markers.addMarkerChange).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1317
---@param index integer Indice de la pièce.
---@param types string|nil Type de marqueur.
---@param force boolean|nil Non utilisé dans le code.
function util_trackBuilder_splineTrack.invalidatePiece(index, types, force) end

--- Charge une piste depuis le fichier trackEditor/<nom>.json ou depuis une table, la construit en haute qualité (makeTrack(true)) pour chaque sous-piste, recrée les intersections et affiche un message à l'UI sauf si silent. increasePointMult multiplie le nombre de points par 1,5 pendant la construction.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1984
---@param originalFilename string|table Nom de la piste (sans extension) ou table déjà lue.
---@param instantHighQuality boolean|nil Non utilisé dans le code (déduit du code).
---@param increasePointMult boolean|nil Augmente la densité de points (sauf si read.keepPointMultiplier).
---@param clearShapes boolean|nil Appelle mesher.clearShapes à la fin.
---@param silent boolean|nil Pas de message UI.
---@param ignoreCol boolean|nil Mémorise ignoreCollision : pas de rechargement de la collision.
function util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol) end

--- Lit seulement le JSON d'une piste (pour connaître longueur, auteur, etc.) sans la construire.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2045
---@param originalFilename string Nom de la piste sans extension.
---@return table|nil  Contenu JSON ou nil.
function util_trackBuilder_splineTrack.loadJSON(originalFilename) end

--- Génère les meshes de la piste : toSegments, convertToSpline, measureTrack, caps, interpolation des marqueurs, rotation finale des points, regénération des meshes à rafraîchir, marqueurs, obstacles. Recharge la collision si instantHighQuality est vrai et ignoreCollision faux.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:848
---@param instantHighQuality boolean|nil Générer tout de suite en qualité 1.
---@param ignoreCollision boolean|nil Ne pas recharger la collision (paramètre, masque la variable de module).
function util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision) end

--- Modifie un marqueur (bank, height, width, checkpoint, murs, plafond, obstacles…) d'une pièce et l'invalide ; value nil le supprime. Interdit le checkpoint sur la première pièce. Sur une piste fermée, applique aussi le changement à la première pièce.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:737
---@param type string Type de marqueur.
---@param index integer|nil Indice de la pièce (dernière par défaut).
---@param value any Valeur du marqueur (table {value, interpolation} pour bank/height/width).
function util_trackBuilder_splineTrack.markerChange(type, index, value) end

--- Calcule startLength, endLength et la longueur cumulée de chaque point, à partir du dernier segment valide, pour les segments invalides.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1291
function util_trackBuilder_splineTrack.measureTrack() end

--- Crée une intersection (raccord de plusieurs extrémités de segments) avec multiTrackMerger et la mémorise ; les matériaux par défaut viennent du premier segment. Le nom de l'intersection est 'procMerger-…'.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:173
---@param segments table[] Liste de {segment, reverse, index, sub}.
---@param centerMat string|nil Matériau du centre.
---@param borderMat string|nil Matériau de la bordure.
---@param borderMesh string|nil Profil de bordure.
function util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh) end

--- Hook appelé à la fin du niveau : appelle unloadAll pour oublier la piste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2172
function util_trackBuilder_splineTrack.onClientEndMission() end

--- Hook appelé quand des métadonnées de capture d'écran sont collectées ; corps entièrement commenté, donc sans effet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2179
---@param metadata table Métadonnées de la capture.
function util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata) end

--- Hook appelé avant le rendu ; relaie à cameraTransition.onPreRender(dt).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2281
---@param dt number Temps écoulé (s).
function util_trackBuilder_splineTrack.onPreRender(dt) end

--- Hook appelé à chaque frame. Si la haute qualité et les marqueurs sont actifs, décompte (pas fixe de 0,01) le timer des segments en basse qualité et les régénère un par un en qualité 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:787
function util_trackBuilder_splineTrack.onUpdate() end

--- Place l'origine de la piste 15 m au-dessus du véhicule joueur. Renvoie false s'il n'y a pas de véhicule.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:422
---@return boolean  Succès.
function util_trackBuilder_splineTrack.positionTrackAboveVehicle() end

--- Place l'origine de la piste 15 m devant la caméra. Renvoie false si la caméra n'est pas libre.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:395
---@return boolean  Succès.
function util_trackBuilder_splineTrack.positionTrackBeforeCamera() end

--- Place le véhicule du joueur (ou 'thePlayer' hors scénario) 3 m derrière le début d'un segment (0,25 m au-dessus) et recharge la collision si ignoreCollision est faux. Met à jour scenario.startingTransforms['scenario_player0'].
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:362
---@param reverse boolean|nil Départ à l'autre extrémité, dans le sens inverse.
---@param index integer|nil Indice du segment de départ (1 par défaut).
function util_trackBuilder_splineTrack.positionVehicle(reverse, index) end

--- Applique les changements de matériaux en attente (materialChanged) sur tous les segments.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:836
function util_trackBuilder_splineTrack.refreshAllMaterials() end

--- Supprime la pièce d'indice donné et décale les suivantes. Ignoré si la piste n'a que deux pièces ou si index <= 2.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1544
---@param index integer Indice de la pièce.
function util_trackBuilder_splineTrack.removeAt(index) end

--- Supprime une intersection (objet de scène compris) par son nom. Plante si le nom n'existe pas.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:197
---@param name string Nom de l'intersection.
function util_trackBuilder_splineTrack.removeIntersection(name) end

--- Supprime une sous-piste (meshes compris), décale les suivantes et renomme leurs meshes. Ne fait rien s'il n'y a qu'une sous-piste.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:104
---@param index integer Indice de la sous-piste.
function util_trackBuilder_splineTrack.removeSubTrack(index) end

--- Supprime la piste entière : cache les marqueurs, supprime meshes, obstacles procéduraux, marqueurs et intersections, remet l'état à une sous-piste vide.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1503
function util_trackBuilder_splineTrack.removeTrack() end

--- Renomme un fichier de piste dans trackEditor/ et affiche un message à l'UI.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2124
---@param oldName string Ancien nom (sans extension).
---@param newName string Nouveau nom.
function util_trackBuilder_splineTrack.rename(oldName, newName) end

--- Supprime la dernière pièce (il en reste au moins deux).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1539
function util_trackBuilder_splineTrack.revert() end

--- Oriente la piste dans la direction de la caméra libre. Renvoie false si la caméra n'est pas libre.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:410
---@return boolean  Succès.
function util_trackBuilder_splineTrack.rotateTrackToCamera() end

--- Oriente la piste selon la direction du véhicule joueur. Renvoie false sans véhicule.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:434
---@return boolean  Succès.
function util_trackBuilder_splineTrack.rotateTrackToTrackVehicle() end

--- Fonction auxiliaire : renvoie q * v.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1727
---@param v vec3 Vecteur.
---@param q quat Rotation.
---@return vec3  Vecteur tourné.
function util_trackBuilder_splineTrack.rotateVectorByQuat(v, q) end

--- Exporte la piste, y ajoute version, auteur (plaque du véhicule joueur), date, longueur, niveau (saveForThisMap), environnement (saveEnvironment), difficulté (37 par défaut) et description, puis l'écrit dans trackEditor/<nom>.json. Un nom vide produit un nom daté AAAA-MM-JJ_HH-MM-SS. Un nom nil ne sérialise pas.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:2062
---@param filename string|nil Nom de fichier sans extension, '' pour un nom daté, nil pour ne pas écrire.
---@param saveOptions table|nil {saveForThisMap, saveEnvironment, difficulty, description}.
---@return table  Table exportée.
---@return string|nil  Nom utilisé si un fichier a été écrit.
function util_trackBuilder_splineTrack.save(filename, saveOptions) end

--- Régénère immédiatement en qualité 1 tous les segments de la sous-piste courante qui ne l'étaient pas.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:772
function util_trackBuilder_splineTrack.setAllPiecesHighQuality() end

--- Définit le nombre de tours par défaut enregistré avec la piste.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:468
---@param laps integer Nombre de tours.
function util_trackBuilder_splineTrack.setDefaultLaps(laps) end

--- Active ou non la haute qualité ; marque tous les segments dont la qualité diffère pour régénération (quality 1 ou 4).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:527
---@param hq boolean Haute qualité.
function util_trackBuilder_splineTrack.setHighQuality(hq) end

--- Change les matériaux d'une intersection.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:205
---@param name string Nom de l'intersection.
---@param center string|nil Matériau du centre.
---@param border string|nil Matériau de la bordure.
function util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border) end

--- Change le profil de bordure d'une intersection en la recréant.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:213
---@param name string Nom de l'intersection.
---@param mesh string Nom de profil (voir basicBorders).
function util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh) end

--- Change le matériau d'un champ (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) d'un segment ; avec fill, étend le changement aux segments voisins qui avaient le même matériau.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:988
---@param index integer Indice du segment.
---@param sub integer|nil Sous-piste.
---@param field string Nom du champ de matériau.
---@param material string Nom du matériau.
---@param fill boolean|nil Étendre aux voisins.
---@return boolean  true si quelque chose a changé.
function util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill) end

--- Change le profil (centerMesh, leftMesh, rightMesh) d'un segment ; avec fill, étend aux segments voisins identiques.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1026
---@param index integer Indice du segment.
---@param field string Champ de profil.
---@param mesh string Nom du profil.
---@param fill boolean|nil Étendre aux voisins.
---@return boolean  true si quelque chose a changé.
function util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill) end

--- Indique si la piste peut être parcourue en sens inverse (enregistré avec la piste).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:472
---@param rev boolean Piste réversible.
function util_trackBuilder_splineTrack.setReversible(rev) end

--- Applique à chaque sous-mesh du segment son matériau (ou 'track_editor_grid' si sélectionné).
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1070
---@param segment table Segment avec points, mesh et submeshIndexes.
function util_trackBuilder_splineTrack.setSegmentMaterial(segment) end

--- Définit la position de l'origine de la sous-piste (x et y en unités de grille, z en mètres) et, si hdg est donné, son cap en degrés ; recalcule les vecteurs unitaires et invalide toutes les pièces.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:446
---@param x number x en unités de grille.
---@param y number y en unités de grille.
---@param z number Altitude en mètres.
---@param hdg number|nil Cap en degrés.
---@param sub integer|nil Sous-piste (courante par défaut).
function util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub) end

--- Affiche (création + placement) ou cache tous les marqueurs d'édition et le marqueur de piste.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:684
---@param show boolean Afficher les marqueurs.
function util_trackBuilder_splineTrack.showMarkers(show) end

--- Aligne un point sur la grille triangulaire (pas de sqrt(3)/2 et 0,5) de la piste, en conservant z.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1078
---@param point vec3 Point à aligner.
---@return vec3  Point aligné.
function util_trackBuilder_splineTrack.snapToGrid(point) end

--- Change la sous-piste courante ; l'initialise si elle n'existe pas.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:96
---@param index integer Indice de la sous-piste.
function util_trackBuilder_splineTrack.switchSubTrack(index) end

--- Transforme les pièces invalides de subPieces en segments de subTracks (supprime les anciens meshes et obstacles) à l'aide de pieces.toSegment, et initialise meshInfo, markerInfo et les champs de marqueurs hérités.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1329
function util_trackBuilder_splineTrack.toSegments() end

--- Réinitialise tous les champs du module (pistes, pièces, intersections, marqueurs, obstacles) sans supprimer les objets de scène, force highQuality à true, markersShown à false et recharge la collision.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:1487
function util_trackBuilder_splineTrack.unloadAll() end

--- Désélectionne tous les segments de toutes les sous-pistes et marque leurs matériaux à rafraîchir.
---Source : lua/ge/extensions/util/trackBuilder/splineTrack.lua:634
function util_trackBuilder_splineTrack.unselectAll() end


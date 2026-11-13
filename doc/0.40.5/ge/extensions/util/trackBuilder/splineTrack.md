# `util_trackBuilder_splineTrack`

*Fichier : `lua/ge/extensions/util/trackBuilder/splineTrack.lua` · VM : Game Engine (GE) · 2295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_splineTrack` : `extensions.load("util_trackBuilder_splineTrack")`, puis la globale `util_trackBuilder_splineTrack`

Cœur du Track Builder (éditeur de pistes procédurales). Le module garde deux niveaux de données par sous-piste : subPieces (description abstraite : liste de pièces avec leurs marqueurs bank, height, width, checkpoint, murs, plafond, matériaux, obstacles) et subTracks (segments concrets avec points, mesh, markerInfo). Il convertit les pièces en segments (toSegments), calcule les points de Bézier, d'arc ou personnalisés, mesure la piste, interpole les marqueurs, génère les ProceduralMesh via segmentToProceduralMesh, place marqueurs et obstacles, gère les intersections multi-pistes, les checkpoints de scénario, la sauvegarde et le chargement en JSON (dossier trackEditor/) et le positionnement du véhicule. Il est piloté par l'application UI du Track Builder et par quickraceSetup.

## Exemple

```lua
extensions.load('util_trackBuilder_splineTrack')
local st = util_trackBuilder_splineTrack
st.addCurve(4, 0, 1)
st.addForward(6)
st.makeTrack(true)
st.save('maPiste')
```

## Remarques

- L'échelle : gridScale = 4 m par unité de grille en x et y, heightScale = 1 pour z. Les positions de pièces sont en unités de grille ; les points du segment en mètres. Les angles de setTrackPosition sont en degrés, ceux des pièces en radians.
- Chargement du module : la dernière ligne exécute M.initTrack(), qui crée une piste initiale (pièce 'init' + addForward(3)) et la positionne devant la caméra libre, au-dessus du véhicule, ou en (0, 0, 15). Dans le niveau glow_city elle est placée en (50, -50, 250).
- Qualité : quality 1 = haute, 4 = basse (1 point sur 4). Après makeTrack(false), les segments sont d'abord en basse qualité puis améliorés un par un par onUpdate (timer de 0,25 s + 0,1 s par segment) ; makeTrack(true) génère tout en haute qualité et recharge la collision.
- Les fichiers de piste sont lus et écrits dans 'trackEditor/<nom>.json' (Documents/BeamNG) ; le format a le champ version = '1.1'.
- Bug probable : load() lit mesher.settings.LUTDetail, mais segmentToProceduralMesh exporte settings = nil ; l'indexation de nil provoque une erreur dès qu'une piste est effectivement chargée.
- Bug : dans load(), la branche finale 'Could not find file…' concatène la variable filename, qui n'existe pas à cet endroit (nil), et lève une erreur quand le fichier est introuvable (un nom de table n'est pas concerné).
- Bug : getLastPieceWithMarker utilise #track alors que 'track' n'est pas défini ; sans argument lastIndex la fonction échoue.
- Bug : positionVehicle teste une variable 'closed' non définie (nil, la variable réelle est trackClosed) : en mode reverse, le véhicule est toujours placé au dernier segment.
- Bug : focusMarkerOn ne déplace la caméra que si M.camActivated est vrai ; ce champ n'est jamais défini ici (la variable locale camActivated n'est pas exportée), il vaut donc nil sauf si l'application l'écrit.
- Plusieurs champs exportés valent nil car leurs fonctions n'existent pas dans ce fichier : applyStack, clearStack, getStackCount, stack, stackToCursor (code de pile commenté), saveHistory, setAllPiecesToAsphalt, interpolateSegment, interpolateField, getHdgVector, initialTrackPiece, forward, curve, offsetCurve, spiral, fresnelSC, loop, emptyOffset. M.deepcopy est également nil (fonction commentée).
- convertToSpline assigne deux fois markerInfo.basePosition : la valeur issue du dernier point est écrasée par segment.position * vectorScale.
- Message UI : guihooks.trigger('Message', {ttl, msg, category, icon}) à la sauvegarde, au chargement et au renommage.
- scénario : addCheckPointPositions et positionVehicle s'appuient sur scenario_scenarios.getScenario() (lapConfig, nodes, startingTransforms['scenario_player0']).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_splineTrack.addCheckPointPositions(reverse)` | Crée des checkpoints (BeamNGWaypoint 'gym_<n>') régulièrement répartis sur la piste (un tous les 300 m environ, au moins 3) ou aux segments marqués hasCheckPoint, et les enregistre dans scenario.lapConfig et scenario.nodes. Réinitialise lapConfig et nodes du scénario courant. | 262 |
| `util_trackBuilder_splineTrack.addClosingPiece()` | Ferme la piste : ajoute une pièce freeBezier absolue vers le point de départ et copie bank, width et height de la première pièce. Ne fait rien si la piste est déjà fermée. | 1092 |
| `util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace)` | Ajoute un virage hexagonal ('hexCurve'). | 1604 |
| `util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace)` | Ajoute un déplacement sans géométrie ('hexEmptyOffset'). | 1608 |
| `util_trackBuilder_splineTrack.addForward(len, index, replace)` | Ajoute une ligne droite ('freeForward'). | 1603 |
| `util_trackBuilder_splineTrack.addLoop(rad, off, index, replace)` | Ajoute un looping hexagonal ('hexLoop'). | 1607 |
| `util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace)` | Ajoute une courbe en S hexagonale ('hexOffsetCurve'). | 1605 |
| `util_trackBuilder_splineTrack.addPiece(params, index, replace)` | Ajoute (ou remplace) une pièce dans subPieces à l'indice donné, l'invalide et invalide les pièces concernées. Avec replace, conserve les marqueurs, profils, matériaux et obstacles de la pièce remplacée ; sinon les profils sont copiés de la pièce précédente (défaut 'regular'). | 1611 |
| `util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace)` | Ajoute une spirale hexagonale ('hexSpiral'). | 1606 |
| `util_trackBuilder_splineTrack.calculateCustomPoints(piece)` | Met à l'échelle et tourne les points personnalisés d'une pièce (loopings). Renvoie nil sans customPoints. | 1263 |
| `util_trackBuilder_splineTrack.convertToSpline()` | Pour chaque segment invalide, calcule rotation et points (Bézier, arc ou personnalisés), marque les premiers et derniers points comme toujours présents, fixe markerInfo.basePosition ; détermine ensuite si la piste est fermée (début et fin à moins de 0,1 unité). | 1111 |
| `util_trackBuilder_splineTrack.createMarkers()` | Crée le marqueur de piste ('track_marker') s'il n'existe pas et place tous les marqueurs d'édition (markers.transformMarkers pour chaque type). | 703 |
| `util_trackBuilder_splineTrack.createNewSubTrack(position, hdg)` | Ajoute une nouvelle sous-piste à la position et au cap donnés (position divisée par gridScale), la rend courante et renvoie son indice. | 90 |
| `util_trackBuilder_splineTrack.exportTrackToTable()` | Exporte la piste en table Lua simple (sous-pistes, positions, pièces, matériaux, matériaux de champs de materialUtil, intersections, tours, réversible, fermée). | 1736 |
| `util_trackBuilder_splineTrack.focusCameraOn(index, distance, force)` | Déplace en douceur (0,3 s, via cameraTransition) la caméra libre pour regarder le segment index à la distance donnée. | 616 |
| `util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force)` | Place le marqueur de piste sur le segment index, le sélectionne (matériau 'track_editor_grid') et, si M.camActivated est vrai, recentre la caméra. Affiche les marqueurs s'ils sont cachés. | 645 |
| `util_trackBuilder_splineTrack.getAllCheckpoints()` | Liste les segments portant un checkpoint fixe. | 347 |
| `util_trackBuilder_splineTrack.getArcPoints(segment)` | Calcule les points d'un arc de cercle (polyMult * pointsMultiplier points, 300 au plus). | 1175 |
| `util_trackBuilder_splineTrack.getBezierPoints(segment)` | Calcule les points d'une courbe de Bézier cubique entre origin et position (échelle de grille appliquée) avec les points de contrôle du segment. | 1209 |
| `util_trackBuilder_splineTrack.getCustomTracks()` | Liste les pistes JSON de trackEditor/ utilisant le format actuel (champ version présent). | 2137 |
| `util_trackBuilder_splineTrack.getEndOfTrack()` | Renvoie le dernier segment de la sous-piste courante. | 1534 |
| `util_trackBuilder_splineTrack.getIntersection(name)` | Renvoie la table d'une intersection par son nom. | 222 |
| `util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex)` | Renvoie le dernier segment (à partir de lastIndex en remontant) qui possède le marqueur donné. Voir notes : plante sans lastIndex. | 493 |
| `util_trackBuilder_splineTrack.getPieceInfo(index, sub)` | Avec index : renvoie la pièce abstraite. Sans index : renvoie l'état global de l'éditeur (pièces, qualité, marqueurs affichés, position, sélection, piste fermée, tours, réversible, indice de sous-piste). | 502 |
| `util_trackBuilder_splineTrack.getPreviewNames()` | Liste les noms des images .png et .jpg de trackEditor/ (aperçus). Les deux boucles écrivent dans les mêmes indices : les jpg écrasent les png (bug). | 2158 |
| `util_trackBuilder_splineTrack.getSegmentInfo(index, sub)` | Renvoie le segment concret (points, mesh, markerInfo) d'indice donné. | 521 |
| `util_trackBuilder_splineTrack.getSelectedTrackInfo()` | Renvoie le segment actuellement sélectionné. | 608 |
| `util_trackBuilder_splineTrack.getTrackPosition()` | Renvoie la position et le cap de la sous-piste courante. | 477 |
| `util_trackBuilder_splineTrack.importTrackFromTable(import)` | Remplace la piste actuelle par celle de la table (format 1.0 ou 1.1) : reconstruit les sous-pistes, convertit les obstacles en vec3/quat, applique les matériaux, invalide toutes les pièces, et restaure l'heure du jour et le brouillard si le niveau correspond. | 1902 |
| `util_trackBuilder_splineTrack.initTrack(noUnload)` | (Ré)initialise la sous-piste courante : décharge tout (sauf noUnload), crée la pièce 'init' avec les matériaux 'track_editor_A_*' (G sur glow_city), positionne la piste puis ajoute un addForward(3). | 1429 |
| `util_trackBuilder_splineTrack.invalidatePiece(index, types, force)` | Enregistre qu'une pièce doit être recalculée pour un type de marqueur donné, ou pour tous si types est nil (markers.addMarkerChange). | 1317 |
| `util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol)` | Charge une piste depuis le fichier trackEditor/<nom>.json ou depuis une table, la construit en haute qualité (makeTrack(true)) pour chaque sous-piste, recrée les intersections et affiche un message à l'UI sauf si silent. increasePointMult multiplie le nombre de points par 1,5 pendant la construction. | 1984 |
| `util_trackBuilder_splineTrack.loadJSON(originalFilename)` | Lit seulement le JSON d'une piste (pour connaître longueur, auteur, etc.) sans la construire. | 2045 |
| `util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision)` | Génère les meshes de la piste : toSegments, convertToSpline, measureTrack, caps, interpolation des marqueurs, rotation finale des points, regénération des meshes à rafraîchir, marqueurs, obstacles. Recharge la collision si instantHighQuality est vrai et ignoreCollision faux. | 848 |
| `util_trackBuilder_splineTrack.markerChange(type, index, value)` | Modifie un marqueur (bank, height, width, checkpoint, murs, plafond, obstacles…) d'une pièce et l'invalide ; value nil le supprime. Interdit le checkpoint sur la première pièce. Sur une piste fermée, applique aussi le changement à la première pièce. | 737 |
| `util_trackBuilder_splineTrack.measureTrack()` | Calcule startLength, endLength et la longueur cumulée de chaque point, à partir du dernier segment valide, pour les segments invalides. | 1291 |
| `util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)` | Crée une intersection (raccord de plusieurs extrémités de segments) avec multiTrackMerger et la mémorise ; les matériaux par défaut viennent du premier segment. Le nom de l'intersection est 'procMerger-…'. | 173 |
| `util_trackBuilder_splineTrack.onClientEndMission()` | Hook appelé à la fin du niveau : appelle unloadAll pour oublier la piste. *(interne)* *(hook)* | 2172 |
| `util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata)` | Hook appelé quand des métadonnées de capture d'écran sont collectées ; corps entièrement commenté, donc sans effet. *(interne)* *(hook)* | 2179 |
| `util_trackBuilder_splineTrack.onPreRender(dt)` | Hook appelé avant le rendu ; relaie à cameraTransition.onPreRender(dt). *(interne)* *(hook)* | 2281 |
| `util_trackBuilder_splineTrack.onUpdate()` | Hook appelé à chaque frame. Si la haute qualité et les marqueurs sont actifs, décompte (pas fixe de 0,01) le timer des segments en basse qualité et les régénère un par un en qualité 1. *(interne)* *(hook)* | 787 |
| `util_trackBuilder_splineTrack.positionTrackAboveVehicle()` | Place l'origine de la piste 15 m au-dessus du véhicule joueur. Renvoie false s'il n'y a pas de véhicule. | 422 |
| `util_trackBuilder_splineTrack.positionTrackBeforeCamera()` | Place l'origine de la piste 15 m devant la caméra. Renvoie false si la caméra n'est pas libre. | 395 |
| `util_trackBuilder_splineTrack.positionVehicle(reverse, index)` | Place le véhicule du joueur (ou 'thePlayer' hors scénario) 3 m derrière le début d'un segment (0,25 m au-dessus) et recharge la collision si ignoreCollision est faux. Met à jour scenario.startingTransforms['scenario_player0']. | 362 |
| `util_trackBuilder_splineTrack.refreshAllMaterials()` | Applique les changements de matériaux en attente (materialChanged) sur tous les segments. | 836 |
| `util_trackBuilder_splineTrack.removeAt(index)` | Supprime la pièce d'indice donné et décale les suivantes. Ignoré si la piste n'a que deux pièces ou si index <= 2. | 1544 |
| `util_trackBuilder_splineTrack.removeIntersection(name)` | Supprime une intersection (objet de scène compris) par son nom. Plante si le nom n'existe pas. | 197 |
| `util_trackBuilder_splineTrack.removeSubTrack(index)` | Supprime une sous-piste (meshes compris), décale les suivantes et renomme leurs meshes. Ne fait rien s'il n'y a qu'une sous-piste. | 104 |
| `util_trackBuilder_splineTrack.removeTrack()` | Supprime la piste entière : cache les marqueurs, supprime meshes, obstacles procéduraux, marqueurs et intersections, remet l'état à une sous-piste vide. | 1503 |
| `util_trackBuilder_splineTrack.rename(oldName, newName)` | Renomme un fichier de piste dans trackEditor/ et affiche un message à l'UI. | 2124 |
| `util_trackBuilder_splineTrack.revert()` | Supprime la dernière pièce (il en reste au moins deux). | 1539 |
| `util_trackBuilder_splineTrack.rotateTrackToCamera()` | Oriente la piste dans la direction de la caméra libre. Renvoie false si la caméra n'est pas libre. | 410 |
| `util_trackBuilder_splineTrack.rotateTrackToTrackVehicle()` | Oriente la piste selon la direction du véhicule joueur. Renvoie false sans véhicule. | 434 |
| `util_trackBuilder_splineTrack.rotateVectorByQuat(v, q)` | Fonction auxiliaire : renvoie q * v. | 1727 |
| `util_trackBuilder_splineTrack.save(filename, saveOptions)` | Exporte la piste, y ajoute version, auteur (plaque du véhicule joueur), date, longueur, niveau (saveForThisMap), environnement (saveEnvironment), difficulté (37 par défaut) et description, puis l'écrit dans trackEditor/<nom>.json. Un nom vide produit un nom daté AAAA-MM-JJ_HH-MM-SS. Un nom nil ne sérialise pas. | 2062 |
| `util_trackBuilder_splineTrack.setAllPiecesHighQuality()` | Régénère immédiatement en qualité 1 tous les segments de la sous-piste courante qui ne l'étaient pas. | 772 |
| `util_trackBuilder_splineTrack.setDefaultLaps(laps)` | Définit le nombre de tours par défaut enregistré avec la piste. | 468 |
| `util_trackBuilder_splineTrack.setHighQuality(hq)` | Active ou non la haute qualité ; marque tous les segments dont la qualité diffère pour régénération (quality 1 ou 4). | 527 |
| `util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border)` | Change les matériaux d'une intersection. | 205 |
| `util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh)` | Change le profil de bordure d'une intersection en la recréant. | 213 |
| `util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill)` | Change le matériau d'un champ (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) d'un segment ; avec fill, étend le changement aux segments voisins qui avaient le même matériau. | 988 |
| `util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill)` | Change le profil (centerMesh, leftMesh, rightMesh) d'un segment ; avec fill, étend aux segments voisins identiques. | 1026 |
| `util_trackBuilder_splineTrack.setReversible(rev)` | Indique si la piste peut être parcourue en sens inverse (enregistré avec la piste). | 472 |
| `util_trackBuilder_splineTrack.setSegmentMaterial(segment)` | Applique à chaque sous-mesh du segment son matériau (ou 'track_editor_grid' si sélectionné). | 1070 |
| `util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub)` | Définit la position de l'origine de la sous-piste (x et y en unités de grille, z en mètres) et, si hdg est donné, son cap en degrés ; recalcule les vecteurs unitaires et invalide toutes les pièces. | 446 |
| `util_trackBuilder_splineTrack.showMarkers(show)` | Affiche (création + placement) ou cache tous les marqueurs d'édition et le marqueur de piste. | 684 |
| `util_trackBuilder_splineTrack.snapToGrid(point)` | Aligne un point sur la grille triangulaire (pas de sqrt(3)/2 et 0,5) de la piste, en conservant z. | 1078 |
| `util_trackBuilder_splineTrack.switchSubTrack(index)` | Change la sous-piste courante ; l'initialise si elle n'existe pas. | 96 |
| `util_trackBuilder_splineTrack.toSegments()` | Transforme les pièces invalides de subPieces en segments de subTracks (supprime les anciens meshes et obstacles) à l'aide de pieces.toSegment, et initialise meshInfo, markerInfo et les champs de marqueurs hérités. | 1329 |
| `util_trackBuilder_splineTrack.unloadAll()` | Réinitialise tous les champs du module (pistes, pièces, intersections, marqueurs, obstacles) sans supprimer les objets de scène, force highQuality à true, markersShown à false et recharge la collision. | 1487 |
| `util_trackBuilder_splineTrack.unselectAll()` | Désélectionne tous les segments de toutes les sous-pistes et marque leurs matériaux à rafraîchir. | 634 |

### Détail des paramètres

#### `util_trackBuilder_splineTrack.addCheckPointPositions(reverse)`

Crée des checkpoints (BeamNGWaypoint 'gym_<n>') régulièrement répartis sur la piste (un tous les 300 m environ, au moins 3) ou aux segments marqués hasCheckPoint, et les enregistre dans scenario.lapConfig et scenario.nodes. Réinitialise lapConfig et nodes du scénario courant.

- `reverse` (*boolean|nil*) : Parcours dans le sens inverse.

#### `util_trackBuilder_splineTrack.addCurve(len, hardness, dir, index, replace)`

Ajoute un virage hexagonal ('hexCurve').

- `len` (*number*) : Taille du virage.
- `hardness` (*number*) : Dureté.
- `dir` (*number*) : Sens : 1 ou -1.
- `index` (*integer|nil*) : Position d'insertion.
- `replace` (*boolean|nil*) : Remplacer.

#### `util_trackBuilder_splineTrack.addEmptyOffset(xOff, yOff, zOff, dirOff, absolute, index, replace)`

Ajoute un déplacement sans géométrie ('hexEmptyOffset').

- `xOff` (*number*) : Décalage latéral.
- `yOff` (*number*) : Décalage avant.
- `zOff` (*number*) : Décalage vertical.
- `dirOff` (*number*) : Rotation en pas.
- `absolute` (*boolean|nil*) : Relatif à l'origine de la piste.
- `index` (*integer|nil*) : Position d'insertion.
- `replace` (*boolean|nil*) : Remplacer.

#### `util_trackBuilder_splineTrack.addForward(len, index, replace)`

Ajoute une ligne droite ('freeForward').

- `len` (*number*) : Longueur.
- `index` (*integer|nil*) : Position d'insertion (fin par défaut).
- `replace` (*boolean|nil*) : Remplacer la pièce à cet indice.

#### `util_trackBuilder_splineTrack.addLoop(rad, off, index, replace)`

Ajoute un looping hexagonal ('hexLoop').

- `rad` (*number*) : Rayon.
- `off` (*number*) : Décalage latéral.
- `index` (*integer|nil*) : Position d'insertion.
- `replace` (*boolean|nil*) : Remplacer.

#### `util_trackBuilder_splineTrack.addOffsetCurve(len, off, hardness, index, replace)`

Ajoute une courbe en S hexagonale ('hexOffsetCurve').

- `len` (*number*) : Longueur.
- `off` (*number*) : Décalage latéral.
- `hardness` (*number*) : Dureté.
- `index` (*integer|nil*) : Position d'insertion.
- `replace` (*boolean|nil*) : Remplacer.

#### `util_trackBuilder_splineTrack.addPiece(params, index, replace)`

Ajoute (ou remplace) une pièce dans subPieces à l'indice donné, l'invalide et invalide les pièces concernées. Avec replace, conserve les marqueurs, profils, matériaux et obstacles de la pièce remplacée ; sinon les profils sont copiés de la pièce précédente (défaut 'regular').

- `params` (*table*) : Description de la pièce (champ piece = nom du type, plus ses paramètres ; voir pieces.toSegment).
- `index` (*integer|nil*) : Position d'insertion (fin par défaut).
- `replace` (*boolean|nil*) : Remplacer la pièce existante.

#### `util_trackBuilder_splineTrack.addSpiral(size, inside, dir, index, replace)`

Ajoute une spirale hexagonale ('hexSpiral').

- `size` (*number*) : Taille.
- `inside` (*boolean*) : Vers l'intérieur.
- `dir` (*number*) : Sens : 1 ou -1.
- `index` (*integer|nil*) : Position d'insertion.
- `replace` (*boolean|nil*) : Remplacer.

#### `util_trackBuilder_splineTrack.calculateCustomPoints(piece)`

Met à l'échelle et tourne les points personnalisés d'une pièce (loopings). Renvoie nil sans customPoints.

- `piece` (*table*) : Pièce avec customPoints, position et hdg.
- **renvoie** : table[]|nil Points {position, rot, quality}.

#### `util_trackBuilder_splineTrack.createNewSubTrack(position, hdg)`

Ajoute une nouvelle sous-piste à la position et au cap donnés (position divisée par gridScale), la rend courante et renvoie son indice.

- `position` (*vec3*) : Position monde en mètres.
- `hdg` (*number*) : Cap en degrés.
- **renvoie** : integer Indice de la nouvelle sous-piste.

#### `util_trackBuilder_splineTrack.exportTrackToTable()`

Exporte la piste en table Lua simple (sous-pistes, positions, pièces, matériaux, matériaux de champs de materialUtil, intersections, tours, réversible, fermée).

- **renvoie** : table Table exportable en JSON.

#### `util_trackBuilder_splineTrack.focusCameraOn(index, distance, force)`

Déplace en douceur (0,3 s, via cameraTransition) la caméra libre pour regarder le segment index à la distance donnée.

- `index` (*integer*) : Indice du segment.
- `distance` (*number|nil*) : Distance (camDistance par défaut).
- `force` (*boolean|nil*) : Refait la transition même si le segment est déjà celui de la dernière fois.

#### `util_trackBuilder_splineTrack.focusMarkerOn(index, dontRefresMaterial, force)`

Place le marqueur de piste sur le segment index, le sélectionne (matériau 'track_editor_grid') et, si M.camActivated est vrai, recentre la caméra. Affiche les marqueurs s'ils sont cachés.

- `index` (*integer*) : Indice du segment.
- `dontRefresMaterial` (*boolean|nil*) : Ne change pas les matériaux de sélection.
- `force` (*boolean|nil*) : Forcer le recentrage de la caméra.

#### `util_trackBuilder_splineTrack.getAllCheckpoints()`

Liste les segments portant un checkpoint fixe.

- **renvoie** : table[] Éléments {segmentIndex, checkpointSize, checkpointPosition}.

#### `util_trackBuilder_splineTrack.getArcPoints(segment)`

Calcule les points d'un arc de cercle (polyMult * pointsMultiplier points, 300 au plus).

- `segment` (*table*) : Segment de type 'arc' (position, hdg, direction, angle, radius).
- **renvoie** : table[] Points {position, rot, quality}.

#### `util_trackBuilder_splineTrack.getBezierPoints(segment)`

Calcule les points d'une courbe de Bézier cubique entre origin et position (échelle de grille appliquée) avec les points de contrôle du segment.

- `segment` (*table*) : Segment de type 'bezier'.
- **renvoie** : table[] Points {position, rot, quality, …}.

#### `util_trackBuilder_splineTrack.getCustomTracks()`

Liste les pistes JSON de trackEditor/ utilisant le format actuel (champ version présent).

- **renvoie** : string[] Noms de pistes.

#### `util_trackBuilder_splineTrack.getEndOfTrack()`

Renvoie le dernier segment de la sous-piste courante.

- **renvoie** : table|nil Segment.

#### `util_trackBuilder_splineTrack.getIntersection(name)`

Renvoie la table d'une intersection par son nom.

- `name` (*string*) : Nom de l'intersection.
- **renvoie** : table|nil {segments, centerMat, borderMat, borderMesh, name, obj}.

#### `util_trackBuilder_splineTrack.getLastPieceWithMarker(markerName, lastIndex)`

Renvoie le dernier segment (à partir de lastIndex en remontant) qui possède le marqueur donné. Voir notes : plante sans lastIndex.

- `markerName` (*string*) : Nom du marqueur.
- `lastIndex` (*integer*) : Indice de départ.
- **renvoie** : table|nil Segment trouvé.

#### `util_trackBuilder_splineTrack.getPieceInfo(index, sub)`

Avec index : renvoie la pièce abstraite. Sans index : renvoie l'état global de l'éditeur (pièces, qualité, marqueurs affichés, position, sélection, piste fermée, tours, réversible, indice de sous-piste).

- `index` (*integer|nil*) : Indice de la pièce.
- `sub` (*integer|nil*) : Sous-piste (courante par défaut).
- **renvoie** : table Pièce ou état global.

#### `util_trackBuilder_splineTrack.getPreviewNames()`

Liste les noms des images .png et .jpg de trackEditor/ (aperçus). Les deux boucles écrivent dans les mêmes indices : les jpg écrasent les png (bug).

- **renvoie** : string[] Noms d'aperçus.

#### `util_trackBuilder_splineTrack.getSegmentInfo(index, sub)`

Renvoie le segment concret (points, mesh, markerInfo) d'indice donné.

- `index` (*integer*) : Indice du segment.
- `sub` (*integer|nil*) : Sous-piste.
- **renvoie** : table|nil Segment.

#### `util_trackBuilder_splineTrack.getSelectedTrackInfo()`

Renvoie le segment actuellement sélectionné.

- **renvoie** : table|nil Segment sélectionné.

#### `util_trackBuilder_splineTrack.getTrackPosition()`

Renvoie la position et le cap de la sous-piste courante.

- **renvoie** : table {x, y, z, hdg, unitX, unitY}.

#### `util_trackBuilder_splineTrack.importTrackFromTable(import)`

Remplace la piste actuelle par celle de la table (format 1.0 ou 1.1) : reconstruit les sous-pistes, convertit les obstacles en vec3/quat, applique les matériaux, invalide toutes les pièces, et restaure l'heure du jour et le brouillard si le niveau correspond.

- `import` (*table*) : Table au format exporté par exportTrackToTable/save.

#### `util_trackBuilder_splineTrack.initTrack(noUnload)`

(Ré)initialise la sous-piste courante : décharge tout (sauf noUnload), crée la pièce 'init' avec les matériaux 'track_editor_A_*' (G sur glow_city), positionne la piste puis ajoute un addForward(3).

- `noUnload` (*boolean|nil*) : Ne pas appeler unloadAll.

#### `util_trackBuilder_splineTrack.invalidatePiece(index, types, force)`

Enregistre qu'une pièce doit être recalculée pour un type de marqueur donné, ou pour tous si types est nil (markers.addMarkerChange).

- `index` (*integer*) : Indice de la pièce.
- `types` (*string|nil*) : Type de marqueur.
- `force` (*boolean|nil*) : Non utilisé dans le code.

#### `util_trackBuilder_splineTrack.load(originalFilename, instantHighQuality, increasePointMult, clearShapes, silent, ignoreCol)`

Charge une piste depuis le fichier trackEditor/<nom>.json ou depuis une table, la construit en haute qualité (makeTrack(true)) pour chaque sous-piste, recrée les intersections et affiche un message à l'UI sauf si silent. increasePointMult multiplie le nombre de points par 1,5 pendant la construction.

- `originalFilename` (*string|table*) : Nom de la piste (sans extension) ou table déjà lue.
- `instantHighQuality` (*boolean|nil*) : Non utilisé dans le code (déduit du code).
- `increasePointMult` (*boolean|nil*) : Augmente la densité de points (sauf si read.keepPointMultiplier).
- `clearShapes` (*boolean|nil*) : Appelle mesher.clearShapes à la fin.
- `silent` (*boolean|nil*) : Pas de message UI.
- `ignoreCol` (*boolean|nil*) : Mémorise ignoreCollision : pas de rechargement de la collision.

#### `util_trackBuilder_splineTrack.loadJSON(originalFilename)`

Lit seulement le JSON d'une piste (pour connaître longueur, auteur, etc.) sans la construire.

- `originalFilename` (*string*) : Nom de la piste sans extension.
- **renvoie** : table|nil Contenu JSON ou nil.

#### `util_trackBuilder_splineTrack.makeTrack(instantHighQuality, ignoreCollision)`

Génère les meshes de la piste : toSegments, convertToSpline, measureTrack, caps, interpolation des marqueurs, rotation finale des points, regénération des meshes à rafraîchir, marqueurs, obstacles. Recharge la collision si instantHighQuality est vrai et ignoreCollision faux.

- `instantHighQuality` (*boolean|nil*) : Générer tout de suite en qualité 1.
- `ignoreCollision` (*boolean|nil*) : Ne pas recharger la collision (paramètre, masque la variable de module).

#### `util_trackBuilder_splineTrack.markerChange(type, index, value)`

Modifie un marqueur (bank, height, width, checkpoint, murs, plafond, obstacles…) d'une pièce et l'invalide ; value nil le supprime. Interdit le checkpoint sur la première pièce. Sur une piste fermée, applique aussi le changement à la première pièce.

- `type` (*string*) : Type de marqueur.
- `index` (*integer|nil*) : Indice de la pièce (dernière par défaut).
- `value` (*any*) : Valeur du marqueur (table {value, interpolation} pour bank/height/width).

#### `util_trackBuilder_splineTrack.mergeMultiTrack(segments, centerMat, borderMat, borderMesh)`

Crée une intersection (raccord de plusieurs extrémités de segments) avec multiTrackMerger et la mémorise ; les matériaux par défaut viennent du premier segment. Le nom de l'intersection est 'procMerger-…'.

- `segments` (*table[]*) : Liste de {segment, reverse, index, sub}.
- `centerMat` (*string|nil*) : Matériau du centre.
- `borderMat` (*string|nil*) : Matériau de la bordure.
- `borderMesh` (*string|nil*) : Profil de bordure.

#### `util_trackBuilder_splineTrack.onCollectScreenshotMetadata(metadata)`

Hook appelé quand des métadonnées de capture d'écran sont collectées ; corps entièrement commenté, donc sans effet.

- `metadata` (*table*) : Métadonnées de la capture.

#### `util_trackBuilder_splineTrack.onPreRender(dt)`

Hook appelé avant le rendu ; relaie à cameraTransition.onPreRender(dt).

- `dt` (*number*) : Temps écoulé (s).

#### `util_trackBuilder_splineTrack.positionTrackAboveVehicle()`

Place l'origine de la piste 15 m au-dessus du véhicule joueur. Renvoie false s'il n'y a pas de véhicule.

- **renvoie** : boolean Succès.

#### `util_trackBuilder_splineTrack.positionTrackBeforeCamera()`

Place l'origine de la piste 15 m devant la caméra. Renvoie false si la caméra n'est pas libre.

- **renvoie** : boolean Succès.

#### `util_trackBuilder_splineTrack.positionVehicle(reverse, index)`

Place le véhicule du joueur (ou 'thePlayer' hors scénario) 3 m derrière le début d'un segment (0,25 m au-dessus) et recharge la collision si ignoreCollision est faux. Met à jour scenario.startingTransforms['scenario_player0'].

- `reverse` (*boolean|nil*) : Départ à l'autre extrémité, dans le sens inverse.
- `index` (*integer|nil*) : Indice du segment de départ (1 par défaut).

#### `util_trackBuilder_splineTrack.removeAt(index)`

Supprime la pièce d'indice donné et décale les suivantes. Ignoré si la piste n'a que deux pièces ou si index <= 2.

- `index` (*integer*) : Indice de la pièce.

#### `util_trackBuilder_splineTrack.removeIntersection(name)`

Supprime une intersection (objet de scène compris) par son nom. Plante si le nom n'existe pas.

- `name` (*string*) : Nom de l'intersection.

#### `util_trackBuilder_splineTrack.removeSubTrack(index)`

Supprime une sous-piste (meshes compris), décale les suivantes et renomme leurs meshes. Ne fait rien s'il n'y a qu'une sous-piste.

- `index` (*integer*) : Indice de la sous-piste.

#### `util_trackBuilder_splineTrack.rename(oldName, newName)`

Renomme un fichier de piste dans trackEditor/ et affiche un message à l'UI.

- `oldName` (*string*) : Ancien nom (sans extension).
- `newName` (*string*) : Nouveau nom.

#### `util_trackBuilder_splineTrack.rotateTrackToCamera()`

Oriente la piste dans la direction de la caméra libre. Renvoie false si la caméra n'est pas libre.

- **renvoie** : boolean Succès.

#### `util_trackBuilder_splineTrack.rotateTrackToTrackVehicle()`

Oriente la piste selon la direction du véhicule joueur. Renvoie false sans véhicule.

- **renvoie** : boolean Succès.

#### `util_trackBuilder_splineTrack.rotateVectorByQuat(v, q)`

Fonction auxiliaire : renvoie q * v.

- `v` (*vec3*) : Vecteur.
- `q` (*quat*) : Rotation.
- **renvoie** : vec3 Vecteur tourné.

#### `util_trackBuilder_splineTrack.save(filename, saveOptions)`

Exporte la piste, y ajoute version, auteur (plaque du véhicule joueur), date, longueur, niveau (saveForThisMap), environnement (saveEnvironment), difficulté (37 par défaut) et description, puis l'écrit dans trackEditor/<nom>.json. Un nom vide produit un nom daté AAAA-MM-JJ_HH-MM-SS. Un nom nil ne sérialise pas.

- `filename` (*string|nil*) : Nom de fichier sans extension, '' pour un nom daté, nil pour ne pas écrire.
- `saveOptions` (*table|nil*) : {saveForThisMap, saveEnvironment, difficulty, description}.
- **renvoie** : table Table exportée.
- **renvoie** : string|nil Nom utilisé si un fichier a été écrit.

#### `util_trackBuilder_splineTrack.setDefaultLaps(laps)`

Définit le nombre de tours par défaut enregistré avec la piste.

- `laps` (*integer*) : Nombre de tours.

#### `util_trackBuilder_splineTrack.setHighQuality(hq)`

Active ou non la haute qualité ; marque tous les segments dont la qualité diffère pour régénération (quality 1 ou 4).

- `hq` (*boolean*) : Haute qualité.

#### `util_trackBuilder_splineTrack.setIntersectionMaterial(name, center, border)`

Change les matériaux d'une intersection.

- `name` (*string*) : Nom de l'intersection.
- `center` (*string|nil*) : Matériau du centre.
- `border` (*string|nil*) : Matériau de la bordure.

#### `util_trackBuilder_splineTrack.setIntersectionMesh(name, mesh)`

Change le profil de bordure d'une intersection en la recréant.

- `name` (*string*) : Nom de l'intersection.
- `mesh` (*string*) : Nom de profil (voir basicBorders).

#### `util_trackBuilder_splineTrack.setMaterial(index, sub, field, material, fill)`

Change le matériau d'un champ (centerMesh, leftMesh, rightMesh, leftWall, rightWall, ceilingMesh) d'un segment ; avec fill, étend le changement aux segments voisins qui avaient le même matériau.

- `index` (*integer*) : Indice du segment.
- `sub` (*integer|nil*) : Sous-piste.
- `field` (*string*) : Nom du champ de matériau.
- `material` (*string*) : Nom du matériau.
- `fill` (*boolean|nil*) : Étendre aux voisins.
- **renvoie** : boolean true si quelque chose a changé.

#### `util_trackBuilder_splineTrack.setMesh(index, field, mesh, fill)`

Change le profil (centerMesh, leftMesh, rightMesh) d'un segment ; avec fill, étend aux segments voisins identiques.

- `index` (*integer*) : Indice du segment.
- `field` (*string*) : Champ de profil.
- `mesh` (*string*) : Nom du profil.
- `fill` (*boolean|nil*) : Étendre aux voisins.
- **renvoie** : boolean true si quelque chose a changé.

#### `util_trackBuilder_splineTrack.setReversible(rev)`

Indique si la piste peut être parcourue en sens inverse (enregistré avec la piste).

- `rev` (*boolean*) : Piste réversible.

#### `util_trackBuilder_splineTrack.setSegmentMaterial(segment)`

Applique à chaque sous-mesh du segment son matériau (ou 'track_editor_grid' si sélectionné).

- `segment` (*table*) : Segment avec points, mesh et submeshIndexes.

#### `util_trackBuilder_splineTrack.setTrackPosition(x, y, z, hdg, sub)`

Définit la position de l'origine de la sous-piste (x et y en unités de grille, z en mètres) et, si hdg est donné, son cap en degrés ; recalcule les vecteurs unitaires et invalide toutes les pièces.

- `x` (*number*) : x en unités de grille.
- `y` (*number*) : y en unités de grille.
- `z` (*number*) : Altitude en mètres.
- `hdg` (*number|nil*) : Cap en degrés.
- `sub` (*integer|nil*) : Sous-piste (courante par défaut).

#### `util_trackBuilder_splineTrack.showMarkers(show)`

Affiche (création + placement) ou cache tous les marqueurs d'édition et le marqueur de piste.

- `show` (*boolean*) : Afficher les marqueurs.

#### `util_trackBuilder_splineTrack.snapToGrid(point)`

Aligne un point sur la grille triangulaire (pas de sqrt(3)/2 et 0,5) de la piste, en conservant z.

- `point` (*vec3*) : Point à aligner.
- **renvoie** : vec3 Point aligné.

#### `util_trackBuilder_splineTrack.switchSubTrack(index)`

Change la sous-piste courante ; l'initialise si elle n'existe pas.

- `index` (*integer*) : Indice de la sous-piste.

## Champs

| Champ | Type | Description |
|---|---|---|
| `applyStack` | nil | Toujours nil (code de pile commenté). ⚠ référence `applyStack` non définie dans le fichier (vaut probablement nil) |
| `camDistance` | number | Distance de la caméra au segment sélectionné lors de focusMarkerOn (80 par défaut). |
| `clearStack` | nil | Toujours nil (code de pile commenté). ⚠ référence `clearStack` non définie dans le fichier (vaut probablement nil) |
| `curve` | nil | Toujours nil (existe dans pieces). ⚠ référence `curve` non définie dans le fichier (vaut probablement nil) |
| `deepcopy` | nil | Toujours nil : la fonction est dans un bloc commenté. |
| `emptyOffset` | nil | Toujours nil (existe dans pieces). ⚠ référence `emptyOffset` non définie dans le fichier (vaut probablement nil) |
| `forward` | nil | Toujours nil (existe dans pieces). ⚠ référence `forward` non définie dans le fichier (vaut probablement nil) |
| `fresnelSC` | nil | Toujours nil (existe dans pieces). ⚠ référence `fresnelSC` non définie dans le fichier (vaut probablement nil) |
| `getHdgVector` | nil | Toujours nil : fonction non définie ici (existe dans pieces). ⚠ référence `getHdgVector` non définie dans le fichier (vaut probablement nil) |
| `getStackCount` | nil | Toujours nil (code de pile commenté). ⚠ référence `getStackCount` non définie dans le fichier (vaut probablement nil) |
| `initialTrackPiece` | nil | Toujours nil : fonction non définie ici (existe dans pieces). ⚠ référence `initialTrackPiece` non définie dans le fichier (vaut probablement nil) |
| `interpolateField` | nil | Toujours nil : fonction non définie. ⚠ référence `interpolateField` non définie dans le fichier (vaut probablement nil) |
| `interpolateSegment` | nil | Toujours nil : fonction non définie. ⚠ référence `interpolateSegment` non définie dans le fichier (vaut probablement nil) |
| `loop` | nil | Toujours nil (existe dans pieces). ⚠ référence `loop` non définie dans le fichier (vaut probablement nil) |
| `materialUtil` | table | Référence vers le module util_trackBuilder_materialUtil (gestion des matériaux A à H). |
| `offsetCurve` | nil | Toujours nil (existe dans pieces). ⚠ référence `offsetCurve` non définie dans le fichier (vaut probablement nil) |
| `saveHistory` | nil | Toujours nil (historique commenté). ⚠ référence `saveHistory` non définie dans le fichier (vaut probablement nil) |
| `setAllPiecesToAsphalt` | nil | Toujours nil : fonction non définie. ⚠ référence `setAllPiecesToAsphalt` non définie dans le fichier (vaut probablement nil) |
| `spiral` | nil | Toujours nil. ⚠ référence `spiral` non définie dans le fichier (vaut probablement nil) |
| `stack` | nil | Toujours nil (code de pile commenté). ⚠ référence `stack` non définie dans le fichier (vaut probablement nil) |
| `stackToCursor` | nil | Toujours nil (code de pile commenté). ⚠ référence `stackToCursor` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `Message`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`, `removeFile`, `renameFile`
- `be:` `reloadCollision`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/splineTrack.lua`.*

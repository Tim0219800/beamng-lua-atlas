# `editor_roadArchitect_profiles`

*Fichier : `lua/ge/extensions/editor/roadArchitect/profiles.lua` · VM : Game Engine (GE) · 3505 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_profiles` : `extensions.load("editor_roadArchitect_profiles")`, puis la globale `editor_roadArchitect_profiles`

Gestion des profils latéraux (coupes en travers) des routes de Road Architect. Un profil est une table indexée par numéro de voie : les clés négatives (-1 à -20) sont les voies de gauche, les clés positives (1 à 20) celles de droite, il n'y a pas de clé 0. Chaque voie a un type ('road_lane', 'sidewalk', 'shoulder', 'island'), une largeur et des hauteurs (champs width, heightL, heightR, ce sont des pointeurs ImGui à lire avec [0]). Le profil porte aussi des paramètres de style (condition d'usure, matériaux des lignes de peinture, fondus de bord, gouttière…) et un tableau layers de couches (peinture, décalques, usure). Le module charge les modèles de profil prédéfinis (fichiers roadArchitect/profiles/*.json : Rural, Urban, Hwy, Tracks, Barrier_Only, Lamps_Only…), fabrique les profils des jonctions, ajoute automatiquement les couches de peinture, d'usure et de fondu de bord, et sérialise/désérialise les profils vers JSON.

## Remarques

- La table publique M.profiles (tableau des profils chargés) est remplie par populateProfileTemplates(). Chaque profil a un champ name (ArrayChar ImGui de 32 caractères) et isDeletable (false pour les modèles prédéfinis).
- Pour les champs de profil ou de couche, la plupart des valeurs sont des pointeurs ImGui (im.FloatPtr, im.IntPtr, im.BoolPtr, im.ArrayChar) : lire avec [0] ou ffi.string pour les noms.
- isProfileValidForMidJctPerfect renvoie nil (return sans valeur) si le profil n'est pas symétrique, false pour les autres refus et true si valide : tester avec 'not' fonctionne dans les deux cas.
- getIdFromName compare name directement avec == aux champs name des profils, qui sont des ArrayChar ImGui ; le code ne les convertit pas en chaîne (comportement de la comparaison chaîne/ArrayChar non vérifié ici). roads.createRoadFromTemplate passe pourtant une chaîne à createProfileFromTemplate.
- getNumRoadLanesLR compte les voies 'road_lane' et 'shoulder' (pas les trottoirs ni îlots) alors que getNumLanesLR compte toutes les voies.
- Les fonctions createProfileForJctRoad* produisent les profils utilisés par les jonctions générées (carrefours, T, Y, ronds-points, jonctions d'autoroute). Elles remplissent les champs de style par défaut (condition 0.2, graine 41226, 10 rustines) et appellent autoPaintLines et/ou autoEdgeBlending.
- load() et save() passent par editor_fileDialog (filtre .json) ; le fichier contient { profile = ... }. loadPrefabProfile (interne) retire l'extension du nom.
- updateCondition suit les couches non persistantes : toute couche dont doNotDelete[0] est faux est supprimée avant régénération, puis les couches d'usure (tread, fissures, dégâts, rustines, nids-de-poule, selon prof.class 'urban'/'highway' ou autre) sont recréées avec math.randomseed(prof.conditionSeed[0]), donc de façon reproductible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_profiles.addCenterline(p, isPaint)` | Ajoute au profil une couche de ligne centrale (matériau p.centerlineMat, largeur 0.4) pour chaque section de voies de route à double sens (les sections à sens unique n'en reçoivent pas). | 134 |
| `editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint)` | Ajoute les lignes de bord de chaussée (largeur 0.25) à gauche et/ou à droite de chaque section de voies de route, avec les matériaux p.edgeMatL et p.edgeMatR. | 172 |
| `editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd)` | Ajoute des lignes d'arrêt (largeur 0.4, matériaux p.endStopMatS et p.endStopMatE) en fin de section pour les voies de route. Seul le cas isEnd est géré dans le code lu ; les voies de gauche et de droite reçoivent des couches distinctes (Stop line A et B). | 297 |
| `editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel)` | Ajoute une voie 'road_lane' (3.5 m, hauteur 0.01) au profil, à la position choisie, en décalant les voies existantes. Limité à 20 voies par côté. | 2903 |
| `editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint)` | Ajoute une ligne de séparation de voies (matériau p.laneMarkingsMat) entre chaque paire de voies de route adjacentes de même sens. | 252 |
| `editor_roadArchitect_profiles.addLayer(p, i, dir)` | Insère une nouvelle couche vide ('new layer') du profil, au-dessus ou au-dessous de l'indice i. | 989 |
| `editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax)` | Ajoute à chaque voie 'road_lane' ou 'shoulder' comprise entre lMin et lMax une couche de traces de pneus légères (matériau m_tread_marks_clean) sur toute la longueur. | 455 |
| `editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth)` | Donne la largeur mWidth à toutes les voies de type 'road_lane' du profil (écrase les largeurs de la coupe). | 2938 |
| `editor_roadArchitect_profiles.areSidewalksPresent(p)` | Indique si le profil contient au moins une voie de type 'sidewalk'. | 1153 |
| `editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat)` | Ajoute des couches de fondu de bord (largeur 2.0, longueur de texture 18, décalage 0.5 m) pour chaque section de route ou d'accotement dont le côté n'est pas occupé par une autre voie autre qu'un îlot. | 383 |
| `editor_roadArchitect_profiles.autoPaintLines(prof)` | Réinitialise prof.layers puis crée automatiquement ligne centrale, lignes de bord, ligne d'arrêt de fin et lignes de séparation de voies d'après les paramètres du profil (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd). | 374 |
| `editor_roadArchitect_profiles.computeLaneKeys(profile)` | Renvoie les clés de voies existantes, de la plus petite à la plus grande, avec en plus les listes séparées des clés de gauche et de droite. | 1050 |
| `editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2)` | Découpe le profil de gauche à droite en sections contiguës de voies d'un ou deux types donnés. Chaque section est { s, e, isOneWay, lanesL, lanesR } : clés de début et de fin, vrai si la section est entièrement d'un côté, nombre de voies à gauche et à droite. | 100 |
| `editor_roadArchitect_profiles.copyProfile(template)` | Copie un profil en profondeur (nouveaux pointeurs ImGui, voies et couches) ; le nom est repris tel quel (même objet). | 2768 |
| `editor_roadArchitect_profiles.createBridgeProfile(width, depth)` | Crée le profil d'un pont simple : deux voies de route de largeur width et dont les hauteurs heightL et heightR valent depth. | 1510 |
| `editor_roadArchitect_profiles.createCustomImportProfile(lanes)` | Crée un profil pour l'import OpenDRIVE : chaque voie de lanes reçoit le type natif correspondant (driving, shoulder, parking, stop, median, entry/exit, rampes, slipLane… -> road_lane ; walking -> sidewalk ; restricted et none -> island ; autre -> road_lane) avec une largeur par défaut de 3.5 m (les vraies largeurs sont ajoutées ensuite nœud par nœud). Ajoute les lignes de peinture automatiques. | 1217 |
| `editor_roadArchitect_profiles.createOverlayProfile(width)` | Crée le profil des routes de superposition de jonction (voir overlays.lua), sans couche. | 1444 |
| `editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Crée le profil d'une route de jonction à double sens : numLeftLanes voies à gauche, numRightLanes à droite, plus éventuellement un trottoir de chaque côté. Ajoute peinture et fondus de bord (les fondus ne sont créés que s'il n'y a pas de trottoirs). | 1581 |
| `editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)` | Crée le profil d'une route de jonction à sens unique de numLanes voies, avec trottoirs éventuels. | 1752 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Crée le profil des sections d'extrémité (début et fin) d'une jonction d'autoroute : voies de route de chaque côté, deux accotements et un terre-plein central (îlot de largeur cResWidth). | 2060 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat)` | Crée le profil d'extrémité d'une jonction d'autoroute à sens unique (sans terre-plein central). | 2390 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat)` | Crée le profil de la partie urbaine d'une jonction de transition autoroute-urbain (voies, trottoirs éventuels, sens unique ou double). | 2161 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat)` | Crée le profil des routes de sortie à sens unique d'une jonction d'autoroute (deux voies de route, en positions 1 et 2). | 2693 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Crée le profil de la section 2 d'une jonction d'autoroute (accotements décalés d'une voie : clés extrêmes à -numLanes-3 et numLanes+3). | 2467 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat)` | Crée le profil de la section 3 d'une jonction d'autoroute. | 2568 |
| `editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat)` | Crée le profil des sections de transition (évasement) d'une jonction autoroute-urbain, à sens unique ou double. | 2273 |
| `editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat)` | Crée le profil de la route de raccord serrée des jonctions en Y (voies de gauche et de droite plus un trottoir à droite, dont le côté de bordure peut être inversé). | 1669 |
| `editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat)` | Crée le profil d'une route de jonction avec un seul trottoir, du côté gauche ou droit. | 1833 |
| `editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes)` | Crée un profil urbain simple (voies de route de 3.5 m, hauteur 0.01) à partir des métadonnées d'une route à décalque (decal road) créée avec d'autres outils, avec peinture automatique. | 1369 |
| `editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName)` | Copie le modèle de profil templateName vers un nouveau profil (paramètres de style, voies et couches copiés en profondeur). | 1297 |
| `editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat)` | Crée le profil des routes circulaires d'un rond-point (numRBLanes voies de largeur laneWidthRB). | 1992 |
| `editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb)` | Crée un profil formé d'une unique voie de trottoir en position 1. | 1922 |
| `editor_roadArchitect_profiles.createTemplateOnRequest(p)` | Ajoute à M.profiles une copie du profil p nommée 'New Template' (création d'un modèle demandée par l'utilisateur). | 3396 |
| `editor_roadArchitect_profiles.cycleLaneType(t)` | Passe au type de voie suivant : road_lane -> sidewalk -> shoulder -> island -> road_lane. Tout autre type est renvoyé inchangé. | 1032 |
| `editor_roadArchitect_profiles.cycleLaneTypeBack(t)` | Passe au type de voie précédent (ordre inverse de cycleLaneType). | 1041 |
| `editor_roadArchitect_profiles.deserialiseProfile(pSer)` | Reconstruit un profil à partir de sa version sérialisée (valeurs par défaut pour les champs absents : nom 'New Profile', classe 'urban'). Renvoie nil si la donnée est nil. | 3247 |
| `editor_roadArchitect_profiles.getIdFromName(name)` | Renvoie l'indice du profil de M.profiles dont le champ name est égal à name (comparaison ==), ou nil. | 834 |
| `editor_roadArchitect_profiles.getLaneFlags()` | Renvoie l'état des drapeaux de voies du module : { isCustom, isSidewalk } (voir updateLaneFlags). | 1210 |
| `editor_roadArchitect_profiles.getMinMaxLaneKeys(profile)` | Renvoie la plus petite et la plus grande clé de voie existante d'un profil (parcours de -20 à 20). | 88 |
| `editor_roadArchitect_profiles.getNumLanesLR(profile)` | Compte les voies de gauche et de droite (tous types confondus). | 1081 |
| `editor_roadArchitect_profiles.getNumRoadLanesLR(profile)` | Compte les voies de gauche et de droite de type 'road_lane' ou 'shoulder' uniquement. | 1097 |
| `editor_roadArchitect_profiles.getOrderedLanes(profile)` | Renvoie les clés de voies triées du plus petit au plus grand et leur nombre total. | 1069 |
| `editor_roadArchitect_profiles.getProfileFromName(name)` | Renvoie le profil dont le nom correspond à name (voir getIdFromName), ou nil. | 842 |
| `editor_roadArchitect_profiles.getWAndHByKey(profile)` | Renvoie trois tables indexées par clé de voie : largeurs, hauteurs gauches et hauteurs droites, chacune sous forme de pointeurs ImGui (im.FloatPtr) prêts à être édités. | 1164 |
| `editor_roadArchitect_profiles.getWidth(profile)` | Somme des largeurs de toutes les voies du profil. | 1176 |
| `editor_roadArchitect_profiles.goToOldView()` | Remet la caméra à la pose mémorisée avant la vue profil (si elle existe) et quitte la vue profil. | 2852 |
| `editor_roadArchitect_profiles.goToProfileView(timer, time)` | Mémorise la pose de la caméra, bascule en caméra libre et la place à la pose d'édition de profil. Ne fait rien si on est déjà en vue profil (le temps est alors renvoyé inchangé). | 2840 |
| `editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile)` | Indique si le profil convient à une jonction automatique parfaitement ajustée (route tirée au milieu d'une autre) : autant de voies à gauche qu'à droite, aucun îlot, 0 ou 2 trottoirs exactement placés aux bords et adjacents à une voie de route. | 1113 |
| `editor_roadArchitect_profiles.layerChangePriority(p, i, dir)` | Échange la couche i avec sa voisine : avec dir == 'raise' elle monte (indice i - 1), sinon elle descend (indice i + 1). | 945 |
| `editor_roadArchitect_profiles.load()` | Ouvre un sélecteur de fichier JSON, lit le profil sérialisé et l'ajoute à M.profiles. | 3373 |
| `editor_roadArchitect_profiles.populateProfileTemplates()` | Charge les modèles de profil prédéfinis (fichiers roadArchitect/profiles/*.json) dans M.profiles, marqués non supprimables. Ne fait rien si M.profiles contient déjà des profils. | 3413 |
| `editor_roadArchitect_profiles.removeAllTempCurrentProfiles()` | Supprime de M.profiles tous les profils temporaires nommés 'Current Profile'. | 3387 |
| `editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side)` | Supprime une voie du profil d'indice selectedProfileIdx dans M.profiles, décale les voies suivantes pour ne pas laisser de trou, puis retire les couches qui référencent des voies inexistantes. | 2878 |
| `editor_roadArchitect_profiles.removeLayer(p, i)` | Supprime la couche d'indice i du profil (table.remove sur p.layers). | 131 |
| `editor_roadArchitect_profiles.resetTemplates()` | Vide M.profiles puis recharge tous les modèles prédéfinis. | 3424 |
| `editor_roadArchitect_profiles.save(p)` | Ouvre une boîte de dialogue d'enregistrement et écrit le profil sérialisé dans un fichier JSON { profile = ... } ; le nom du profil devient le nom du fichier. | 3358 |
| `editor_roadArchitect_profiles.serialiseProfile(p)` | Convertit un profil en table sérialisable en JSON (pointeurs ImGui remplacés par leurs valeurs, name en chaîne). | 3142 |
| `editor_roadArchitect_profiles.updateCondition(r)` | Régénère les couches d'usure/état de la route r d'après les paramètres du profil (condition, graine, nombre de rustines et de nids-de-poule, traces de pneus, fissures, dégâts d'asphalte ou sol de terre selon la classe). Sort sans rien faire si la route a moins de 2 nœuds ou pas de renderData, et sans régénérer si aucune voie 'road_lane' n'existe (après avoir supprimé les couches non persistantes). | 2948 |
| `editor_roadArchitect_profiles.updateLaneFlags(p)` | Met à jour les drapeaux du module (isCustom : une voie de type 'mesh' existe, isSidewalk : une voie 'sidewalk' existe), utilisés par l'interface pour savoir quels meshes statiques sont présents. | 845 |
| `editor_roadArchitect_profiles.updateToNewTemplate(road, templateName)` | Vide le profil de la route et le remplace par une copie du modèle templateName en conservant son nom d'origine. | 859 |

### Détail des paramètres

#### `editor_roadArchitect_profiles.addCenterline(p, isPaint)`

Ajoute au profil une couche de ligne centrale (matériau p.centerlineMat, largeur 0.4) pour chaque section de voies de route à double sens (les sections à sens unique n'en reçoivent pas).

- `p` (*table*) : Profil.
- `isPaint` (*boolean*) : Si vrai, la couche n'est pas marquée comme peinture (isPaint = not isPaint) ; reçoit prof.continueLinesToEnd[0] depuis autoPaintLines.

#### `editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint)`

Ajoute les lignes de bord de chaussée (largeur 0.25) à gauche et/ou à droite de chaque section de voies de route, avec les matériaux p.edgeMatL et p.edgeMatR.

- `p` (*table*) : Profil.
- `latOffL` (*number*) : Décalage latéral de la ligne de bord gauche (m).
- `latOffR` (*number*) : Décalage latéral de la ligne de bord droite (m).
- `isLeft` (*boolean*) : Créer les lignes de bord gauches.
- `isRight` (*boolean*) : Créer les lignes de bord droites.
- `isPaint` (*boolean*) : Même sens que pour addCenterline.

#### `editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd)`

Ajoute des lignes d'arrêt (largeur 0.4, matériaux p.endStopMatS et p.endStopMatE) en fin de section pour les voies de route. Seul le cas isEnd est géré dans le code lu ; les voies de gauche et de droite reçoivent des couches distinctes (Stop line A et B).

- `p` (*table*) : Profil.
- `isStart` (*boolean*) : Ligne d'arrêt au début de la route.
- `isEnd` (*boolean*) : Ligne d'arrêt à la fin de la route.

#### `editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel)`

Ajoute une voie 'road_lane' (3.5 m, hauteur 0.01) au profil, à la position choisie, en décalant les voies existantes. Limité à 20 voies par côté.

- `selectedProfileIdx` (*integer*) : Indice du profil dans profiles.
- `selectedLaneIdx` (*integer*) : Clé de voie de référence.
- `side` (*string*) : 'left' ou 'right'.
- `rel` (*string*) : Position relative : 'above' (côté gauche : avant la voie) ou 'below' (côté droit : après la voie).

#### `editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint)`

Ajoute une ligne de séparation de voies (matériau p.laneMarkingsMat) entre chaque paire de voies de route adjacentes de même sens.

- `p` (*table*) : Profil.
- `isPaint` (*boolean*) : Même sens que pour addCenterline.

#### `editor_roadArchitect_profiles.addLayer(p, i, dir)`

Insère une nouvelle couche vide ('new layer') du profil, au-dessus ou au-dessous de l'indice i.

- `p` (*table*) : Profil.
- `i` (*integer*) : Indice de référence.
- `dir` (*string*) : 'above' pour insérer avant l'indice i, sinon après (déduit du code).

#### `editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax)`

Ajoute à chaque voie 'road_lane' ou 'shoulder' comprise entre lMin et lMax une couche de traces de pneus légères (matériau m_tread_marks_clean) sur toute la longueur.

- `p` (*table*) : Profil.
- `fadeS` (*number*) : Longueur de fondu au début (m).
- `fadeE` (*number*) : Longueur de fondu à la fin (m).
- `lMin` (*integer*) : Première clé de voie.
- `lMax` (*integer*) : Dernière clé de voie.

#### `editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth)`

Donne la largeur mWidth à toutes les voies de type 'road_lane' du profil (écrase les largeurs de la coupe).

- `profile` (*table*) : Profil.
- `mWidth` (*number*) : Largeur unique (m).

#### `editor_roadArchitect_profiles.areSidewalksPresent(p)`

Indique si le profil contient au moins une voie de type 'sidewalk'.

- `p` (*table*) : Profil.
- **renvoie** : boolean true si un trottoir existe.

#### `editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat)`

Ajoute des couches de fondu de bord (largeur 2.0, longueur de texture 18, décalage 0.5 m) pour chaque section de route ou d'accotement dont le côté n'est pas occupé par une autre voie autre qu'un îlot.

- `prof` (*table*) : Profil.
- `isLeft` (*boolean*) : Créer les fondus du côté gauche.
- `isRight` (*boolean*) : Créer les fondus du côté droit.
- `mat` (*string|nil*) : Matériau (défaut m_road_asphalt_edge).

#### `editor_roadArchitect_profiles.autoPaintLines(prof)`

Réinitialise prof.layers puis crée automatiquement ligne centrale, lignes de bord, ligne d'arrêt de fin et lignes de séparation de voies d'après les paramètres du profil (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd).

- `prof` (*table*) : Profil dont les couches sont recréées.

#### `editor_roadArchitect_profiles.computeLaneKeys(profile)`

Renvoie les clés de voies existantes, de la plus petite à la plus grande, avec en plus les listes séparées des clés de gauche et de droite.

- `profile` (*table*) : Profil.
- **renvoie** : integer[] Toutes les clés triées.
- **renvoie** : integer[] Clés de gauche.
- **renvoie** : integer[] Clés de droite.

#### `editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2)`

Découpe le profil de gauche à droite en sections contiguës de voies d'un ou deux types donnés. Chaque section est { s, e, isOneWay, lanesL, lanesR } : clés de début et de fin, vrai si la section est entièrement d'un côté, nombre de voies à gauche et à droite.

- `profile` (*table*) : Profil de route.
- `laneType1` (*string*) : Premier type de voie accepté ('road_lane', 'sidewalk', 'shoulder', 'island').
- `laneType2` (*string|nil*) : Second type de voie accepté, facultatif.
- **renvoie** : table[] Tableau de sections { s, e, isOneWay, lanesL, lanesR }.

#### `editor_roadArchitect_profiles.copyProfile(template)`

Copie un profil en profondeur (nouveaux pointeurs ImGui, voies et couches) ; le nom est repris tel quel (même objet).

- `template` (*table*) : Profil à copier.
- **renvoie** : table Copie du profil.

#### `editor_roadArchitect_profiles.createBridgeProfile(width, depth)`

Crée le profil d'un pont simple : deux voies de route de largeur width et dont les hauteurs heightL et heightR valent depth.

- `width` (*number*) : Largeur de chaque voie (m).
- `depth` (*number*) : Épaisseur/hauteur du tablier (m).
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createCustomImportProfile(lanes)`

Crée un profil pour l'import OpenDRIVE : chaque voie de lanes reçoit le type natif correspondant (driving, shoulder, parking, stop, median, entry/exit, rampes, slipLane… -> road_lane ; walking -> sidewalk ; restricted et none -> island ; autre -> road_lane) avec une largeur par défaut de 3.5 m (les vraies largeurs sont ajoutées ensuite nœud par nœud). Ajoute les lignes de peinture automatiques.

- `lanes` (*table*) : Table clé de voie -> { type = type OpenDRIVE (chaîne) }.
- **renvoie** : table Le profil créé.
- **renvoie** : table Table clé de voie -> type natif.

#### `editor_roadArchitect_profiles.createOverlayProfile(width)`

Crée le profil des routes de superposition de jonction (voir overlays.lua), sans couche.

- `width` (*number*) : Largeur de la voie (m).
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)`

Crée le profil d'une route de jonction à double sens : numLeftLanes voies à gauche, numRightLanes à droite, plus éventuellement un trottoir de chaque côté. Ajoute peinture et fondus de bord (les fondus ne sont créés que s'il n'y a pas de trottoirs).

- `numLeftLanes` (*integer*) : Voies à gauche.
- `numRightLanes` (*integer*) : Voies à droite.
- `width` (*number*) : Largeur des voies (m).
- `sidewalkWidth` (*number*) : Largeur des trottoirs (m).
- `sidewalkHeight` (*number*) : Hauteur des trottoirs (m).
- `isSidewalk` (*boolean*) : Ajouter les trottoirs.
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat)`

Crée le profil d'une route de jonction à sens unique de numLanes voies, avec trottoirs éventuels.

- `numLanes` (*integer*) : Nombre de voies.
- `width` (*number*) : Largeur des voies (m).
- `sidewalkWidth` (*number*) : Largeur des trottoirs (m).
- `sidewalkHeight` (*number*) : Hauteur des trottoirs (m).
- `isSidewalk` (*boolean*) : Ajouter les trottoirs.
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Crée le profil des sections d'extrémité (début et fin) d'une jonction d'autoroute : voies de route de chaque côté, deux accotements et un terre-plein central (îlot de largeur cResWidth).

- `numLanes` (*integer*) : Nombre de voies par sens.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `cResWidth` (*number*) : Largeur du terre-plein central (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat)`

Crée le profil d'extrémité d'une jonction d'autoroute à sens unique (sans terre-plein central).

- `numLanes` (*integer*) : Nombre de voies.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat)`

Crée le profil de la partie urbaine d'une jonction de transition autoroute-urbain (voies, trottoirs éventuels, sens unique ou double).

- `numLanes` (*integer*) : Nombre de voies.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `isSidewalk` (*boolean*) : Ajouter des trottoirs.
- `sidewalkWidth` (*number*) : Largeur des trottoirs (m).
- `sidewalkHeight` (*number*) : Hauteur des trottoirs (m).
- `isOneWay` (*boolean*) : Route à sens unique.
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat)`

Crée le profil des routes de sortie à sens unique d'une jonction d'autoroute (deux voies de route, en positions 1 et 2).

- `laneWidth` (*number*) : Largeur d'une voie (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Crée le profil de la section 2 d'une jonction d'autoroute (accotements décalés d'une voie : clés extrêmes à -numLanes-3 et numLanes+3).

- `numLanes` (*integer*) : Nombre de voies.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `cResWidth` (*number*) : Largeur du terre-plein central (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat)`

Crée le profil de la section 3 d'une jonction d'autoroute.

- `numLanes` (*integer*) : Nombre de voies.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `cResWidth` (*number*) : Largeur du terre-plein central (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat)`

Crée le profil des sections de transition (évasement) d'une jonction autoroute-urbain, à sens unique ou double.

- `numLanes` (*integer*) : Nombre de voies.
- `laneWidth` (*number*) : Largeur d'une voie (m).
- `cResWidth` (*number*) : Largeur du terre-plein central (m).
- `hardWidth` (*number*) : Largeur de la bande d'arrêt d'urgence (m).
- `isOneWay` (*boolean*) : Route à sens unique.
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat)`

Crée le profil de la route de raccord serrée des jonctions en Y (voies de gauche et de droite plus un trottoir à droite, dont le côté de bordure peut être inversé).

- `numLeftLanes` (*integer*) : Voies à gauche.
- `numRightLanes` (*integer*) : Voies à droite.
- `width` (*number*) : Largeur des voies (m).
- `sidewalkWidth` (*number*) : Largeur du trottoir (m).
- `sidewalkHeight` (*number*) : Hauteur du trottoir (m).
- `isSidewalk` (*boolean*) : Ajouter le trottoir.
- `isFlipKerb` (*boolean*) : Inverser le côté de la bordure du trottoir (isLeftSide).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat)`

Crée le profil d'une route de jonction avec un seul trottoir, du côté gauche ou droit.

- `numLeftLanes` (*integer*) : Voies à gauche.
- `numRightLanes` (*integer*) : Voies à droite.
- `width` (*number*) : Largeur des voies (m).
- `sidewalkWidth` (*number*) : Largeur du trottoir (m).
- `sidewalkHeight` (*number*) : Hauteur du trottoir (m).
- `isLeftSide` (*boolean*) : Trottoir sur le côté gauche si vrai, sinon à droite.
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes)`

Crée un profil urbain simple (voies de route de 3.5 m, hauteur 0.01) à partir des métadonnées d'une route à décalque (decal road) créée avec d'autres outils, avec peinture automatique.

- `numLeftLanes` (*integer*) : Nombre de voies à gauche.
- `numRightLanes` (*integer*) : Nombre de voies à droite.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName)`

Copie le modèle de profil templateName vers un nouveau profil (paramètres de style, voies et couches copiés en profondeur).

- `templateName` (*any*) : Nom du modèle à copier (voir getProfileFromName).
- `newName` (*any|nil*) : Nom du nouveau profil (défaut un ArrayChar 'New Profile').
- **renvoie** : table Nouveau profil.

#### `editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat)`

Crée le profil des routes circulaires d'un rond-point (numRBLanes voies de largeur laneWidthRB).

- `numRBLanes` (*integer*) : Nombre de voies de l'anneau.
- `laneWidthRB` (*number*) : Largeur d'une voie (m).
- `mat` (*string|nil*) : Matériau des fondus de bord.
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb)`

Crée un profil formé d'une unique voie de trottoir en position 1.

- `sidewalkWidth` (*number*) : Largeur (m).
- `sidewalkHeight` (*number*) : Hauteur (m).
- `isFlipKerb` (*boolean|nil*) : Inverse le côté de la bordure (faux par défaut).
- **renvoie** : table Profil créé.

#### `editor_roadArchitect_profiles.createTemplateOnRequest(p)`

Ajoute à M.profiles une copie du profil p nommée 'New Template' (création d'un modèle demandée par l'utilisateur).

- `p` (*table*) : Profil à copier.

#### `editor_roadArchitect_profiles.cycleLaneType(t)`

Passe au type de voie suivant : road_lane -> sidewalk -> shoulder -> island -> road_lane. Tout autre type est renvoyé inchangé.

- `t` (*string*) : Type de voie courant.
- **renvoie** : string Type suivant.

#### `editor_roadArchitect_profiles.cycleLaneTypeBack(t)`

Passe au type de voie précédent (ordre inverse de cycleLaneType).

- `t` (*string*) : Type de voie courant.
- **renvoie** : string Type précédent.

#### `editor_roadArchitect_profiles.deserialiseProfile(pSer)`

Reconstruit un profil à partir de sa version sérialisée (valeurs par défaut pour les champs absents : nom 'New Profile', classe 'urban'). Renvoie nil si la donnée est nil.

- `pSer` (*table|nil*) : Profil sérialisé.
- **renvoie** : table|nil Profil reconstruit.

#### `editor_roadArchitect_profiles.getIdFromName(name)`

Renvoie l'indice du profil de M.profiles dont le champ name est égal à name (comparaison ==), ou nil.

- `name` (*any*) : Nom recherché, comparé tel quel au champ name des profils.
- **renvoie** : integer|nil Indice dans profiles.

#### `editor_roadArchitect_profiles.getLaneFlags()`

Renvoie l'état des drapeaux de voies du module : { isCustom, isSidewalk } (voir updateLaneFlags).

- **renvoie** : table { isCustom = boolean, isSidewalk = boolean }.

#### `editor_roadArchitect_profiles.getMinMaxLaneKeys(profile)`

Renvoie la plus petite et la plus grande clé de voie existante d'un profil (parcours de -20 à 20).

- `profile` (*table*) : Profil de route.
- **renvoie** : integer Clé minimale (100 si le profil est vide).
- **renvoie** : integer Clé maximale (-100 si le profil est vide).

#### `editor_roadArchitect_profiles.getNumLanesLR(profile)`

Compte les voies de gauche et de droite (tous types confondus).

- `profile` (*table*) : Profil.
- **renvoie** : integer Voies à gauche.
- **renvoie** : integer Voies à droite.

#### `editor_roadArchitect_profiles.getNumRoadLanesLR(profile)`

Compte les voies de gauche et de droite de type 'road_lane' ou 'shoulder' uniquement.

- `profile` (*table*) : Profil.
- **renvoie** : integer Voies de route à gauche.
- **renvoie** : integer Voies de route à droite.

#### `editor_roadArchitect_profiles.getOrderedLanes(profile)`

Renvoie les clés de voies triées du plus petit au plus grand et leur nombre total.

- `profile` (*table*) : Profil.
- **renvoie** : integer[] Clés triées.
- **renvoie** : integer Nombre de voies.

#### `editor_roadArchitect_profiles.getProfileFromName(name)`

Renvoie le profil dont le nom correspond à name (voir getIdFromName), ou nil.

- `name` (*any*) : Nom du profil.
- **renvoie** : table|nil Profil trouvé.

#### `editor_roadArchitect_profiles.getWAndHByKey(profile)`

Renvoie trois tables indexées par clé de voie : largeurs, hauteurs gauches et hauteurs droites, chacune sous forme de pointeurs ImGui (im.FloatPtr) prêts à être édités.

- `profile` (*table*) : Profil.
- **renvoie** : table<integer, cdata> Largeurs.
- **renvoie** : table<integer, cdata> Hauteurs gauches (heightL).
- **renvoie** : table<integer, cdata> Hauteurs droites (heightR).

#### `editor_roadArchitect_profiles.getWidth(profile)`

Somme des largeurs de toutes les voies du profil.

- `profile` (*table*) : Profil.
- **renvoie** : number Largeur totale en mètres.

#### `editor_roadArchitect_profiles.goToProfileView(timer, time)`

Mémorise la pose de la caméra, bascule en caméra libre et la place à la pose d'édition de profil. Ne fait rien si on est déjà en vue profil (le temps est alors renvoyé inchangé).

- `timer` (*table*) : Chronomètre (objet avec stopAndReset) remis à zéro.
- `time` (*number*) : Temps courant de l'animation.
- **renvoie** : number 0.0 si la vue vient d'être activée, sinon time.

#### `editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile)`

Indique si le profil convient à une jonction automatique parfaitement ajustée (route tirée au milieu d'une autre) : autant de voies à gauche qu'à droite, aucun îlot, 0 ou 2 trottoirs exactement placés aux bords et adjacents à une voie de route.

- `profile` (*table*) : Profil testé.
- **renvoie** : boolean|nil true si valide, false ou nil sinon (nil si asymétrique).

#### `editor_roadArchitect_profiles.layerChangePriority(p, i, dir)`

Échange la couche i avec sa voisine : avec dir == 'raise' elle monte (indice i - 1), sinon elle descend (indice i + 1).

- `p` (*table*) : Profil.
- `i` (*integer*) : Indice de la couche.
- `dir` (*string*) : 'raise' ou toute autre valeur pour descendre.

#### `editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side)`

Supprime une voie du profil d'indice selectedProfileIdx dans M.profiles, décale les voies suivantes pour ne pas laisser de trou, puis retire les couches qui référencent des voies inexistantes.

- `selectedProfileIdx` (*integer*) : Indice du profil dans profiles.
- `selectedLaneIdx` (*integer*) : Clé de la voie à supprimer.
- `side` (*string*) : 'left' ou 'right'.

#### `editor_roadArchitect_profiles.removeLayer(p, i)`

Supprime la couche d'indice i du profil (table.remove sur p.layers).

- `p` (*table*) : Profil.
- `i` (*integer*) : Indice de la couche.

#### `editor_roadArchitect_profiles.save(p)`

Ouvre une boîte de dialogue d'enregistrement et écrit le profil sérialisé dans un fichier JSON { profile = ... } ; le nom du profil devient le nom du fichier.

- `p` (*table*) : Profil à enregistrer.

#### `editor_roadArchitect_profiles.serialiseProfile(p)`

Convertit un profil en table sérialisable en JSON (pointeurs ImGui remplacés par leurs valeurs, name en chaîne).

- `p` (*table*) : Profil.
- **renvoie** : table Données sérialisées.

#### `editor_roadArchitect_profiles.updateCondition(r)`

Régénère les couches d'usure/état de la route r d'après les paramètres du profil (condition, graine, nombre de rustines et de nids-de-poule, traces de pneus, fissures, dégâts d'asphalte ou sol de terre selon la classe). Sort sans rien faire si la route a moins de 2 nœuds ou pas de renderData, et sans régénérer si aucune voie 'road_lane' n'existe (après avoir supprimé les couches non persistantes).

- `r` (*table*) : Route Road Architect.

#### `editor_roadArchitect_profiles.updateLaneFlags(p)`

Met à jour les drapeaux du module (isCustom : une voie de type 'mesh' existe, isSidewalk : une voie 'sidewalk' existe), utilisés par l'interface pour savoir quels meshes statiques sont présents.

- `p` (*table*) : Profil examiné.

#### `editor_roadArchitect_profiles.updateToNewTemplate(road, templateName)`

Vide le profil de la route et le remplace par une copie du modèle templateName en conservant son nom d'origine.

- `road` (*table*) : Route dont le profil est remplacé.
- `templateName` (*any*) : Nom du modèle (voir getProfileFromName).

## Champs

| Champ | Type | Description |
|---|---|---|
| `profiles` | table[] | Tableau des profils actuellement présents dans l'éditeur (modèles prédéfinis puis profils créés ou chargés par l'utilisateur). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/profiles.lua`.*

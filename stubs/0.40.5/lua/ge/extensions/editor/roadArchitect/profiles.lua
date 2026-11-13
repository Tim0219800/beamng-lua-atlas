---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/profiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des profils latéraux (coupes en travers) des routes de Road Architect. Un profil est une table indexée par numéro de voie : les clés négatives (-1 à -20) sont les voies de gauche, les clés positives (1 à 20) celles de droite, il n'y a pas de clé 0. Chaque voie a un type ('road_lane', 'sidewalk', 'shoulder', 'island'), une largeur et des hauteurs (champs width, heightL, heightR, ce sont des pointeurs ImGui à lire avec [0]). Le profil porte aussi des paramètres de style (condition d'usure, matériaux des lignes de peinture, fondus de bord, gouttière…) et un tableau layers de couches (peinture, décalques, usure). Le module charge les modèles de profil prédéfinis (fichiers roadArchitect/profiles/*.json : Rural, Urban, Hwy, Tracks, Barrier_Only, Lamps_Only…), fabrique les profils des jonctions, ajoute automatiquement les couches de peinture, d'usure et de fondu de bord, et sérialise/désérialise les profils vers JSON.
--- Accès : extension `editor_roadArchitect_profiles` : `extensions.load("editor_roadArchitect_profiles")`, puis la globale `editor_roadArchitect_profiles`
---@class editor_roadArchitect_profiles
---@field profiles table[] Tableau des profils actuellement présents dans l'éditeur (modèles prédéfinis puis profils créés ou chargés par l'utilisateur).
editor_roadArchitect_profiles = {}

--- Ajoute au profil une couche de ligne centrale (matériau p.centerlineMat, largeur 0.4) pour chaque section de voies de route à double sens (les sections à sens unique n'en reçoivent pas).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:134
---@param p table Profil.
---@param isPaint boolean Si vrai, la couche n'est pas marquée comme peinture (isPaint = not isPaint) ; reçoit prof.continueLinesToEnd[0] depuis autoPaintLines.
function editor_roadArchitect_profiles.addCenterline(p, isPaint) end

--- Ajoute les lignes de bord de chaussée (largeur 0.25) à gauche et/ou à droite de chaque section de voies de route, avec les matériaux p.edgeMatL et p.edgeMatR.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:172
---@param p table Profil.
---@param latOffL number Décalage latéral de la ligne de bord gauche (m).
---@param latOffR number Décalage latéral de la ligne de bord droite (m).
---@param isLeft boolean Créer les lignes de bord gauches.
---@param isRight boolean Créer les lignes de bord droites.
---@param isPaint boolean Même sens que pour addCenterline.
function editor_roadArchitect_profiles.addEdgeLines(p, latOffL, latOffR, isLeft, isRight, isPaint) end

--- Ajoute des lignes d'arrêt (largeur 0.4, matériaux p.endStopMatS et p.endStopMatE) en fin de section pour les voies de route. Seul le cas isEnd est géré dans le code lu ; les voies de gauche et de droite reçoivent des couches distinctes (Stop line A et B).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:297
---@param p table Profil.
---@param isStart boolean Ligne d'arrêt au début de la route.
---@param isEnd boolean Ligne d'arrêt à la fin de la route.
function editor_roadArchitect_profiles.addEndLine(p, isStart, isEnd) end

--- Ajoute une voie 'road_lane' (3.5 m, hauteur 0.01) au profil, à la position choisie, en décalant les voies existantes. Limité à 20 voies par côté.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2903
---@param selectedProfileIdx integer Indice du profil dans profiles.
---@param selectedLaneIdx integer Clé de voie de référence.
---@param side string 'left' ou 'right'.
---@param rel string Position relative : 'above' (côté gauche : avant la voie) ou 'below' (côté droit : après la voie).
function editor_roadArchitect_profiles.addLane(selectedProfileIdx, selectedLaneIdx, side, rel) end

--- Ajoute une ligne de séparation de voies (matériau p.laneMarkingsMat) entre chaque paire de voies de route adjacentes de même sens.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:252
---@param p table Profil.
---@param isPaint boolean Même sens que pour addCenterline.
function editor_roadArchitect_profiles.addLaneDivisionLines(p, isPaint) end

--- Insère une nouvelle couche vide ('new layer') du profil, au-dessus ou au-dessous de l'indice i.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:989
---@param p table Profil.
---@param i integer Indice de référence.
---@param dir string 'above' pour insérer avant l'indice i, sinon après (déduit du code).
function editor_roadArchitect_profiles.addLayer(p, i, dir) end

--- Ajoute à chaque voie 'road_lane' ou 'shoulder' comprise entre lMin et lMax une couche de traces de pneus légères (matériau m_tread_marks_clean) sur toute la longueur.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:455
---@param p table Profil.
---@param fadeS number Longueur de fondu au début (m).
---@param fadeE number Longueur de fondu à la fin (m).
---@param lMin integer Première clé de voie.
---@param lMax integer Dernière clé de voie.
function editor_roadArchitect_profiles.addLightTreadToLanes(p, fadeS, fadeE, lMin, lMax) end

--- Donne la largeur mWidth à toutes les voies de type 'road_lane' du profil (écrase les largeurs de la coupe).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2938
---@param profile table Profil.
---@param mWidth number Largeur unique (m).
function editor_roadArchitect_profiles.applyMasterWidth(profile, mWidth) end

--- Indique si le profil contient au moins une voie de type 'sidewalk'.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1153
---@param p table Profil.
---@return boolean  true si un trottoir existe.
function editor_roadArchitect_profiles.areSidewalksPresent(p) end

--- Ajoute des couches de fondu de bord (largeur 2.0, longueur de texture 18, décalage 0.5 m) pour chaque section de route ou d'accotement dont le côté n'est pas occupé par une autre voie autre qu'un îlot.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:383
---@param prof table Profil.
---@param isLeft boolean Créer les fondus du côté gauche.
---@param isRight boolean Créer les fondus du côté droit.
---@param mat string|nil Matériau (défaut m_road_asphalt_edge).
function editor_roadArchitect_profiles.autoEdgeBlending(prof, isLeft, isRight, mat) end

--- Réinitialise prof.layers puis crée automatiquement ligne centrale, lignes de bord, ligne d'arrêt de fin et lignes de séparation de voies d'après les paramètres du profil (conditionEdgesL/R, conditionEndStopE, edgeLineGapL/R, continueLinesToEnd).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:374
---@param prof table Profil dont les couches sont recréées.
function editor_roadArchitect_profiles.autoPaintLines(prof) end

--- Renvoie les clés de voies existantes, de la plus petite à la plus grande, avec en plus les listes séparées des clés de gauche et de droite.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1050
---@param profile table Profil.
---@return integer[]  Toutes les clés triées.
---@return integer[]  Clés de gauche.
---@return integer[]  Clés de droite.
function editor_roadArchitect_profiles.computeLaneKeys(profile) end

--- Découpe le profil de gauche à droite en sections contiguës de voies d'un ou deux types donnés. Chaque section est { s, e, isOneWay, lanesL, lanesR } : clés de début et de fin, vrai si la section est entièrement d'un côté, nombre de voies à gauche et à droite.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:100
---@param profile table Profil de route.
---@param laneType1 string Premier type de voie accepté ('road_lane', 'sidewalk', 'shoulder', 'island').
---@param laneType2 string|nil Second type de voie accepté, facultatif.
---@return table[]  Tableau de sections { s, e, isOneWay, lanesL, lanesR }.
function editor_roadArchitect_profiles.computeSectionsByType(profile, laneType1, laneType2) end

--- Copie un profil en profondeur (nouveaux pointeurs ImGui, voies et couches) ; le nom est repris tel quel (même objet).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2768
---@param template table Profil à copier.
---@return table  Copie du profil.
function editor_roadArchitect_profiles.copyProfile(template) end

--- Crée le profil d'un pont simple : deux voies de route de largeur width et dont les hauteurs heightL et heightR valent depth.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1510
---@param width number Largeur de chaque voie (m).
---@param depth number Épaisseur/hauteur du tablier (m).
---@return table  Profil créé.
function editor_roadArchitect_profiles.createBridgeProfile(width, depth) end

--- Crée un profil pour l'import OpenDRIVE : chaque voie de lanes reçoit le type natif correspondant (driving, shoulder, parking, stop, median, entry/exit, rampes, slipLane… -> road_lane ; walking -> sidewalk ; restricted et none -> island ; autre -> road_lane) avec une largeur par défaut de 3.5 m (les vraies largeurs sont ajoutées ensuite nœud par nœud). Ajoute les lignes de peinture automatiques.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1217
---@param lanes table Table clé de voie -> { type = type OpenDRIVE (chaîne) }.
---@return table  Le profil créé.
---@return table  Table clé de voie -> type natif.
function editor_roadArchitect_profiles.createCustomImportProfile(lanes) end

--- Crée le profil des routes de superposition de jonction (voir overlays.lua), sans couche.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1444
---@param width number Largeur de la voie (m).
---@return table  Profil créé.
function editor_roadArchitect_profiles.createOverlayProfile(width) end

--- Crée le profil d'une route de jonction à double sens : numLeftLanes voies à gauche, numRightLanes à droite, plus éventuellement un trottoir de chaque côté. Ajoute peinture et fondus de bord (les fondus ne sont créés que s'il n'y a pas de trottoirs).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1581
---@param numLeftLanes integer Voies à gauche.
---@param numRightLanes integer Voies à droite.
---@param width number Largeur des voies (m).
---@param sidewalkWidth number Largeur des trottoirs (m).
---@param sidewalkHeight number Hauteur des trottoirs (m).
---@param isSidewalk boolean Ajouter les trottoirs.
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoad(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Crée le profil d'une route de jonction à sens unique de numLanes voies, avec trottoirs éventuels.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1752
---@param numLanes integer Nombre de voies.
---@param width number Largeur des voies (m).
---@param sidewalkWidth number Largeur des trottoirs (m).
---@param sidewalkHeight number Hauteur des trottoirs (m).
---@param isSidewalk boolean Ajouter les trottoirs.
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoad1Way(numLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, mat) end

--- Crée le profil des sections d'extrémité (début et fin) d'une jonction d'autoroute : voies de route de chaque côté, deux accotements et un terre-plein central (îlot de largeur cResWidth).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2060
---@param numLanes integer Nombre de voies par sens.
---@param laneWidth number Largeur d'une voie (m).
---@param cResWidth number Largeur du terre-plein central (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Crée le profil d'extrémité d'une jonction d'autoroute à sens unique (sans terre-plein central).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2390
---@param numLanes integer Nombre de voies.
---@param laneWidth number Largeur d'une voie (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCap1W(numLanes, laneWidth, hardWidth, mat) end

--- Crée le profil de la partie urbaine d'une jonction de transition autoroute-urbain (voies, trottoirs éventuels, sens unique ou double).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2161
---@param numLanes integer Nombre de voies.
---@param laneWidth number Largeur d'une voie (m).
---@param isSidewalk boolean Ajouter des trottoirs.
---@param sidewalkWidth number Largeur des trottoirs (m).
---@param sidewalkHeight number Hauteur des trottoirs (m).
---@param isOneWay boolean Route à sens unique.
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyCapUrban(numLanes, laneWidth, isSidewalk, sidewalkWidth, sidewalkHeight, isOneWay, mat) end

--- Crée le profil des routes de sortie à sens unique d'une jonction d'autoroute (deux voies de route, en positions 1 et 2).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2693
---@param laneWidth number Largeur d'une voie (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyExit(laneWidth, hardWidth, mat) end

--- Crée le profil de la section 2 d'une jonction d'autoroute (accotements décalés d'une voie : clés extrêmes à -numLanes-3 et numLanes+3).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2467
---@param numLanes integer Nombre de voies.
---@param laneWidth number Largeur d'une voie (m).
---@param cResWidth number Largeur du terre-plein central (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS2(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Crée le profil de la section 3 d'une jonction d'autoroute.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2568
---@param numLanes integer Nombre de voies.
---@param laneWidth number Largeur d'une voie (m).
---@param cResWidth number Largeur du terre-plein central (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyS3(numLanes, laneWidth, cResWidth, hardWidth, mat) end

--- Crée le profil des sections de transition (évasement) d'une jonction autoroute-urbain, à sens unique ou double.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2273
---@param numLanes integer Nombre de voies.
---@param laneWidth number Largeur d'une voie (m).
---@param cResWidth number Largeur du terre-plein central (m).
---@param hardWidth number Largeur de la bande d'arrêt d'urgence (m).
---@param isOneWay boolean Route à sens unique.
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadHwyUrbanTrans(numLanes, laneWidth, cResWidth, hardWidth, isOneWay, mat) end

--- Crée le profil de la route de raccord serrée des jonctions en Y (voies de gauche et de droite plus un trottoir à droite, dont le côté de bordure peut être inversé).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1669
---@param numLeftLanes integer Voies à gauche.
---@param numRightLanes integer Voies à droite.
---@param width number Largeur des voies (m).
---@param sidewalkWidth number Largeur du trottoir (m).
---@param sidewalkHeight number Hauteur du trottoir (m).
---@param isSidewalk boolean Ajouter le trottoir.
---@param isFlipKerb boolean Inverser le côté de la bordure du trottoir (isLeftSide).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoadYSpecial(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isSidewalk, isFlipKerb, mat) end

--- Crée le profil d'une route de jonction avec un seul trottoir, du côté gauche ou droit.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1833
---@param numLeftLanes integer Voies à gauche.
---@param numRightLanes integer Voies à droite.
---@param width number Largeur des voies (m).
---@param sidewalkWidth number Largeur du trottoir (m).
---@param sidewalkHeight number Hauteur du trottoir (m).
---@param isLeftSide boolean Trottoir sur le côté gauche si vrai, sinon à droite.
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileForJctRoad_SW(numLeftLanes, numRightLanes, width, sidewalkWidth, sidewalkHeight, isLeftSide, mat) end

--- Crée un profil urbain simple (voies de route de 3.5 m, hauteur 0.01) à partir des métadonnées d'une route à décalque (decal road) créée avec d'autres outils, avec peinture automatique.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1369
---@param numLeftLanes integer Nombre de voies à gauche.
---@param numRightLanes integer Nombre de voies à droite.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createProfileFromDecalData(numLeftLanes, numRightLanes) end

--- Copie le modèle de profil templateName vers un nouveau profil (paramètres de style, voies et couches copiés en profondeur).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1297
---@param templateName any Nom du modèle à copier (voir getProfileFromName).
---@param newName any|nil Nom du nouveau profil (défaut un ArrayChar 'New Profile').
---@return table  Nouveau profil.
function editor_roadArchitect_profiles.createProfileFromTemplate(templateName, newName) end

--- Crée le profil des routes circulaires d'un rond-point (numRBLanes voies de largeur laneWidthRB).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1992
---@param numRBLanes integer Nombre de voies de l'anneau.
---@param laneWidthRB number Largeur d'une voie (m).
---@param mat string|nil Matériau des fondus de bord.
---@return table  Profil créé.
function editor_roadArchitect_profiles.createRoundaboutProfile(numRBLanes, laneWidthRB, mat) end

--- Crée un profil formé d'une unique voie de trottoir en position 1.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1922
---@param sidewalkWidth number Largeur (m).
---@param sidewalkHeight number Hauteur (m).
---@param isFlipKerb boolean|nil Inverse le côté de la bordure (faux par défaut).
---@return table  Profil créé.
function editor_roadArchitect_profiles.createSidewalkOnlyProfile(sidewalkWidth, sidewalkHeight, isFlipKerb) end

--- Ajoute à M.profiles une copie du profil p nommée 'New Template' (création d'un modèle demandée par l'utilisateur).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3396
---@param p table Profil à copier.
function editor_roadArchitect_profiles.createTemplateOnRequest(p) end

--- Passe au type de voie suivant : road_lane -> sidewalk -> shoulder -> island -> road_lane. Tout autre type est renvoyé inchangé.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1032
---@param t string Type de voie courant.
---@return string  Type suivant.
function editor_roadArchitect_profiles.cycleLaneType(t) end

--- Passe au type de voie précédent (ordre inverse de cycleLaneType).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1041
---@param t string Type de voie courant.
---@return string  Type précédent.
function editor_roadArchitect_profiles.cycleLaneTypeBack(t) end

--- Reconstruit un profil à partir de sa version sérialisée (valeurs par défaut pour les champs absents : nom 'New Profile', classe 'urban'). Renvoie nil si la donnée est nil.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3247
---@param pSer table|nil Profil sérialisé.
---@return table|nil  Profil reconstruit.
function editor_roadArchitect_profiles.deserialiseProfile(pSer) end

--- Renvoie l'indice du profil de M.profiles dont le champ name est égal à name (comparaison ==), ou nil.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:834
---@param name any Nom recherché, comparé tel quel au champ name des profils.
---@return integer|nil  Indice dans profiles.
function editor_roadArchitect_profiles.getIdFromName(name) end

--- Renvoie l'état des drapeaux de voies du module : { isCustom, isSidewalk } (voir updateLaneFlags).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1210
---@return table  { isCustom = boolean, isSidewalk = boolean }.
function editor_roadArchitect_profiles.getLaneFlags() end

--- Renvoie la plus petite et la plus grande clé de voie existante d'un profil (parcours de -20 à 20).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:88
---@param profile table Profil de route.
---@return integer  Clé minimale (100 si le profil est vide).
---@return integer  Clé maximale (-100 si le profil est vide).
function editor_roadArchitect_profiles.getMinMaxLaneKeys(profile) end

--- Compte les voies de gauche et de droite (tous types confondus).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1081
---@param profile table Profil.
---@return integer  Voies à gauche.
---@return integer  Voies à droite.
function editor_roadArchitect_profiles.getNumLanesLR(profile) end

--- Compte les voies de gauche et de droite de type 'road_lane' ou 'shoulder' uniquement.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1097
---@param profile table Profil.
---@return integer  Voies de route à gauche.
---@return integer  Voies de route à droite.
function editor_roadArchitect_profiles.getNumRoadLanesLR(profile) end

--- Renvoie les clés de voies triées du plus petit au plus grand et leur nombre total.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1069
---@param profile table Profil.
---@return integer[]  Clés triées.
---@return integer  Nombre de voies.
function editor_roadArchitect_profiles.getOrderedLanes(profile) end

--- Renvoie le profil dont le nom correspond à name (voir getIdFromName), ou nil.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:842
---@param name any Nom du profil.
---@return table|nil  Profil trouvé.
function editor_roadArchitect_profiles.getProfileFromName(name) end

--- Renvoie trois tables indexées par clé de voie : largeurs, hauteurs gauches et hauteurs droites, chacune sous forme de pointeurs ImGui (im.FloatPtr) prêts à être édités.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1164
---@param profile table Profil.
---@return table<integer, cdata>  Largeurs.
---@return table<integer, cdata>  Hauteurs gauches (heightL).
---@return table<integer, cdata>  Hauteurs droites (heightR).
function editor_roadArchitect_profiles.getWAndHByKey(profile) end

--- Somme des largeurs de toutes les voies du profil.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1176
---@param profile table Profil.
---@return number  Largeur totale en mètres.
function editor_roadArchitect_profiles.getWidth(profile) end

--- Remet la caméra à la pose mémorisée avant la vue profil (si elle existe) et quitte la vue profil.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2852
function editor_roadArchitect_profiles.goToOldView() end

--- Mémorise la pose de la caméra, bascule en caméra libre et la place à la pose d'édition de profil. Ne fait rien si on est déjà en vue profil (le temps est alors renvoyé inchangé).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2840
---@param timer table Chronomètre (objet avec stopAndReset) remis à zéro.
---@param time number Temps courant de l'animation.
---@return number  0.0 si la vue vient d'être activée, sinon time.
function editor_roadArchitect_profiles.goToProfileView(timer, time) end

--- Indique si le profil convient à une jonction automatique parfaitement ajustée (route tirée au milieu d'une autre) : autant de voies à gauche qu'à droite, aucun îlot, 0 ou 2 trottoirs exactement placés aux bords et adjacents à une voie de route.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:1113
---@param profile table Profil testé.
---@return boolean|nil  true si valide, false ou nil sinon (nil si asymétrique).
function editor_roadArchitect_profiles.isProfileValidForMidJctPerfect(profile) end

--- Échange la couche i avec sa voisine : avec dir == 'raise' elle monte (indice i - 1), sinon elle descend (indice i + 1).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:945
---@param p table Profil.
---@param i integer Indice de la couche.
---@param dir string 'raise' ou toute autre valeur pour descendre.
function editor_roadArchitect_profiles.layerChangePriority(p, i, dir) end

--- Ouvre un sélecteur de fichier JSON, lit le profil sérialisé et l'ajoute à M.profiles.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3373
function editor_roadArchitect_profiles.load() end

--- Charge les modèles de profil prédéfinis (fichiers roadArchitect/profiles/*.json) dans M.profiles, marqués non supprimables. Ne fait rien si M.profiles contient déjà des profils.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3413
function editor_roadArchitect_profiles.populateProfileTemplates() end

--- Supprime de M.profiles tous les profils temporaires nommés 'Current Profile'.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3387
function editor_roadArchitect_profiles.removeAllTempCurrentProfiles() end

--- Supprime une voie du profil d'indice selectedProfileIdx dans M.profiles, décale les voies suivantes pour ne pas laisser de trou, puis retire les couches qui référencent des voies inexistantes.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2878
---@param selectedProfileIdx integer Indice du profil dans profiles.
---@param selectedLaneIdx integer Clé de la voie à supprimer.
---@param side string 'left' ou 'right'.
function editor_roadArchitect_profiles.removeLane(selectedProfileIdx, selectedLaneIdx, side) end

--- Supprime la couche d'indice i du profil (table.remove sur p.layers).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:131
---@param p table Profil.
---@param i integer Indice de la couche.
function editor_roadArchitect_profiles.removeLayer(p, i) end

--- Vide M.profiles puis recharge tous les modèles prédéfinis.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3424
function editor_roadArchitect_profiles.resetTemplates() end

--- Ouvre une boîte de dialogue d'enregistrement et écrit le profil sérialisé dans un fichier JSON { profile = ... } ; le nom du profil devient le nom du fichier.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3358
---@param p table Profil à enregistrer.
function editor_roadArchitect_profiles.save(p) end

--- Convertit un profil en table sérialisable en JSON (pointeurs ImGui remplacés par leurs valeurs, name en chaîne).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:3142
---@param p table Profil.
---@return table  Données sérialisées.
function editor_roadArchitect_profiles.serialiseProfile(p) end

--- Régénère les couches d'usure/état de la route r d'après les paramètres du profil (condition, graine, nombre de rustines et de nids-de-poule, traces de pneus, fissures, dégâts d'asphalte ou sol de terre selon la classe). Sort sans rien faire si la route a moins de 2 nœuds ou pas de renderData, et sans régénérer si aucune voie 'road_lane' n'existe (après avoir supprimé les couches non persistantes).
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:2948
---@param r table Route Road Architect.
function editor_roadArchitect_profiles.updateCondition(r) end

--- Met à jour les drapeaux du module (isCustom : une voie de type 'mesh' existe, isSidewalk : une voie 'sidewalk' existe), utilisés par l'interface pour savoir quels meshes statiques sont présents.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:845
---@param p table Profil examiné.
function editor_roadArchitect_profiles.updateLaneFlags(p) end

--- Vide le profil de la route et le remplace par une copie du modèle templateName en conservant son nom d'origine.
---Source : lua/ge/extensions/editor/roadArchitect/profiles.lua:859
---@param road table Route dont le profil est remplacé.
---@param templateName any Nom du modèle (voir getProfileFromName).
function editor_roadArchitect_profiles.updateToNewTemplate(road, templateName) end


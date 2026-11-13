---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driveline V3 renvoyée par le constructeur. Attributs : missionDir, rawDrivelinePoints, spline, finalDrivelinePoints, simplificationTolerance, properties, stats.
---@class gameplay_rally_driveline_drivelineV3
local gameplay_rally_driveline_drivelineV3 = {}

--- Projette p1 et p2 sur les segments de la driveline finale (projection la plus proche) et renvoie la plage de segments ordonnée : startIdx, startXnorm, endIdx, endXnorm (le début vient toujours en premier). nil si non résolu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:662
---@param p1 vec3 Premier point.
---@param p2 vec3 Second point.
---@return integer|nil  startIdx.
---@return number|nil  startXnorm.
---@return integer|nil  endIdx.
---@return number|nil  endXnorm.
function gameplay_rally_driveline_drivelineV3:_findSegmentRange(p1, p2) end

--- Distance le long de la driveline finale entre les projections de p1 et p2 (segments partiels de début et de fin calculés avec xnorm).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:724
---@param p1 vec3 Premier point.
---@param p2 vec3 Second point.
---@return number  Distance en mètres (0 si non résolu).
function gameplay_rally_driveline_drivelineV3:calculateDistanceBetweenPoints(p1, p2) end

--- Convertit des points de driveline en spline : positions, largeur constante, normales ; simplification RDP (tolérance simplificationTolerance). Journalise le taux de réduction.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:335
---@param drivelinePoints table[]|nil Points {pos, normal?} ; par défaut rawDrivelinePoints. S'ils sont fournis, ils remplacent rawDrivelinePoints.
---@return boolean  false s'il y a moins de 2 points.
function gameplay_rally_driveline_drivelineV3:convertDrivelineToSpline(drivelinePoints) end

--- Génère finalDrivelinePoints à partir des points subdivisés de la spline (divPoints). Met finalDrivelinePoints à nil si la spline n'est pas prête.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:481
---@return boolean  true si des points finaux existent.
function gameplay_rally_driveline_drivelineV3:createDrivelineFromSpline() end

--- Convertit une liste de positions en points complets : orientation (quatFromDir depuis la direction vers le point suivant), ts = indice/5, chaînage prev/next/id, normale (SnaproadNormals.forwardNormalVec), pacenoteDistances et cachedPacenotes vides.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:418
---@param positions vec3[] Au moins 2 positions.
---@return table[]|nil  Points, nil si moins de 2 positions.
function gameplay_rally_driveline_drivelineV3:createDrivelinePointsFromPositions(positions) end

--- Crée une table de spline vide ({name, id, isDirty, isEnabled, isLoop, nodes, widths, nmls, divPoints, divWidths, tangents, binormals, normals, discMap}). L'id est un UUID si absent.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:65
---@param name string|nil Nom ('Driveline' par défaut).
---@param isLoop boolean|nil Spline fermée.
---@param id string|nil Identifiant.
---@return table  Spline vide.
function gameplay_rally_driveline_drivelineV3:createEmptySpline(name, isLoop, id) end

--- Copie profonde de la spline (nodes, widths, nmls et métadonnées simples) pour annuler/rétablir dans l'éditeur. Ne copie pas la géométrie secondaire.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:503
---@return table|nil  Copie de la spline.
function gameplay_rally_driveline_drivelineV3:deepCopySpline() end

--- Renvoie un PointList construit à partir des points finaux (nil et avertissement s'il y en a moins de 2).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:493
---@return table|nil  Instance de PointList.
function gameplay_rally_driveline_drivelineV3:getFinalPointList() end

--- Temps alloué pour la liaison, en secondes (liaisonAllocatedTimeMins x 60).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:654
---@return number  Secondes.
function gameplay_rally_driveline_drivelineV3:getLiaisonAllocatedTimeSecs() end

--- Liste ordonnée des points finaux couvrant l'intervalle entre p1 et p2 (extrémités de segments incluses).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:713
---@param p1 vec3 Premier point.
---@param p2 vec3 Second point.
---@return table[]|nil  Points, ou nil si non résolu.
function gameplay_rally_driveline_drivelineV3:getPointsBetween(p1, p2) end

--- Limite de vitesse de la driveline (propriété speedLimitKph).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:650
---@return number  km/h.
function gameplay_rally_driveline_drivelineV3:getSpeedLimitKph() end

--- Mémorise le dossier de mission et initialise l'état (tolérance de simplification par défaut, propriétés par défaut, aucune donnée chargée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:41
---@param missionDir string Dossier de la mission.
function gameplay_rally_driveline_drivelineV3:init(missionDir) end

--- Charge la driveline depuis un fichier : spline si présente, sinon driveline finale ancienne convertie en spline puis régénérée.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:266
---@return boolean  true si chargée.
function gameplay_rally_driveline_drivelineV3:loadDrivelineFromFile() end

--- Charge la spline depuis son fichier, calcule sa géométrie et génère les points finaux.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:176
---@return boolean  true si tout a réussi.
function gameplay_rally_driveline_drivelineV3:loadDrivelineSplineFromFile() end

--- Charge l'ancienne driveline finale (liste de points [x,y,z], au moins 2) et en fait des points complets ; lit aussi les propriétés.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:228
---@return boolean  true si chargée.
function gameplay_rally_driveline_drivelineV3:loadFinalDrivelineFromFile() end

--- Pipeline complet : charge l'enregistrement recce, convertit en spline, calcule la géométrie, génère les points finaux.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:306
---@return boolean  true si toutes les étapes ont réussi.
function gameplay_rally_driveline_drivelineV3:loadFromRecording() end

--- Lit data.properties (speedLimitKph, liaisonAllocatedTimeMins, useRaycast, vertRayRaise) avec valeurs par défaut.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:86
---@param data table|nil Données JSON.
function gameplay_rally_driveline_drivelineV3:loadPropertiesFromData(data) end

--- Charge les points bruts enregistrés pendant la reconnaissance (DrivelineRecording.load) dans rawDrivelinePoints.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:209
---@return boolean  true si chargés.
function gameplay_rally_driveline_drivelineV3:loadRecceRecording() end

--- Construit la spline à partir de données JSON (nodes, widths, nmls, properties, stats). Échoue si moins de 2 nœuds ou un nœud invalide.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:120
---@param data table Données lues d'un fichier de spline.
---@return boolean  true si chargée.
function gameplay_rally_driveline_drivelineV3:loadSplineFromData(data) end

--- Dessine les points finaux en cylindres rouges semi-transparents avec piquets.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:587
function gameplay_rally_driveline_drivelineV3:renderFinalDriveline() end

--- Dessine (debugDrawer) les points bruts : cylindres rose-violet entre points et petits piquets verticaux. À appeler à chaque frame.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:537
function gameplay_rally_driveline_drivelineV3:renderRawDriveline() end

--- Dessine la courbe lissée (divPoints) comme un prisme bleu de la largeur d'un véhicule.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:563
---@param lineWidth number|nil Largeur du prisme en m (1,945 par défaut).
function gameplay_rally_driveline_drivelineV3:renderSmoothCurve(lineWidth) end

--- Dessine la spline éditable (outils d'éditeur rSpline) avec marqueurs de début et de fin ; pour un seul nœud, dessine la sphère du nœud.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:613
---@param selectedNodeIdx integer|nil Nœud sélectionné (surligné).
function gameplay_rally_driveline_drivelineV3:renderSpline(selectedNodeIdx) end

--- Écrit la spline dans le fichier de spline de la mission (dossier créé au besoin).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:145
---@return boolean  true si l'écriture a réussi.
function gameplay_rally_driveline_drivelineV3:saveSplineToFile() end

--- Sérialise la spline courante en table JSON {version=1, name, isLoop, nodes, widths, nmls, properties, stats}. Renvoie nil si moins de 2 nœuds.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:97
---@return table|nil  Données de la spline.
function gameplay_rally_driveline_drivelineV3:serializeSpline() end

--- Recalcule la géométrie secondaire de la spline (points subdivisés divPoints, tangentes, normales...) conforme au terrain via zSnap.conformSplineGeometry, et sa longueur roadLength.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua:383
---@return boolean  false si pas de spline ou moins de 2 nœuds.
function gameplay_rally_driveline_drivelineV3:updateSplineGeometry() end


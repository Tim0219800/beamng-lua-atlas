---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Driveline V2 renvoyée par le constructeur. Attributs principaux : racePath, notebookPath, route, routeStatic, staticTracker, vehicleTracker, events, eventLog, loaded, nextPacenoteIdxForEval, splitDataList, pathnodeObservationList, raceCompletionData, callbacks onPacenote*Hit.
---@class gameplay_rally_driveline_drivelineRoute
local gameplay_rally_driveline_drivelineRoute = {}

--- Abandonne un chargement en cours (appelle _reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:403
function gameplay_rally_driveline_drivelineRoute:_abortLoadRoute() end

--- Remet à zéro l'état de chargement et de suivi : routes, trackers, évènements, seuils de déclenchement (0,1 m, 1 mph, 2 s, lissage 0,25 s) et suivi souris.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:72
function gameplay_rally_driveline_drivelineRoute:_reset() end

--- Construit le profil d'altitude : un élément {x, y, z, distFromStart, splitLabel, isRacePathnode} par point de la route statique jusqu'à la ligne d'arrivée incluse.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2085
---@return table[]  Profil.
function gameplay_rally_driveline_drivelineRoute:buildElevationProfile() end

--- Appelle un callback d'évènement de note, sauf s'il est nil ou si un recalcul est en attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1331
---@param callbackFn function|nil Callback.
---@param ... any Arguments transmis.
function gameplay_rally_driveline_drivelineRoute:callPacenoteEventCallback(callbackFn, ...) end

--- Délai du copilote pour une vitesse donnée, avec les réglages du pack vocal actif (mise à l'échelle par la vitesse, décalage) via gameplay_rally_codriverTiming.delayForSpeed.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:123
---@param speedMph number Vitesse en mph.
---@return number  Délai en secondes.
function gameplay_rally_driveline_drivelineRoute:codriverDelayForSpeed(speedMph) end

--- Dessine la route (dynamique ou statique) : sphères arc-en-ciel et prismes, indices de points, métadonnées, pathnodes de course et étiquettes de notes (drawLimit étiquettes au plus).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1814
---@param drawRoute boolean|nil Dessiner la route.
---@param drawPacenotes boolean|nil Dessiner les étiquettes Cs/Ce des notes.
---@param drawLimit integer|nil Nombre maximal d'étiquettes de notes (4 par défaut).
---@param monochrome boolean|nil Route en gris foncé surélevée de 2 m.
---@param static boolean|nil Utiliser la route statique.
---@param drawHiddenPathnodes boolean|nil Afficher aussi les pathnodes masqués.
---@param drawRoutePathnodes boolean|nil Afficher les étiquettes de pathnodes et de splits.
---@param drawPointI boolean|nil Afficher l'indice des points.
---@param drawPointMetadata boolean|nil Afficher les métadonnées des points.
---@param drawPacenoteText boolean|nil Ajouter l'aperçu du texte de la note.
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRoute(drawRoute, drawPacenotes, drawLimit, monochrome, static, drawHiddenPathnodes, drawRoutePathnodes, drawPointI, drawPointMetadata, drawPacenoteText) end

--- Dessine en vert la route statique devant le véhicule sur une distance donnée.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:2044
---@param dist number|nil Longueur dessinée en m (100 par défaut).
function gameplay_rally_driveline_drivelineRoute:drawDebugDrivelineRouteShort(dist) end

--- Dessine une sphère orange à l'endroit où la prochaine note se déclenchera à la vitesse actuelle.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1787
function gameplay_rally_driveline_drivelineRoute:drawDebugTriggerPoint() end

--- Durée parlée effective d'une note, avec les écarts de recouvrement structurés (AudioManager:pacenoteEffectiveAudioLen) ; sinon la durée totale brute pacenote:audioLenTotal().
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:114
---@param pacenote table Note.
---@return number  Secondes.
function gameplay_rally_driveline_drivelineRoute:effectiveAudioLen(pacenote) end

--- Autorise le déplacement de la position-souris (Maj + clic) en mode débogage.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1501
---@param val boolean État.
function gameplay_rally_driveline_drivelineRoute:enableTrackMouseLikeVehicleMovement(val) end

--- Indique si le journal détaillé des déclenchements est actif (gameplay_rally.getDebugLogging()).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:60
---@return boolean  true si actif.
function gameplay_rally_driveline_drivelineRoute:enableTriggerLogging() end

--- Évalue les déclenchements d'une note : dynamique (temps avant Cs < délai copilote + durée parlée), immédiat, statique Cs, décalage -40 m et 50 % entre Cs et Ce, décalage -5 m et statique Ce. Appelle les callbacks correspondants avec shouldTriggerAudio (vrai une seule fois, pour le type de déclenchement de la note). Renvoie true si l'audio de la note vient d'être déclenché.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1095
---@param pacenote table Note à évaluer.
---@param speedMs number Vitesse lissée en m/s.
---@return boolean|nil  true si la note est marquée comme jouée ce tick.
function gameplay_rally_driveline_drivelineRoute:evaluatePacenoteEvents(pacenote, speedMs) end

--- Évalue les notes de la fenêtre [prochaine - 5, prochaine] ; avance nextPacenoteIdxForEval à chaque audio déclenché.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1389
---@param speedMs number Vitesse lissée en m/s.
function gameplay_rally_driveline_drivelineRoute:evaluatePacenotesWindow(speedMs) end

--- Position du deuxième point de la route dynamique (point en avant du véhicule).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:147
---@return vec3|nil  Position.
function gameplay_rally_driveline_drivelineRoute:getAheadRoutePointPos() end

--- Longueur de la course formatée '%.2f km', ou 'N/A'.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1586
---@return string  Texte.
function gameplay_rally_driveline_drivelineRoute:getDistanceKmString() end

--- Longueur de la course (du départ à la ligne d'arrivée) en mètres ; -1 si la ligne d'arrivée est inconnue ; nil sans route ou racePath.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1573
---@return number|nil  Mètres.
function gameplay_rally_driveline_drivelineRoute:getDistanceMeters() end

--- distToTarget du point de route statique du dernier pathnode (ligne d'arrivée) ; nil si indisponible.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1546
---@return number|nil  Mètres.
function gameplay_rally_driveline_drivelineRoute:getFinishLineDistOffset() end

--- Position projetée sur la route statique du segment le plus proche (via kd-tree), si la projection est en avant du début du segment (xnorm > 0).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:831
---@param pos vec3 Position.
---@return vec3|nil  Position sur la route.
function gameplay_rally_driveline_drivelineRoute:getNearestRoutePoint(pos) end

--- Prochaine note à évaluer.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:143
---@return table|nil  Note.
function gameplay_rally_driveline_drivelineRoute:getNextPacenote() end

--- Renvoie l'évènement mémorisé d'une note ou en crée un : disabledByRecalc, csDynamicHit, csImmediateHit, csStaticHit, csMeterOffsetHit[-40], cornerPercentHit[0.5], ceStaticHit, ceMeterOffsetHit[-5], audioTriggerComplete.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1033
---@param pacenote table Note.
---@return table  Évènement.
function gameplay_rally_driveline_drivelineRoute:getPacenoteEvent(pacenote) end

--- Liste triée des notes du carnet chargé ({} si aucun carnet).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:135
---@return table[]  Notes.
function gameplay_rally_driveline_drivelineRoute:getPacenotes() end

--- Distance du départ à un point de la route, en kilomètres.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1671
---@param point table Point de route.
---@return number  Kilomètres.
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartKm(point) end

--- Distance du départ à un point de la route, en mètres (0 sans route).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1660
---@param point table Point de route avec distToTarget.
---@return number  Mètres.
function gameplay_rally_driveline_drivelineRoute:getPointDistanceFromStartMeters(point) end

--- Position du véhicule (ou de la souris en mode débogage).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1366
---@return vec3|nil  Position.
function gameplay_rally_driveline_drivelineRoute:getPosition() end

--- Progression de la course : renvoie une table partagée {distM, distPct, distKm, totalDistM} (distance parcourue, fraction, texte '%.2fkm', longueur totale). Valeurs à 0 si la ligne d'arrivée est inconnue.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1595
---@return table|nil  Données de progression (table réutilisée).
function gameplay_rally_driveline_drivelineRoute:getRaceCompletionData() end

--- Distance restante où replacer le véhicule après une sortie de route (suiveur statique ; sinon distance suivie).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:892
---@param backoffDistance number|nil Recul en mètres.
---@return number|nil  distToTarget.
function gameplay_rally_driveline_drivelineRoute:getRecoveryDistToTarget(backoffDistance) end

--- Demi-largeur actuelle du corridor.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:875
---@return number|nil  Mètres.
function gameplay_rally_driveline_drivelineRoute:getRouteCorridorWidth() end

--- Vitesse du véhicule en m/s (ou celle de la souris en mode débogage). 0 sans suiveur de véhicule, nil sans véhicule.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1337
---@return number|nil  m/s.
function gameplay_rally_driveline_drivelineRoute:getSpeed() end

--- État du suiveur statique (voir RallyRouteTracker:getState).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:859
---@return table|nil  État.
function gameplay_rally_driveline_drivelineRoute:getStaticTrackerState() end

--- Distance restante jusqu'à la fin de la route : celle du suiveur statique ; à défaut celle du premier point de la route dynamique.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:882
---@return number|nil  Mètres.
function gameplay_rally_driveline_drivelineRoute:getTrackedDistToTarget() end

--- Initialise les callbacks (nil), les options de débogage souris, les listes de splits et l'état interne (_reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:28
function gameplay_rally_driveline_drivelineRoute:init() end

--- Indique si une route a été chargée avec succès.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:68
---@return boolean  État.
function gameplay_rally_driveline_drivelineRoute:isLoaded() end

--- Charge la route à partir d'une driveline enregistrée : construit la liste de points (driveline, position de départ, zone d'arrêt, pathnodes, waypoints Cs/Ce des notes), supprime ceux avant le départ et après l'arrêt, crée route dynamique et route statique, le suiveur statique, les longueurs de notes et les données de splits/pathnodes. Retourne false (et se remet à zéro) si les prérequis manquent.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:412
---@param racePath table Objet RacePath.
---@param notebookPath table Objet NotebookPath.
---@param pointsList table PointList des points enregistrés.
---@return boolean  true si la route est chargée.
function gameplay_rally_driveline_drivelineRoute:loadRouteFromRecordedDriveline(racePath, notebookPath, pointsList) end

--- Appelé à chaque frame : met à jour la souris en mode débogage, la vitesse, le suiveur statique et la vitesse de déclenchement lissée ; exécute un recalcul si demandé, sinon évalue les notes si la vitesse dépasse 1 mph et que 2 s se sont écoulées depuis le dernier recalcul. Ignore les vitesses > 1000 mph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1427
---@param dtReal number Temps réel (s).
---@param dtSim number Temps de simulation (s).
---@param dtRaw number Temps brut (s).
function gameplay_rally_driveline_drivelineRoute:onUpdate(dtReal, dtSim, dtRaw) end

--- Position sur la route statique pour une distance restante donnée (interpolation linéaire entre points).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1699
---@param targetDist number distToTarget en mètres.
---@return vec3|nil  Position, nil hors route.
function gameplay_rally_driveline_drivelineRoute:positionAtDistToTarget(targetDist) end

--- Projette une position sur la route statique sans modifier l'état.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:848
---@param pos vec3 Position.
---@param options table|nil {forceFullSearch}.
---@return table|nil  Projection.
function gameplay_rally_driveline_drivelineRoute:projectStaticRoute(pos, options) end

--- Recalcule la route depuis la position courante : retrouve le prochain waypoint de début de virage (Cs) et le prochain pathnode, désactive les évènements des notes déjà passées (disabledByRecalc), fixe nextPacenoteIdxForEval, appelle route:recalculateRouteWithOriginalPositions et réinitialise le suiveur statique (sauf preserveStaticTracker).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:900
---@param options table|nil {preserveStaticTracker = boolean}.
---@return boolean  true.
function gameplay_rally_driveline_drivelineRoute:recalculate(options) end

--- Réinitialise le suiveur statique, éventuellement à une position.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:853
---@param pos vec3|nil Position initiale.
function gameplay_rally_driveline_drivelineRoute:resetStaticTracker(pos) end

--- Demande un recalcul de la route au prochain onUpdate.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1482
---@param options table|nil {preserveStaticTracker = boolean}.
function gameplay_rally_driveline_drivelineRoute:setRecalcNeeded(options) end

--- Règle la demi-largeur du corridor de route du suiveur statique.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:869
---@param width number Mètres (bornée à [0,1 ; 15] par le suiveur).
function gameplay_rally_driveline_drivelineRoute:setRouteCorridorWidth(width) end

--- Active la capture de diagnostic du suiveur statique.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:863
---@param enabled boolean true pour activer.
function gameplay_rally_driveline_drivelineRoute:setStaticTrackerDebugCapture(enabled) end

--- Active/désactive le suivi de la souris comme s'il s'agissait du véhicule (débogage). La désactivation efface les données de souris.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1490
---@param val boolean État.
function gameplay_rally_driveline_drivelineRoute:setTrackMouseLikeVehicle(val) end

--- Définit l'objet qui fournit la position et la vitesse du véhicule (méthodes getVehicle, speedMs, pos).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:131
---@param vehicleTracker table Suivi du véhicule.
function gameplay_rally_driveline_drivelineRoute:setVehicleTracker(vehicleTracker) end

--- Lisse la vitesse utilisée pour les déclenchements (filtre exponentiel de constante 0,25 s) ; l'initialise à la vitesse courante si elle est nil ou si dtSim est invalide.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1014
---@param speedMs number|nil Vitesse en m/s.
---@param dtSim number|nil Pas de temps de simulation en s.
---@return number|nil  Vitesse lissée en m/s.
function gameplay_rally_driveline_drivelineRoute:updateDynamicTriggerSpeed(speedMs, dtSim) end

--- Met à jour la position et la vitesse simulées de la souris (raycast caméra, lissage 0,02) en mode débogage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1505
---@param dtSim number Temps de simulation (s).
function gameplay_rally_driveline_drivelineRoute:updateMouseLikeVehicle(dtSim) end

--- Met à jour le suiveur de route statique avec la position (RallyRouteTracker:update).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:843
---@param pos vec3 Position.
---@param options table|nil {allowJump, forceFullSearch}.
---@return table|nil  Projection.
function gameplay_rally_driveline_drivelineRoute:updateStaticTracker(pos, options) end

--- Position et orientation pour replacer le véhicule distBefore mètres avant le début du virage (Cs) d'une note, cap pris vers un point tangentLookAhead mètres plus loin sur la route.
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1713
---@param pacenote table Note.
---@param distBefore number|nil Distance avant Cs en m (10 par défaut).
---@param tangentLookAhead number|nil Distance de visée en m (min(distBefore, 5) par défaut).
---@return vec3|nil  Position.
---@return quat|nil  Orientation.
---@return vec3|nil  Direction avant normalisée.
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForPacenote(pacenote, distBefore, tangentLookAhead) end

--- Position et orientation pour récupérer le véhicule après une sortie de route (distance de récupération du suiveur, bornée au début de la route).
---Source : lua/ge/extensions/gameplay/rally/driveline/drivelineRoute.lua:1754
---@param backoffDistance number|nil Recul en m.
---@param tangentLookAhead number|nil Distance de visée en m (5 par défaut).
---@return vec3|nil  Position.
---@return quat|nil  Orientation.
---@return string|nil  Message d'erreur en cas d'échec.
---@return vec3|nil  Direction avant.
---@return number|nil  distToTarget de placement.
function gameplay_rally_driveline_drivelineRoute:vehiclePlacementPosAndRotForRecovery(backoffDistance, tangentLookAhead) end


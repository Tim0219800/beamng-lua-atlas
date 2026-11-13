---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du gestionnaire de boucle. Champs principaux : missionId, missionDir, mission, missionName, fgVariables, missionSequence (liste d'ids), currentMissionIndex (0 = pas démarré), schedule (une entrée par mission de la séquence), events (liste linéaire des évènements), nextEventIndex, clock, clockPaused, environmentStartTimeSecs, rallyStartTimeSecs, scheduleParams, skipParams, eventLog (RallyEventLog), streamData/rallyClockData/scheduleData/timecardData/uiColors (tables réutilisées sur place), roadSectionPenaltyKeeper, speedingDetector, totalSSCount, totalSSDistanceKm, totalRoadSectionDistanceKm, totalDistanceKm.
---@class gameplay_rally_loop_rallyLoopManager
local gameplay_rally_loop_rallyLoopManager = {}

--- Ajoute l'entrée serviceIn (position du stall serviceStallPos, sans heure ni TC).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1414
function gameplay_rally_loop_rallyLoopManager:_addServiceInToSchedule() end

--- Ajoute l'entrée serviceOut au schedule (TC0, ou TC{n-1}B si on continue un rallye) et renvoie son étiquette.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1385
---@param currentScheduleTimeSecs number Heure courante.
---@param startingSSNumber integer Numéro de la première spéciale.
---@return string  Étiquette TC.
function gameplay_rally_loop_rallyLoopManager:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber) end

--- Ajoute un problème de validation (blocking = true par défaut) et marque l'horaire invalide (scheduleValid = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:377
---@param issue table {type, missionId, missionType, label, message, hint, blocking}.
function gameplay_rally_loop_rallyLoopManager:_addValidationIssue(issue) end

--- Construit la liste events : un TC pour serviceOut, un 'service_in', et pour chaque spéciale 'ss_start' + 'ss_stop', pour chaque liaison un 'tc' (TC_out). Place nextEventIndex sur le premier évènement avec heure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1721
function gameplay_rally_loop_rallyLoopManager:_buildEventsFromSchedule() end

--- Détermine les étiquettes TC_in et TC_out d'une liaison : TC_in reprend le dernier TC pour la première liaison ou la liaison de retour ; TC_out = 'TC'..nextSSNumber, ou 'TC'..(nextSSNumber-1)..'A' pour la liaison de retour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1350
---@param roadSectionCount integer Rang de la liaison.
---@param nextSSNumber integer Prochain numéro de spéciale.
---@param isServiceInRoadSection boolean true pour la liaison de retour.
---@param lastTCLabel string|nil Dernier TC attribué.
---@param tcInPos vec3|nil Position TC_in.
---@param tcOutPos vec3|nil Position TC_out.
---@return string|nil  tcInLabel.
---@return string|nil  tcOutLabel.
---@return string|nil  Dernier TC mis à jour.
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos) end

--- Calcule les heures d'une liaison : TC_in = heure courante, TC_out = minute supérieure de (heure courante + temps alloué).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1295
---@param tcInPos vec3|nil Position TC_in.
---@param tcOutPos vec3|nil Position TC_out.
---@param currentScheduleTimeSecs number Heure courante de l'horaire.
---@param timeAllocationSecs number|nil Temps alloué en secondes.
---@return number|nil  tcInTime.
---@return number|nil  tcOutTime.
---@return number|nil  Durée de la section.
---@return number  Heure courante mise à jour.
function gameplay_rally_loop_rallyLoopManager:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs) end

--- Calcule les heures d'une spéciale : ligne de départ = minute supérieure de (heure courante + 60 s), arrêt = minute supérieure de (départ + temps alloué).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1321
---@param ssStartLinePos vec3|nil Position de la ligne de départ.
---@param ssStopControlPos vec3|nil Position du contrôle d'arrêt.
---@param currentScheduleTimeSecs number Heure courante.
---@param timeAllocationSecs number|nil Temps alloué.
---@return number|nil  Heure de la ligne de départ.
---@return number|nil  Heure du contrôle d'arrêt.
---@return number|nil  Durée de transition.
---@return number|nil  Durée de la section.
---@return number  Heure courante mise à jour.
function gameplay_rally_loop_rallyLoopManager:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs) end

--- Cherche vers l'avant, à partir de nextEventIndex, le prochain évènement 'ss_start'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1038
---@return table|nil  Évènement.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findNextSSStartEvent() end

--- Cherche vers l'avant le prochain évènement 'tc'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1071
---@return table|nil  Évènement.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findNextTCEvent() end

--- Cherche vers l'arrière le 'ss_start' de la spéciale en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1054
---@return table|nil  Évènement.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findPreviousSSStartEvent() end

--- Cherche vers l'arrière le dernier évènement 'tc'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1087
---@return table|nil  Évènement.
---@return integer|nil  Index.
function gameplay_rally_loop_rallyLoopManager:_findPreviousTCEvent() end

--- Étiquette attendue pour un message de validation : 'ROAD'..(roadSectionCount+1) pour une liaison, 'SS'..nextSSNumber pour une spéciale, nil sinon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:353
---@param missionType string|nil 'rallyRoadSection' ou 'rallyStage'.
---@param nextSSNumber integer|nil Prochain numéro de spéciale.
---@param roadSectionCount integer|nil Nombre de liaisons déjà traitées.
---@return string|nil  Étiquette.
function gameplay_rally_loop_rallyLoopManager:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount) end

--- Conseil de correction selon le message d'erreur (mot 'driveline' ou 'race') et le type de mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:362
---@param missionType string|nil Type de mission.
---@param errorMessage string|nil Message d'erreur du rallyManager.
---@return string|nil  Conseil ou nil.
function gameplay_rally_loop_rallyLoopManager:_getValidationHint(missionType, errorMessage) end

--- Réinitialise schedule, events, validation, totaux, calcule l'heure de départ du rallye, initialise l'horloge (négative) et crée le roadSectionPenaltyKeeper et le speedingDetector.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1632
---@return table  État initial du calcul (returnRoadSectionId, startingSSNumber, nextSSNumber, roadSectionCount, lastTCLabel, rallyStartTimeSecs, currentScheduleTimeSecs).
function gameplay_rally_loop_rallyLoopManager:_initScheduleCalculation() end

--- Définit la position de déclenchement du serviceOut (TC_in de la première liaison), construit les évènements et les données de carte de temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1693
function gameplay_rally_loop_rallyLoopManager:_postProcessSchedule() end

--- Charge une mission de spéciale ou de liaison via un RallyManager temporaire (distance, temps alloué, limite de vitesse, positions TC/SS), détermine son type, calcule ses étiquettes et heures, ajoute l'entrée au schedule. En cas d'échec, ajoute un problème de validation (scheduleLoadFailed ou scheduleMissingStageStartPositions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1434
---@param missionId string Id de la mission.
---@param currentScheduleTimeSecs number Heure courante.
---@param nextSSNumber integer Prochain numéro de spéciale.
---@param roadSectionCount integer Nombre de liaisons déjà traitées.
---@param lastTCLabel string|nil Dernier TC.
---@param serviceInRoadSectionId string|nil Id de la liaison de retour.
---@param includeDebugData boolean Garder les points de driveline.
---@return table  {currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, success, isStage}.
function gameplay_rally_loop_rallyLoopManager:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData) end

--- Modifie l'heure du prochain 'ss_start' (marque scheduledTimeWasAdjusted, incrémente rescheduleCount).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1103
---@param newTime number Nouvelle heure en epoch.
---@param onlyIfLater boolean Si true, ne change que si newTime est strictement postérieure.
---@param reason string Raison (log).
---@return table  {success, newTime, oldTime, rescheduleCount} ou {success=false, reason}.
function gameplay_rally_loop_rallyLoopManager:_updateSSStartTime(newTime, onlyIfLater, reason) end

--- Active (pushActionMap) ou désactive (popActionMap) la carte d'actions 'RallyModeInteract'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2120
---@param enabled boolean|nil true pour activer.
function gameplay_rally_loop_rallyLoopManager:activateRallyModeInteractActionMap(enabled) end

--- Ajoute des secondes à l'horloge (avance ou recul).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:564
---@param seconds number Secondes à ajouter.
function gameplay_rally_loop_rallyLoopManager:adjustClock(seconds) end

--- Passe à l'évènement suivant (nextEventIndex = #events + 1 à la fin).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:855
function gameplay_rally_loop_rallyLoopManager:advanceToNextEvent() end

--- Applique les réglages choisis sur l'écran de départ (rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties), met à jour isNgrcMode, les données d'horloge et les couleurs.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:296
---@param values table|nil Table clé -> booléen (ignorée si ce n'est pas une table).
function gameplay_rally_loop_rallyLoopManager:applyStartScreenSettings(values) end

--- Applique l'exclusion de trafic de la boucle (TrafficExclusion.applyForRallyLoop).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2940
function gameplay_rally_loop_rallyLoopManager:applyTrafficExclusion() end

--- Construit missionSequence : 'serviceOut', puis liaison et spéciale de chaque stage 1 à 4 présents, la liaison de retour, puis 'serviceIn'. Remet currentMissionIndex à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:384
function gameplay_rally_loop_rallyLoopManager:buildMissionSequence() end

--- Calcule rallyStartTimeSecs : heure de l'environnement arrondie à la minute supérieure plus currentTimeToRallyStartSecs (120 s).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:468
---@return number  Secondes du jour.
function gameplay_rally_loop_rallyLoopManager:calculateRallyStartTime() end

--- Calcule tout l'horaire : initialise l'état, parcourt la séquence (serviceOut, missions réelles chargées via un RallyManager temporaire, serviceIn), puis construit les évènements et les cartes de temps. Arrête et vide events au premier échec de mission.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:601
---@param includeDebugData boolean|nil true pour garder la liste de points de driveline (dessin de debug).
---@return boolean  false si une mission n'a pas pu être traitée.
function gameplay_rally_loop_rallyLoopManager:calculateSchedule(includeDebugData) end

--- Replanifie la ligne de départ de spéciale d'après l'heure d'arrivée au TC : minute suivante s'il reste au moins 35 s dans la minute, sinon minute pleine après arrivée + 60 s. Ne met à jour que si la nouvelle heure est plus tardive.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1141
---@param tcArrivalTime number Heure d'arrivée en epoch.
---@return number|nil  Heure de départ résultante.
function gameplay_rally_loop_rallyLoopManager:calculateStartLineTime(tcArrivalTime) end

--- Vrai si un saut de contrôle horaire ou de compte à rebours est possible.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2214
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:canSkip() end

--- Vrai si le compte à rebours peut être sauté.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2629
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:canSkipCountdown() end

--- Drapeau de saut manuel possible.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2210
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:canSkipTimeControls() end

--- Supprime l'exclusion de trafic (TrafficExclusion.clearTrafficExclusion).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2949
function gameplay_rally_loop_rallyLoopManager:clearTrafficExclusion() end

--- Dessine en debug les épingles, positions TC/SS et éventuellement le tracé et les étiquettes de chaque mission du schedule (rouge pour les liaisons, bleu pour les spéciales, gris pour les services).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2336
---@param zOnTop boolean|nil Dessiner au premier plan.
---@param drawRoute boolean|nil Dessiner les formes (true par défaut).
---@param drawLabels boolean|nil Dessiner les textes (false par défaut).
function gameplay_rally_loop_rallyLoopManager:drawDebug(zOnTop, drawRoute, drawLabels) end

--- Convertit un temps d'epoch en secondes du jour absolues (epoch + rallyStartTimeSecs, sans modulo).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1285
---@param epochTime number|nil Epoch.
---@return number|nil  Secondes.
function gameplay_rally_loop_rallyLoopManager:epochToWallClock(epochTime) end

--- Évalue si le saut d'horloge est possible : prochain évènement 'tc', vitesse < 30 km/h (hystérésis de 0.5 m/s) et distance du joueur au TC entre 5 m et 50 m. Avec les pénalités d'avance, autorise le saut manuel ; sans, saute automatiquement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2162
function gameplay_rally_loop_rallyLoopManager:evaluateSkip() end

--- Extrait l'id de mission d'une valeur « Nom (id) » de fgVariable. Renvoie nil pour nil ou '<none>'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:344
---@param value string|nil Valeur du champ.
---@return string|nil  Id de mission.
function gameplay_rally_loop_rallyLoopManager:extractMissionId(value) end

--- Si les pénalités d'avance sont désactivées, retire les pénalités 'time_control_early' du résultat de timing et recalcule le total.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:870
---@param timingResult table|nil Résultat de Penalties.getTimingStatus.
---@return table|nil  {status, totalPenalty, hasPenalty, penalties}.
function gameplay_rally_loop_rallyLoopManager:filterTimingResultForSettings(timingResult) end

--- Formate une durée en M:SS (valeur absolue).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1231
---@param seconds number|nil Secondes.
---@return string|nil  Texte.
function gameplay_rally_loop_rallyLoopManager:formatDuration(seconds) end

--- Formate un temps de spéciale arrondi au dixième : S.T, M:SS.T ou H:MM:SS.T selon la durée.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1242
---@param seconds number|nil Secondes.
---@return string|nil  Texte.
function gameplay_rally_loop_rallyLoopManager:formatStageTime(seconds) end

--- Formate des secondes du jour selon le format 24 h (USE_24H_FORMAT = true) ou 12 h.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1211
---@param timeSecs number Secondes du jour.
---@param includeSeconds boolean|nil Inclure les secondes.
---@param includeTenths boolean|nil Inclure les dixièmes.
---@return table  {time = 'HH:MM', ampm = 'AM'|'PM'|nil}.
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths) end

--- Comme formatTimeFromSeconds mais renvoie une chaîne (avec AM/PM si 12 h).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1221
---@param timeSecs number Secondes du jour.
---@param includeSeconds boolean|nil Inclure les secondes.
---@param includeTenths boolean|nil Inclure les dixièmes.
---@return string  Texte.
function gameplay_rally_loop_rallyLoopManager:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths) end

--- Indique si l'horloge est en pause.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:560
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:getClockPaused() end

--- Id de la mission courante de la séquence.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:648
---@return string|nil  Id, nil si hors séquence.
function gameplay_rally_loop_rallyLoopManager:getCurrentMissionId() end

--- Chemin du race.race.json de la mission courante (nil pour serviceOut/serviceIn).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:828
---@return string|nil  Chemin.
function gameplay_rally_loop_rallyLoopManager:getCurrentRacePath() end

--- Lit un drapeau de dessin (par exemple showDebugInfo).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2525
---@param flagName string Nom du drapeau.
---@return boolean  Valeur (false par défaut).
function gameplay_rally_loop_rallyLoopManager:getDrawFlag(flagName) end

--- Pénalités de faux départ activées.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2964
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:getEnableFalseStarts() end

--- Heure de l'environnement au démarrage, formatée.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2536
---@return string  Texte, ou 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getEnvironmentStartTimeFormatted() end

--- Temps de l'epoch du rallye (négatif avant le départ).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:543
---@return number  Secondes.
function gameplay_rally_loop_rallyLoopManager:getEpochTime() end

--- Epoch formaté avec signe, par exemple '+0:01:30'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:549
---@return string  Texte.
function gameplay_rally_loop_rallyLoopManager:getEpochTimeFormatted() end

--- Journal d'évènements (RallyEventLog).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1170
---@return table  Journal.
function gameplay_rally_loop_rallyLoopManager:getEventLog() end

--- Liste linéaire des évènements.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:820
---@return table[]|nil  Évènements.
function gameplay_rally_loop_rallyLoopManager:getEvents() end

--- Drapeau indiquant que l'exécution est transférée à une autre mission.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2517
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:getMissionExecutionTransferFlag() end

--- Index (1-based) du prochain évènement à valider.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:824
---@return integer  Index.
function gameplay_rally_loop_rallyLoopManager:getNextEventIndex() end

--- Passe à la mission suivante de la séquence et renvoie son id. Incrémente toujours l'index, même au-delà de la fin.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:710
---@return string|nil  Id, nil si séquence vide ou terminée.
function gameplay_rally_loop_rallyLoopManager:getNextMissionId() end

--- Objet mission de la boucle.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:701
---@return table|nil  Mission.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMission() end

--- Id de la mission rallyLoop.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:693
---@return string  Id.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopMissionId() end

--- Nom (non traduit) de la mission rallyLoop.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:697
---@return string|nil  Nom.
function gameplay_rally_loop_rallyLoopManager:getRallyLoopName() end

--- RallyManager de gameplay_rally (mis en cache) ; nil si l'extension gameplay_rally n'est pas chargée.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2081
---@return table|nil  RallyManager.
function gameplay_rally_loop_rallyLoopManager:getRallyManager() end

--- Durée prévue avant le départ (scheduleParams.currentTimeToRallyStartSecs).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:506
---@return number  Secondes.
function gameplay_rally_loop_rallyLoopManager:getRallyPreStartAllocatedDurationSecs() end

--- Durée entre l'heure de l'environnement et le départ du rallye.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:498
---@return number|nil  Secondes.
function gameplay_rally_loop_rallyLoopManager:getRallyStartDurationSecs() end

--- Heure de départ formatée (HH:MM).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:494
---@return string  Texte.
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeFormatted() end

--- Heure de départ du rallye en secondes du jour.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:490
---@return number|nil  Secondes.
function gameplay_rally_loop_rallyLoopManager:getRallyStartTimeSecs() end

--- Indique si le véhicule est réparé lors d'une récupération : toujours si rallyRepairVehicleOnRecovery, sinon seulement hors spéciale (mode hardcore/NGRC : pas de réparation en spéciale).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:315
---@return boolean  true si réparation.
function gameplay_rally_loop_rallyLoopManager:getRecoveryRepairVehicle() end

--- Nombre de replanifications du prochain 'ss_start'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2654
---@return integer  Compteur.
function gameplay_rally_loop_rallyLoopManager:getSSRescheduleCount() end

--- Table schedule (une entrée par mission de la séquence : tcIn/tcOut/ssStartLine/ssStopControl avec pos, rot, nom, étiquette, heure, speedLimitKph, distanceKm…).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:780
---@return table|nil  Schedule.
function gameplay_rally_loop_rallyLoopManager:getSchedule() end

--- Cherche dans events l'heure planifiée de l'évènement dont spName vaut eventName pour la mission courante.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:568
---@param eventName string Nom de la start position (spName).
---@return number|nil  Heure en epoch, nil si introuvable.
function gameplay_rally_loop_rallyLoopManager:getScheduledEventTime(eventName) end

--- Position {x,y,z} du déclencheur serviceOut (TC_in de la première liaison).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2819
---@return number[]|nil  Position.
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCPos() end

--- Rotation {x,y,z,w} du déclencheur serviceOut.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2833
---@return number[]|nil  Quaternion.
function gameplay_rally_loop_rallyLoopManager:getServiceOutTCRot() end

--- Même limite formatée pour l'affichage, en km/h ou mph arrondi à 5 selon le réglage uiUnitLength.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:72
---@return string  Par exemple '30 km/h'.
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitDisplay() end

--- Limite de vitesse dans le parc d'assistance (30 km/h).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:68
---@return number  km/h.
function gameplay_rally_loop_rallyLoopManager:getServiceParkSpeedLimitKph() end

--- Réglage rallyShowStageApps (true par défaut).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:333
---@return boolean  true si les apps de spéciale sont affichées.
function gameplay_rally_loop_rallyLoopManager:getShowStageApps() end

--- Taille du créneau de replanification du départ de spéciale (1 minute).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:510
---@return number  Minutes.
function gameplay_rally_loop_rallyLoopManager:getSlotSizeMinutes() end

--- Liste des étiquettes de spéciales ('SS1', 'SS2'…).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:798
---@return string[]  Étiquettes.
function gameplay_rally_loop_rallyLoopManager:getStageLabels() end

--- Met à jour sur place et renvoie la table de flux envoyée à l'UI : activeState (testActiveState en mode test), rallyClock, stageData (seulement en spéciale, avec label et unité km), vehicleProximity, countdownData, scheduleData, timecardData, penaltyData (résumé des pénalités), showStageApps, missionName traduit, uiColors.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2577
---@return table  Données de flux.
function gameplay_rally_loop_rallyLoopManager:getStreamData() end

--- Mode test actif.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2960
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:getTestMode() end

--- Heure du jour de l'environnement ; en repli {time = 0.92} (heure de départ par défaut pour l'Italie) si core_environment ne renvoie rien.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1194
---@return table|nil  Table tod.
function gameplay_rally_loop_rallyLoopManager:getTimeOfDay() end

--- Heure du jour de l'environnement formatée (avec secondes).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1268
---@return string  Texte, ou 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getTimeOfDayFormatted() end

--- Distance totale en km.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1182
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalDistanceKm() end

--- Pénalités totales du journal.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1190
---@return number  Secondes.
function gameplay_rally_loop_rallyLoopManager:getTotalPenalty() end

--- Distance totale des liaisons en km.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1178
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalRoadSectionDistanceKm() end

--- Distance totale des spéciales en km.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1174
---@return number  km.
function gameplay_rally_loop_rallyLoopManager:getTotalSSDistanceKm() end

--- Temps total (spéciales + pénalités) du journal.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1186
---@return number  Secondes.
function gameplay_rally_loop_rallyLoopManager:getTotalTime() end

--- Trafic activé pour la boucle (faux pour une mission de dev qui le désactive).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:325
---@return boolean  true si activé.
function gameplay_rally_loop_rallyLoopManager:getTrafficEnabled() end

--- Format 24 h (constante USE_24H_FORMAT = true).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2088
---@return boolean  true.
function gameplay_rally_loop_rallyLoopManager:getUse24hFormat() end

--- Liste des problèmes de validation.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:812
---@return table[]  Problèmes.
function gameplay_rally_loop_rallyLoopManager:getValidationIssues() end

--- Résout le voicepack à utiliser via voicepack.resolveLoopVoicepackPick selon le réglage rallyVoicepackPick.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:705
---@param missionId string Id de la mission.
---@param missionDir string Dossier de la mission.
---@return any  Choix de voicepack (déduit du code : valeur renvoyée par voicepack.resolveLoopVoicepackPick).
function gameplay_rally_loop_rallyLoopManager:getVoicepackPickForMission(missionId, missionDir) end

--- Numéro de jour (1, 2…) de l'horloge murale.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:523
---@return integer|nil  Jour.
function gameplay_rally_loop_rallyLoopManager:getWallClockDay() end

--- Heure murale avec secondes et dixièmes, suivie de « , Day N ».
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:532
---@return string  Texte, ou 'N/A'.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeFormatted() end

--- Heure murale courante = (rallyStartTimeSecs + clock) % 86400.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:514
---@return number|nil  Secondes du jour, nil si l'horaire n'est pas calculé.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeSecs() end

--- Heure murale avec secondes sous forme de table {time, ampm}.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2092
---@return table|nil  Table.
function gameplay_rally_loop_rallyLoopManager:getWallClockTimeTable() end

--- Identique à restartRallyLoop : redémarre instantanément la mission rallyLoop.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:769
function gameplay_rally_loop_rallyLoopManager:gotoRallyLoopInstant() end

--- Vrai s'il y a au moins un problème de validation.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:816
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:hasValidationIssues() end

--- Initialise l'état de la boucle : tables d'UI, heure de départ de l'environnement, horloge en pause, paramètres d'horaire (départ rallye 120 s après la minute pleine, 60 s de TC à la ligne de départ, créneau de 1 min) et de saut. Si la mission fournit des fgVariables, construit la séquence et calcule l'horaire (calculateSchedule(true)), puis lit les réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:77
---@param missionId string Id de la mission rallyLoop.
---@param missionDir string Dossier de la mission.
function gameplay_rally_loop_rallyLoopManager:init(missionId, missionDir) end

--- Fige les réglages de la boucle : enableFalseStarts, repairVehicleOnRecovery, earlyTimeControlPenaltiesEnabled, trafficEnabled, showStageApps et isNgrcMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:286
function gameplay_rally_loop_rallyLoopManager:initSettings() end

--- Construit une fois la structure timecardData (une entrée par TC, plus une entrée de temps par spéciale), avec groupes 'group-N'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1842
function gameplay_rally_loop_rallyLoopManager:initTimecardData() end

--- Vrai pour une mission de dev dont missionTypeData.devDisableTraffic est vrai.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:279
---@return boolean  true si le trafic est désactivé par la mission de dev.
function gameplay_rally_loop_rallyLoopManager:isDevTrafficDisabled() end

--- Vrai si l'entrée courante du schedule est une liaison (roadSectionLabel défini).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:655
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:isInRoadSection() end

--- Vrai si l'entrée courante est une spéciale chronométrée (ssLabel défini).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:671
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:isInSpecialStage() end

--- Vrai tant qu'aucun problème bloquant n'a été trouvé.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:808
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:isScheduleValid() end

--- Drapeau de saut disponible.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2206
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:isTimeControlSkipAvailable() end

--- Hook appelé à la création de la route de marqueurs au sol : remet à zéro le roadSectionPenaltyKeeper.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2872
function gameplay_rally_loop_rallyLoopManager:onCreatedRallyGroundMarkerRoute() end

--- Appelé par la boucle GUI ; ne fait rien (instrumentation du profileur seulement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2155
---@param dtReal number Temps réel.
---@param dtSim number Temps de simulation.
---@param dtRaw number Temps brut.
function gameplay_rally_loop_rallyLoopManager:onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Reçoit les données du rallyManager ou des nœuds (activeState, vehicleProximity avec distances arrondies au centimètre, countdownData) et les mémorise pour le flux UI.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2543
---@param data table|nil Paquet de données.
function gameplay_rally_loop_rallyLoopManager:onRallyDataUpdated(data) end

--- Hook de l'action d'interaction : saute au prochain évènement si possible, sinon déclenche l'évènement UI RallyGameplayInteract.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2328
function gameplay_rally_loop_rallyLoopManager:onRallyModeInteract() end

--- Hook de fin de récupération de route : mémorise data dans lastRouteRecoveryData et log.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2925
---@param data table|nil {vehId, repairVehicle}.
function gameplay_rally_loop_rallyLoopManager:onRallyRouteRecoveryComplete(data) end

--- Hook de recalcul d'itinéraire ; actuellement sans effet (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2861
---@param source any Source du recalcul.
function gameplay_rally_loop_rallyLoopManager:onRecalculatedRoute(source) end

--- Hook appelé quand les réglages changent : relit rallyShowStageApps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:340
function gameplay_rally_loop_rallyLoopManager:onSettingsChanged() end

--- Appelé quand le joueur clique sur Démarrer : applique les réglages de l'écran de départ, relance l'horloge, active le bouton restartMission de core_recoveryPrompt et dégèle le véhicule.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2847
function gameplay_rally_loop_rallyLoopManager:onUIStartButtonClicked() end

--- Appelé à chaque frame : avance l'horloge de dtSim si elle n'est pas en pause, évalue le saut, active la carte d'actions si le saut est possible, met à jour le roadSectionPenaltyKeeper et le speedingDetector (hors spéciale, avec limite ; mode strict pour serviceIn et serviceOut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2129
---@param dtReal number Temps réel.
---@param dtSim number Temps de simulation.
---@param dtRaw number Temps brut.
function gameplay_rally_loop_rallyLoopManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Enregistre une pénalité de faux départ pour la prochaine spéciale : compte les faux départs déjà journalisés pour l'évènement et utilise Penalties.calculateFalseStartPenalty(n).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2664
---@return boolean  false s'il n'y a pas de ss_start à venir.
function gameplay_rally_loop_rallyLoopManager:recordFalseStartPenalty() end

--- Enregistre une pénalité de recalcul d'itinéraire (penaltyType 'route_recalc') sur le prochain TC et affiche un message « Route penalty recorded ».
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2707
---@param penaltyData table {amount, data = {violationNumber, recalcCount}} (produit par roadSectionPenaltyKeeper).
---@return boolean  false s'il n'y a pas de TC à venir.
function gameplay_rally_loop_rallyLoopManager:recordRouteRecalcPenalty(penaltyData) end

--- Enregistre une pénalité d'excès de vitesse fixe de 10 s sur le prochain évènement 'tc' ou 'service_in'.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2733
---@param speedingData table {speedOver, speedLimit, strictMode, …} produit par speedingDetector.
---@return boolean  false s'il n'y a pas d'évènement éligible.
function gameplay_rally_loop_rallyLoopManager:recordSpeedingPenalty(speedingData) end

--- Outil de test : enregistre une pénalité 'test_penalty' (10 s par défaut) sur l'évènement courant et affiche un message.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2783
---@param amount number|nil Secondes (entier > 0).
---@return boolean  false si montant <= 0 ou aucun évènement.
function gameplay_rally_loop_rallyLoopManager:recordTestPenalty(amount) end

--- Enregistre le passage à l'évènement courant. Vérifie que l'évènement appartient à la mission courante et que entryName == spName. Calcule l'écart horaire, journalise les pénalités horaires puis un item 'timecard' (actualTime, timeDiff, timingResult, stageTimeSecs, splits pour ss_stop), force l'affichage de la carte de temps, replanifie la ligne de départ si on arrive à un TC trop près, met à jour la carte puis avance.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:893
---@param entryName string Nom de la start position franchie.
---@param stageTimeSecs number|nil Temps de la spéciale (pour ss_stop).
---@return boolean  false si l'enregistrement est refusé.
function gameplay_rally_loop_rallyLoopManager:recordTimeCardEntry(entryName, stageTimeSecs) end

--- Repousse le prochain 'ss_start' au créneau suivant (slotSizeMinutes, arrondi à la minute) quand le véhicule n'est pas en position à -10 s. Replanifie toujours.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2633
---@return table  Résultat de _updateSSStartTime.
function gameplay_rally_loop_rallyLoopManager:rescheduleNextSSStart() end

--- Lit un réglage booléen global (settings.getValue) ou la valeur par défaut.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:268
---@param key string Nom du réglage.
---@param defaultValue boolean Valeur de repli.
---@return boolean  Valeur résolue.
function gameplay_rally_loop_rallyLoopManager:resolveGlobalBoolSetting(key, defaultValue) end

--- Lit un réglage booléen en priorité dans mission.lastUserSettings, sinon dans settings.getValue, sinon la valeur par défaut.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:252
---@param key string Nom du réglage.
---@param defaultValue boolean Valeur de repli.
---@return boolean  Valeur résolue.
function gameplay_rally_loop_rallyLoopManager:resolveMissionBoolSetting(key, defaultValue) end

--- Relance la mission rallyLoop depuis elle-même (instantané) et lève missionExecutionTransferFlag.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:758
function gameplay_rally_loop_rallyLoopManager:restartRallyLoop() end

--- Arrondit à la minute supérieure (délègue à scheduleUtils).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1033
---@param timeSecs number Secondes.
---@return number  Secondes.
function gameplay_rally_loop_rallyLoopManager:roundToNextMinute(timeSecs) end

--- Fixe les deux drapeaux de saut de contrôle horaire.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2201
---@param canSkip boolean Saut manuel possible maintenant.
---@param isTimeControlSkipAvailable boolean Saut disponible (affichage).
function gameplay_rally_loop_rallyLoopManager:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable) end

--- Met l'horloge en pause ou la relance.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:556
---@param paused boolean true pour figer.
function gameplay_rally_loop_rallyLoopManager:setClockPaused(paused) end

--- Mémorise que le compte à rebours peut être sauté (mis à jour par le nœud de compte à rebours).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2624
---@param canSkip boolean|nil État.
function gameplay_rally_loop_rallyLoopManager:setCountdownCanSkip(canSkip) end

--- Fixe un drapeau de dessin.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2529
---@param flagName string Nom du drapeau.
---@param value boolean Valeur.
function gameplay_rally_loop_rallyLoopManager:setDrawFlag(flagName, value) end

--- Fixe le drapeau de transfert d'exécution.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2521
---@param val boolean Valeur.
function gameplay_rally_loop_rallyLoopManager:setMissionExecutionTransferFlag(val) end

--- Fixe l'état actif forcé en mode test (et currentActiveState si le mode test est actif).
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2968
---@param state any Valeur RallyUtil.activeState_*.
function gameplay_rally_loop_rallyLoopManager:setTestActiveState(state) end

--- Active ou désactive le mode test ; en le désactivant, remet currentActiveState à inactif.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2953
---@param enabled boolean|nil État.
function gameplay_rally_loop_rallyLoopManager:setTestMode(enabled) end

--- Oublie le rallyManager mis en cache.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2513
function gameplay_rally_loop_rallyLoopManager:setupForNewMission() end

--- Les excès de vitesse sont pénalisés partout sauf en spéciale.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:687
---@return boolean  État.
function gameplay_rally_loop_rallyLoopManager:shouldPenalizeSpeeding() end

--- Outil de test : téléporte le véhicule à distanceBefore m (50 par défaut) avant le TC_out de la liaison en cours, resynchronise le rallyManager et règle l'horloge 1 s avant l'heure du TC_out.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2252
---@param options table|nil {distanceBefore = 50, resetVehicle = true}.
---@return boolean  true si réussi.
---@return string|nil  Raison de l'échec.
function gameplay_rally_loop_rallyLoopManager:skipLiaisonForTesting(options) end

--- Avance l'horloge jusqu'à 1 s avant le prochain TC et notifie l'UI (RallyClockSkipped). Refuse si le prochain évènement n'est pas un TC ou si la cible n'est pas dans le futur.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2218
---@return boolean  true si l'horloge a été avancée.
function gameplay_rally_loop_rallyLoopManager:skipToNextEvent() end

--- Lance la mission suivante de la séquence depuis la mission en cours (startFromWithinMission instantané) et lève missionExecutionTransferFlag. Échoue s'il n'y a pas de mission au premier plan.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:727
---@return boolean  true si lancée.
function gameplay_rally_loop_rallyLoopManager:startNextMission() end

--- Enregistre une récupération ('recovery') ou un retournement ('flip') : avance l'horloge de RecoveryClockAdvance.getSeconds(type, enSpéciale), avance aussi l'heure du jour (RallyLoopTime.advancePlayingTime), notifie l'UI et journalise l'item avec la position du joueur.
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2878
---@param recoveryType string 'recovery' ou 'flip'.
function gameplay_rally_loop_rallyLoopManager:trackRecovery(recoveryType) end

--- Met à jour sur place rallyClockData : heure, jour, temps total, drapeaux de saut, pénalités d'avance activées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:2107
function gameplay_rally_loop_rallyLoopManager:updateRallyClockData() end

--- Met à jour sur place scheduleData pour le prochain évènement : étiquette, type, heures de la minute prévue, écart (timeDiff négatif = en avance), statut et pénalité courants, limite de vitesse, parc d'assistance, isSpeeding.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1956
function gameplay_rally_loop_rallyLoopManager:updateScheduleData() end

--- Met à jour l'entrée de carte de temps d'un évènement (heure enregistrée, statut early/late/on-time, temps de spéciale) d'après le journal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:1910
---@param eventIndex integer Index dans events.
function gameplay_rally_loop_rallyLoopManager:updateTimecardEntry(eventIndex) end

--- Vérifie que la première mission est serviceOutMission. Non appelée dans cette version (appel commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua:435
---@return boolean  true si valide.
function gameplay_rally_loop_rallyLoopManager:validateMissionSequence() end


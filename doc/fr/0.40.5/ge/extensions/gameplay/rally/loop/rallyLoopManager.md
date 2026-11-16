# `gameplay_rally_loop_rallyLoopManager`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua` · VM : Game Engine (GE) · 2981 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/rallyLoopManager")` (fichier sous extensions/ mais pas une extension classique)

Gestionnaire d'une boucle de rallye (rally loop) : une mission qui enchaîne service de départ, jusqu'à 4 couples liaison/spéciale (stageN_rallyRoadSection / stageN_rallyStage), une liaison de retour et le parc d'assistance. Il construit la séquence de missions à partir des fgVariables de la mission, calcule l'horaire (contrôles horaires TC, lignes de départ SS, arrêts), en tire une liste linéaire d'évènements, tient l'horloge de rallye (epoch), enregistre les pénalités et les cartes de temps dans un rallyEventLog, et fournit les données de flux (getStreamData) pour l'interface. Instancié par l'extension gameplay_rallyLoop avec (missionId, missionDir) ; les nœuds flowgraph du rallye l'appellent pour enregistrer les passages aux contrôles.

## Exemple

```lua
local mgr = require('gameplay_rally_loop_rallyLoopManager')(missionId, missionDir)
mgr:setClockPaused(false)
local ev = mgr:getEvents()[mgr:getNextEventIndex()]
print(ev.label, ev.time)
```

## Remarques

- Le module renvoie un constructeur ; C:init(missionId, missionDir) est appelé automatiquement. Si la mission a des fgVariables, la séquence et l'horaire sont calculés dans init ; sinon la séquence reste vide.
- Horloge (self.clock) : en secondes dans l'epoch du rallye. Elle est négative avant le départ du rallye (départ = prochaine minute pleine après l'heure de l'environnement + 120 s), vaut 0 au départ du rallye puis croît. Elle démarre en pause (clockPaused = true) et n'est libérée que par onUIStartButtonClicked.
- Heure murale = (rallyStartTimeSecs + clock) modulo 86400. Pour tod.time du moteur, 0 correspond à midi : secondes du jour = ((tod.time*24 + 12) % 24) * 3600.
- Séquence de missions : 'serviceOut', puis pour chaque stage 1 à 4 la liaison puis la spéciale, puis la liaison de retour, puis 'serviceIn'. serviceOut et serviceIn sont des entrées fictives (notActualMission = true).
- Étiquettes : TC0 au premier départ (TC{n-1}B si startingSSNumber > 1), TC{n} pour la liaison avant la spéciale n, TC{n-1}A pour la liaison de retour. Les ssLabel du schedule sont des chaînes de nombre ("1", "2"…) ; l'étiquette affichée est 'SS' .. ssLabel.
- Types d'évènements (self.events[i].type) : 'tc', 'ss_start', 'ss_stop', 'service_in'. Champs d'un évènement : type, label, spName (nom de la start position du race path), time (epoch, minute alignée, nil pour service_in), pos ({x,y,z}), missionId, missionIndex, canIncurLatePenalty, hideTimecardEntry, eventId, eventGroup, inServicePark, timecardIndex.
- Pénalités enregistrées dans eventLog via addItem(event, clock, 'penalty', data) : penaltyType = false_start, route_recalc, speeding (10 s fixes), test_penalty, ainsi que les pénalités horaires de loop/penalties (getTimingStatus : time_control_early, retard…). Les pénalités 'time_control_early' sont retirées quand rallyEnableEarlyTimeControlPenalties est faux.
- Réglages figés au démarrage de la boucle (initSettings) : rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties, rallyEnableTraffic (mission.lastUserSettings en priorité, sinon settings globaux) ; rallyShowStageApps est global. isNgrcMode = not repairVehicleOnRecovery.
- Les chronos et temps de spéciale sont en secondes ; distances en km pour distanceKm et totaux ; limite de vitesse du parc : 30 km/h (serviceParkSpeedLimitKph).
- Bug mineur : dans init, UiColors.updateForLoop et rallyClockData.isNgrcMode sont d'abord appelés avec self.isNgrcMode = nil (défini plus bas par initSettings) ; ils sont réappliqués en fin d'init.
- Code mort : validateMissionSequence n'est pas appelé (appel commenté dans buildMissionSequence) ; onRecalculatedRoute est entièrement commenté (le compteur de recalculs n'est donc jamais incrémenté par ce hook) ; dans _processRegularMission, ssLabel est d'abord 'SS'..n puis immédiatement écrasé par tostring(n).
- getNextMissionId incrémente currentMissionIndex même quand la fin de séquence est dépassée (l'index reste au-delà de la dernière entrée, donc getCurrentMissionId renvoie nil).
- updateScheduleData : timeDiffWithEnd utilise nextEvent.time + 59 alors que eventWallClockEnd utilise nextEvent.time + 60 (fin exclusive).
- extractMissionId utilise le motif '%((.+)%)$' : renvoie ce qui est entre les dernières parenthèses finales d'une chaîne « Nom (id) » (glouton), nil pour '<none>' ou une chaîne sans parenthèses.
- Le module appelle guihooks.trigger avec 'Message', 'RallyClockSkipped' (oldTime, newTime, skippedSeconds) et 'RallyGameplayInteract' ({forceShowTimecard} ou {}), et extensions.hook('onVehicleTeleportedToLastRoad', vehId).

## Classe `C`

Instance du gestionnaire de boucle. Champs principaux : missionId, missionDir, mission, missionName, fgVariables, missionSequence (liste d'ids), currentMissionIndex (0 = pas démarré), schedule (une entrée par mission de la séquence), events (liste linéaire des évènements), nextEventIndex, clock, clockPaused, environmentStartTimeSecs, rallyStartTimeSecs, scheduleParams, skipParams, eventLog (RallyEventLog), streamData/rallyClockData/scheduleData/timecardData/uiColors (tables réutilisées sur place), roadSectionPenaltyKeeper, speedingDetector, totalSSCount, totalSSDistanceKm, totalRoadSectionDistanceKm, totalDistanceKm.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_rallyLoopManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_addServiceInToSchedule()` | Ajoute l'entrée serviceIn (position du stall serviceStallPos, sans heure ni TC). | 1414 |
| `C:_addServiceOutToSchedule(currentScheduleTimeSecs, startingSSNumber)` | Ajoute l'entrée serviceOut au schedule (TC0, ou TC{n-1}B si on continue un rallye) et renvoie son étiquette. | 1385 |
| `C:_addValidationIssue(issue)` | Ajoute un problème de validation (blocking = true par défaut) et marque l'horaire invalide (scheduleValid = false). | 377 |
| `C:_buildEventsFromSchedule()` | Construit la liste events : un TC pour serviceOut, un 'service_in', et pour chaque spéciale 'ss_start' + 'ss_stop', pour chaque liaison un 'tc' (TC_out). Place nextEventIndex sur le premier évènement avec heure. | 1721 |
| `C:_calculateRoadSectionLabels(roadSectionCount, nextSSNumber, isServiceInRoadSection, lastTCLabel, tcInPos, tcOutPos)` | Détermine les étiquettes TC_in et TC_out d'une liaison : TC_in reprend le dernier TC pour la première liaison ou la liaison de retour ; TC_out = 'TC'..nextSSNumber, ou 'TC'..(nextSSNumber-1)..'A' pour la liaison de retour. | 1350 |
| `C:_calculateRoadSectionTimes(tcInPos, tcOutPos, currentScheduleTimeSecs, timeAllocationSecs)` | Calcule les heures d'une liaison : TC_in = heure courante, TC_out = minute supérieure de (heure courante + temps alloué). | 1295 |
| `C:_calculateStageTimes(ssStartLinePos, ssStopControlPos, currentScheduleTimeSecs, timeAllocationSecs)` | Calcule les heures d'une spéciale : ligne de départ = minute supérieure de (heure courante + 60 s), arrêt = minute supérieure de (départ + temps alloué). | 1321 |
| `C:_findNextSSStartEvent()` | Cherche vers l'avant, à partir de nextEventIndex, le prochain évènement 'ss_start'. | 1038 |
| `C:_findNextTCEvent()` | Cherche vers l'avant le prochain évènement 'tc'. | 1071 |
| `C:_findPreviousSSStartEvent()` | Cherche vers l'arrière le 'ss_start' de la spéciale en cours. | 1054 |
| `C:_findPreviousTCEvent()` | Cherche vers l'arrière le dernier évènement 'tc'. | 1087 |
| `C:_getExpectedScheduleLabel(missionType, nextSSNumber, roadSectionCount)` | Étiquette attendue pour un message de validation : 'ROAD'..(roadSectionCount+1) pour une liaison, 'SS'..nextSSNumber pour une spéciale, nil sinon. | 353 |
| `C:_getValidationHint(missionType, errorMessage)` | Conseil de correction selon le message d'erreur (mot 'driveline' ou 'race') et le type de mission. | 362 |
| `C:_initScheduleCalculation()` | Réinitialise schedule, events, validation, totaux, calcule l'heure de départ du rallye, initialise l'horloge (négative) et crée le roadSectionPenaltyKeeper et le speedingDetector. | 1632 |
| `C:_postProcessSchedule()` | Définit la position de déclenchement du serviceOut (TC_in de la première liaison), construit les évènements et les données de carte de temps. | 1693 |
| `C:_processRegularMission(missionId, currentScheduleTimeSecs, nextSSNumber, roadSectionCount, lastTCLabel, serviceInRoadSectionId, includeDebugData)` | Charge une mission de spéciale ou de liaison via un RallyManager temporaire (distance, temps alloué, limite de vitesse, positions TC/SS), détermine son type, calcule ses étiquettes et heures, ajoute l'entrée au schedule. En cas d'échec, ajoute un problème de validation (scheduleLoadFailed ou scheduleMissingStageStartPositions). | 1434 |
| `C:_updateSSStartTime(newTime, onlyIfLater, reason)` | Modifie l'heure du prochain 'ss_start' (marque scheduledTimeWasAdjusted, incrémente rescheduleCount). | 1103 |
| `C:activateRallyModeInteractActionMap(enabled)` | Active (pushActionMap) ou désactive (popActionMap) la carte d'actions 'RallyModeInteract'. | 2120 |
| `C:adjustClock(seconds)` | Ajoute des secondes à l'horloge (avance ou recul). | 564 |
| `C:advanceToNextEvent()` | Passe à l'évènement suivant (nextEventIndex = #events + 1 à la fin). | 855 |
| `C:applyStartScreenSettings(values)` | Applique les réglages choisis sur l'écran de départ (rallyEnableFalseStarts, rallyRepairVehicleOnRecovery, rallyEnableEarlyTimeControlPenalties), met à jour isNgrcMode, les données d'horloge et les couleurs. | 296 |
| `C:applyTrafficExclusion()` | Applique l'exclusion de trafic de la boucle (TrafficExclusion.applyForRallyLoop). | 2940 |
| `C:buildMissionSequence()` | Construit missionSequence : 'serviceOut', puis liaison et spéciale de chaque stage 1 à 4 présents, la liaison de retour, puis 'serviceIn'. Remet currentMissionIndex à 0. | 384 |
| `C:calculateRallyStartTime()` | Calcule rallyStartTimeSecs : heure de l'environnement arrondie à la minute supérieure plus currentTimeToRallyStartSecs (120 s). | 468 |
| `C:calculateSchedule(includeDebugData)` | Calcule tout l'horaire : initialise l'état, parcourt la séquence (serviceOut, missions réelles chargées via un RallyManager temporaire, serviceIn), puis construit les évènements et les cartes de temps. Arrête et vide events au premier échec de mission. | 601 |
| `C:calculateStartLineTime(tcArrivalTime)` | Replanifie la ligne de départ de spéciale d'après l'heure d'arrivée au TC : minute suivante s'il reste au moins 35 s dans la minute, sinon minute pleine après arrivée + 60 s. Ne met à jour que si la nouvelle heure est plus tardive. | 1141 |
| `C:canSkip()` | Vrai si un saut de contrôle horaire ou de compte à rebours est possible. | 2214 |
| `C:canSkipCountdown()` | Vrai si le compte à rebours peut être sauté. | 2629 |
| `C:canSkipTimeControls()` | Drapeau de saut manuel possible. | 2210 |
| `C:clearTrafficExclusion()` | Supprime l'exclusion de trafic (TrafficExclusion.clearTrafficExclusion). | 2949 |
| `C:drawDebug(zOnTop, drawRoute, drawLabels)` | Dessine en debug les épingles, positions TC/SS et éventuellement le tracé et les étiquettes de chaque mission du schedule (rouge pour les liaisons, bleu pour les spéciales, gris pour les services). | 2336 |
| `C:epochToWallClock(epochTime)` | Convertit un temps d'epoch en secondes du jour absolues (epoch + rallyStartTimeSecs, sans modulo). | 1285 |
| `C:evaluateSkip()` | Évalue si le saut d'horloge est possible : prochain évènement 'tc', vitesse < 30 km/h (hystérésis de 0.5 m/s) et distance du joueur au TC entre 5 m et 50 m. Avec les pénalités d'avance, autorise le saut manuel ; sans, saute automatiquement. | 2162 |
| `C:extractMissionId(value)` | Extrait l'id de mission d'une valeur « Nom (id) » de fgVariable. Renvoie nil pour nil ou '<none>'. | 344 |
| `C:filterTimingResultForSettings(timingResult)` | Si les pénalités d'avance sont désactivées, retire les pénalités 'time_control_early' du résultat de timing et recalcule le total. | 870 |
| `C:formatDuration(seconds)` | Formate une durée en M:SS (valeur absolue). | 1231 |
| `C:formatStageTime(seconds)` | Formate un temps de spéciale arrondi au dixième : S.T, M:SS.T ou H:MM:SS.T selon la durée. | 1242 |
| `C:formatTimeFromSeconds(timeSecs, includeSeconds, includeTenths)` | Formate des secondes du jour selon le format 24 h (USE_24H_FORMAT = true) ou 12 h. | 1211 |
| `C:formatTimeFromSecondsString(timeSecs, includeSeconds, includeTenths)` | Comme formatTimeFromSeconds mais renvoie une chaîne (avec AM/PM si 12 h). | 1221 |
| `C:getClockPaused()` | Indique si l'horloge est en pause. | 560 |
| `C:getCurrentMissionId()` | Id de la mission courante de la séquence. | 648 |
| `C:getCurrentRacePath()` | Chemin du race.race.json de la mission courante (nil pour serviceOut/serviceIn). | 828 |
| `C:getDrawFlag(flagName)` | Lit un drapeau de dessin (par exemple showDebugInfo). | 2525 |
| `C:getEnableFalseStarts()` | Pénalités de faux départ activées. | 2964 |
| `C:getEnvironmentStartTimeFormatted()` | Heure de l'environnement au démarrage, formatée. | 2536 |
| `C:getEpochTime()` | Temps de l'epoch du rallye (négatif avant le départ). | 543 |
| `C:getEpochTimeFormatted()` | Epoch formaté avec signe, par exemple '+0:01:30'. | 549 |
| `C:getEventLog()` | Journal d'évènements (RallyEventLog). | 1170 |
| `C:getEvents()` | Liste linéaire des évènements. | 820 |
| `C:getMissionExecutionTransferFlag()` | Drapeau indiquant que l'exécution est transférée à une autre mission. | 2517 |
| `C:getNextEventIndex()` | Index (1-based) du prochain évènement à valider. | 824 |
| `C:getNextMissionId()` | Passe à la mission suivante de la séquence et renvoie son id. Incrémente toujours l'index, même au-delà de la fin. | 710 |
| `C:getRallyLoopMission()` | Objet mission de la boucle. | 701 |
| `C:getRallyLoopMissionId()` | Id de la mission rallyLoop. | 693 |
| `C:getRallyLoopName()` | Nom (non traduit) de la mission rallyLoop. | 697 |
| `C:getRallyManager()` | RallyManager de gameplay_rally (mis en cache) ; nil si l'extension gameplay_rally n'est pas chargée. | 2081 |
| `C:getRallyPreStartAllocatedDurationSecs()` | Durée prévue avant le départ (scheduleParams.currentTimeToRallyStartSecs). | 506 |
| `C:getRallyStartDurationSecs()` | Durée entre l'heure de l'environnement et le départ du rallye. | 498 |
| `C:getRallyStartTimeFormatted()` | Heure de départ formatée (HH:MM). | 494 |
| `C:getRallyStartTimeSecs()` | Heure de départ du rallye en secondes du jour. | 490 |
| `C:getRecoveryRepairVehicle()` | Indique si le véhicule est réparé lors d'une récupération : toujours si rallyRepairVehicleOnRecovery, sinon seulement hors spéciale (mode hardcore/NGRC : pas de réparation en spéciale). | 315 |
| `C:getSSRescheduleCount()` | Nombre de replanifications du prochain 'ss_start'. | 2654 |
| `C:getSchedule()` | Table schedule (une entrée par mission de la séquence : tcIn/tcOut/ssStartLine/ssStopControl avec pos, rot, nom, étiquette, heure, speedLimitKph, distanceKm…). | 780 |
| `C:getScheduledEventTime(eventName)` | Cherche dans events l'heure planifiée de l'évènement dont spName vaut eventName pour la mission courante. | 568 |
| `C:getServiceOutTCPos()` | Position {x,y,z} du déclencheur serviceOut (TC_in de la première liaison). | 2819 |
| `C:getServiceOutTCRot()` | Rotation {x,y,z,w} du déclencheur serviceOut. | 2833 |
| `C:getServiceParkSpeedLimitDisplay()` | Même limite formatée pour l'affichage, en km/h ou mph arrondi à 5 selon le réglage uiUnitLength. | 72 |
| `C:getServiceParkSpeedLimitKph()` | Limite de vitesse dans le parc d'assistance (30 km/h). | 68 |
| `C:getShowStageApps()` | Réglage rallyShowStageApps (true par défaut). | 333 |
| `C:getSlotSizeMinutes()` | Taille du créneau de replanification du départ de spéciale (1 minute). | 510 |
| `C:getStageLabels()` | Liste des étiquettes de spéciales ('SS1', 'SS2'…). | 798 |
| `C:getStreamData()` | Met à jour sur place et renvoie la table de flux envoyée à l'UI : activeState (testActiveState en mode test), rallyClock, stageData (seulement en spéciale, avec label et unité km), vehicleProximity, countdownData, scheduleData, timecardData, penaltyData (résumé des pénalités), showStageApps, missionName traduit, uiColors. | 2577 |
| `C:getTestMode()` | Mode test actif. | 2960 |
| `C:getTimeOfDay()` | Heure du jour de l'environnement ; en repli {time = 0.92} (heure de départ par défaut pour l'Italie) si core_environment ne renvoie rien. | 1194 |
| `C:getTimeOfDayFormatted()` | Heure du jour de l'environnement formatée (avec secondes). | 1268 |
| `C:getTotalDistanceKm()` | Distance totale en km. | 1182 |
| `C:getTotalPenalty()` | Pénalités totales du journal. | 1190 |
| `C:getTotalRoadSectionDistanceKm()` | Distance totale des liaisons en km. | 1178 |
| `C:getTotalSSDistanceKm()` | Distance totale des spéciales en km. | 1174 |
| `C:getTotalTime()` | Temps total (spéciales + pénalités) du journal. | 1186 |
| `C:getTrafficEnabled()` | Trafic activé pour la boucle (faux pour une mission de dev qui le désactive). | 325 |
| `C:getUse24hFormat()` | Format 24 h (constante USE_24H_FORMAT = true). | 2088 |
| `C:getValidationIssues()` | Liste des problèmes de validation. | 812 |
| `C:getVoicepackPickForMission(missionId, missionDir)` | Résout le voicepack à utiliser via voicepack.resolveLoopVoicepackPick selon le réglage rallyVoicepackPick. | 705 |
| `C:getWallClockDay()` | Numéro de jour (1, 2…) de l'horloge murale. | 523 |
| `C:getWallClockTimeFormatted()` | Heure murale avec secondes et dixièmes, suivie de « , Day N ». | 532 |
| `C:getWallClockTimeSecs()` | Heure murale courante = (rallyStartTimeSecs + clock) % 86400. | 514 |
| `C:getWallClockTimeTable()` | Heure murale avec secondes sous forme de table {time, ampm}. | 2092 |
| `C:gotoRallyLoopInstant()` | Identique à restartRallyLoop : redémarre instantanément la mission rallyLoop. | 769 |
| `C:hasValidationIssues()` | Vrai s'il y a au moins un problème de validation. | 816 |
| `C:init(missionId, missionDir)` | Initialise l'état de la boucle : tables d'UI, heure de départ de l'environnement, horloge en pause, paramètres d'horaire (départ rallye 120 s après la minute pleine, 60 s de TC à la ligne de départ, créneau de 1 min) et de saut. Si la mission fournit des fgVariables, construit la séquence et calcule l'horaire (calculateSchedule(true)), puis lit les réglages. | 77 |
| `C:initSettings()` | Fige les réglages de la boucle : enableFalseStarts, repairVehicleOnRecovery, earlyTimeControlPenaltiesEnabled, trafficEnabled, showStageApps et isNgrcMode. | 286 |
| `C:initTimecardData()` | Construit une fois la structure timecardData (une entrée par TC, plus une entrée de temps par spéciale), avec groupes 'group-N'. | 1842 |
| `C:isDevTrafficDisabled()` | Vrai pour une mission de dev dont missionTypeData.devDisableTraffic est vrai. | 279 |
| `C:isInRoadSection()` | Vrai si l'entrée courante du schedule est une liaison (roadSectionLabel défini). | 655 |
| `C:isInSpecialStage()` | Vrai si l'entrée courante est une spéciale chronométrée (ssLabel défini). | 671 |
| `C:isScheduleValid()` | Vrai tant qu'aucun problème bloquant n'a été trouvé. | 808 |
| `C:isTimeControlSkipAvailable()` | Drapeau de saut disponible. | 2206 |
| `C:onCreatedRallyGroundMarkerRoute()` | Hook appelé à la création de la route de marqueurs au sol : remet à zéro le roadSectionPenaltyKeeper. | 2872 |
| `C:onGuiUpdate(dtReal, dtSim, dtRaw)` | Appelé par la boucle GUI ; ne fait rien (instrumentation du profileur seulement). | 2155 |
| `C:onRallyDataUpdated(data)` | Reçoit les données du rallyManager ou des nœuds (activeState, vehicleProximity avec distances arrondies au centimètre, countdownData) et les mémorise pour le flux UI. | 2543 |
| `C:onRallyModeInteract()` | Hook de l'action d'interaction : saute au prochain évènement si possible, sinon déclenche l'évènement UI RallyGameplayInteract. | 2328 |
| `C:onRallyRouteRecoveryComplete(data)` | Hook de fin de récupération de route : mémorise data dans lastRouteRecoveryData et log. | 2925 |
| `C:onRecalculatedRoute(source)` | Hook de recalcul d'itinéraire ; actuellement sans effet (code commenté). | 2861 |
| `C:onSettingsChanged()` | Hook appelé quand les réglages changent : relit rallyShowStageApps. | 340 |
| `C:onUIStartButtonClicked()` | Appelé quand le joueur clique sur Démarrer : applique les réglages de l'écran de départ, relance l'horloge, active le bouton restartMission de core_recoveryPrompt et dégèle le véhicule. | 2847 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame : avance l'horloge de dtSim si elle n'est pas en pause, évalue le saut, active la carte d'actions si le saut est possible, met à jour le roadSectionPenaltyKeeper et le speedingDetector (hors spéciale, avec limite ; mode strict pour serviceIn et serviceOut). | 2129 |
| `C:recordFalseStartPenalty()` | Enregistre une pénalité de faux départ pour la prochaine spéciale : compte les faux départs déjà journalisés pour l'évènement et utilise Penalties.calculateFalseStartPenalty(n). | 2664 |
| `C:recordRouteRecalcPenalty(penaltyData)` | Enregistre une pénalité de recalcul d'itinéraire (penaltyType 'route_recalc') sur le prochain TC et affiche un message « Route penalty recorded ». | 2707 |
| `C:recordSpeedingPenalty(speedingData)` | Enregistre une pénalité d'excès de vitesse fixe de 10 s sur le prochain évènement 'tc' ou 'service_in'. | 2733 |
| `C:recordTestPenalty(amount)` | Outil de test : enregistre une pénalité 'test_penalty' (10 s par défaut) sur l'évènement courant et affiche un message. | 2783 |
| `C:recordTimeCardEntry(entryName, stageTimeSecs)` | Enregistre le passage à l'évènement courant. Vérifie que l'évènement appartient à la mission courante et que entryName == spName. Calcule l'écart horaire, journalise les pénalités horaires puis un item 'timecard' (actualTime, timeDiff, timingResult, stageTimeSecs, splits pour ss_stop), force l'affichage de la carte de temps, replanifie la ligne de départ si on arrive à un TC trop près, met à jour la carte puis avance. | 893 |
| `C:rescheduleNextSSStart()` | Repousse le prochain 'ss_start' au créneau suivant (slotSizeMinutes, arrondi à la minute) quand le véhicule n'est pas en position à -10 s. Replanifie toujours. | 2633 |
| `C:resolveGlobalBoolSetting(key, defaultValue)` | Lit un réglage booléen global (settings.getValue) ou la valeur par défaut. | 268 |
| `C:resolveMissionBoolSetting(key, defaultValue)` | Lit un réglage booléen en priorité dans mission.lastUserSettings, sinon dans settings.getValue, sinon la valeur par défaut. | 252 |
| `C:restartRallyLoop()` | Relance la mission rallyLoop depuis elle-même (instantané) et lève missionExecutionTransferFlag. | 758 |
| `C:roundToNextMinute(timeSecs)` | Arrondit à la minute supérieure (délègue à scheduleUtils). | 1033 |
| `C:setCanSkipTimeControls(canSkip, isTimeControlSkipAvailable)` | Fixe les deux drapeaux de saut de contrôle horaire. | 2201 |
| `C:setClockPaused(paused)` | Met l'horloge en pause ou la relance. | 556 |
| `C:setCountdownCanSkip(canSkip)` | Mémorise que le compte à rebours peut être sauté (mis à jour par le nœud de compte à rebours). | 2624 |
| `C:setDrawFlag(flagName, value)` | Fixe un drapeau de dessin. | 2529 |
| `C:setMissionExecutionTransferFlag(val)` | Fixe le drapeau de transfert d'exécution. | 2521 |
| `C:setTestActiveState(state)` | Fixe l'état actif forcé en mode test (et currentActiveState si le mode test est actif). | 2968 |
| `C:setTestMode(enabled)` | Active ou désactive le mode test ; en le désactivant, remet currentActiveState à inactif. | 2953 |
| `C:setupForNewMission()` | Oublie le rallyManager mis en cache. | 2513 |
| `C:shouldPenalizeSpeeding()` | Les excès de vitesse sont pénalisés partout sauf en spéciale. | 687 |
| `C:skipLiaisonForTesting(options)` | Outil de test : téléporte le véhicule à distanceBefore m (50 par défaut) avant le TC_out de la liaison en cours, resynchronise le rallyManager et règle l'horloge 1 s avant l'heure du TC_out. | 2252 |
| `C:skipToNextEvent()` | Avance l'horloge jusqu'à 1 s avant le prochain TC et notifie l'UI (RallyClockSkipped). Refuse si le prochain évènement n'est pas un TC ou si la cible n'est pas dans le futur. | 2218 |
| `C:startNextMission()` | Lance la mission suivante de la séquence depuis la mission en cours (startFromWithinMission instantané) et lève missionExecutionTransferFlag. Échoue s'il n'y a pas de mission au premier plan. | 727 |
| `C:trackRecovery(recoveryType)` | Enregistre une récupération ('recovery') ou un retournement ('flip') : avance l'horloge de RecoveryClockAdvance.getSeconds(type, enSpéciale), avance aussi l'heure du jour (RallyLoopTime.advancePlayingTime), notifie l'UI et journalise l'item avec la position du joueur. | 2878 |
| `C:updateRallyClockData()` | Met à jour sur place rallyClockData : heure, jour, temps total, drapeaux de saut, pénalités d'avance activées. | 2107 |
| `C:updateScheduleData()` | Met à jour sur place scheduleData pour le prochain évènement : étiquette, type, heures de la minute prévue, écart (timeDiff négatif = en avance), statut et pénalité courants, limite de vitesse, parc d'assistance, isSpeeding. | 1956 |
| `C:updateTimecardEntry(eventIndex)` | Met à jour l'entrée de carte de temps d'un évènement (heure enregistrée, statut early/late/on-time, temps de spéciale) d'après le journal. | 1910 |
| `C:validateMissionSequence()` | Vérifie que la première mission est serviceOutMission. Non appelée dans cette version (appel commenté). | 435 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleTeleportedToLastRoad`

**Évènements UI (guihooks.trigger) :** `Message`, `RallyClockSkipped`, `RallyGameplayInteract`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/rallyLoopManager.lua`.*

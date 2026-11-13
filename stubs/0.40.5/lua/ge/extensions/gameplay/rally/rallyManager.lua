---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/rallyManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet RallyManager renvoyé par le constructeur du module.
---@class gameplay_rally_rallyManager
local gameplay_rally_rallyManager = {}

--- Appelle pacenote:playbackAllowed() ; en cas d'erreur, l'erreur est loggée et la lecture est autorisée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:647
---@param pacenote table Pacenote
---@return boolean  true si la lecture est autorisée
function gameplay_rally_rallyManager:_playbackAllowed(pacenote) end

--- Invalide les caches de voicepack et d'audio personnalisé du notebook et lui signale un changement de réglages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:87
function gameplay_rally_rallyManager:_refreshNotebookForVoicepackPick() end

--- Ajoute au chrono la pénalité d'une récupération (RecoveryClockAdvance.getSpecialStageSeconds).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1096
---@param recoveryType string "recovery" ou "flip"
---@return boolean  true si du temps a été ajouté (faux si 0 s ou chrono inactif)
function gameplay_rally_rallyManager:addRecoveryRaceTime(recoveryType) end

--- Retire le HOLD en tête de file de pacenotes, s'il y est.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:743
function gameplay_rally_rallyManager:clearQueueHold() end

--- Demande au notebook d'oublier les objets audio résolus.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:609
function gameplay_rally_rallyManager:clearResolvedAudioObjs() end

--- Efface tous les temps et marqueurs d'observation des splits puis réinitialise le chrono d'étape.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1259
function gameplay_rally_rallyManager:clearSplitTimes() end

--- Pacenote le plus proche de la position du véhicule suivi.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:788
---@return table|nil  Pacenote
function gameplay_rally_rallyManager:closestPacenoteToVehicle() end

--- Copilote sélectionné du notebook.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:328
---@return any  résultat de notebook:selectedCodriver()
function gameplay_rally_rallyManager:codriver() end

--- Dessine en debug le prochain pacenote : le waypoint de début de virage avec le texte compilé.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:702
function gameplay_rally_rallyManager:drawPacenotesForDriving() end

--- Ajoute une valeur HOLD à la fin de la file : les pacenotes suivants attendent sa libération.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:756
function gameplay_rally_rallyManager:enqueueHold() end

--- Ajoute un pacenote à la fin de la file.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:751
---@param pacenote table Pacenote
function gameplay_rally_rallyManager:enqueuePacenote(pacenote) end

--- Ajoute une pause dans la file audio.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:842
---@param secs number Durée en secondes
function gameplay_rally_rallyManager:enqueuePauseSecs(secs) end

--- Choisit un pacenote système aléatoire par nom, lit la durée audio dans ses métadonnées (+ audioLenOffset) et l'envoie à l'AudioManager. Logue une erreur si le nom, le fichier audio ou la durée sont invalides.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:802
---@param name string Nom du pacenote système
---@param audioLenOffset number|nil Secondes ajoutées à la durée audio (0 par défaut)
function gameplay_rally_rallyManager:enqueueRandomSystemPacenote(name, audioLenOffset) end

--- Construit l'état de la spéciale pour l'UI : currentSSTime (secondes au dixième), isActive, isComplete, splits, authorityMode, source ('race', 'tracker' ou 'trackerFallback'), completion {distPct, totalDistM}. Dépend du mode d'autorité et de l'état de l'observateur.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1167
---@return table|nil  Table partagée réutilisée ; nil sans vehicleTracker
function gameplay_rally_rallyManager:getActiveStageData() end

--- Gestionnaire audio, nil avant rebuildAssets.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:140
---@return table|nil
function gameplay_rally_rallyManager:getAudioManager() end

--- Objet DrivelineRoute.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:870
---@return table|nil
function gameplay_rally_rallyManager:getDrivelineRoute() end

--- Dernier message d'erreur destiné à l'utilisateur (race.json manquant, notebook invalide, etc.).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:108
---@return string|nil  message
function gameplay_rally_rallyManager:getErrorMsgForUser() end

--- Dernier pacenote joué (retrouvé par son index dans le notebook s'il existe).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:892
---@return table|nil  Pacenote
function gameplay_rally_rallyManager:getLastPlayedPacenote() end

--- Calcule une position et rotation de récupération placées avant le dernier pacenote joué.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:900
---@param distanceBefore number Distance avant le pacenote, en mètres (déduit du code)
---@return vec3|nil  Position
---@return quat|nil  Rotation
---@return string|nil  Raison de l'échec
---@return table|nil  Pacenote utilisé
---@return vec3|nil  Direction avant
function gameplay_rally_rallyManager:getLastPlayedPacenoteRecoveryPose(distanceBefore) end

--- Temps alloué de la liaison en secondes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1021
---@return number|nil  secondes
function gameplay_rally_rallyManager:getLiaisonAllocatedTimeSecs() end

--- Chemin du fichier loopPrefab.prefab.json dans le dossier de la mission.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1279
---@return string
function gameplay_rally_rallyManager:getLoopPrefabPath() end

--- Dossier de la mission.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:132
---@return string
function gameplay_rally_rallyManager:getMissionDir() end

--- Identifiant de la mission.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:128
---@return string
function gameplay_rally_rallyManager:getMissionId() end

--- Nom traduit de la mission, calculé une fois puis mis en cache.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:185
---@return string
function gameplay_rally_rallyManager:getMissionName() end

--- Déclencheur de départ (startTrigger) de la mission dans gameplay_missions_missions ; nil et erreur loggée si la mission est introuvable.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:194
---@return table|nil  table avec pos, rot, level...
function gameplay_rally_rallyManager:getMissionStartTrigger() end

--- Liste contenant le prochain pacenote de la driveline (un seul élément, éventuellement nil).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:797
---@return table  {pacenote}
function gameplay_rally_rallyManager:getNextPacenotes() end

--- Notebook chargé (objet NotebookPath), nil avant rebuildAssets.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:136
---@return table|nil
function gameplay_rally_rallyManager:getNotebookPath() end

--- Indique si le traitement de la file de pacenotes est actif.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:112
---@return boolean
function gameplay_rally_rallyManager:getPacenoteProcessingEnabled() end

--- Liste ordonnée par distance des pathnodes à observer (splits, arrivée).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:422
---@return table|nil
function gameplay_rally_rallyManager:getPathnodeObservationList() end

--- Distance du point depuis le départ le long de la route, en kilomètres.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:363
---@param point any Point ou position de la route (déduit du code)
---@return number  kilomètres
function gameplay_rally_rallyManager:getPointDistanceFromStartKm(point) end

--- Distance du point depuis le départ le long de la route, en mètres.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:359
---@param point any Point ou position de la route (déduit du code)
---@return number  mètres
function gameplay_rally_rallyManager:getPointDistanceFromStartMeters(point) end

--- Progression de la course : distM (distance en m) et distPct (0 à 1) ; le code lit aussi totalDistM.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1061
---@return table  {distM, distPct, totalDistM}
function gameplay_rally_rallyManager:getRaceCompletionData() end

--- Données de course courantes (états des véhicules, temps), fournies par setRaceData.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:148
---@return table|nil
function gameplay_rally_rallyManager:getRaceData() end

--- Distance de course entre départ et arrivée le long de la driveline.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1049
---@return number|nil  mètres
function gameplay_rally_rallyManager:getRaceDistanceMeters() end

--- Chemin de course chargé depuis race.json.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:144
---@return table|nil
function gameplay_rally_rallyManager:getRacePath() end

--- Position de destination d'une récupération : la pose de reprise, sinon le point de route devant le véhicule.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:998
---@return vec3|nil  Position
function gameplay_rally_rallyManager:getRecoveryDestinationPos() end

--- Calcule la pose de récupération après une sortie de route (DrivelineRoute:vehiclePlacementPosAndRotForRecovery).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:939
---@param options table|nil {backoffDistance=number, tangentLookAhead=number}
---@return vec3|nil  Position
---@return quat|nil  Rotation
---@return string|nil  Raison de l'échec
---@return table|nil  {fwd, distToTarget, trackerState}
function gameplay_rally_rallyManager:getRouteDepartureRecoveryPose(options) end

--- Position de départ nommée « SS_start_line » (ligne de départ de la spéciale).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:177
---@return table|nil
function gameplay_rally_rallyManager:getSSStartLinePos() end

--- Position de départ nommée « SS_stop_control » (contrôle d'arrêt).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:181
---@return table|nil
function gameplay_rally_rallyManager:getSSStopControlPos() end

--- Limite de vitesse de la driveline en km/h.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1014
---@return number|nil  km/h
function gameplay_rally_rallyManager:getSpeedLimitKph() end

--- Index des splits par pathnodeId.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:415
---@return table|nil
function gameplay_rally_rallyManager:getSplitDataIndex() end

--- Liste des données de splits du DrivelineRoute.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:408
---@return table|nil
function gameplay_rally_rallyManager:getSplitDataList() end

--- État de l'observateur d'étape (StageObserver:getState).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1077
---@return table|nil
function gameplay_rally_rallyManager:getStageObserverState() end

--- Mode d'autorité courant ('shadow' par défaut).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1073
---@return string
function gameplay_rally_rallyManager:getStageRuntimeAuthorityMode() end

--- Temps de la spéciale en secondes : temps de fin du tracker s'il existe, sinon temps du chrono.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1087
---@return number  secondes
function gameplay_rally_rallyManager:getStageRuntimeTime() end

--- Instantané de l'état du chrono (StageTimingState:getState).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1092
---@return table|nil
function gameplay_rally_rallyManager:getStageTimingState() end

--- Renvoie la position de départ (SS_start_line, à défaut TC_in) et le dernier pathnode (arrivée lancée, pas le contrôle d'arrêt).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1033
---@return table|nil  Position de départ
---@return table|nil  Dernier pathnode
function gameplay_rally_rallyManager:getStartAndFinishStartPositions() end

--- Cherche une position de départ du chemin de course par son nom.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:156
---@param name string Nom de la position (ex. TC_in)
---@return table|nil  Position de départ ou nil
function gameplay_rally_rallyManager:getStartPositionByName(name) end

--- Position de départ nommée « TC_in » (entrée du contrôle horaire).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:169
---@return table|nil
function gameplay_rally_rallyManager:getTCInPos() end

--- Position de départ nommée « TC_out » (sortie du contrôle horaire).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:173
---@return table|nil
function gameplay_rally_rallyManager:getTCOutPos() end

--- Temps alloué en secondes pour parcourir la route à la vitesse limite de la driveline (distance / vitesse).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:367
---@return number|nil  secondes ; nil si route/driveline absentes ou distance négative
function gameplay_rally_rallyManager:getTimeAllocationSecs() end

--- Temps alloué arrondi à la minute supérieure, au format « Xh Ym ».
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:387
---@return string  texte, ou "N/A" si indisponible
function gameplay_rally_rallyManager:getTimeAllocationString() end

--- Temps de la spéciale vu par le tracker : observateur, sinon fin du tracker, chrono actif, ou temps de course.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1122
---@return number|nil  secondes
function gameplay_rally_rallyManager:getTrackerStageTime() end

--- Choix de voicepack de la session ; {type='preferences'} par défaut.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:79
---@return table  {type='preferences'} ou {type='voicepack', id, scope, dirname}
function gameplay_rally_rallyManager:getVoicepackPick() end

--- Indique si le choix de voicepack est écrit dans les réglages (vrai sauf si explicitement désactivé).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:83
---@return boolean
function gameplay_rally_rallyManager:getVoicepackPickWritesSettings() end

--- Indique si le notebook contient des pacenotes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1028
---@return boolean
function gameplay_rally_rallyManager:hasAnyPacenotes() end

--- Initialise tous les champs (file de pacenotes, notebook, racePath, driveline, audio nil, StageObserver, StageTimingState, mode d'autorité 'shadow') pour la mission donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:36
---@param missionDir string Dossier de la mission
---@param missionId string Identifiant de la mission
function gameplay_rally_rallyManager:init(missionDir, missionId) end

--- Appelé quand les réglages rally changent : prévient le notebook et vide la file audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:626
function gameplay_rally_rallyManager:onSettingsChanged() end

--- Appelé à chaque frame par gameplay_rally : met à jour le tracker, le DrivelineRoute, le chrono (avance de dtSim), les observations de splits, l'audio, puis traite la file de pacenotes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:717
---@param dtReal number Temps réel écoulé (s)
---@param dtSim number Temps de simulation écoulé (s)
---@param dtRaw number Temps brut écoulé (s)
function gameplay_rally_rallyManager:onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé quand le véhicule est remis en place : vide les audio résolus et resynchronise (en préservant le tracker de récupération une seule fois si demandé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:637
function gameplay_rally_rallyManager:onVehicleResetted() end

--- Joue (audio) le premier pacenote trié du notebook et le mémorise comme dernier joué.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:853
function gameplay_rally_rallyManager:playFirstPacenote() end

--- Si le traitement est actif et que la tête n'est pas HOLD, dépile un pacenote et le joue via triggerPacenote.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:763
function gameplay_rally_rallyManager:processPacenoteQueue() end

--- Construit tout le contexte d'exécution : VehicleTracker, race.json, notebook, AudioManager, driveline (DrivelineV3) et DrivelineRoute, snaproad du notebook, pacenotes compilés, puis runtimeResync. En cas d'échec, errorMsgForUser est renseigné.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:447
---@param options table|nil {assets=false pour seulement resynchroniser, deferRuntime=boolean (défaut true)}
---@return boolean  true si tout s'est bien passé
function gameplay_rally_rallyManager:rebuildAssets(options) end

--- Enregistre le temps d'une course pour un split (via l'observateur, ou directement dans splitData).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1246
---@param pathnodeId integer Id du pathnode du split
---@param time number Temps en secondes
function gameplay_rally_rallyManager:recordSplit(pathnodeId, time) end

--- Téléporte le véhicule 10 m (ou options.distanceBefore) avant le dernier pacenote joué, resynchronise puis déclenche le hook onVehicleTeleportedToLastRoad.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:918
---@param veh userdata|nil Véhicule (joueur 0 par défaut)
---@param options table|nil {distanceBefore=number, resetVehicle=boolean, unlimitedSafeSpawnRange=boolean}
---@return boolean  true si réussi
---@return string|nil  Raison de l'échec
---@return table|nil  Pacenote utilisé
function gameplay_rally_rallyManager:recoverVehicleToLastPlayedPacenote(veh, options) end

--- Téléporte le véhicule au point de reprise de la route, avec réparation selon options.repairVehicle / resetVehicle / gameplay_rally.getRecoveryRepairVehicle (vrai par défaut), puis déclenche les hooks onVehicleTeleportedToLastRoad et onRallyRouteRecoveryComplete.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:960
---@param veh userdata|nil Véhicule (joueur 0 par défaut)
---@param options table|nil {repairVehicle, resetVehicle, backoffDistance, tangentLookAhead, unlimitedSafeSpawnRange}
---@return boolean  true si réussi
---@return string|nil  Raison de l'échec
---@return table|nil  recoveryData
function gameplay_rally_rallyManager:recoverVehicleToRouteDeparture(veh, options) end

--- Change de voicepack puis reconstruit tous les états dérivés du compositeur (y compris les appels de distance).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:552
---@param pick table|nil Choix de voicepack
---@param opts table|nil {writeSettings=boolean}
---@return boolean  résultat de rebuildAssets
function gameplay_rally_rallyManager:reloadVoicepackAssets(pick, opts) end

--- Vide la file audio de l'AudioManager.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1009
function gameplay_rally_rallyManager:resetAudioQueue() end

--- Efface les pacenotes visuels, la file audio et la file de pacenotes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:575
function gameplay_rally_rallyManager:resetPacenoteRuntime() end

--- Réinitialise l'état de suivi de la spéciale : chrono, observateur, drapeaux de fin, et réapplique le mode d'autorité à l'observateur.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:561
function gameplay_rally_rallyManager:resetStageRuntime() end

--- Choisit le voicepack actif (choix exact ou préférences/MRU) puis charge le notebook correspondant de la mission. Si aucun n'existe, renvoie un notebook vide en mémoire (« Route Preview ») pour prévisualiser une route sans pacenotes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:432
---@return table|nil  Notebook
function gameplay_rally_rallyManager:resolveAndLoadNotebook() end

--- Resynchronise l'état après un déplacement du véhicule : vide les files, oublie l'emprise de l'observateur et demande au DrivelineRoute de recalculer (immédiatement si deferRuntime == false, sinon au prochain onUpdate).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:581
---@param options table|nil {deferRuntime=boolean, preserveRecoveryTracker=boolean}
---@return boolean  toujours true
function gameplay_rally_rallyManager:resyncAfterTeleport(options) end

--- Vide les audio résolus, réinitialise le chrono d'étape, puis appelle resyncAfterTeleport.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:615
---@param options table|nil Mêmes options que resyncAfterTeleport
---@return boolean  résultat de resyncAfterTeleport
function gameplay_rally_rallyManager:runtimeResync(options) end

--- Temps de la spéciale pour un véhicule : celui du chrono si actif ou terminé par le tracker, sinon celui des données de course (temps de fin si terminé).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1110
---@param vehId integer|nil Id du véhicule
---@return number|nil  secondes
function gameplay_rally_rallyManager:sampleRaceStageTime(vehId) end

--- Envoie le pacenote à l'AudioManager pour lecture audio.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:847
---@param pacenote table Pacenote
---@return boolean  false s'il n'y a pas d'AudioManager
function gameplay_rally_rallyManager:sendPacenoteToAudioManager(pacenote) end

--- Mémorise le dernier pacenote joué, son nom et son index dans la liste triée du notebook.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:874
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:setLastPlayedPacenote(pacenote) end

--- Active ou suspend le traitement de la file de pacenotes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:116
---@param enabled boolean true pour traiter la file
function gameplay_rally_rallyManager:setPacenoteProcessingEnabled(enabled) end

--- Indique que le prochain reset du véhicule doit préserver le suivi statique de la récupération.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:633
---@param val boolean true pour préserver (seule la valeur true stricte compte)
function gameplay_rally_rallyManager:setPreserveRecoveryTrackerOnNextVehicleReset(val) end

--- Mémorise les données de course courantes.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:152
---@param raceData table|nil Données de course (states, time...)
function gameplay_rally_rallyManager:setRaceData(raceData) end

--- Démarre ou arrête le chrono de l'étape ; ne démarre pas si l'étape est déjà terminée.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1081
---@param active boolean true pour démarrer
function gameplay_rally_rallyManager:setStageRuntimeActive(active) end

--- Définit le mode d'autorité du chrono ('tracker' ou 'shadow') et le transmet à l'observateur.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1066
---@param mode string 'tracker' ou 'shadow'
function gameplay_rally_rallyManager:setStageRuntimeAuthorityMode(mode) end

--- Définit le voicepack de la session (type 'auto' converti en 'preferences'), l'ajoute à la liste MRU si nécessaire, puis rafraîchit le notebook sauf si deferNotebookRefresh.
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:96
---@param pick table|nil Choix de voicepack
---@param opts table|nil {writeSettings=boolean, deferNotebookRefresh=boolean}
function gameplay_rally_rallyManager:setVoicepackPick(pick, opts) end

--- Branche les callbacks du DrivelineRoute (CsDynamic, CsImmediate, CsStatic, CeStatic, décalages -40 pour Cs et -5 pour Ce, pourcentage de virage 0.5) : ils mettent le pacenote en file, ajoutent un HOLD pour les virages lents, effacent le pacenote visuel et libèrent le HOLD selon la règle du pacenote.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:230
function gameplay_rally_rallyManager:setupDrivelineRouteHooks() end

--- Efface tous les pacenotes visuels (guihooks 'clearAllVisualPacenotes').
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:695
function gameplay_rally_rallyManager:triggerClearAllVisualPacenotes() end

--- Efface un pacenote visuel (guihooks 'clearOneVisualPacenote' avec visualSerialNo).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:687
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:triggerClearVisualPacenote(pacenote) end

--- Joue un pacenote si la lecture est autorisée : l'envoie à l'audio (réglage rallyAudioPacenotes) et déclenche l'affichage visuel (réglage rallyVisualPacenotes, sauf notebook audio personnalisé).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:203
---@param pacenote table Pacenote du notebook
function gameplay_rally_rallyManager:triggerPacenote(pacenote) end

--- Envoie le pacenote compilé à l'UI via guihooks 'showVisualPacenote2'. Ignoré s'il n'a pas d'événement visuel ou aucune icône (visualPacenotes vide).
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:661
---@param pacenote table|nil Pacenote
function gameplay_rally_rallyManager:triggerShowVisualPacenote(pacenote) end

--- Appelle StageObserver:update avec le tracker statique, les nodes d'observation et les temps de frame, puis recopie la fin d'étape et termine le chrono si l'observateur a détecté l'arrivée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/rallyManager.lua:1133
function gameplay_rally_rallyManager:updateTrackerSplitObservations() end


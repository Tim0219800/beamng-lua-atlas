---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Noyau du système de drag race (solo et multijoueur). Il possède la table dragData (piste, couloirs, pilotes, timers, phases), crée les « racers » (setupRacer), gère reset/clear de la course, les hooks réseau MP (onDragRace*), les récompenses carrière, le chargement paresseux des extensions drag (phaseHandlers, dragTypes_*, times, display) et la détection de sortie de zone. Un moddeur l'utilise pour charger une piste (loadDragDataForMission), armer une course (startDragRaceActivity) ou lire l'état (getData, getRacerData, getTimers).
--- Accès : extension `gameplay_drag_core` : `extensions.load("gameplay_drag_core")`, puis la globale `gameplay_drag_core`
---@class gameplay_drag_core
---@field dependencies string[] Extensions chargées avant : saveSystem, dragBridge, rulesMenu, timeslip, poi.
gameplay_drag_core = {}

--- Vrai si data contient au moins un racer et que tous ont isFinished.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1330
---@param data table|nil Données de piste (dragData ou poiData).
---@return boolean  true si tous les pilotes ont fini.
function gameplay_drag_core.allRacersFinished(data) end

--- Somme de contrôle simple de l'état de course (isStarted, isCompleted, phases, DQ, fini des racers), utilisée pour logguer l'effet d'un reset.
---Source : lua/ge/extensions/gameplay/drag/core.lua:532
---@param data table|nil Données de piste.
---@return integer  Checksum, 0 si data est nil.
function gameplay_drag_core.calculateStateChecksum(data) end

--- Nettoie l'état drag selon les options (toutes à false par défaut) : hooks (onDragClear puis onDragClearComplete), transitionLock, localRace (MP), extensions (décharge les extensions paresseuses), data (décharge les prefabs et met dragData à nil), context (retour à 'freeroam'), ui (cache l'app 'drag'), treeLightStaging (éteint le voyant de staging).
---Source : lua/ge/extensions/gameplay/drag/core.lua:700
---@param opts table|nil Table d'options booléennes nommées hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging.
function gameplay_drag_core.clear(opts) end

--- Oublie la demande de participation envoyée pour un POI (MP).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1601
---@param poiKey string|nil Clé renvoyée par getPoiKey.
function gameplay_drag_core.clearPoiJoinRequest(poiKey) end

--- Supprime l'état stocké pour une course MP (raceStateStore).
---Source : lua/ge/extensions/gameplay/drag/core.lua:914
---@param raceId any Identifiant de course.
function gameplay_drag_core.clearRaceState(raceId) end

--- Délègue à gameplay_drag_timeslip.createTimeslipData.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1572
---@return table  Données du ticket de chronométrage.
function gameplay_drag_core.createTimeslipData() end

--- Délègue à gameplay_drag_timeslip.createTimeslipPanelData.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1575
---@return table  Données du panneau de ticket.
function gameplay_drag_core.createTimeslipPanelData() end

--- Fin de course MP : appelle display.dragRaceEndLineReached pour chaque racer, génère les données de victoire (phaseHandlers.generateWinData) puis envoie le ticket à l'UI (et sauvegarde les temps de dial).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1390
function gameplay_drag_core.finalizeMPPostRace() end

--- Chemin de sauvegarde courant du système de sauvegarde drag.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1449
---@return string|nil  Chemin (déduit de saveSystem.getCurrentSavePath).
function gameplay_drag_core.getCurrentSavePath() end

--- Source unique des données drag (piste, racers, timers). Solo et MP : core en est propriétaire.
---Source : lua/ge/extensions/gameplay/drag/core.lua:205
---@return table|nil  dragData, nil si rien de chargé.
function gameplay_drag_core.getData() end

--- Charge (puis met en cache) toutes les pistes *.dragSettings.json du dossier dragstrips d'un niveau. Ajoute _originFile, _fnWithoutExt et _index à chaque entrée.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1489
---@param levelIdentifier string Nom du niveau (core_levels.getLevelByName).
---@return table[]  Liste des données de pistes.
function gameplay_drag_core.getDragDataForLevel(levelIdentifier) end

--- Renvoie l'extension du gamemode drag multijoueur (multiplayer/gamemodes/drag/drag) si elle est chargée.
---Source : lua/ge/extensions/gameplay/drag/core.lua:37
---@return table|nil  L'extension ou nil.
function gameplay_drag_core.getDragGamemode() end

--- Indique si la course est démarrée (dragData.isStarted).
---Source : lua/ge/extensions/gameplay/drag/core.lua:964
---@return boolean  false si aucune donnée.
function gameplay_drag_core.getDragIsStarted() end

--- Nombre de pilotes attendus en staging avant de lancer le compte à rebours (1 par défaut).
---Source : lua/ge/extensions/gameplay/drag/core.lua:910
---@return integer  Nombre attendu.
function gameplay_drag_core.getExpectedStagingRacerCount() end

--- Extension de type de course active (headsUpRace ou bracketRace).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1480
---@return table|nil  L'extension dragType.
function gameplay_drag_core.getExtension() end

--- Contexte de jeu courant : 'freeroam' par défaut, ou data.context de la piste (par ex. 'activity').
---Source : lua/ge/extensions/gameplay/drag/core.lua:969
---@return string  Contexte.
function gameplay_drag_core.getGameplayContext() end

--- Nombre de couloirs de la piste (au moins 1 ; 2 par défaut si la piste n'a pas de lanes).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1512
---@param data table|nil poiData ou dragData.
---@return integer  Nombre de couloirs.
function gameplay_drag_core.getMaxLanes(data) end

--- Clé stable « niveau:nom » d'une piste (nom = _fnWithoutExt ou name), utilisée pour un lobby par piste en MP.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1518
---@param poiData table|nil Données du POI.
---@return string|nil  Clé, nil si poiData est nil.
function gameplay_drag_core.getPoiKey(poiData) end

--- Renvoie un instantané de l'état de course. En MP : issu du raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData…), ou nil si introuvable. En solo : data, isStarted, isCompleted, treeType.
---Source : lua/ge/extensions/gameplay/drag/core.lua:918
---@param raceId any Identifiant de course MP ; nil = course locale active ou première stockée.
---@return table|nil  État de course.
function gameplay_drag_core.getRaceState(raceId) end

--- Renvoie la table du racer d'un véhicule.
---Source : lua/ge/extensions/gameplay/drag/core.lua:806
---@param vehicleId integer ID du véhicule.
---@return table|nil  Racer, nil si inconnu.
function gameplay_drag_core.getRacerData(vehicleId) end

--- État du reset : 'idle', 'resetting' ou 'ready'.
---Source : lua/ge/extensions/gameplay/drag/core.lua:589
---@return string  État.
function gameplay_drag_core.getResetState() end

--- Appelée par l'hôte MP : vérifie si tous les pilotes sont en staging (lecture seule).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1339
---@return boolean  allStaged ; false si pas hôte, course non démarrée ou pas de données.
---@return table|nil  dragData courant, nil si la vérification n'a pas eu lieu.
function gameplay_drag_core.getStagingCheckData() end

--- Timers d'un racer (dial, timer, distanceTimer, velocity…).
---Source : lua/ge/extensions/gameplay/drag/core.lua:797
---@param vehicleId integer ID du véhicule.
---@return table|nil  Table des timers ({} si racer inconnu, nil si pas de données).
function gameplay_drag_core.getTimers(vehicleId) end

--- Drag autorisé si la carrière est active ou si le réglage enableDragRaceInFreeroam est vrai.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1525
---@return boolean  Activé ou non.
function gameplay_drag_core.isDragEnabled() end

--- Fenêtre de participation ouverte : course non terminée et aucun racer au-delà de la phase 1.
---Source : lua/ge/extensions/gameplay/drag/core.lua:818
---@param data table|nil Données de piste.
---@return boolean  Ouverte ou non.
function gameplay_drag_core.isJoinWindowOpen(data) end

--- Indique si une demande de participation a déjà été envoyée pour ce POI.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1597
---@param poiKey string Clé de POI.
---@return boolean|nil  true si envoyée.
function gameplay_drag_core.isPoiJoinRequestSent(poiKey) end

--- Aide pour les missions : charge la piste depuis un fichier, charge les prefabs, fixe le contexte et arme les données (setDragRaceData).
---Source : lua/ge/extensions/gameplay/drag/core.lua:521
---@param filepath string Chemin du fichier de piste (.dragSettings.json).
---@return table|nil  Données chargées, nil en cas d'échec.
function gameplay_drag_core.loadDragDataForMission(filepath) end

--- Charge les données de piste via saveSystem.loadDragStripData et les stocke dans dragData.
---Source : lua/ge/extensions/gameplay/drag/core.lua:182
---@param filepath string Chemin du fichier.
---@return table|nil  Données ou nil (log E).
function gameplay_drag_core.loadDragStripData(filepath) end

--- Hook : à chaque démarrage ou arrêt de mission, fait un clear complet (tous les drapeaux à true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1443
---@param status string 'started' ou 'stopped' déclenchent le nettoyage.
---@param mission table Mission concernée.
function gameplay_drag_core.onAnyMissionChanged(status, mission) end

--- Hook : carrière activée, délègue à saveSystem.onCareerActive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1466
function gameplay_drag_core.onCareerActive() end

--- Hook MP : course annulée. Ne fait rien (le reset/clear vient du dragBridge ou des hooks véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1268
---@param raceId any Identifiant de course.
function gameplay_drag_core.onDragRaceCancelled(raceId) end

--- Hook MP : un client se déconnecte. Retrouve le joueur MP correspondant et appelle onDragRacePlayerLeft.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1315
---@param client table Client avec champ id.
function gameplay_drag_core.onDragRaceClientDisconnected(client) end

--- Hook : début du compte à rebours. En MP côté client, termine la phase 1 de tous les racers et passe à la phase suivante ; en solo, passe à la phase suivante si tous les pilotes attendus sont en staging. Puis démarre la phase 2 de chaque racer (hook startDragCountdown).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1011
---@param mappedTime number Temps du compte à rebours (non utilisé directement).
---@param randValue number Valeur aléatoire (non utilisée directement).
function gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue) end

--- Hook MP : participation acceptée. Arme les données de la piste (avec treeType), crée le racer du véhicule local, démarre l'activité et ouvre le menu de lobby si fermé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1112
---@param raceId any Identifiant de course.
---@param lane integer Couloir attribué.
---@param poiData table Données de la piste.
---@param treeType string Type d'arbre de départ (par ex. '.500').
function gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType) end

--- Hook MP : la liste des courses a changé ; relayée au gamemode drag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1251
function gameplay_drag_core.onDragRaceListChanged() end

--- Hook MP : marque le racer d'un joueur parti comme disqualifié et fini (raison playerLeft). Recherche par vehicleId, sinon par couloir.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1273
---@param player table Table avec mpPlayerId.
function gameplay_drag_core.onDragRacePlayerLeft(player) end

--- Hook MP : remet isStarted/isCompleted à false et autorise un nouveau onDragRaceStarted pour la même course (manche suivante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1258
---@param raceId any Identifiant de course.
function gameplay_drag_core.onDragRaceReset(raceId) end

--- Hook MP : l'hôte diffuse le départ ; les clients (non hôtes) terminent la phase 2 et passent tous les racers en phase de course (phase 3).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1090
---@param raceStartTime number Heure de départ (non utilisée directement).
function gameplay_drag_core.onDragRaceStart(raceStartTime) end

--- Hook MP : la manche démarre. Reconstruit dragData depuis raceState.poiData (copie profonde), crée les racers de la manche, marque le racer local (isLocalRacer), applique les dials, émet onDragReset, lance startDragRaceActivity et ouvre le contrôle de dial en bracketRace si le dial local est vide. Ignore les appels doublons pour le même raceId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1134
---@param raceId any Identifiant de course.
function gameplay_drag_core.onDragRaceStarted(raceId) end

--- Hook MP : un timer réseau arrive. Applique le dial d'un joueur distant et ré-associe le racer au vrai vehicleId si la clé a changé (même couloir).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1621
---@param raceId any Identifiant de course.
---@param mpPlayerId any Joueur MP.
---@param timerName string Nom du timer (par ex. 'dial').
---@param timerValue number Valeur.
function gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue) end

--- Hook MP : état des feux de l'arbre reçu pour un couloir. Met à jour le staging des racers du couloir (si stageLight défini) puis l'affichage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1074
---@param lane integer Couloir.
---@param lightState table État des feux (stageLights.stageLight, etc.).
function gameplay_drag_core.onDragRaceTreeLights(lane, lightState) end

--- Hook MP : allume le feu du gagnant du couloir (display.onWinnerLightOn).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1083
---@param lane integer Couloir gagnant.
function gameplay_drag_core.onDragRaceWinningLights(lane) end

--- Hook de chargement ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1324
function gameplay_drag_core.onExtensionLoaded() end

--- Hook de déchargement : clear complet de l'état drag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1660
function gameplay_drag_core.onExtensionUnloaded() end

--- Hook : ajoute les POI de pistes de drag d'un niveau (délègue à gameplay_drag_poi).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1586
---@param levelIdentifier string Nom du niveau.
---@param elements table Liste de POI à compléter.
function gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Hook : liste de POI pour le tutoriel, toujours celle du niveau west_coast_usa.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1589
---@param elements table Liste de POI à compléter.
function gameplay_drag_core.onGetRawPoiListForTutorial(elements) end

--- Appelée quand le joueur quitte la zone de la piste (hors ligne) : clear complet avec déchargement des extensions. Aussi appelée depuis onUpdate.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1351
function gameplay_drag_core.onPlayerLeftDragArea() end

--- Hook : sauvegarde du profil carrière ; écrit le fichier des temps de dial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1460
---@param currentSavePath string|nil Chemin de sauvegarde.
function gameplay_drag_core.onSaveCurrentProfile(currentSavePath) end

--- Hook par frame : détecte la sortie de zone (stripZone) et la fuite de staging (> 25 m), puis gère la re-staging après DQ en freeroam et les minuteries de staging distant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:1407
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta brut (s).
function gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : véhicule détruit. En freeroam solo avec course démarrée, marque le racer comme retiré et disqualifié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:999
---@param vehicleId integer ID du véhicule.
function gameplay_drag_core.onVehicleDestroyed(vehicleId) end

--- Hook : véhicule réinitialisé. En freeroam solo avec course démarrée, disqualifie le racer (vehicleReset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:973
---@param vehicleId integer ID du véhicule.
function gameplay_drag_core.onVehicleResetted(vehicleId) end

--- Hook : changement de véhicule joué. En freeroam solo avec course démarrée, disqualifie l'ancien et le nouveau racer (vehicleSwitched).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/core.lua:985
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
function gameplay_drag_core.onVehicleSwitched(oldId, newId) end

--- Remet l'état de course à zéro selon les options (false/nil par défaut) : raceState (isStarted/isCompleted), racers (phase, DQ, fini, timers de chaque racer), clearRacers (vide la liste), timeslip (efface le ticket UI), transitionLock, treeLightStaging (voyant de staging allumé), hooks (émet onDragReset), raceId (passé au hook). Valide ensuite l'état et logue un warning si incohérent.
---Source : lua/ge/extensions/gameplay/drag/core.lua:644
---@param opts table|nil Options nommées.
function gameplay_drag_core.reset(opts) end

--- Enregistre les temps du ticket dans le carnet de dial via saveSystem.saveDialTimes (si des données sont chargées).
---Source : lua/ge/extensions/gameplay/drag/core.lua:1453
---@param timeslip table Données du ticket.
function gameplay_drag_core.saveDialTimes(timeslip) end

--- Envoie le ticket à l'UI (guihook onDragRaceTimeslipData). En MP, émet plutôt le hook onDragMPTimeslipRequested et laisse le gamemode finaliser. Sauvegarde aussi les temps de dial ; en gamemode multiseat drag, n'envoie pas le ticket au HUD.
---Source : lua/ge/extensions/gameplay/drag/core.lua:71
function gameplay_drag_core.sendTimeslipDataToUi() end

--- Accorde la récompense carrière (monnaie bmra, valeur 5) une fois par course, sauf contexte 'activity' ou carrière inactive.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1470
---@return table|nil  {bmra = n} si accordée, nil sinon.
function gameplay_drag_core.setCareerRewards() end

--- Arme les données de piste : normalise les champs de DQ, calcule raceEndTimerId (timer de plus grande distance), restaure les métatables de zones, synchronise les waypoints avec la scène, charge les extensions requises, lit le carnet de dial puis émet onDragDataSet.
---Source : lua/ge/extensions/gameplay/drag/core.lua:493
---@param data table Données de piste (dragSettings).
function gameplay_drag_core.setDragRaceData(data) end

--- Fixe le nombre de pilotes qui doivent être en staging avant le départ (minimum 1).
---Source : lua/ge/extensions/gameplay/drag/core.lua:906
---@param count integer Nombre de pilotes.
function gameplay_drag_core.setExpectedStagingRacerCount(count) end

--- Remplace l'extension de type de course active.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1484
---@param ext table|nil Extension dragType.
function gameplay_drag_core.setExtension(ext) end

--- Marque le racer du véhicule comme jouable (isPlayable = true).
---Source : lua/ge/extensions/gameplay/drag/core.lua:789
---@param vehicleId integer ID du véhicule.
function gameplay_drag_core.setPlayableVehicle(vehicleId) end

--- Mémorise (val vrai) ou oublie une demande de participation pour un POI.
---Source : lua/ge/extensions/gameplay/drag/core.lua:1598
---@param poiKey string Clé de POI.
---@param val boolean true pour mémoriser, sinon efface.
function gameplay_drag_core.setPoiJoinRequestSent(poiKey, val) end

--- Fusionne des champs dans l'état stocké d'une course MP.
---Source : lua/ge/extensions/gameplay/drag/core.lua:897
---@param raceId any Identifiant de course.
---@param updates table Champs à écrire.
function gameplay_drag_core.setRaceState(raceId, updates) end

--- Fixe le dial (temps annoncé, en secondes) d'un racer et le marque isSet. Crée le timer dial s'il manque.
---Source : lua/ge/extensions/gameplay/drag/core.lua:741
---@param vehicleId integer ID du véhicule.
---@param dialValue number Valeur >= 0.
---@return boolean  true si appliqué.
function gameplay_drag_core.setRacerDial(vehicleId, dialValue) end

--- Calcule la géométrie des roues du véhicule (groupes par « frontness », décalages par rapport au centre) et initialise racer.allWheelsOffsets, wheelsCenter, beamState et frontWheelId. Si aucune roue n'est trouvée, utilise l'OOBB.
---Source : lua/ge/extensions/gameplay/drag/core.lua:356
---@param racer table Racer à compléter.
---@param vehicle userdata Objet BeamNGVehicle.
function gameplay_drag_core.setRacerWheelGeometry(racer, vehicle) end

--- Applique plusieurs dials d'un coup.
---Source : lua/ge/extensions/gameplay/drag/core.lua:768
---@param dials table[] Liste d'entrées {racerId = vehId, value = dial}.
---@return boolean  true si au moins un dial a été appliqué.
function gameplay_drag_core.setRacersDial(dials) end

--- Crée le racer d'un véhicule dans un couloir (phases, timers depuis la config de piste, dial initial, géométrie des roues, nom, plaque, état stock). Refuse un couloir déjà occupé. En MP, crée un stub si le véhicule n'existe pas localement.
---Source : lua/ge/extensions/gameplay/drag/core.lua:384
---@param vehicleId integer ID du véhicule.
---@param lane integer|nil Couloir.
function gameplay_drag_core.setupRacer(vehicleId, lane) end

--- Démarre l'activité de drag : charge les extensions, crée le racer du joueur en freeroam solo, affiche l'app UI 'drag', allume le staging, coupe/met le contact sur 3 pour les racers jouables hors freeroam, émet onDragRacersSetup puis appelle startActivity du type de course.
---Source : lua/ge/extensions/gameplay/drag/core.lua:827
---@param lane integer|nil Couloir du joueur.
---@param vehicleId integer|nil Véhicule (défaut : véhicule joueur 0).
---@return boolean  true si démarré.
function gameplay_drag_core.startDragRaceActivity(lane, vehicleId) end

--- Vérifie qu'un reset est complet (course non démarrée, racers en phase 1, ni DQ ni finis, timers arrêtés, phases remises à zéro).
---Source : lua/ge/extensions/gameplay/drag/core.lua:553
---@param data table|nil Données de piste.
---@return boolean  Valide ou non.
---@return string  Message explicatif.
function gameplay_drag_core.validateResetState(data) end


# `gameplay_drag_core`

*Fichier : `lua/ge/extensions/gameplay/drag/core.lua` · VM : Game Engine (GE) · 1664 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_core` : `extensions.load("gameplay_drag_core")`, puis la globale `gameplay_drag_core`

Noyau du système de drag race (solo et multijoueur). Il possède la table dragData (piste, couloirs, pilotes, timers, phases), crée les « racers » (setupRacer), gère reset/clear de la course, les hooks réseau MP (onDragRace*), les récompenses carrière, le chargement paresseux des extensions drag (phaseHandlers, dragTypes_*, times, display) et la détection de sortie de zone. Un moddeur l'utilise pour charger une piste (loadDragDataForMission), armer une course (startDragRaceActivity) ou lire l'état (getData, getRacerData, getTimers).

## Exemple

```lua
local data = gameplay_drag_core.loadDragDataForMission('/levels/west_coast_usa/dragstrips/strip.dragSettings.json')
if data then gameplay_drag_core.startDragRaceActivity(1, be:getPlayerVehicleID(0)) end
```

## Remarques

- Les extensions gameplay_drag_phaseHandlers, gameplay_drag_dragTypes_headsUpRace / bracketRace, gameplay_drag_times et gameplay_drag_display sont chargées à la demande par ensureAllExtensionsLoaded (appelée par setDragRaceData et startDragRaceActivity) et déchargées par clear({extensions=true}).
- dragType doit valoir 'headsUpRace' ou 'bracketRace', sinon setDragRaceData/startDragRaceActivity échouent (log E).
- Les champs de disqualification existent en double : isDisqualified/disqualifiedReason et les anciens alias (orthographe fautive) isDesqualified/desqualifiedReason, gardés pour compatibilité.
- Deux états de reset : 'idle', 'resetting', 'ready' (getResetState).
- Les raisons de DQ sont des clés de traduction (missions.dragRace.gameplay.disqualified.vehicleReset, vehicleSwitched, vehicleRemoved, playerLeft).
- onDragRaceCancelled et onExtensionLoaded sont des fonctions vides (le reset/clear est fait par dragBridge ou les hooks véhicule).
- Les hooks onVehicleResetted/onVehicleSwitched/onVehicleDestroyed ne disqualifient qu'en contexte 'freeroam', course démarrée et hors multijoueur.
- onUpdate : hors MP en freeroam, appelle onPlayerLeftDragArea si aucun pilote n'est dans la stripZone, ou si tous les pilotes en phase 'stage' sont à plus de 25 m (STAGE_RUNAWAY_CLEAR_DISTANCE) de l'origine.
- getResetState/validateResetState : la validation de reset n'émet qu'un warning dans le log (pas d'erreur bloquante).
- Récompense carrière : 5 (careerRewards) en monnaie 'bmra', une seule fois par course, pas en contexte 'activity'.

**Dépendances (chargées avant) :** `gameplay_drag_saveSystem`, `gameplay_drag_dragBridge`, `gameplay_drag_rulesMenu`, `gameplay_drag_timeslip`, `gameplay_drag_poi`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_core.allRacersFinished(data)` | Vrai si data contient au moins un racer et que tous ont isFinished. | 1330 |
| `gameplay_drag_core.calculateStateChecksum(data)` | Somme de contrôle simple de l'état de course (isStarted, isCompleted, phases, DQ, fini des racers), utilisée pour logguer l'effet d'un reset. | 532 |
| `gameplay_drag_core.clear(opts)` | Nettoie l'état drag selon les options (toutes à false par défaut) : hooks (onDragClear puis onDragClearComplete), transitionLock, localRace (MP), extensions (décharge les extensions paresseuses), data (décharge les prefabs et met dragData à nil), context (retour à 'freeroam'), ui (cache l'app 'drag'), treeLightStaging (éteint le voyant de staging). | 700 |
| `gameplay_drag_core.clearPoiJoinRequest(poiKey)` | Oublie la demande de participation envoyée pour un POI (MP). | 1601 |
| `gameplay_drag_core.clearRaceState(raceId)` | Supprime l'état stocké pour une course MP (raceStateStore). | 914 |
| `gameplay_drag_core.createTimeslipData()` | Délègue à gameplay_drag_timeslip.createTimeslipData. | 1572 |
| `gameplay_drag_core.createTimeslipPanelData()` | Délègue à gameplay_drag_timeslip.createTimeslipPanelData. | 1575 |
| `gameplay_drag_core.finalizeMPPostRace()` | Fin de course MP : appelle display.dragRaceEndLineReached pour chaque racer, génère les données de victoire (phaseHandlers.generateWinData) puis envoie le ticket à l'UI (et sauvegarde les temps de dial). | 1390 |
| `gameplay_drag_core.getCurrentSavePath()` | Chemin de sauvegarde courant du système de sauvegarde drag. | 1449 |
| `gameplay_drag_core.getData()` | Source unique des données drag (piste, racers, timers). Solo et MP : core en est propriétaire. | 205 |
| `gameplay_drag_core.getDragDataForLevel(levelIdentifier)` | Charge (puis met en cache) toutes les pistes *.dragSettings.json du dossier dragstrips d'un niveau. Ajoute _originFile, _fnWithoutExt et _index à chaque entrée. | 1489 |
| `gameplay_drag_core.getDragGamemode()` | Renvoie l'extension du gamemode drag multijoueur (multiplayer/gamemodes/drag/drag) si elle est chargée. | 37 |
| `gameplay_drag_core.getDragIsStarted()` | Indique si la course est démarrée (dragData.isStarted). | 964 |
| `gameplay_drag_core.getExpectedStagingRacerCount()` | Nombre de pilotes attendus en staging avant de lancer le compte à rebours (1 par défaut). | 910 |
| `gameplay_drag_core.getExtension()` | Extension de type de course active (headsUpRace ou bracketRace). | 1480 |
| `gameplay_drag_core.getGameplayContext()` | Contexte de jeu courant : 'freeroam' par défaut, ou data.context de la piste (par ex. 'activity'). | 969 |
| `gameplay_drag_core.getMaxLanes(data)` | Nombre de couloirs de la piste (au moins 1 ; 2 par défaut si la piste n'a pas de lanes). | 1512 |
| `gameplay_drag_core.getPoiKey(poiData)` | Clé stable « niveau:nom » d'une piste (nom = _fnWithoutExt ou name), utilisée pour un lobby par piste en MP. | 1518 |
| `gameplay_drag_core.getRaceState(raceId)` | Renvoie un instantané de l'état de course. En MP : issu du raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData…), ou nil si introuvable. En solo : data, isStarted, isCompleted, treeType. | 918 |
| `gameplay_drag_core.getRacerData(vehicleId)` | Renvoie la table du racer d'un véhicule. | 806 |
| `gameplay_drag_core.getResetState()` | État du reset : 'idle', 'resetting' ou 'ready'. | 589 |
| `gameplay_drag_core.getStagingCheckData()` | Appelée par l'hôte MP : vérifie si tous les pilotes sont en staging (lecture seule). | 1339 |
| `gameplay_drag_core.getTimers(vehicleId)` | Timers d'un racer (dial, timer, distanceTimer, velocity…). | 797 |
| `gameplay_drag_core.isDragEnabled()` | Drag autorisé si la carrière est active ou si le réglage enableDragRaceInFreeroam est vrai. | 1525 |
| `gameplay_drag_core.isJoinWindowOpen(data)` | Fenêtre de participation ouverte : course non terminée et aucun racer au-delà de la phase 1. | 818 |
| `gameplay_drag_core.isPoiJoinRequestSent(poiKey)` | Indique si une demande de participation a déjà été envoyée pour ce POI. | 1597 |
| `gameplay_drag_core.loadDragDataForMission(filepath)` | Aide pour les missions : charge la piste depuis un fichier, charge les prefabs, fixe le contexte et arme les données (setDragRaceData). | 521 |
| `gameplay_drag_core.loadDragStripData(filepath)` | Charge les données de piste via saveSystem.loadDragStripData et les stocke dans dragData. | 182 |
| `gameplay_drag_core.onAnyMissionChanged(status, mission)` | Hook : à chaque démarrage ou arrêt de mission, fait un clear complet (tous les drapeaux à true). *(interne)* *(hook)* | 1443 |
| `gameplay_drag_core.onCareerActive()` | Hook : carrière activée, délègue à saveSystem.onCareerActive. *(interne)* *(hook)* | 1466 |
| `gameplay_drag_core.onDragRaceCancelled(raceId)` | Hook MP : course annulée. Ne fait rien (le reset/clear vient du dragBridge ou des hooks véhicule). *(interne)* *(hook)* | 1268 |
| `gameplay_drag_core.onDragRaceClientDisconnected(client)` | Hook MP : un client se déconnecte. Retrouve le joueur MP correspondant et appelle onDragRacePlayerLeft. *(interne)* *(hook)* | 1315 |
| `gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue)` | Hook : début du compte à rebours. En MP côté client, termine la phase 1 de tous les racers et passe à la phase suivante ; en solo, passe à la phase suivante si tous les pilotes attendus sont en staging. Puis démarre la phase 2 de chaque racer (hook startDragCountdown). *(interne)* *(hook)* | 1011 |
| `gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType)` | Hook MP : participation acceptée. Arme les données de la piste (avec treeType), crée le racer du véhicule local, démarre l'activité et ouvre le menu de lobby si fermé. *(interne)* *(hook)* | 1112 |
| `gameplay_drag_core.onDragRaceListChanged()` | Hook MP : la liste des courses a changé ; relayée au gamemode drag. *(interne)* *(hook)* | 1251 |
| `gameplay_drag_core.onDragRacePlayerLeft(player)` | Hook MP : marque le racer d'un joueur parti comme disqualifié et fini (raison playerLeft). Recherche par vehicleId, sinon par couloir. *(interne)* *(hook)* | 1273 |
| `gameplay_drag_core.onDragRaceReset(raceId)` | Hook MP : remet isStarted/isCompleted à false et autorise un nouveau onDragRaceStarted pour la même course (manche suivante). *(interne)* *(hook)* | 1258 |
| `gameplay_drag_core.onDragRaceStart(raceStartTime)` | Hook MP : l'hôte diffuse le départ ; les clients (non hôtes) terminent la phase 2 et passent tous les racers en phase de course (phase 3). *(interne)* *(hook)* | 1090 |
| `gameplay_drag_core.onDragRaceStarted(raceId)` | Hook MP : la manche démarre. Reconstruit dragData depuis raceState.poiData (copie profonde), crée les racers de la manche, marque le racer local (isLocalRacer), applique les dials, émet onDragReset, lance startDragRaceActivity et ouvre le contrôle de dial en bracketRace si le dial local est vide. Ignore les appels doublons pour le même raceId. *(interne)* *(hook)* | 1134 |
| `gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | Hook MP : un timer réseau arrive. Applique le dial d'un joueur distant et ré-associe le racer au vrai vehicleId si la clé a changé (même couloir). *(interne)* *(hook)* | 1621 |
| `gameplay_drag_core.onDragRaceTreeLights(lane, lightState)` | Hook MP : état des feux de l'arbre reçu pour un couloir. Met à jour le staging des racers du couloir (si stageLight défini) puis l'affichage. *(interne)* *(hook)* | 1074 |
| `gameplay_drag_core.onDragRaceWinningLights(lane)` | Hook MP : allume le feu du gagnant du couloir (display.onWinnerLightOn). *(interne)* *(hook)* | 1083 |
| `gameplay_drag_core.onExtensionLoaded()` | Hook de chargement ; ne fait rien. *(interne)* *(hook)* | 1324 |
| `gameplay_drag_core.onExtensionUnloaded()` | Hook de déchargement : clear complet de l'état drag. *(interne)* *(hook)* | 1660 |
| `gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook : ajoute les POI de pistes de drag d'un niveau (délègue à gameplay_drag_poi). *(interne)* *(hook)* | 1586 |
| `gameplay_drag_core.onGetRawPoiListForTutorial(elements)` | Hook : liste de POI pour le tutoriel, toujours celle du niveau west_coast_usa. *(interne)* *(hook)* | 1589 |
| `gameplay_drag_core.onPlayerLeftDragArea()` | Appelée quand le joueur quitte la zone de la piste (hors ligne) : clear complet avec déchargement des extensions. Aussi appelée depuis onUpdate. *(hook)* | 1351 |
| `gameplay_drag_core.onSaveCurrentProfile(currentSavePath)` | Hook : sauvegarde du profil carrière ; écrit le fichier des temps de dial. *(interne)* *(hook)* | 1460 |
| `gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : détecte la sortie de zone (stripZone) et la fuite de staging (> 25 m), puis gère la re-staging après DQ en freeroam et les minuteries de staging distant. *(interne)* *(hook)* | 1407 |
| `gameplay_drag_core.onVehicleDestroyed(vehicleId)` | Hook : véhicule détruit. En freeroam solo avec course démarrée, marque le racer comme retiré et disqualifié. *(interne)* *(hook)* | 999 |
| `gameplay_drag_core.onVehicleResetted(vehicleId)` | Hook : véhicule réinitialisé. En freeroam solo avec course démarrée, disqualifie le racer (vehicleReset). *(interne)* *(hook)* | 973 |
| `gameplay_drag_core.onVehicleSwitched(oldId, newId)` | Hook : changement de véhicule joué. En freeroam solo avec course démarrée, disqualifie l'ancien et le nouveau racer (vehicleSwitched). *(interne)* *(hook)* | 985 |
| `gameplay_drag_core.reset(opts)` | Remet l'état de course à zéro selon les options (false/nil par défaut) : raceState (isStarted/isCompleted), racers (phase, DQ, fini, timers de chaque racer), clearRacers (vide la liste), timeslip (efface le ticket UI), transitionLock, treeLightStaging (voyant de staging allumé), hooks (émet onDragReset), raceId (passé au hook). Valide ensuite l'état et logue un warning si incohérent. | 644 |
| `gameplay_drag_core.saveDialTimes(timeslip)` | Enregistre les temps du ticket dans le carnet de dial via saveSystem.saveDialTimes (si des données sont chargées). | 1453 |
| `gameplay_drag_core.sendTimeslipDataToUi()` | Envoie le ticket à l'UI (guihook onDragRaceTimeslipData). En MP, émet plutôt le hook onDragMPTimeslipRequested et laisse le gamemode finaliser. Sauvegarde aussi les temps de dial ; en gamemode multiseat drag, n'envoie pas le ticket au HUD. | 71 |
| `gameplay_drag_core.setCareerRewards()` | Accorde la récompense carrière (monnaie bmra, valeur 5) une fois par course, sauf contexte 'activity' ou carrière inactive. | 1470 |
| `gameplay_drag_core.setDragRaceData(data)` | Arme les données de piste : normalise les champs de DQ, calcule raceEndTimerId (timer de plus grande distance), restaure les métatables de zones, synchronise les waypoints avec la scène, charge les extensions requises, lit le carnet de dial puis émet onDragDataSet. | 493 |
| `gameplay_drag_core.setExpectedStagingRacerCount(count)` | Fixe le nombre de pilotes qui doivent être en staging avant le départ (minimum 1). | 906 |
| `gameplay_drag_core.setExtension(ext)` | Remplace l'extension de type de course active. | 1484 |
| `gameplay_drag_core.setPlayableVehicle(vehicleId)` | Marque le racer du véhicule comme jouable (isPlayable = true). | 789 |
| `gameplay_drag_core.setPoiJoinRequestSent(poiKey, val)` | Mémorise (val vrai) ou oublie une demande de participation pour un POI. | 1598 |
| `gameplay_drag_core.setRaceState(raceId, updates)` | Fusionne des champs dans l'état stocké d'une course MP. | 897 |
| `gameplay_drag_core.setRacerDial(vehicleId, dialValue)` | Fixe le dial (temps annoncé, en secondes) d'un racer et le marque isSet. Crée le timer dial s'il manque. | 741 |
| `gameplay_drag_core.setRacerWheelGeometry(racer, vehicle)` | Calcule la géométrie des roues du véhicule (groupes par « frontness », décalages par rapport au centre) et initialise racer.allWheelsOffsets, wheelsCenter, beamState et frontWheelId. Si aucune roue n'est trouvée, utilise l'OOBB. | 356 |
| `gameplay_drag_core.setRacersDial(dials)` | Applique plusieurs dials d'un coup. | 768 |
| `gameplay_drag_core.setupRacer(vehicleId, lane)` | Crée le racer d'un véhicule dans un couloir (phases, timers depuis la config de piste, dial initial, géométrie des roues, nom, plaque, état stock). Refuse un couloir déjà occupé. En MP, crée un stub si le véhicule n'existe pas localement. | 384 |
| `gameplay_drag_core.startDragRaceActivity(lane, vehicleId)` | Démarre l'activité de drag : charge les extensions, crée le racer du joueur en freeroam solo, affiche l'app UI 'drag', allume le staging, coupe/met le contact sur 3 pour les racers jouables hors freeroam, émet onDragRacersSetup puis appelle startActivity du type de course. | 827 |
| `gameplay_drag_core.validateResetState(data)` | Vérifie qu'un reset est complet (course non démarrée, racers en phase 1, ni DQ ni finis, timers arrêtés, phases remises à zéro). | 553 |

### Détail des paramètres

#### `gameplay_drag_core.allRacersFinished(data)`

Vrai si data contient au moins un racer et que tous ont isFinished.

- `data` (*table|nil*) : Données de piste (dragData ou poiData).
- **renvoie** : boolean true si tous les pilotes ont fini.

#### `gameplay_drag_core.calculateStateChecksum(data)`

Somme de contrôle simple de l'état de course (isStarted, isCompleted, phases, DQ, fini des racers), utilisée pour logguer l'effet d'un reset.

- `data` (*table|nil*) : Données de piste.
- **renvoie** : integer Checksum, 0 si data est nil.

#### `gameplay_drag_core.clear(opts)`

Nettoie l'état drag selon les options (toutes à false par défaut) : hooks (onDragClear puis onDragClearComplete), transitionLock, localRace (MP), extensions (décharge les extensions paresseuses), data (décharge les prefabs et met dragData à nil), context (retour à 'freeroam'), ui (cache l'app 'drag'), treeLightStaging (éteint le voyant de staging).

- `opts` (*table|nil*) : Table d'options booléennes nommées hooks, transitionLock, localRace, extensions, data, context, ui, treeLightStaging.

#### `gameplay_drag_core.clearPoiJoinRequest(poiKey)`

Oublie la demande de participation envoyée pour un POI (MP).

- `poiKey` (*string|nil*) : Clé renvoyée par getPoiKey.

#### `gameplay_drag_core.clearRaceState(raceId)`

Supprime l'état stocké pour une course MP (raceStateStore).

- `raceId` (*any*) : Identifiant de course.

#### `gameplay_drag_core.createTimeslipData()`

Délègue à gameplay_drag_timeslip.createTimeslipData.

- **renvoie** : table Données du ticket de chronométrage.

#### `gameplay_drag_core.createTimeslipPanelData()`

Délègue à gameplay_drag_timeslip.createTimeslipPanelData.

- **renvoie** : table Données du panneau de ticket.

#### `gameplay_drag_core.getCurrentSavePath()`

Chemin de sauvegarde courant du système de sauvegarde drag.

- **renvoie** : string|nil Chemin (déduit de saveSystem.getCurrentSavePath).

#### `gameplay_drag_core.getData()`

Source unique des données drag (piste, racers, timers). Solo et MP : core en est propriétaire.

- **renvoie** : table|nil dragData, nil si rien de chargé.

#### `gameplay_drag_core.getDragDataForLevel(levelIdentifier)`

Charge (puis met en cache) toutes les pistes *.dragSettings.json du dossier dragstrips d'un niveau. Ajoute _originFile, _fnWithoutExt et _index à chaque entrée.

- `levelIdentifier` (*string*) : Nom du niveau (core_levels.getLevelByName).
- **renvoie** : table[] Liste des données de pistes.

#### `gameplay_drag_core.getDragGamemode()`

Renvoie l'extension du gamemode drag multijoueur (multiplayer/gamemodes/drag/drag) si elle est chargée.

- **renvoie** : table|nil L'extension ou nil.

#### `gameplay_drag_core.getDragIsStarted()`

Indique si la course est démarrée (dragData.isStarted).

- **renvoie** : boolean false si aucune donnée.

#### `gameplay_drag_core.getExpectedStagingRacerCount()`

Nombre de pilotes attendus en staging avant de lancer le compte à rebours (1 par défaut).

- **renvoie** : integer Nombre attendu.

#### `gameplay_drag_core.getExtension()`

Extension de type de course active (headsUpRace ou bracketRace).

- **renvoie** : table|nil L'extension dragType.

#### `gameplay_drag_core.getGameplayContext()`

Contexte de jeu courant : 'freeroam' par défaut, ou data.context de la piste (par ex. 'activity').

- **renvoie** : string Contexte.

#### `gameplay_drag_core.getMaxLanes(data)`

Nombre de couloirs de la piste (au moins 1 ; 2 par défaut si la piste n'a pas de lanes).

- `data` (*table|nil*) : poiData ou dragData.
- **renvoie** : integer Nombre de couloirs.

#### `gameplay_drag_core.getPoiKey(poiData)`

Clé stable « niveau:nom » d'une piste (nom = _fnWithoutExt ou name), utilisée pour un lobby par piste en MP.

- `poiData` (*table|nil*) : Données du POI.
- **renvoie** : string|nil Clé, nil si poiData est nil.

#### `gameplay_drag_core.getRaceState(raceId)`

Renvoie un instantané de l'état de course. En MP : issu du raceStateStore (id, players, queue, currentPairIndex, treeType, finishTimes, timerValues, lobbyId, poiData…), ou nil si introuvable. En solo : data, isStarted, isCompleted, treeType.

- `raceId` (*any*) : Identifiant de course MP ; nil = course locale active ou première stockée.
- **renvoie** : table|nil État de course.

#### `gameplay_drag_core.getRacerData(vehicleId)`

Renvoie la table du racer d'un véhicule.

- `vehicleId` (*integer*) : ID du véhicule.
- **renvoie** : table|nil Racer, nil si inconnu.

#### `gameplay_drag_core.getResetState()`

État du reset : 'idle', 'resetting' ou 'ready'.

- **renvoie** : string État.

#### `gameplay_drag_core.getStagingCheckData()`

Appelée par l'hôte MP : vérifie si tous les pilotes sont en staging (lecture seule).

- **renvoie** : boolean allStaged ; false si pas hôte, course non démarrée ou pas de données.
- **renvoie** : table|nil dragData courant, nil si la vérification n'a pas eu lieu.

#### `gameplay_drag_core.getTimers(vehicleId)`

Timers d'un racer (dial, timer, distanceTimer, velocity…).

- `vehicleId` (*integer*) : ID du véhicule.
- **renvoie** : table|nil Table des timers ({} si racer inconnu, nil si pas de données).

#### `gameplay_drag_core.isDragEnabled()`

Drag autorisé si la carrière est active ou si le réglage enableDragRaceInFreeroam est vrai.

- **renvoie** : boolean Activé ou non.

#### `gameplay_drag_core.isJoinWindowOpen(data)`

Fenêtre de participation ouverte : course non terminée et aucun racer au-delà de la phase 1.

- `data` (*table|nil*) : Données de piste.
- **renvoie** : boolean Ouverte ou non.

#### `gameplay_drag_core.isPoiJoinRequestSent(poiKey)`

Indique si une demande de participation a déjà été envoyée pour ce POI.

- `poiKey` (*string*) : Clé de POI.
- **renvoie** : boolean|nil true si envoyée.

#### `gameplay_drag_core.loadDragDataForMission(filepath)`

Aide pour les missions : charge la piste depuis un fichier, charge les prefabs, fixe le contexte et arme les données (setDragRaceData).

- `filepath` (*string*) : Chemin du fichier de piste (.dragSettings.json).
- **renvoie** : table|nil Données chargées, nil en cas d'échec.

#### `gameplay_drag_core.loadDragStripData(filepath)`

Charge les données de piste via saveSystem.loadDragStripData et les stocke dans dragData.

- `filepath` (*string*) : Chemin du fichier.
- **renvoie** : table|nil Données ou nil (log E).

#### `gameplay_drag_core.onAnyMissionChanged(status, mission)`

Hook : à chaque démarrage ou arrêt de mission, fait un clear complet (tous les drapeaux à true).

- `status` (*string*) : 'started' ou 'stopped' déclenchent le nettoyage.
- `mission` (*table*) : Mission concernée.

#### `gameplay_drag_core.onDragRaceCancelled(raceId)`

Hook MP : course annulée. Ne fait rien (le reset/clear vient du dragBridge ou des hooks véhicule).

- `raceId` (*any*) : Identifiant de course.

#### `gameplay_drag_core.onDragRaceClientDisconnected(client)`

Hook MP : un client se déconnecte. Retrouve le joueur MP correspondant et appelle onDragRacePlayerLeft.

- `client` (*table*) : Client avec champ id.

#### `gameplay_drag_core.onDragRaceCountdownStart(mappedTime, randValue)`

Hook : début du compte à rebours. En MP côté client, termine la phase 1 de tous les racers et passe à la phase suivante ; en solo, passe à la phase suivante si tous les pilotes attendus sont en staging. Puis démarre la phase 2 de chaque racer (hook startDragCountdown).

- `mappedTime` (*number*) : Temps du compte à rebours (non utilisé directement).
- `randValue` (*number*) : Valeur aléatoire (non utilisée directement).

#### `gameplay_drag_core.onDragRaceJoinAccepted(raceId, lane, poiData, treeType)`

Hook MP : participation acceptée. Arme les données de la piste (avec treeType), crée le racer du véhicule local, démarre l'activité et ouvre le menu de lobby si fermé.

- `raceId` (*any*) : Identifiant de course.
- `lane` (*integer*) : Couloir attribué.
- `poiData` (*table*) : Données de la piste.
- `treeType` (*string*) : Type d'arbre de départ (par ex. '.500').

#### `gameplay_drag_core.onDragRacePlayerLeft(player)`

Hook MP : marque le racer d'un joueur parti comme disqualifié et fini (raison playerLeft). Recherche par vehicleId, sinon par couloir.

- `player` (*table*) : Table avec mpPlayerId.

#### `gameplay_drag_core.onDragRaceReset(raceId)`

Hook MP : remet isStarted/isCompleted à false et autorise un nouveau onDragRaceStarted pour la même course (manche suivante).

- `raceId` (*any*) : Identifiant de course.

#### `gameplay_drag_core.onDragRaceStart(raceStartTime)`

Hook MP : l'hôte diffuse le départ ; les clients (non hôtes) terminent la phase 2 et passent tous les racers en phase de course (phase 3).

- `raceStartTime` (*number*) : Heure de départ (non utilisée directement).

#### `gameplay_drag_core.onDragRaceStarted(raceId)`

Hook MP : la manche démarre. Reconstruit dragData depuis raceState.poiData (copie profonde), crée les racers de la manche, marque le racer local (isLocalRacer), applique les dials, émet onDragReset, lance startDragRaceActivity et ouvre le contrôle de dial en bracketRace si le dial local est vide. Ignore les appels doublons pour le même raceId.

- `raceId` (*any*) : Identifiant de course.

#### `gameplay_drag_core.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)`

Hook MP : un timer réseau arrive. Applique le dial d'un joueur distant et ré-associe le racer au vrai vehicleId si la clé a changé (même couloir).

- `raceId` (*any*) : Identifiant de course.
- `mpPlayerId` (*any*) : Joueur MP.
- `timerName` (*string*) : Nom du timer (par ex. 'dial').
- `timerValue` (*number*) : Valeur.

#### `gameplay_drag_core.onDragRaceTreeLights(lane, lightState)`

Hook MP : état des feux de l'arbre reçu pour un couloir. Met à jour le staging des racers du couloir (si stageLight défini) puis l'affichage.

- `lane` (*integer*) : Couloir.
- `lightState` (*table*) : État des feux (stageLights.stageLight, etc.).

#### `gameplay_drag_core.onDragRaceWinningLights(lane)`

Hook MP : allume le feu du gagnant du couloir (display.onWinnerLightOn).

- `lane` (*integer*) : Couloir gagnant.

#### `gameplay_drag_core.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook : ajoute les POI de pistes de drag d'un niveau (délègue à gameplay_drag_poi).

- `levelIdentifier` (*string*) : Nom du niveau.
- `elements` (*table*) : Liste de POI à compléter.

#### `gameplay_drag_core.onGetRawPoiListForTutorial(elements)`

Hook : liste de POI pour le tutoriel, toujours celle du niveau west_coast_usa.

- `elements` (*table*) : Liste de POI à compléter.

#### `gameplay_drag_core.onSaveCurrentProfile(currentSavePath)`

Hook : sauvegarde du profil carrière ; écrit le fichier des temps de dial.

- `currentSavePath` (*string|nil*) : Chemin de sauvegarde.

#### `gameplay_drag_core.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : détecte la sortie de zone (stripZone) et la fuite de staging (> 25 m), puis gère la re-staging après DQ en freeroam et les minuteries de staging distant.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `gameplay_drag_core.onVehicleDestroyed(vehicleId)`

Hook : véhicule détruit. En freeroam solo avec course démarrée, marque le racer comme retiré et disqualifié.

- `vehicleId` (*integer*) : ID du véhicule.

#### `gameplay_drag_core.onVehicleResetted(vehicleId)`

Hook : véhicule réinitialisé. En freeroam solo avec course démarrée, disqualifie le racer (vehicleReset).

- `vehicleId` (*integer*) : ID du véhicule.

#### `gameplay_drag_core.onVehicleSwitched(oldId, newId)`

Hook : changement de véhicule joué. En freeroam solo avec course démarrée, disqualifie l'ancien et le nouveau racer (vehicleSwitched).

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.

#### `gameplay_drag_core.reset(opts)`

Remet l'état de course à zéro selon les options (false/nil par défaut) : raceState (isStarted/isCompleted), racers (phase, DQ, fini, timers de chaque racer), clearRacers (vide la liste), timeslip (efface le ticket UI), transitionLock, treeLightStaging (voyant de staging allumé), hooks (émet onDragReset), raceId (passé au hook). Valide ensuite l'état et logue un warning si incohérent.

- `opts` (*table|nil*) : Options nommées.

#### `gameplay_drag_core.saveDialTimes(timeslip)`

Enregistre les temps du ticket dans le carnet de dial via saveSystem.saveDialTimes (si des données sont chargées).

- `timeslip` (*table*) : Données du ticket.

#### `gameplay_drag_core.setCareerRewards()`

Accorde la récompense carrière (monnaie bmra, valeur 5) une fois par course, sauf contexte 'activity' ou carrière inactive.

- **renvoie** : table|nil {bmra = n} si accordée, nil sinon.

#### `gameplay_drag_core.setDragRaceData(data)`

Arme les données de piste : normalise les champs de DQ, calcule raceEndTimerId (timer de plus grande distance), restaure les métatables de zones, synchronise les waypoints avec la scène, charge les extensions requises, lit le carnet de dial puis émet onDragDataSet.

- `data` (*table*) : Données de piste (dragSettings).

#### `gameplay_drag_core.setExpectedStagingRacerCount(count)`

Fixe le nombre de pilotes qui doivent être en staging avant le départ (minimum 1).

- `count` (*integer*) : Nombre de pilotes.

#### `gameplay_drag_core.setExtension(ext)`

Remplace l'extension de type de course active.

- `ext` (*table|nil*) : Extension dragType.

#### `gameplay_drag_core.setPlayableVehicle(vehicleId)`

Marque le racer du véhicule comme jouable (isPlayable = true).

- `vehicleId` (*integer*) : ID du véhicule.

#### `gameplay_drag_core.setPoiJoinRequestSent(poiKey, val)`

Mémorise (val vrai) ou oublie une demande de participation pour un POI.

- `poiKey` (*string*) : Clé de POI.
- `val` (*boolean*) : true pour mémoriser, sinon efface.

#### `gameplay_drag_core.setRaceState(raceId, updates)`

Fusionne des champs dans l'état stocké d'une course MP.

- `raceId` (*any*) : Identifiant de course.
- `updates` (*table*) : Champs à écrire.

#### `gameplay_drag_core.setRacerDial(vehicleId, dialValue)`

Fixe le dial (temps annoncé, en secondes) d'un racer et le marque isSet. Crée le timer dial s'il manque.

- `vehicleId` (*integer*) : ID du véhicule.
- `dialValue` (*number*) : Valeur >= 0.
- **renvoie** : boolean true si appliqué.

#### `gameplay_drag_core.setRacerWheelGeometry(racer, vehicle)`

Calcule la géométrie des roues du véhicule (groupes par « frontness », décalages par rapport au centre) et initialise racer.allWheelsOffsets, wheelsCenter, beamState et frontWheelId. Si aucune roue n'est trouvée, utilise l'OOBB.

- `racer` (*table*) : Racer à compléter.
- `vehicle` (*userdata*) : Objet BeamNGVehicle.

#### `gameplay_drag_core.setRacersDial(dials)`

Applique plusieurs dials d'un coup.

- `dials` (*table[]*) : Liste d'entrées {racerId = vehId, value = dial}.
- **renvoie** : boolean true si au moins un dial a été appliqué.

#### `gameplay_drag_core.setupRacer(vehicleId, lane)`

Crée le racer d'un véhicule dans un couloir (phases, timers depuis la config de piste, dial initial, géométrie des roues, nom, plaque, état stock). Refuse un couloir déjà occupé. En MP, crée un stub si le véhicule n'existe pas localement.

- `vehicleId` (*integer*) : ID du véhicule.
- `lane` (*integer|nil*) : Couloir.

#### `gameplay_drag_core.startDragRaceActivity(lane, vehicleId)`

Démarre l'activité de drag : charge les extensions, crée le racer du joueur en freeroam solo, affiche l'app UI 'drag', allume le staging, coupe/met le contact sur 3 pour les racers jouables hors freeroam, émet onDragRacersSetup puis appelle startActivity du type de course.

- `lane` (*integer|nil*) : Couloir du joueur.
- `vehicleId` (*integer|nil*) : Véhicule (défaut : véhicule joueur 0).
- **renvoie** : boolean true si démarré.

#### `gameplay_drag_core.validateResetState(data)`

Vérifie qu'un reset est complet (course non démarrée, racers en phase 1, ni DQ ni finis, timers arrêtés, phases remises à zéro).

- `data` (*table|nil*) : Données de piste.
- **renvoie** : boolean Valide ou non.
- **renvoie** : string Message explicatif.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : saveSystem, dragBridge, rulesMenu, timeslip, poi. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeDragUnloadAllExtensions` — écouté par 1 module(s)
- `onDragClear` — écouté par 5 module(s)
- `onDragClearComplete` — écouté par 1 module(s)
- `onDragDataSet` — écouté par 3 module(s)
- `onDragMPTimeslipRequested`
- `onDragRacersSetup` — écouté par 2 module(s)
- `onDragReset` — écouté par 4 module(s)
- `startDragCountdown`

**Évènements UI (guihooks.trigger) :** `onDragRaceTimeslipData`, `updateTreeLightStaging`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getPlayerVehicleID`, `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/core.lua`.*

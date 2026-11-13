# `gameplay_rally_rallyManager`

*Fichier : `lua/ge/extensions/gameplay/rally/rallyManager.lua` · VM : Game Engine (GE) · 1290 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/rallyManager")` (fichier sous extensions/ mais pas une extension classique)

Gestionnaire d'une mission de rallye chargée (spéciale ou section de route). Un objet RallyManager regroupe le notebook (pacenotes), le chemin de course (race.json), la driveline enregistrée (DrivelineV3 / DrivelineRoute), le suivi du véhicule (VehicleTracker), le gestionnaire audio, la file d'attente des pacenotes, l'observateur d'étape (StageObserver) et le chronomètre (StageTimingState). Il déclenche les pacenotes audio et visuelles, gère les récupérations du véhicule, les temps intermédiaires et l'état de la spéciale pour l'UI. Il est créé et possédé par l'extension gameplay_rally (gameplay_rally.getRallyManager()). Le module renvoie un constructeur.

## Exemple

```lua
local rm = gameplay_rally.getRallyManager()
if rm then
  local data = rm:getActiveStageData()
  print(data.currentSSTime, data.completion.distPct)
end
```

## Remarques

- Le constructeur est appelé avec (missionDir, missionId) ; les ressources (notebook, driveline, audio) ne sont construites que par rebuildAssets.
- La file de pacenotes (dequeue) peut contenir la valeur spéciale 'HOLD' : tant qu'elle est en tête, aucun pacenote n'est joué. Elle est utilisée pour les virages lents (slowCorner) et libérée par clearQueueHold.
- Les paramètres d'activation sont lus dans settings : rallyAudioPacenotes et rallyVisualPacenotes. Un notebook en mode audio personnalisé n'émet pas de pacenotes visuels.
- Modes d'autorité du chrono : 'shadow' (par défaut, source = données de course 'race') ou 'tracker' (source = observateur de passage). Toute autre valeur est ramenée à 'shadow'.
- Les récupérations de véhicule appellent extensions.hook('onVehicleTeleportedToLastRoad', vehId) ; recoverVehicleToRouteDeparture appelle aussi extensions.hook('onRallyRouteRecoveryComplete', {vehId, repairVehicle, recoveryData}).
- getActiveStageData renvoie toujours la même table réutilisée (variable locale du module) : copier les valeurs si elles doivent être conservées entre deux appels.
- Bug potentiel : plusieurs méthodes ne vérifient pas que drivelineRoute existe (getPointDistanceFromStartMeters/Km, getRaceCompletionData) et provoquent une erreur sur nil avant le chargement ; getTimeAllocationSecs divise par drivelineV3:getSpeedLimitKph() sans tester une valeur nil ou nulle ; codriver et closestPacenoteToVehicle supposent notebook / vehicleTracker non nil.
- addRecoveryRaceTime utilise toujours les pénalités d'une spéciale (« Single stages are always a special stage », commentaire du code) et ignore la table des pénalités hors spéciale de recoveryClockAdvance.

## Classe `C`

Objet RallyManager renvoyé par le constructeur du module.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_rallyManager")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_playbackAllowed(pacenote)` | Appelle pacenote:playbackAllowed() ; en cas d'erreur, l'erreur est loggée et la lecture est autorisée. | 647 |
| `C:_refreshNotebookForVoicepackPick()` | Invalide les caches de voicepack et d'audio personnalisé du notebook et lui signale un changement de réglages. | 87 |
| `C:addRecoveryRaceTime(recoveryType)` | Ajoute au chrono la pénalité d'une récupération (RecoveryClockAdvance.getSpecialStageSeconds). | 1096 |
| `C:clearQueueHold()` | Retire le HOLD en tête de file de pacenotes, s'il y est. | 743 |
| `C:clearResolvedAudioObjs()` | Demande au notebook d'oublier les objets audio résolus. | 609 |
| `C:clearSplitTimes()` | Efface tous les temps et marqueurs d'observation des splits puis réinitialise le chrono d'étape. | 1259 |
| `C:closestPacenoteToVehicle()` | Pacenote le plus proche de la position du véhicule suivi. | 788 |
| `C:codriver()` | Copilote sélectionné du notebook. | 328 |
| `C:drawPacenotesForDriving()` | Dessine en debug le prochain pacenote : le waypoint de début de virage avec le texte compilé. | 702 |
| `C:enqueueHold()` | Ajoute une valeur HOLD à la fin de la file : les pacenotes suivants attendent sa libération. | 756 |
| `C:enqueuePacenote(pacenote)` | Ajoute un pacenote à la fin de la file. | 751 |
| `C:enqueuePauseSecs(secs)` | Ajoute une pause dans la file audio. | 842 |
| `C:enqueueRandomSystemPacenote(name, audioLenOffset)` | Choisit un pacenote système aléatoire par nom, lit la durée audio dans ses métadonnées (+ audioLenOffset) et l'envoie à l'AudioManager. Logue une erreur si le nom, le fichier audio ou la durée sont invalides. | 802 |
| `C:getActiveStageData()` | Construit l'état de la spéciale pour l'UI : currentSSTime (secondes au dixième), isActive, isComplete, splits, authorityMode, source ('race', 'tracker' ou 'trackerFallback'), completion {distPct, totalDistM}. Dépend du mode d'autorité et de l'état de l'observateur. | 1167 |
| `C:getAudioManager()` | Gestionnaire audio, nil avant rebuildAssets. | 140 |
| `C:getDrivelineRoute()` | Objet DrivelineRoute. | 870 |
| `C:getErrorMsgForUser()` | Dernier message d'erreur destiné à l'utilisateur (race.json manquant, notebook invalide, etc.). | 108 |
| `C:getLastPlayedPacenote()` | Dernier pacenote joué (retrouvé par son index dans le notebook s'il existe). | 892 |
| `C:getLastPlayedPacenoteRecoveryPose(distanceBefore)` | Calcule une position et rotation de récupération placées avant le dernier pacenote joué. | 900 |
| `C:getLiaisonAllocatedTimeSecs()` | Temps alloué de la liaison en secondes. | 1021 |
| `C:getLoopPrefabPath()` | Chemin du fichier loopPrefab.prefab.json dans le dossier de la mission. | 1279 |
| `C:getMissionDir()` | Dossier de la mission. | 132 |
| `C:getMissionId()` | Identifiant de la mission. | 128 |
| `C:getMissionName()` | Nom traduit de la mission, calculé une fois puis mis en cache. | 185 |
| `C:getMissionStartTrigger()` | Déclencheur de départ (startTrigger) de la mission dans gameplay_missions_missions ; nil et erreur loggée si la mission est introuvable. | 194 |
| `C:getNextPacenotes()` | Liste contenant le prochain pacenote de la driveline (un seul élément, éventuellement nil). | 797 |
| `C:getNotebookPath()` | Notebook chargé (objet NotebookPath), nil avant rebuildAssets. | 136 |
| `C:getPacenoteProcessingEnabled()` | Indique si le traitement de la file de pacenotes est actif. | 112 |
| `C:getPathnodeObservationList()` | Liste ordonnée par distance des pathnodes à observer (splits, arrivée). | 422 |
| `C:getPointDistanceFromStartKm(point)` | Distance du point depuis le départ le long de la route, en kilomètres. | 363 |
| `C:getPointDistanceFromStartMeters(point)` | Distance du point depuis le départ le long de la route, en mètres. | 359 |
| `C:getRaceCompletionData()` | Progression de la course : distM (distance en m) et distPct (0 à 1) ; le code lit aussi totalDistM. | 1061 |
| `C:getRaceData()` | Données de course courantes (états des véhicules, temps), fournies par setRaceData. | 148 |
| `C:getRaceDistanceMeters()` | Distance de course entre départ et arrivée le long de la driveline. | 1049 |
| `C:getRacePath()` | Chemin de course chargé depuis race.json. | 144 |
| `C:getRecoveryDestinationPos()` | Position de destination d'une récupération : la pose de reprise, sinon le point de route devant le véhicule. | 998 |
| `C:getRouteDepartureRecoveryPose(options)` | Calcule la pose de récupération après une sortie de route (DrivelineRoute:vehiclePlacementPosAndRotForRecovery). | 939 |
| `C:getSSStartLinePos()` | Position de départ nommée « SS_start_line » (ligne de départ de la spéciale). | 177 |
| `C:getSSStopControlPos()` | Position de départ nommée « SS_stop_control » (contrôle d'arrêt). | 181 |
| `C:getSpeedLimitKph()` | Limite de vitesse de la driveline en km/h. | 1014 |
| `C:getSplitDataIndex()` | Index des splits par pathnodeId. | 415 |
| `C:getSplitDataList()` | Liste des données de splits du DrivelineRoute. | 408 |
| `C:getStageObserverState()` | État de l'observateur d'étape (StageObserver:getState). | 1077 |
| `C:getStageRuntimeAuthorityMode()` | Mode d'autorité courant ('shadow' par défaut). | 1073 |
| `C:getStageRuntimeTime()` | Temps de la spéciale en secondes : temps de fin du tracker s'il existe, sinon temps du chrono. | 1087 |
| `C:getStageTimingState()` | Instantané de l'état du chrono (StageTimingState:getState). | 1092 |
| `C:getStartAndFinishStartPositions()` | Renvoie la position de départ (SS_start_line, à défaut TC_in) et le dernier pathnode (arrivée lancée, pas le contrôle d'arrêt). | 1033 |
| `C:getStartPositionByName(name)` | Cherche une position de départ du chemin de course par son nom. | 156 |
| `C:getTCInPos()` | Position de départ nommée « TC_in » (entrée du contrôle horaire). | 169 |
| `C:getTCOutPos()` | Position de départ nommée « TC_out » (sortie du contrôle horaire). | 173 |
| `C:getTimeAllocationSecs()` | Temps alloué en secondes pour parcourir la route à la vitesse limite de la driveline (distance / vitesse). | 367 |
| `C:getTimeAllocationString()` | Temps alloué arrondi à la minute supérieure, au format « Xh Ym ». | 387 |
| `C:getTrackerStageTime()` | Temps de la spéciale vu par le tracker : observateur, sinon fin du tracker, chrono actif, ou temps de course. | 1122 |
| `C:getVoicepackPick()` | Choix de voicepack de la session ; {type='preferences'} par défaut. | 79 |
| `C:getVoicepackPickWritesSettings()` | Indique si le choix de voicepack est écrit dans les réglages (vrai sauf si explicitement désactivé). | 83 |
| `C:hasAnyPacenotes()` | Indique si le notebook contient des pacenotes. | 1028 |
| `C:init(missionDir, missionId)` | Initialise tous les champs (file de pacenotes, notebook, racePath, driveline, audio nil, StageObserver, StageTimingState, mode d'autorité 'shadow') pour la mission donnée. | 36 |
| `C:onSettingsChanged()` | Appelé quand les réglages rally changent : prévient le notebook et vide la file audio. | 626 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame par gameplay_rally : met à jour le tracker, le DrivelineRoute, le chrono (avance de dtSim), les observations de splits, l'audio, puis traite la file de pacenotes. | 717 |
| `C:onVehicleResetted()` | Appelé quand le véhicule est remis en place : vide les audio résolus et resynchronise (en préservant le tracker de récupération une seule fois si demandé). | 637 |
| `C:playFirstPacenote()` | Joue (audio) le premier pacenote trié du notebook et le mémorise comme dernier joué. | 853 |
| `C:processPacenoteQueue()` | Si le traitement est actif et que la tête n'est pas HOLD, dépile un pacenote et le joue via triggerPacenote. | 763 |
| `C:rebuildAssets(options)` | Construit tout le contexte d'exécution : VehicleTracker, race.json, notebook, AudioManager, driveline (DrivelineV3) et DrivelineRoute, snaproad du notebook, pacenotes compilés, puis runtimeResync. En cas d'échec, errorMsgForUser est renseigné. | 447 |
| `C:recordSplit(pathnodeId, time)` | Enregistre le temps d'une course pour un split (via l'observateur, ou directement dans splitData). | 1246 |
| `C:recoverVehicleToLastPlayedPacenote(veh, options)` | Téléporte le véhicule 10 m (ou options.distanceBefore) avant le dernier pacenote joué, resynchronise puis déclenche le hook onVehicleTeleportedToLastRoad. | 918 |
| `C:recoverVehicleToRouteDeparture(veh, options)` | Téléporte le véhicule au point de reprise de la route, avec réparation selon options.repairVehicle / resetVehicle / gameplay_rally.getRecoveryRepairVehicle (vrai par défaut), puis déclenche les hooks onVehicleTeleportedToLastRoad et onRallyRouteRecoveryComplete. | 960 |
| `C:reloadVoicepackAssets(pick, opts)` | Change de voicepack puis reconstruit tous les états dérivés du compositeur (y compris les appels de distance). | 552 |
| `C:resetAudioQueue()` | Vide la file audio de l'AudioManager. | 1009 |
| `C:resetPacenoteRuntime()` | Efface les pacenotes visuels, la file audio et la file de pacenotes. | 575 |
| `C:resetStageRuntime()` | Réinitialise l'état de suivi de la spéciale : chrono, observateur, drapeaux de fin, et réapplique le mode d'autorité à l'observateur. | 561 |
| `C:resolveAndLoadNotebook()` | Choisit le voicepack actif (choix exact ou préférences/MRU) puis charge le notebook correspondant de la mission. Si aucun n'existe, renvoie un notebook vide en mémoire (« Route Preview ») pour prévisualiser une route sans pacenotes. | 432 |
| `C:resyncAfterTeleport(options)` | Resynchronise l'état après un déplacement du véhicule : vide les files, oublie l'emprise de l'observateur et demande au DrivelineRoute de recalculer (immédiatement si deferRuntime == false, sinon au prochain onUpdate). | 581 |
| `C:runtimeResync(options)` | Vide les audio résolus, réinitialise le chrono d'étape, puis appelle resyncAfterTeleport. | 615 |
| `C:sampleRaceStageTime(vehId)` | Temps de la spéciale pour un véhicule : celui du chrono si actif ou terminé par le tracker, sinon celui des données de course (temps de fin si terminé). | 1110 |
| `C:sendPacenoteToAudioManager(pacenote)` | Envoie le pacenote à l'AudioManager pour lecture audio. | 847 |
| `C:setLastPlayedPacenote(pacenote)` | Mémorise le dernier pacenote joué, son nom et son index dans la liste triée du notebook. | 874 |
| `C:setPacenoteProcessingEnabled(enabled)` | Active ou suspend le traitement de la file de pacenotes. | 116 |
| `C:setPreserveRecoveryTrackerOnNextVehicleReset(val)` | Indique que le prochain reset du véhicule doit préserver le suivi statique de la récupération. | 633 |
| `C:setRaceData(raceData)` | Mémorise les données de course courantes. | 152 |
| `C:setStageRuntimeActive(active)` | Démarre ou arrête le chrono de l'étape ; ne démarre pas si l'étape est déjà terminée. | 1081 |
| `C:setStageRuntimeAuthorityMode(mode)` | Définit le mode d'autorité du chrono ('tracker' ou 'shadow') et le transmet à l'observateur. | 1066 |
| `C:setVoicepackPick(pick, opts)` | Définit le voicepack de la session (type 'auto' converti en 'preferences'), l'ajoute à la liste MRU si nécessaire, puis rafraîchit le notebook sauf si deferNotebookRefresh. | 96 |
| `C:setupDrivelineRouteHooks()` | Branche les callbacks du DrivelineRoute (CsDynamic, CsImmediate, CsStatic, CeStatic, décalages -40 pour Cs et -5 pour Ce, pourcentage de virage 0.5) : ils mettent le pacenote en file, ajoutent un HOLD pour les virages lents, effacent le pacenote visuel et libèrent le HOLD selon la règle du pacenote. | 230 |
| `C:triggerClearAllVisualPacenotes()` | Efface tous les pacenotes visuels (guihooks 'clearAllVisualPacenotes'). | 695 |
| `C:triggerClearVisualPacenote(pacenote)` | Efface un pacenote visuel (guihooks 'clearOneVisualPacenote' avec visualSerialNo). | 687 |
| `C:triggerPacenote(pacenote)` | Joue un pacenote si la lecture est autorisée : l'envoie à l'audio (réglage rallyAudioPacenotes) et déclenche l'affichage visuel (réglage rallyVisualPacenotes, sauf notebook audio personnalisé). | 203 |
| `C:triggerShowVisualPacenote(pacenote)` | Envoie le pacenote compilé à l'UI via guihooks 'showVisualPacenote2'. Ignoré s'il n'a pas d'événement visuel ou aucune icône (visualPacenotes vide). | 661 |
| `C:updateTrackerSplitObservations()` | Appelle StageObserver:update avec le tracker statique, les nodes d'observation et les temps de frame, puis recopie la fin d'étape et termine le chrono si l'observateur a détecté l'arrivée. | 1133 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRallyRouteRecoveryComplete` — écouté par 1 module(s)
- `onVehicleTeleportedToLastRoad`

**Évènements UI (guihooks.trigger) :** `clearAllVisualPacenotes`, `clearOneVisualPacenote`, `showVisualPacenote2`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/rallyManager.lua`.*

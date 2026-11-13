# `core_replay`

*Fichier : `lua/ge/extensions/core/replay.lua` · VM : Game Engine (GE) · 1109 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_replay` : `extensions.load("core_replay")`, puis la globale `core_replay`

Interface Lua du système de replays (fichiers .rpl sous replays/). Elle pilote le flux de fichier C++ (be:getFileStream) : enregistrement manuel ou de mission, lecture, pause, vitesse, saut, renommage, suppression. Elle reçoit l'état du moteur par stateChanged, le republie à l'UI (guihooks replayStateChanged) et aux extensions (hooks onReplayStateChanged et onReplayCoreEvent), et active ou désactive les action maps de lecture. Gère aussi les replays automatiques de mission (replays/missionReplays/ et replays/userSavedMissionReplays/).

## Exemple

```lua
core_replay.startRecording()
-- plus tard
core_replay.stopRecording({autoplayAfterStopping = true})
local list = core_replay.getRecordings()
core_replay.loadFile(list[1].filename, true)
```

## Remarques

- M.state contient : loadedFile, positionSeconds, totalSeconds, speed (arrondi au millième), paused, fpsPlay, fpsRec, state ('inactive', 'playback' ou 'recording'), framePositionSeconds.
- Tous les noms de fichiers sont validés : relatifs au jeu, sous replays/, avec extension .rpl, sans '..', sans ':' ni caractères interdits. Sinon les fonctions renvoient un résultat d'échec avec code 'invalidFilename' ou un message.
- Beaucoup de fonctions renvoient un résultat {success, filename, message?, code?, ...} (replayOperationResult). Codes vus : ok, queued, invalidFilename, fileNotFound, streamUnavailable, streamPlayFailed, recordStartFailed, recordingActive, notRecording, playbackActive.
- loadFile ne lance pas la lecture tout de suite : il met la demande en attente et affiche 'app:waiting' ; la lecture démarre dans onUiWaitingState. Un nouvel appel remplace la demande en attente.
- Vitesses accessibles par toggleSpeed : 1/1000, 1/500, 1/200, 1/100, 1/50, 1/32, 1/16, 1/8, 1/4, 1/2, 3/4, 1, 1.5, 2, 4, 8.
- Le commentaire de setSpeed dit '1=realtime, 0.5=slowmo, 2=fastmotion'. Le changement est instantané, sans lissage.
- Un enregistrement manuel est refusé pendant qu'un enregistrement de mission est actif (message ui replay.cantManualRecording).
- BUG probable : getMissionReplayFiles appelle career_saveSystem.getCurrentProfile() sans tester que career_saveSystem existe (le test career_career vient après). Hors carrière, si career_saveSystem n'est pas chargé, cela lève une erreur.
- Les fonctions saveMissionReplay et removeMissionSavedReplay copient puis suppriment les fichiers .rpl et .rplMeta.json, et supposent que le meta existe (meta.missionId).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_replay._getReplayVehicleData(id)` | Appelé par le C++ : renvoie les données du véhicule (core_vehicle_manager.getVehicleData) encodées en JSON. *(interne)* | 1054 |
| `core_replay.acceptRename(oldFilename, newFilename)` | Renomme un replay (et son .rplMeta.json). Un nouveau nom sans '/' reste dans le même dossier ; refusé si la cible existe. Si le replay était chargé, il est rechargé sous son nouveau nom. | 909 |
| `core_replay.cancelRecording()` | Si un enregistrement est en cours : l'arrête et supprime le fichier, puis publie l'état vide. | 689 |
| `core_replay.displayMsg(level, msg, context)` | Affiche une notification (toastrMsg) 'Replay <level>' et écrit un log. | 546 |
| `core_replay.getDebugEnabled()` | Indique si les logs de debug du replay sont actifs. | 40 |
| `core_replay.getLoadedFile()` | Nom du fichier replay chargé. | 483 |
| `core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt)` | Liste les replays de mission (automatiques et sauvegardés par l'utilisateur pour la carrière/freeroam courante) correspondant à une mission, triés par meta.time. | 971 |
| `core_replay.getMissionReplaysPath()` | Renvoie le dossier des replays de mission automatiques. | 1104 |
| `core_replay.getPlaybackContext(filename)` | Indique si un replay peut être lu et s'il faut d'abord charger son niveau. | 298 |
| `core_replay.getPositionSeconds()` | Position de lecture courante en secondes. | 458 |
| `core_replay.getRecordings()` | Liste les .rpl du dossier replays/ (sans sous-dossiers). Chaque entrée : filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. Le niveau est deviné en scannant le début du fichier (jusqu'à 1 Mo) ; tri : niveau courant d'abord, puis le plus récent. | 261 |
| `core_replay.getState()` | État du système de replay. | 466 |
| `core_replay.getTotalSeconds()` | Durée totale du replay chargé en secondes. | 462 |
| `core_replay.isGameplayAllowed()` | Indique si le gameplay est autorisé pendant le replay. Renvoie toujours true actuellement (un TODO dans le code prévoit une option). | 470 |
| `core_replay.isPaused()` | Indique si la lecture est en pause. | 479 |
| `core_replay.jump(offset)` | Alias de jumpFrames (ancien nom). | 842 |
| `core_replay.jumpFrames(offset)` | Avance ou recule d'un nombre d'images (stream:stepFrames) et affiche un message UI. | 842 |
| `core_replay.jumpTime(timeDiffInSeconds)` | Avance ou recule d'une durée (stream:stepTime) et affiche un message UI. | 849 |
| `core_replay.loadFile(filename, autoplay, options)` | Met en attente le chargement d'un replay (affiche l'écran d'attente ; la lecture démarre dans onUiWaitingState). Valide le nom de fichier. | 631 |
| `core_replay.logUiAction(scope, data)` | Écrit dans le log de debug (si actif) une action venue de l'UI, avec le préfixe 'ui.'. | 36 |
| `core_replay.onClientEndMission(levelPath)` | Hook appelé à la fin d'un niveau : si une lecture est en cours et que le changement de niveau n'a pas été demandé par startLevel, la lecture est arrêtée avec un message. *(interne)* *(hook)* | 863 |
| `core_replay.onInit()` | Hook d'initialisation de l'extension : demande au flux de fichier de renvoyer son état (stream:requestState). *(interne)* *(hook)* | 254 |
| `core_replay.onUiWaitingState(state)` | Hook appelé quand l'écran d'attente de l'UI est affiché. Lance alors la lecture du fichier mis en attente par loadFile (stop du flux puis play). *(interne)* *(hook)* | 608 |
| `core_replay.openMissionReplayFolder(replayFileName)` | Ouvre l'emplacement d'un fichier replay dans l'explorateur ; journalise une erreur s'il n'existe pas. | 1044 |
| `core_replay.openReplayFolderInExplorer()` | Ouvre le dossier replays/ dans l'explorateur de fichiers (le crée s'il manque). | 856 |
| `core_replay.pause(v)` | Met en pause ou relance la lecture. Sans effet hors 'playback'. | 538 |
| `core_replay.removeMissionSavedReplay(replayFileName)` | Opération inverse : déplace un replay sauvegardé vers replays/missionReplays/ (pour qu'il soit de nouveau géré automatiquement), puis notifie l'UI. | 1028 |
| `core_replay.removeRecording(filename)` | Supprime un replay et son fichier .rplMeta.json ; l'arrête d'abord s'il est chargé ; met à jour le catalogue. | 882 |
| `core_replay.saveMissionReplay(replayFileName)` | Déplace un replay de mission automatique vers le dossier des replays sauvegardés par l'utilisateur (carrière/<slot>/ ou freeroam/) avec son .rplMeta.json, puis notifie l'UI (recordingFilesUpdated). | 1011 |
| `core_replay.seek(percent)` | Se place à une position normalisée du replay. Sans effet hors playback. | 834 |
| `core_replay.setDebugEnabled(enabled)` | Active ou désactive les logs de debug du replay (tag core_replay.debug). | 31 |
| `core_replay.setSpeed(speed)` | Fixe la vitesse de lecture (1 = temps réel, 0.5 = ralenti, 2 = accéléré), sans lissage. Ne fait rien si la vitesse est déjà celle-ci. | 487 |
| `core_replay.startLevel(levelPath)` | Lance le niveau donné en freeroam sans faire apparaître de véhicule (freeroam_freeroam.startFreeroamByName), en marquant requestedStartLevel pour ne pas arrêter la lecture. | 873 |
| `core_replay.startRecording()` | Démarre un enregistrement manuel dans replays/ (nom 'AAAA-MM-JJ_HH-MM-SS <niveau>.rpl'). Refusé si déjà en enregistrement, en lecture, ou si un enregistrement de mission est actif. | 774 |
| `core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds)` | Appelé par le C++ à chaque changement d'état du flux de replay. À l'entrée en 'playback', désactive les action maps VehicleCommon/VehicleSpecific et pousse ReplayPlaybackActionMap ; à la sortie, l'inverse. Met à jour M.state, déclenche guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) et 'onReplayCoreEvent'({event, state, ...}) avec event parmi playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged. *(interne)* | 376 |
| `core_replay.stop()` | Annule un chargement en attente et arrête le flux (lecture ou enregistrement). | 662 |
| `core_replay.stopAndUnload()` | Arrête la lecture et publie un état vide 'inactive'. Refusé pendant un enregistrement (code recordingActive). | 672 |
| `core_replay.stopRecording(options)` | Arrête l'enregistrement manuel et met à jour le catalogue (guihooks replayRecordingsUpdated). | 790 |
| `core_replay.toggleMissionRecording()` | Raccourci de toggleRecording(false, true) : bascule l'enregistrement du replay de mission. | 830 |
| `core_replay.togglePlay()` | Bascule lecture/pause du replay chargé. Si l'état est 'inactive', recharge et lance le fichier ; hors playback et inactive, journalise une erreur. | 552 |
| `core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay)` | Bascule l'enregistrement : en enregistrement, l'arrête ; en lecture, arrête la lecture ; sinon démarre un enregistrement. | 808 |
| `core_replay.toggleSpeed(val)` | Change la vitesse. 'realtime' alterne entre 1 et la dernière autre vitesse (1/8 au départ) ; 'slowmotion' met 1/8 ; un nombre positif ou négatif monte ou descend d'autant de crans dans la liste des vitesses. Informe simTimeAuthority. | 496 |

### Détail des paramètres

#### `core_replay._getReplayVehicleData(id)`

Appelé par le C++ : renvoie les données du véhicule (core_vehicle_manager.getVehicleData) encodées en JSON.

- `id` (*integer*) : Id du véhicule.
- **renvoie** : string JSON ; doit être une chaîne.

#### `core_replay.acceptRename(oldFilename, newFilename)`

Renomme un replay (et son .rplMeta.json). Un nouveau nom sans '/' reste dans le même dossier ; refusé si la cible existe. Si le replay était chargé, il est rechargé sous son nouveau nom.

- `oldFilename` (*string*) : Ancien chemin sous replays/.
- `newFilename` (*string*) : Nouveau nom ou chemin.
- **renvoie** : table {success, filename, newFilename?, message?}.

#### `core_replay.displayMsg(level, msg, context)`

Affiche une notification (toastrMsg) 'Replay <level>' et écrit un log.

- `level` (*string*) : Catégorie toastr : error, info, warning…
- `msg` (*string*) : Clé de traduction ou texte.
- `context` (*table|nil*) : Variables de traduction.

#### `core_replay.getDebugEnabled()`

Indique si les logs de debug du replay sont actifs.

- **renvoie** : boolean État du debug.

#### `core_replay.getLoadedFile()`

Nom du fichier replay chargé.

- **renvoie** : string|nil Chemin du fichier.

#### `core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt)`

Liste les replays de mission (automatiques et sauvegardés par l'utilisateur pour la carrière/freeroam courante) correspondant à une mission, triés par meta.time.

- `mission` (*table*) : Mission, avec champ id.
- `returnOnlyWithAttempt` (*boolean|nil*) : Si vrai, ne garde que ceux dont le meta contient attempt.
- **renvoie** : table[] Entrées {replayFile, replayFileName, meta, userSaved}.

#### `core_replay.getMissionReplaysPath()`

Renvoie le dossier des replays de mission automatiques.

- **renvoie** : string "replays/missionReplays/".

#### `core_replay.getPlaybackContext(filename)`

Indique si un replay peut être lu et s'il faut d'abord charger son niveau.

- `filename` (*string*) : Fichier replay (sous replays/).
- **renvoie** : table {success, filename, code, recordedLevel, currentLevel, levelKnown, requiresLevelLoad} ou échec avec code invalidFilename / fileNotFound.

#### `core_replay.getPositionSeconds()`

Position de lecture courante en secondes.

- **renvoie** : number|nil Position (nil avant le premier stateChanged).

#### `core_replay.getRecordings()`

Liste les .rpl du dossier replays/ (sans sous-dossiers). Chaque entrée : filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. Le niveau est deviné en scannant le début du fichier (jusqu'à 1 Mo) ; tri : niveau courant d'abord, puis le plus récent.

- **renvoie** : table[] Liste d'enregistrements.

#### `core_replay.getState()`

État du système de replay.

- **renvoie** : string|nil 'inactive', 'playback' ou 'recording'.

#### `core_replay.getTotalSeconds()`

Durée totale du replay chargé en secondes.

- **renvoie** : number|nil Durée.

#### `core_replay.isGameplayAllowed()`

Indique si le gameplay est autorisé pendant le replay. Renvoie toujours true actuellement (un TODO dans le code prévoit une option).

- **renvoie** : boolean Toujours true.

#### `core_replay.isPaused()`

Indique si la lecture est en pause.

- **renvoie** : boolean|nil État de pause.

#### `core_replay.jump(offset)`

Alias de jumpFrames (ancien nom).

- `offset` (*integer*) : Nombre d'images.

#### `core_replay.jumpFrames(offset)`

Avance ou recule d'un nombre d'images (stream:stepFrames) et affiche un message UI.

- `offset` (*integer*) : Nombre d'images (négatif = recul).

#### `core_replay.jumpTime(timeDiffInSeconds)`

Avance ou recule d'une durée (stream:stepTime) et affiche un message UI.

- `timeDiffInSeconds` (*number*) : Durée en secondes (négatif = recul).

#### `core_replay.loadFile(filename, autoplay, options)`

Met en attente le chargement d'un replay (affiche l'écran d'attente ; la lecture démarre dans onUiWaitingState). Valide le nom de fichier.

- `filename` (*string*) : Chemin sous replays/ (extension .rpl).
- `autoplay` (*boolean|nil*) : Si vrai, la lecture démarre immédiatement ; sinon elle démarre en pause.
- `options` (*table|nil*) : options.pauseWhenReady = true : remet en pause au début quand le monde est prêt.
- **renvoie** : table {success, filename, code = 'queued'} ou échec.

#### `core_replay.logUiAction(scope, data)`

Écrit dans le log de debug (si actif) une action venue de l'UI, avec le préfixe 'ui.'.

- `scope` (*string*) : Nom de l'action.
- `data` (*any*) : Données à journaliser.

#### `core_replay.onClientEndMission(levelPath)`

Hook appelé à la fin d'un niveau : si une lecture est en cours et que le changement de niveau n'a pas été demandé par startLevel, la lecture est arrêtée avec un message.

- `levelPath` (*string*) : Chemin du niveau quitté (déduit du code).

#### `core_replay.onUiWaitingState(state)`

Hook appelé quand l'écran d'attente de l'UI est affiché. Lance alors la lecture du fichier mis en attente par loadFile (stop du flux puis play).

- `state` (*boolean*) : Vrai quand l'attente est active ; sinon ignoré.

#### `core_replay.openMissionReplayFolder(replayFileName)`

Ouvre l'emplacement d'un fichier replay dans l'explorateur ; journalise une erreur s'il n'existe pas.

- `replayFileName` (*string*) : Chemin du fichier.

#### `core_replay.pause(v)`

Met en pause ou relance la lecture. Sans effet hors 'playback'.

- `v` (*boolean*) : true = pause.

#### `core_replay.removeMissionSavedReplay(replayFileName)`

Opération inverse : déplace un replay sauvegardé vers replays/missionReplays/ (pour qu'il soit de nouveau géré automatiquement), puis notifie l'UI.

- `replayFileName` (*string*) : Chemin du .rpl.

#### `core_replay.removeRecording(filename)`

Supprime un replay et son fichier .rplMeta.json ; l'arrête d'abord s'il est chargé ; met à jour le catalogue.

- `filename` (*string*) : Fichier sous replays/.
- **renvoie** : table {success, filename, message?}.

#### `core_replay.saveMissionReplay(replayFileName)`

Déplace un replay de mission automatique vers le dossier des replays sauvegardés par l'utilisateur (carrière/<slot>/ ou freeroam/) avec son .rplMeta.json, puis notifie l'UI (recordingFilesUpdated).

- `replayFileName` (*string*) : Chemin du .rpl.

#### `core_replay.seek(percent)`

Se place à une position normalisée du replay. Sans effet hors playback.

- `percent` (*number*) : Position entre 0 et 1 (borné).

#### `core_replay.setDebugEnabled(enabled)`

Active ou désactive les logs de debug du replay (tag core_replay.debug).

- `enabled` (*boolean*) : Vrai pour activer.

#### `core_replay.setSpeed(speed)`

Fixe la vitesse de lecture (1 = temps réel, 0.5 = ralenti, 2 = accéléré), sans lissage. Ne fait rien si la vitesse est déjà celle-ci.

- `speed` (*number*) : Facteur de vitesse.

#### `core_replay.startLevel(levelPath)`

Lance le niveau donné en freeroam sans faire apparaître de véhicule (freeroam_freeroam.startFreeroamByName), en marquant requestedStartLevel pour ne pas arrêter la lecture.

- `levelPath` (*string*) : Chemin du niveau.

#### `core_replay.startRecording()`

Démarre un enregistrement manuel dans replays/ (nom 'AAAA-MM-JJ_HH-MM-SS <niveau>.rpl'). Refusé si déjà en enregistrement, en lecture, ou si un enregistrement de mission est actif.

- **renvoie** : table {success, filename, code, ...}.

#### `core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds)`

Appelé par le C++ à chaque changement d'état du flux de replay. À l'entrée en 'playback', désactive les action maps VehicleCommon/VehicleSpecific et pousse ReplayPlaybackActionMap ; à la sortie, l'inverse. Met à jour M.state, déclenche guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) et 'onReplayCoreEvent'({event, state, ...}) avec event parmi playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged.

- `loadedFile` (*string*) : Fichier chargé.
- `positionSeconds` (*number*) : Position de lecture (s).
- `totalSeconds` (*number*) : Durée totale (s).
- `speed` (*number*) : Vitesse de lecture.
- `paused` (*boolean*) : En pause.
- `fpsPlay` (*number*) : Images par seconde en lecture.
- `fpsRec` (*number*) : Images par seconde à l'enregistrement.
- `statestr` (*string*) : 'inactive', 'playback' ou 'recording'.
- `framePositionSeconds` (*number*) : Position de l'image courante (s).

#### `core_replay.stopAndUnload()`

Arrête la lecture et publie un état vide 'inactive'. Refusé pendant un enregistrement (code recordingActive).

- **renvoie** : table Résultat {success, filename, message?, code}.

#### `core_replay.stopRecording(options)`

Arrête l'enregistrement manuel et met à jour le catalogue (guihooks replayRecordingsUpdated).

- `options` (*table|nil*) : options.autoplayAfterStopping = true : charge le replay à l'arrêt.
- **renvoie** : table {success, filename, code, playbackResult?}.

#### `core_replay.toggleMissionRecording()`

Raccourci de toggleRecording(false, true) : bascule l'enregistrement du replay de mission.

- **renvoie** : string|nil Nom du fichier si un enregistrement vient de démarrer.

#### `core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay)`

Bascule l'enregistrement : en enregistrement, l'arrête ; en lecture, arrête la lecture ; sinon démarre un enregistrement.

- `autoplayAfterStopping` (*boolean|nil*) : Lire le replay après l'arrêt. Si nil : vrai pour un enregistrement manuel, faux pour un replay de mission.
- `isMissionReplay` (*boolean|nil*) : Replay automatique de mission (dossier replays/missionReplays/).
- **renvoie** : string|nil Nom du fichier si un enregistrement vient de démarrer.

#### `core_replay.toggleSpeed(val)`

Change la vitesse. 'realtime' alterne entre 1 et la dernière autre vitesse (1/8 au départ) ; 'slowmotion' met 1/8 ; un nombre positif ou négatif monte ou descend d'autant de crans dans la liste des vitesses. Informe simTimeAuthority.

- `val` (*string|integer*) : 'realtime', 'slowmotion', ou nombre de crans (+1, -1…).

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onReplayCoreEvent` — écouté par 1 module(s)
- `onReplayStateChanged` — écouté par 3 module(s)

**Évènements UI (guihooks.trigger) :** `Message`, `app:waiting`, `recordingFilesUpdated`, `replayStateChanged`, `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `fileExists`, `fileSize`, `findFiles`, `removeFile`, `renameFile`, `stat`
- `be:` `getEnterableObjectCount`, `getFileStream`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/replay.lua`.*

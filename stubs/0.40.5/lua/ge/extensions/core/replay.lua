---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/replay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interface Lua du système de replays (fichiers .rpl sous replays/). Elle pilote le flux de fichier C++ (be:getFileStream) : enregistrement manuel ou de mission, lecture, pause, vitesse, saut, renommage, suppression. Elle reçoit l'état du moteur par stateChanged, le republie à l'UI (guihooks replayStateChanged) et aux extensions (hooks onReplayStateChanged et onReplayCoreEvent), et active ou désactive les action maps de lecture. Gère aussi les replays automatiques de mission (replays/missionReplays/ et replays/userSavedMissionReplays/).
--- Accès : extension `core_replay` : `extensions.load("core_replay")`, puis la globale `core_replay`
---@class core_replay
core_replay = {}

--- Appelé par le C++ : renvoie les données du véhicule (core_vehicle_manager.getVehicleData) encodées en JSON.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/replay.lua:1054
---@param id integer Id du véhicule.
---@return string  JSON ; doit être une chaîne.
function core_replay._getReplayVehicleData(id) end

--- Renomme un replay (et son .rplMeta.json). Un nouveau nom sans '/' reste dans le même dossier ; refusé si la cible existe. Si le replay était chargé, il est rechargé sous son nouveau nom.
---Source : lua/ge/extensions/core/replay.lua:909
---@param oldFilename string Ancien chemin sous replays/.
---@param newFilename string Nouveau nom ou chemin.
---@return table  {success, filename, newFilename?, message?}.
function core_replay.acceptRename(oldFilename, newFilename) end

--- Si un enregistrement est en cours : l'arrête et supprime le fichier, puis publie l'état vide.
---Source : lua/ge/extensions/core/replay.lua:689
function core_replay.cancelRecording() end

--- Affiche une notification (toastrMsg) 'Replay <level>' et écrit un log.
---Source : lua/ge/extensions/core/replay.lua:546
---@param level string Catégorie toastr : error, info, warning…
---@param msg string Clé de traduction ou texte.
---@param context table|nil Variables de traduction.
function core_replay.displayMsg(level, msg, context) end

--- Indique si les logs de debug du replay sont actifs.
---Source : lua/ge/extensions/core/replay.lua:40
---@return boolean  État du debug.
function core_replay.getDebugEnabled() end

--- Nom du fichier replay chargé.
---Source : lua/ge/extensions/core/replay.lua:483
---@return string|nil  Chemin du fichier.
function core_replay.getLoadedFile() end

--- Liste les replays de mission (automatiques et sauvegardés par l'utilisateur pour la carrière/freeroam courante) correspondant à une mission, triés par meta.time.
---Source : lua/ge/extensions/core/replay.lua:971
---@param mission table Mission, avec champ id.
---@param returnOnlyWithAttempt boolean|nil Si vrai, ne garde que ceux dont le meta contient attempt.
---@return table[]  Entrées {replayFile, replayFileName, meta, userSaved}.
function core_replay.getMissionReplayFiles(mission, returnOnlyWithAttempt) end

--- Renvoie le dossier des replays de mission automatiques.
---Source : lua/ge/extensions/core/replay.lua:1104
---@return string  "replays/missionReplays/".
function core_replay.getMissionReplaysPath() end

--- Indique si un replay peut être lu et s'il faut d'abord charger son niveau.
---Source : lua/ge/extensions/core/replay.lua:298
---@param filename string Fichier replay (sous replays/).
---@return table  {success, filename, code, recordedLevel, currentLevel, levelKnown, requiresLevelLoad} ou échec avec code invalidFilename / fileNotFound.
function core_replay.getPlaybackContext(filename) end

--- Position de lecture courante en secondes.
---Source : lua/ge/extensions/core/replay.lua:458
---@return number|nil  Position (nil avant le premier stateChanged).
function core_replay.getPositionSeconds() end

--- Liste les .rpl du dossier replays/ (sans sous-dossiers). Chaque entrée : filename, path, key, basename, displayName, size, sortTime, map, levelName, metadataAvailable, missingMetadataFields. Le niveau est deviné en scannant le début du fichier (jusqu'à 1 Mo) ; tri : niveau courant d'abord, puis le plus récent.
---Source : lua/ge/extensions/core/replay.lua:261
---@return table[]  Liste d'enregistrements.
function core_replay.getRecordings() end

--- État du système de replay.
---Source : lua/ge/extensions/core/replay.lua:466
---@return string|nil  'inactive', 'playback' ou 'recording'.
function core_replay.getState() end

--- Durée totale du replay chargé en secondes.
---Source : lua/ge/extensions/core/replay.lua:462
---@return number|nil  Durée.
function core_replay.getTotalSeconds() end

--- Indique si le gameplay est autorisé pendant le replay. Renvoie toujours true actuellement (un TODO dans le code prévoit une option).
---Source : lua/ge/extensions/core/replay.lua:470
---@return boolean  Toujours true.
function core_replay.isGameplayAllowed() end

--- Indique si la lecture est en pause.
---Source : lua/ge/extensions/core/replay.lua:479
---@return boolean|nil  État de pause.
function core_replay.isPaused() end

--- Alias de jumpFrames (ancien nom).
---Source : lua/ge/extensions/core/replay.lua:842
---@param offset integer Nombre d'images.
function core_replay.jump(offset) end

--- Avance ou recule d'un nombre d'images (stream:stepFrames) et affiche un message UI.
---Source : lua/ge/extensions/core/replay.lua:842
---@param offset integer Nombre d'images (négatif = recul).
function core_replay.jumpFrames(offset) end

--- Avance ou recule d'une durée (stream:stepTime) et affiche un message UI.
---Source : lua/ge/extensions/core/replay.lua:849
---@param timeDiffInSeconds number Durée en secondes (négatif = recul).
function core_replay.jumpTime(timeDiffInSeconds) end

--- Met en attente le chargement d'un replay (affiche l'écran d'attente ; la lecture démarre dans onUiWaitingState). Valide le nom de fichier.
---Source : lua/ge/extensions/core/replay.lua:631
---@param filename string Chemin sous replays/ (extension .rpl).
---@param autoplay boolean|nil Si vrai, la lecture démarre immédiatement ; sinon elle démarre en pause.
---@param options table|nil options.pauseWhenReady = true : remet en pause au début quand le monde est prêt.
---@return table  {success, filename, code = 'queued'} ou échec.
function core_replay.loadFile(filename, autoplay, options) end

--- Écrit dans le log de debug (si actif) une action venue de l'UI, avec le préfixe 'ui.'.
---Source : lua/ge/extensions/core/replay.lua:36
---@param scope string Nom de l'action.
---@param data any Données à journaliser.
function core_replay.logUiAction(scope, data) end

--- Hook appelé à la fin d'un niveau : si une lecture est en cours et que le changement de niveau n'a pas été demandé par startLevel, la lecture est arrêtée avec un message.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/replay.lua:863
---@param levelPath string Chemin du niveau quitté (déduit du code).
function core_replay.onClientEndMission(levelPath) end

--- Hook d'initialisation de l'extension : demande au flux de fichier de renvoyer son état (stream:requestState).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/replay.lua:254
function core_replay.onInit() end

--- Hook appelé quand l'écran d'attente de l'UI est affiché. Lance alors la lecture du fichier mis en attente par loadFile (stop du flux puis play).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/replay.lua:608
---@param state boolean Vrai quand l'attente est active ; sinon ignoré.
function core_replay.onUiWaitingState(state) end

--- Ouvre l'emplacement d'un fichier replay dans l'explorateur ; journalise une erreur s'il n'existe pas.
---Source : lua/ge/extensions/core/replay.lua:1044
---@param replayFileName string Chemin du fichier.
function core_replay.openMissionReplayFolder(replayFileName) end

--- Ouvre le dossier replays/ dans l'explorateur de fichiers (le crée s'il manque).
---Source : lua/ge/extensions/core/replay.lua:856
function core_replay.openReplayFolderInExplorer() end

--- Met en pause ou relance la lecture. Sans effet hors 'playback'.
---Source : lua/ge/extensions/core/replay.lua:538
---@param v boolean true = pause.
function core_replay.pause(v) end

--- Opération inverse : déplace un replay sauvegardé vers replays/missionReplays/ (pour qu'il soit de nouveau géré automatiquement), puis notifie l'UI.
---Source : lua/ge/extensions/core/replay.lua:1028
---@param replayFileName string Chemin du .rpl.
function core_replay.removeMissionSavedReplay(replayFileName) end

--- Supprime un replay et son fichier .rplMeta.json ; l'arrête d'abord s'il est chargé ; met à jour le catalogue.
---Source : lua/ge/extensions/core/replay.lua:882
---@param filename string Fichier sous replays/.
---@return table  {success, filename, message?}.
function core_replay.removeRecording(filename) end

--- Déplace un replay de mission automatique vers le dossier des replays sauvegardés par l'utilisateur (carrière/<slot>/ ou freeroam/) avec son .rplMeta.json, puis notifie l'UI (recordingFilesUpdated).
---Source : lua/ge/extensions/core/replay.lua:1011
---@param replayFileName string Chemin du .rpl.
function core_replay.saveMissionReplay(replayFileName) end

--- Se place à une position normalisée du replay. Sans effet hors playback.
---Source : lua/ge/extensions/core/replay.lua:834
---@param percent number Position entre 0 et 1 (borné).
function core_replay.seek(percent) end

--- Active ou désactive les logs de debug du replay (tag core_replay.debug).
---Source : lua/ge/extensions/core/replay.lua:31
---@param enabled boolean Vrai pour activer.
function core_replay.setDebugEnabled(enabled) end

--- Fixe la vitesse de lecture (1 = temps réel, 0.5 = ralenti, 2 = accéléré), sans lissage. Ne fait rien si la vitesse est déjà celle-ci.
---Source : lua/ge/extensions/core/replay.lua:487
---@param speed number Facteur de vitesse.
function core_replay.setSpeed(speed) end

--- Lance le niveau donné en freeroam sans faire apparaître de véhicule (freeroam_freeroam.startFreeroamByName), en marquant requestedStartLevel pour ne pas arrêter la lecture.
---Source : lua/ge/extensions/core/replay.lua:873
---@param levelPath string Chemin du niveau.
function core_replay.startLevel(levelPath) end

--- Démarre un enregistrement manuel dans replays/ (nom 'AAAA-MM-JJ_HH-MM-SS <niveau>.rpl'). Refusé si déjà en enregistrement, en lecture, ou si un enregistrement de mission est actif.
---Source : lua/ge/extensions/core/replay.lua:774
---@return table  {success, filename, code, ...}.
function core_replay.startRecording() end

--- Appelé par le C++ à chaque changement d'état du flux de replay. À l'entrée en 'playback', désactive les action maps VehicleCommon/VehicleSpecific et pousse ReplayPlaybackActionMap ; à la sortie, l'inverse. Met à jour M.state, déclenche guihooks 'replayStateChanged', hook 'onReplayStateChanged'(state) et 'onReplayCoreEvent'({event, state, ...}) avec event parmi playbackStarted, playbackStopped, recordingStarted, recordingStopped, playbackPaused, playbackResumed, loadedFileChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/replay.lua:376
---@param loadedFile string Fichier chargé.
---@param positionSeconds number Position de lecture (s).
---@param totalSeconds number Durée totale (s).
---@param speed number Vitesse de lecture.
---@param paused boolean En pause.
---@param fpsPlay number Images par seconde en lecture.
---@param fpsRec number Images par seconde à l'enregistrement.
---@param statestr string 'inactive', 'playback' ou 'recording'.
---@param framePositionSeconds number Position de l'image courante (s).
function core_replay.stateChanged(loadedFile, positionSeconds, totalSeconds, speed, paused, fpsPlay, fpsRec, statestr, framePositionSeconds) end

--- Annule un chargement en attente et arrête le flux (lecture ou enregistrement).
---Source : lua/ge/extensions/core/replay.lua:662
function core_replay.stop() end

--- Arrête la lecture et publie un état vide 'inactive'. Refusé pendant un enregistrement (code recordingActive).
---Source : lua/ge/extensions/core/replay.lua:672
---@return table  Résultat {success, filename, message?, code}.
function core_replay.stopAndUnload() end

--- Arrête l'enregistrement manuel et met à jour le catalogue (guihooks replayRecordingsUpdated).
---Source : lua/ge/extensions/core/replay.lua:790
---@param options table|nil options.autoplayAfterStopping = true : charge le replay à l'arrêt.
---@return table  {success, filename, code, playbackResult?}.
function core_replay.stopRecording(options) end

--- Raccourci de toggleRecording(false, true) : bascule l'enregistrement du replay de mission.
---Source : lua/ge/extensions/core/replay.lua:830
---@return string|nil  Nom du fichier si un enregistrement vient de démarrer.
function core_replay.toggleMissionRecording() end

--- Bascule lecture/pause du replay chargé. Si l'état est 'inactive', recharge et lance le fichier ; hors playback et inactive, journalise une erreur.
---Source : lua/ge/extensions/core/replay.lua:552
function core_replay.togglePlay() end

--- Bascule l'enregistrement : en enregistrement, l'arrête ; en lecture, arrête la lecture ; sinon démarre un enregistrement.
---Source : lua/ge/extensions/core/replay.lua:808
---@param autoplayAfterStopping boolean|nil Lire le replay après l'arrêt. Si nil : vrai pour un enregistrement manuel, faux pour un replay de mission.
---@param isMissionReplay boolean|nil Replay automatique de mission (dossier replays/missionReplays/).
---@return string|nil  Nom du fichier si un enregistrement vient de démarrer.
function core_replay.toggleRecording(autoplayAfterStopping, isMissionReplay) end

--- Change la vitesse. 'realtime' alterne entre 1 et la dernière autre vitesse (1/8 au départ) ; 'slowmotion' met 1/8 ; un nombre positif ou négatif monte ou descend d'autant de crans dans la liste des vitesses. Informe simTimeAuthority.
---Source : lua/ge/extensions/core/replay.lua:496
---@param val string|integer 'realtime', 'slowmotion', ou nombre de crans (+1, -1…).
function core_replay.toggleSpeed(val) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/missionReplayModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui enregistre automatiquement des replays de missions (fichiers .rpl). Il applique les limites de stockage choisies dans les réglages (par nombre ou par taille maximale), crée un fichier .rplMeta.json avec l'id de la mission, l'heure, le contexte carrière et la tentative, et gère la caméra pendant la lecture d'un replay de mission.
--- Accès : `require("extensions/flowgraph/modules/missionReplayModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_missionReplayModule
flowgraph_modules_missionReplayModule = {}

--- Écrit le fichier <replay>.rplMeta.json (missionId, missionName, time, humanTime, context carrière, et attempt si fournie). Ne fait rien sans currentReplayFile. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param attempt table|nil tentative (champ attemptNumber)
---@param mission table|nil mission (inutilisé dans le code)
---@param progressKey string|nil clé de progression
function flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey) end

--- Supprime les replays les plus anciens quand leur nombre dépasse le réglage countReplayCapMode. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteByCount() end

--- Supprime les plus anciens replays tant que la taille totale (en Mo) atteint maxSizeReplayCapMode. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteByMaxSize() end

--- Applique la règle de nettoyage choisie dans le réglage enableMissionReplayCapModes ('maxSize' ou 'count'). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.deleteOlderReplays() end

--- Supprime un fichier de replay. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param file string chemin du fichier
function flowgraph_modules_missionReplayModule.deleteReplayFile(file) end

--- Appelé au démarrage du projet : lit le dossier des replays de mission (core_replay.getMissionReplaysPath). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.executionStarted() end

--- Appelé à l'arrêt du projet : arrête l'enregistrement en cours et le replay IA (module aiRecording). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.executionStopped() end

--- Liste les fichiers *.rpl du dossier des replays de mission, du plus ancien au plus récent. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@return string[]  chemins de fichiers
function flowgraph_modules_missionReplayModule.getMissionReplayFiles() end

--- Appelé à la création du module : replayRecording = false, currentReplayFile = nil. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.init() end

--- À la fin de la lecture : restaure le chemin de caméra d'origine ou la caméra d'origine. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.missionPlaybackEnded() end

--- Au début de la lecture d'un replay de mission : mémorise la caméra (et le chemin si caméra 'path'), passe en caméra orbite, puis relance la simulation après 0,1 s. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.missionPlaybackStarted() end

--- Hook appelé quand une tentative de mission est agrégée : écrit les métadonnées avec la tentative puis oublie le fichier courant. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param attempt table tentative
---@param mission table mission
---@param progressKey string clé de progression
function flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey) end

--- Hook appelé quand le réglage d'enregistrement automatique change. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param newValue boolean nouvelle valeur
function flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue) end

--- Hook appelé quand l'UI demande l'état de l'enregistrement automatique : répond par guihooks.trigger('onReplayRecordingValueRequested', replayRecording). (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.onReplayRecordingValueRequested() end

--- Hook appelé à chaque changement d'état du replay. Détecte le début et la fin d'une lecture d'un replay appartenant à la mission courante et appelle missionPlaybackStarted / missionPlaybackEnded. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
---@param state table champs state ('playback', 'inactive'…) et loadedFile
function flowgraph_modules_missionReplayModule.onReplayStateChanged(state) end

--- Écrit les métadonnées sans tentative puis oublie le fichier courant. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.saveMetaInfoWithoutAttempt() end

--- Arrête tout enregistrement, nettoie les anciens replays, puis démarre un nouvel enregistrement si le réglage replayRecording est actif et le replay inactif. Mémorise le fichier dans currentReplayFile. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.startNewRec() end

--- Arrête l'enregistrement de replay s'il est en cours (core_replay.toggleMissionRecording). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:dyn
function flowgraph_modules_missionReplayModule.stopIfRec() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/missionReplayModule.lua
---@class flowgraph_modules_missionReplayModule_C
local flowgraph_modules_missionReplayModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:102
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:buildMetaInfo(attempt, mission, progressKey) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:52
function flowgraph_modules_missionReplayModule_C:deleteByCount() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:62
function flowgraph_modules_missionReplayModule_C:deleteByMaxSize() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:76
function flowgraph_modules_missionReplayModule_C:deleteOlderReplays() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:48
---@param file any
function flowgraph_modules_missionReplayModule_C:deleteReplayFile(file) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:31
function flowgraph_modules_missionReplayModule_C:executionStarted() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:23
function flowgraph_modules_missionReplayModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:35
function flowgraph_modules_missionReplayModule_C:getMissionReplayFiles() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:18
function flowgraph_modules_missionReplayModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:168
function flowgraph_modules_missionReplayModule_C:missionPlaybackEnded() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:153
function flowgraph_modules_missionReplayModule_C:missionPlaybackStarted() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:136
---@param attempt any
---@param mission any
---@param progressKey any
function flowgraph_modules_missionReplayModule_C:onMissionAttemptAggregated(attempt, mission, progressKey) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:145
---@param newValue any
function flowgraph_modules_missionReplayModule_C:onMissionAutoReplayRecordingSettingChanged(newValue) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:141
function flowgraph_modules_missionReplayModule_C:onReplayRecordingValueRequested() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:179
---@param state any
function flowgraph_modules_missionReplayModule_C:onReplayStateChanged(state) end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:131
function flowgraph_modules_missionReplayModule_C:saveMetaInfoWithoutAttempt() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:91
function flowgraph_modules_missionReplayModule_C:startNewRec() end

---Source : lua/ge/extensions/flowgraph/modules/missionReplayModule.lua:84
function flowgraph_modules_missionReplayModule_C:stopIfRec() end


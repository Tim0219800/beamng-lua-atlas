# `flowgraph_modules_missionReplayModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/missionReplayModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui enregistre automatiquement des replays de missions (fichiers .rpl). Il applique les limites de stockage choisies dans les réglages (par nombre ou par taille maximale), crée un fichier .rplMeta.json avec l'id de la mission, l'heure, le contexte carrière et la tentative, et gère la caméra pendant la lecture d'un replay de mission.

## Remarques

- Réglages lus : enableMissionReplayCapModes ('maxSize' ou 'count'), countReplayCapMode, maxSizeReplayCapMode (en Mo).
- Hooks écoutés : onReplayStateChanged, onReplayRecordingValueRequested, onMissionAutoReplayRecordingSettingChanged, onMissionAttemptAggregated.
- deleteByCount boucle jusqu'à diff + 1 : elle supprime donc un fichier de plus que l'excédent (pour laisser la place au nouvel enregistrement) ; l'indice peut dépasser #files si diff + 1 > #files, ce qui appellerait FS:removeFile(nil).
- Les tables de fichiers sont triées par date de création (FS:stat(file).createtime), du plus ancien au plus récent.
- originalCamMode, originalPathId, originalPathLoop et lastFrameState sont des variables locales au fichier.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey)` | Écrit le fichier <replay>.rplMeta.json (missionId, missionName, time, humanTime, context carrière, et attempt si fournie). Ne fait rien sans currentReplayFile. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.deleteByCount()` | Supprime les replays les plus anciens quand leur nombre dépasse le réglage countReplayCapMode. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.deleteByMaxSize()` | Supprime les plus anciens replays tant que la taille totale (en Mo) atteint maxSizeReplayCapMode. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.deleteOlderReplays()` | Applique la règle de nettoyage choisie dans le réglage enableMissionReplayCapModes ('maxSize' ou 'count'). (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.deleteReplayFile(file)` | Supprime un fichier de replay. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.executionStarted()` | Appelé au démarrage du projet : lit le dossier des replays de mission (core_replay.getMissionReplaysPath). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionReplayModule.executionStopped()` | Appelé à l'arrêt du projet : arrête l'enregistrement en cours et le replay IA (module aiRecording). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionReplayModule.getMissionReplayFiles()` | Liste les fichiers *.rpl du dossier des replays de mission, du plus ancien au plus récent. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.init()` | Appelé à la création du module : replayRecording = false, currentReplayFile = nil. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionReplayModule.missionPlaybackEnded()` | À la fin de la lecture : restaure le chemin de caméra d'origine ou la caméra d'origine. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.missionPlaybackStarted()` | Au début de la lecture d'un replay de mission : mémorise la caméra (et le chemin si caméra 'path'), passe en caméra orbite, puis relance la simulation après 0,1 s. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey)` | Hook appelé quand une tentative de mission est agrégée : écrit les métadonnées avec la tentative puis oublie le fichier courant. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue)` | Hook appelé quand le réglage d'enregistrement automatique change. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onReplayRecordingValueRequested()` | Hook appelé quand l'UI demande l'état de l'enregistrement automatique : répond par guihooks.trigger('onReplayRecordingValueRequested', replayRecording). (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.onReplayStateChanged(state)` | Hook appelé à chaque changement d'état du replay. Détecte le début et la fin d'une lecture d'un replay appartenant à la mission courante et appelle missionPlaybackStarted / missionPlaybackEnded. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_missionReplayModule.saveMetaInfoWithoutAttempt()` | Écrit les métadonnées sans tentative puis oublie le fichier courant. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.startNewRec()` | Arrête tout enregistrement, nettoie les anciens replays, puis démarre un nouvel enregistrement si le réglage replayRecording est actif et le replay inactif. Mémorise le fichier dans currentReplayFile. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionReplayModule.stopIfRec()` | Arrête l'enregistrement de replay s'il est en cours (core_replay.toggleMissionRecording). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_missionReplayModule.buildMetaInfo(attempt, mission, progressKey)`

Écrit le fichier <replay>.rplMeta.json (missionId, missionName, time, humanTime, context carrière, et attempt si fournie). Ne fait rien sans currentReplayFile. (assignée dynamiquement)

- `attempt` (*table|nil*) : tentative (champ attemptNumber)
- `mission` (*table|nil*) : mission (inutilisé dans le code)
- `progressKey` (*string|nil*) : clé de progression

#### `flowgraph_modules_missionReplayModule.deleteReplayFile(file)`

Supprime un fichier de replay. (assignée dynamiquement)

- `file` (*string*) : chemin du fichier

#### `flowgraph_modules_missionReplayModule.getMissionReplayFiles()`

Liste les fichiers *.rpl du dossier des replays de mission, du plus ancien au plus récent. (assignée dynamiquement)

- **renvoie** : string[] chemins de fichiers

#### `flowgraph_modules_missionReplayModule.onMissionAttemptAggregated(attempt, mission, progressKey)`

Hook appelé quand une tentative de mission est agrégée : écrit les métadonnées avec la tentative puis oublie le fichier courant. (assignée dynamiquement)

- `attempt` (*table*) : tentative
- `mission` (*table*) : mission
- `progressKey` (*string*) : clé de progression

#### `flowgraph_modules_missionReplayModule.onMissionAutoReplayRecordingSettingChanged(newValue)`

Hook appelé quand le réglage d'enregistrement automatique change. (assignée dynamiquement)

- `newValue` (*boolean*) : nouvelle valeur

#### `flowgraph_modules_missionReplayModule.onReplayStateChanged(state)`

Hook appelé à chaque changement d'état du replay. Détecte le début et la fin d'une lecture d'un replay appartenant à la mission courante et appelle missionPlaybackStarted / missionPlaybackEnded. (assignée dynamiquement)

- `state` (*table*) : champs state ('playback', 'inactive'…) et loadedFile

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildMetaInfo(attempt, mission, progressKey)` |  | 102 |
| `C:deleteByCount()` |  | 52 |
| `C:deleteByMaxSize()` |  | 62 |
| `C:deleteOlderReplays()` |  | 76 |
| `C:deleteReplayFile(file)` |  | 48 |
| `C:executionStarted()` |  | 31 |
| `C:executionStopped()` |  | 23 |
| `C:getMissionReplayFiles()` |  | 35 |
| `C:init()` |  | 18 |
| `C:missionPlaybackEnded()` |  | 168 |
| `C:missionPlaybackStarted()` |  | 153 |
| `C:onMissionAttemptAggregated(attempt, mission, progressKey)` |  | 136 |
| `C:onMissionAutoReplayRecordingSettingChanged(newValue)` |  | 145 |
| `C:onReplayRecordingValueRequested()` |  | 141 |
| `C:onReplayStateChanged(state)` |  | 179 |
| `C:saveMetaInfoWithoutAttempt()` |  | 131 |
| `C:startNewRec()` |  | 91 |
| `C:stopIfRec()` |  | 84 |

**Évènements UI (guihooks.trigger) :** `onReplayRecordingValueRequested`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua`.*
